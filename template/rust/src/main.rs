use std::io;

mod handler;

fn main() {
    println!("Hello from rust!");

    let mut user_input = String::new();

    io::stdin().read_line(&mut user_input)
        .expect("Failed to read line");

    handler::handler(user_input);
}

