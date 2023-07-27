#include <webots/Robot.hpp>
#include <webots/Motor.hpp>
#include <webots/PositionSensor.hpp>

using namespace webots;

int main(void) {	
    printf("hello world");
    Robot *robot = new Robot(); // Create robot object
    int timeStep = (int)robot->getBasicTimeStep();  // timeStep = number of milliseconds between world updates

    Motor *wheel_left = robot->getMotor("wheel1 motor");    // Motor initialization
    Motor *wheel_right = robot->getMotor("wheel2 motor");
    wheel_left->setPosition(INFINITY);
    wheel_right->setPosition(INFINITY);

    PositionSensor *leftEncoders = wheel_left->getPositionSensor();     // Encoder initialization
    PositionSensor *rightEncoders = wheel_right->getPositionSensor();
    leftEncoders->enable(timeStep);
    rightEncoders->enable(timeStep);

    wheel_left->setVelocity(5.0);
    wheel_right->setVelocity(5.0);

    while (robot->step(timeStep) != -1) {
        if (leftEncoders->getValue() > 20.0) // If left motor has spun more than 20 radians
            break;
    };

    wheel_left->setVelocity(0.0);
    wheel_right->setVelocity(0.0);
    
    delete robot;
    return 0;
}