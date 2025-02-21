
<br>

### Welcome!

In this workshop, Let's write a simple `rockcraft.yaml` then build a rock from it.

You will be doing:
  - Install tools
  - Create sample .NET Web API app project from template then have a quick look
  - Draft `rockcraft.yaml`
  - Build a .NET Rock
  - Load the rock built into Docker
  - Test running rock with Docker
  - Modifying `rockcraft.yaml` to use `bare` base, .NET plugin and chiseled packages
  - Build then run the rock again
  
#### What are rocks and rockcraft?

##### Rock
Rocks are secure and stable OCI container images based on Ubuntu LTS. - It also got pebble, a service manager as the entry point.

[Learn more](https://documentation.ubuntu.com/rockcraft/en/stable/explanation/rocks.html)

##### Rockcraft
Rockcraft is a tool that builds rocks. It uses `rockcraft.yaml` to defind container image build using the same or similar language from Snapcraft and Charmcraft and focuses on what content to include in the container rather listing comples shell commands to build a good container image.

[Why use Rockcraft?](https://documentation.ubuntu.com/rockcraft/en/stable/explanation/rockcraft.html)