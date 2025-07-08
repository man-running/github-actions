/*
########################################################################################################
# Project Name: DevOps Infrastructure as Code (IaC) for all projects
# Project Version: 1.0.0
# Description:  Terraform configuration for sample project infrastructure.
#
# Copyright (c) 2024 Takara.AI
# All rights reserved.
# 
# Author(s): Carlos Miguens
#
# License: proprietary
# 
# Licensed under the the terms of your contract with Takara.AI.
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Creation Date: 2024-07-08
########################################################################################################
*/

/*
*   We'll setup some networking first
*/

module "networking" {
	source = "./modules/networking"

	main_vpc_cidr = var.main_vpc_cidr
	public_subnet_1 = var.public_subnet_1
	public_subnet_2 = var.public_subnet_2
	private_subnet = var.private_subnet
	region = var.region
	az1 = var.az1
	az2 = var.az2

}