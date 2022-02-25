Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255E510E793
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 13:50:07 +0000 (UTC)
Date: Fri, 25 Feb 2022 14:50:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yhjeis0fQJXUs/xs@kamilkon-DESK1>
References: <20220225053612.43527-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225053612.43527-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_create: Added test description
 for test case
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

Dnia 2022-02-25 at 11:06:12 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: Added test description for newly added subtets.
> 
> v3: Updated test descriptions.
> 
> Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_create.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index 45804cde..31fd6526 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -59,9 +59,8 @@
>  #include "i915/gem_mman.h"
>  #include "i915_drm.h"
>  
> -IGT_TEST_DESCRIPTION("This is a test for the gem_create ioctl,"
> -		     " where the goal is to simply ensure that basics work"
> -		     " and invalid input combinations are rejected.");
> +IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext works"
> +		     " and that invalid input combinations are rejected.");
>  
>  #define PAGE_SIZE 4096
>  
> @@ -489,30 +488,46 @@ igt_main
>  		fd = drm_open_driver(DRIVER_INTEL);
>  	}
>  
> +	igt_describe("Try to create a gem object of invalid size 0"
> +		     " and check if ioctl returns error.");
>  	igt_subtest("create-invalid-size")
>  		invalid_size_test(fd);
>  
> +	igt_describe("Exercise creation of buffer object with impossible"
> +		     " size and check for the expected error.");
>  	igt_subtest("create-massive")
>  		massive_test(fd);
>  
> +	igt_describe("Try to create an object with non-aligned size, check"
> +		     " we got one with size aligned up to page size and test"
> +		     " we can write into the padded extra memory.");
>  	igt_subtest("create-valid-nonaligned")
>  		valid_nonaligned_size(fd);
>  
> +	igt_describe("Try to create a gem object with size 15"
> +		     " and check actual created size.");
>  	igt_subtest("create-size-update")
>  		size_update(fd);
>  
> +	igt_describe("Verify that all new objects are clear.");
>  	igt_subtest("create-clear")
>  		always_clear(fd, 30);
>  
> +	igt_describe("Create buffer objects while GPU is busy.");
>  	igt_subtest("busy-create")
>  		busy_create(fd, 30);
>  
> +	igt_describe("Exercise create_ext placements extension.");
>  	igt_subtest("create-ext-placement-sanity-check")
>  		create_ext_placement_sanity_check(fd);
>  
> +	igt_describe("Create one object with memory pieces in each"
> +		     " memory region using create_ext.");
>  	igt_subtest("create-ext-placement-each")
>  		create_ext_placement_each(fd);
>  
> +	igt_describe("Create objects in every  memory region using"
---------------------------------------------^^

Two spaces here, please correct this.

> +		     " create_ext.");
>  	igt_subtest("create-ext-placement-all")
>  		create_ext_placement_all(fd);
>  
> -- 
> 2.25.1
>
Regards,
Kamil
 
