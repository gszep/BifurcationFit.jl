######################################################## model
function rates(u::AbstractVector,parameters::NamedTuple)

	@unpack θ,p = parameters
	θ₁,θ₂,c = θ[1]*cos(θ[2]), θ[1]*sin(θ[2]), θ[3]

	f = first(u)*first(p)*first(θ)
	F = similar(u,typeof(f))

	F[1] = p + θ₁*u[1] + θ₂*u[1]^3 + c
	F[2] = u[1] - u[2] # dummy second dimension

	return F
end

######################################################### targets and initial guess
targetData = StateSpace( 2, -2:0.01:2, [1,-1] )
θ = SizedVector{3}(5.0,-0.93,0.0)
