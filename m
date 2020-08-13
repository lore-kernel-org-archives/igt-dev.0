Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0FB6EA03
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2020 14:46:17 +0000 (UTC)
From: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
In-Reply-To: <20200810112246.15168-1-priyanka.dandamudi@intel.com>
References: <20200810112246.15168-1-priyanka.dandamudi@intel.com>
Date: Thu, 13 Aug 2020 16:46:08 +0200
Message-ID: <875z9m8uz3.fsf@lfiedoro-desk1.igk.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_vm_create: Added test
 description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com, Arjun.Melkaveri@intel.com, igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

<priyanka.dandamudi@intel.com> writes:

> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
> Added test description for test and to all the available subtests.
>
> Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_vm_create.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
> index e8af68f1..9fd8fb89 100644
> --- a/tests/i915/gem_vm_create.c
> +++ b/tests/i915/gem_vm_create.c
> @@ -26,6 +26,11 @@
>  #include "igt.h"
>  #include "igt_dummyload.h"
>  
> +IGT_TEST_DESCRIPTION("Test the basic vm creation ioctl,"
> +		 "where it checks if invalid combinations are rejected and "
> +		 "checks isolation that the same vm_id on different fd are indeed "
> +		 "different VM.");
> +
>  static int vm_create_ioctl(int i915, struct drm_i915_gem_vm_control *ctl)
>  {
>  	int err = 0;
> @@ -395,10 +400,10 @@ igt_main
>  		igt_require_gem(i915);
>  		igt_require(has_vm(i915));
>  	}
> -
> +	igt_describe("Checks if vm creation ioctl returns error for invalid flags and extensions.");
>  	igt_subtest("invalid-create")
>  		invalid_create(i915);
> -
> +	igt_describe("Checks if vm destroy ioctl returns error for invalid vmid's, flags and extensions.");
>  	igt_subtest("invalid-destroy")
>  		invalid_destroy(i915);
>  
> @@ -406,16 +411,21 @@ igt_main
>  		igt_fixture {
>  			gem_context_require_param(i915, I915_CONTEXT_PARAM_VM);
>  		}
> -
> +		igt_describe("Checks if offset for same context can be different for different VM's.");
>  		igt_subtest("execbuf")
>  			execbuf(i915);
>  
> +		igt_describe("Checks if same vmid in different fd are different VM, also " 
> +			     "proves that it cannot be written to vm from another fd.");
>  		igt_subtest("isolation")
>  			isolation(i915);
> -
> +		
> +		igt_describe("Checks if an already VMA for different contexts will try to keep its offset or not.");

Could you please rephrase this description. I have trouble understanding
what do you test here.
Other descriptions look good but please be consistent in
naming and use upper or lower case and stick to it (vm/VM, etc.)

>  		igt_subtest("create-ext")
>  			create_ext(i915);
> -
> +		
> +		igt_describe("Test tries to access same VM and context for "
> +			     "two different spin batches when vm has been destroyed asynchronously.");
>  		igt_subtest("async-destroy")
>  			async_destroy(i915);
>  	}
> -- 
> 2.26.2
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev


-- 
Thanks,
Lukasz
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
