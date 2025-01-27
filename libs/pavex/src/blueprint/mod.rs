//! Define the routes and the structure of your application using a [`Blueprint`].
pub use blueprint::Blueprint;

#[allow(clippy::module_inception)]
mod blueprint;
pub mod constructor;
pub mod internals;
pub mod middleware;
pub mod reflection;
pub mod router;
