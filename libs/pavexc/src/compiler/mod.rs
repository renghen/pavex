#![allow(clippy::too_many_arguments)]

pub use app::App;

mod analyses;
mod app;
mod codegen;
mod codegen_utils;
mod component;
mod computation;
mod generated_app;
mod interner;
mod resolvers;
mod route_parameter_validation;
mod traits;
mod utils;
