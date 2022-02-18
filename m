Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE3510E71F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 18:40:28 +0000 (UTC)
Date: Fri, 18 Feb 2022 19:40:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yg/oGI5xXjEN6bDV@kamilkon-DESK1>
References: <20220216123508.130647-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216123508.130647-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t ,
 v2] i915/gem_create: Added test description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Priyanka,

Dnia 2022-02-16 at 18:05:08 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: Added test description for newly added subtets.
> 
> Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>

Please write it without comma, so instead of "Melkaveri, Arjun"
write "Arjun Melkaveri".

> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_create.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index 45804cde..0280fe31 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -489,30 +489,44 @@ igt_main
>  		fd = drm_open_driver(DRIVER_INTEL);
>  	}
>  
> +	igt_describe("Test tries to create a gem object of invalid size 0"
> +		     " and checks if ioctl returns error.");

s/Test tries to create/Try to create/
s/checks/check/

>  	igt_subtest("create-invalid-size")
>  		invalid_size_test(fd);
>  
> +	igt_describe("Test tries to exercise impossible size of buffer object and "
> +		       "checks for the expected error.");

Replace "Test tries to exercise impossible size of buffer object and checks"
with
"Exercise creation of buffer object with impossible size and check"

Aline strings to be on same column.

>  	igt_subtest("create-massive")
>  		massive_test(fd);
>  
> +	igt_describe("Test creates an object with non-aligned size request "
> +		     "and assert the buffer is page aligned and tests the "
> +		     "write into the padded extra memory.");

"Try to create an object with non-aligned size,
 check we got one with size aligned up to page size
 and test we can write into the padded extra memory."

>  	igt_subtest("create-valid-nonaligned")
>  		valid_nonaligned_size(fd);
>  
> +	igt_describe("Test tries to create a gem object with size 15"
> +		     " and checks if the actual created size to be default page size.");

s/Test tries to create/Try to create/
s/checks if the actual created size to be default page size./check actual created size./

>  	igt_subtest("create-size-update")
>  		size_update(fd);
>  
> +	igt_describe("Test tries to verify that all new objects are clear.");

s/Test tries to verify/Verify/

>  	igt_subtest("create-clear")
>  		always_clear(fd, 30);
>  
> +	igt_describe("Test tries to create BO while GPU is busy.");

s/Test tries to create BO/Create buffer objects/

>  	igt_subtest("busy-create")
>  		busy_create(fd, 30);
>  
> +	igt_describe("Test tries to exercise create_ext placements extension");

s/Test tries to exercise/Exercise/

Add dot at end of description.

>  	igt_subtest("create-ext-placement-sanity-check")
>  		create_ext_placement_sanity_check(fd);
>  
> +	igt_describe("Test tries to create object in each memory region using create_ext.");

s/Test tries to create/Create/

>  	igt_subtest("create-ext-placement-each")
>  		create_ext_placement_each(fd);
>  
> +	igt_describe("Test tries to create object on all memory regions using create_ext.");

s/Test tries to create/Create/

>  	igt_subtest("create-ext-placement-all")
>  		create_ext_placement_all(fd);
>  
> -- 
> 2.25.1
> 

Also while you add new descriptions, please make main
description shorter, replace

IGT_TEST_DESCRIPTION("This is a test for the gem_create ioctl,"
		     " where the goal is to simply ensure that basics work"
		     " and invalid input combinations are rejected.");

with

IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext works"
		     " and that invalid input combinations are rejected.");

Regards,
Kamil
