
module lift_con(input wire clk, reset, up_button, down_button, doors_closed, top_floor, ground_floor, emergency, maintenance,
           output reg [3:0] state, output reg motor_on, output reg motor_direction, output reg fan_on);

  // State encoding
  parameter Ground = 4'b0000, Starting_up = 4'b0001, Going_up = 4'b0010, Idle = 4'b0011, Top = 4'b0100, Starting_down = 4'b0101, Going_down = 4'b0110, Emergency = 4'b0111, Maintenance = 4'b1000;

  always @(posedge clk ) begin
    if (reset) begin
      state <= Ground;
      motor_on <= 0;
      fan_on <= 0;
    end
    else begin
      case (state)
        Ground: begin
          if (up_button) begin
            state <= Starting_up;
            motor_on <= 1;
            motor_direction <= 1; // Upward
            fan_on <= 1;
          end
          else state <= Ground;
        end
        Starting_up: begin
          if (doors_closed) state <= Going_up;
          else state <= Starting_up;
        end
        Going_up: begin
          if (top_floor) begin
            state <= Top;
            motor_on <= 0;
          end
          else if (!up_button) begin
            state <= Idle;
            motor_on <= 0;
          end
          else state <= Going_up;
        end
        Idle: begin
          if (up_button) begin
            state <= Starting_up;
            motor_on <= 1;
            motor_direction <= 1; // Upward
            fan_on <= 1;
          end
          else if (down_button) begin
            state <= Starting_down;
            motor_on <= 1;
            motor_direction <= 0; // Downward
            fan_on <= 1;
          end
          else state <= Idle;
        end
        Top: begin
          if (down_button) begin
            state <= Starting_down;
            motor_on <= 1;
            motor_direction <= 0; // Downward
            fan_on <= 1;
          end
          else state <= Top;
        end
        Starting_down: begin
          if (doors_closed) state <= Going_down;
          else state <= Starting_down;
        end
        Going_down: begin
          if (ground_floor) begin
            state <= Ground;
            motor_on <= 0;
          end
          else if (!down_button) begin
            state <= Idle;
            motor_on <= 0;
          end
          else state <= Going_down;
        end
        Emergency: begin
          state <= Ground;
          motor_on <= 0;
          fan_on <= 0;
        end
        Maintenance: begin
          state <= Maintenance;
          motor_on <= 0;
          fan_on <= 0;
        end
      endcase
    end
    if (emergency) state <= Emergency;
    if (maintenance) state <= Maintenance;
  end
endmodule


