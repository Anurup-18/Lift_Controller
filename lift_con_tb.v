module lift_con_tb;
    reg clk;
    reg reset;
    reg up_button;
    reg down_button;
    reg doors_closed;
    reg top_floor;
    reg ground_floor;
    reg emergency;
    reg maintenance;

    wire [3:0] state;
    wire motor_on;
    wire motor_direction;
    wire fan_on;

    // Instantiate the FSM
    lift_con u1 (
        .clk(clk), .reset(reset), .up_button(up_button), .down_button(down_button), .doors_closed(doors_closed),
        .top_floor(top_floor), .ground_floor(ground_floor), .emergency(emergency), .maintenance(maintenance),
        .state(state), .motor_on(motor_on), .motor_direction(motor_direction), .fan_on(fan_on)
    );

    // Clock generator

    always begin
 	#5 clk=0;
        #5 clk = ~ clk;

    end


        always #2 reset <= $random;
        always #2 up_button <= $random;
        always #2 down_button <= $random;
        always #2 doors_closed <= $random;
        always #2 top_floor <= $random;
        always #2 ground_floor <= $random;
        //always #2 emergency <= $random;
        //always #2 maintenance <= $random;











    // Test sequence
    //initial begin
        // Initialize inputs
        //clk = 0;
        //reset = 1;
        //up_button = 0;
        //down_button = 0;
        //doors_closed = 0;
        //top_floor = 0;
        //ground_floor = 1;
        //emergency = 0;
        //maintenance = 0;


        

        // Apply reset
       // #10 reset = 0;
       // #10 reset = 1;

        // Test sequence
       /* #10 up_button = 1; doors_closed = 1; ground_floor = 0; top_floor = 0; // Go to Starting_up state
        #20 up_button = 0; // Go to Going_up state
        #20 top_floor = 1; // Go to Top state
        #10 down_button = 1; doors_closed = 1; top_floor = 0; ground_floor = 0; // Go to Starting_down state
        #20 down_button = 0; // Go to Going_down state
        #20 ground_floor = 1; // Go to Ground state
        #10 up_button = 1; doors_closed = 1; ground_floor = 0; top_floor = 0; // Go to Starting_up state
        #20 emergency = 1; // Go to Emergency state
        #20 emergency = 0; // Go back to Ground state
        #10 maintenance = 1; // Go to Maintenance state
        #20 maintenance = 0; // Go back to Ground state

        // Additional test cases to cover all states and transitions
        #10 up_button = 1; doors_closed = 0; ground_floor = 0; top_floor = 0; // Stay in Starting_up state
        #20 doors_closed = 1; // Go to Going_up state
        #10 up_button = 0; // Stay in Going_up state
        #20 top_floor = 1; // Go to Top state
        #10 down_button = 1; doors_closed = 0; top_floor = 0; ground_floor = 0; // Stay in Starting_down state
        #20 doors_closed = 1; // Go to Going_down state
        #10 down_button = 0; // Stay in Going_down state
        #20 ground_floor = 1; // Go to Ground state

        // End of test
*/
   
endmodule

	

