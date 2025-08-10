Rather than hardcoding the token, you can use:
1. Environment Variables
	export JIB_TO_AUTH_USERNAME=beingshrikant
	export JIB_TO_AUTH_PASSWORD=<token>
Jib will automatically pick these up.

2. gradle.properties file (for local use only)
	jib.to.auth.username=beingshrikant
	jib.to.auth.password=<token>