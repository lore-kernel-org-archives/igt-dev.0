Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBBC6E4FE
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 14:49:11 +0000 (UTC)
Date: Fri, 13 Nov 2020 15:49:06 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201113144906.GS6508@kdec5-desk.ger.corp.intel.com>
References: <20201010143719.1778033-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201010143719.1778033-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_create: Added test
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
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Oct 10, 2020 at 08:07:19PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Added test and subtests description
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_ctx_create.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 39305f02..490b9a66 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -35,6 +35,8 @@
>  #include "igt_rand.h"
>  #include "sw_sync.h"
>  
> +IGT_TEST_DESCRIPTION("Test the context create ioctls");
> +
>  #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
>  static unsigned all_engines[16];
> @@ -582,6 +584,7 @@ igt_main
>  		igt_fork_hang_detector(fd);
>  	}
>  
> +	igt_describe("Tests the basic functionlaity of CONTEXT_CREATE ioctl");
Typo in functionality.
I would go with:
igt_describe("Test random ctx creation");
>  	igt_subtest("basic") {
>  		memset(&create, 0, sizeof(create));
>  		create.ctx_id = rand();
> @@ -591,41 +594,69 @@ igt_main
>  		gem_context_destroy(fd, create.ctx_id);
>  	}
>  
> +	igt_describe("Verify the functionality of CONTEXT_CREATE_EXT ioctl");
igt_describe("Verify valid and invalid context extensions");
>  	igt_subtest("ext-param")
>  		basic_ext_param(fd);
> +
>  	igt_subtest("iris-pipeline")
>  		iris_pipeline(fd);
Why ^ this one does not have a description?
maybe:
igt_describe("Set, validate and execute particular ctx params");
>  
> +	igt_describe("Creates multiple contexts upto available RAM size and then checks "
> +	       "the average performance of their execution on multiple parallel threads");

igt_describe("Create ctxs upto available RAM size, check the average performance of their execution on multiple parallel threads");
>  	igt_subtest("maximum-mem")
>  		maximum(fd, ncpus, CHECK_RAM);
> +
> +	igt_describe("Creates multiple contexts upto available RAM plus SWAP size and then "
> +	       "checks the average performance of their execution on multiple parallel threads");
igt_describe("Create ctxs upto available RAM+SWAP size, check the average performance of their execution on multiple parallel threads");
>  	igt_subtest("maximum-swap")
>  		maximum(fd, ncpus, CHECK_RAM | CHECK_SWAP);
>  
> +	igt_describe("Checks the average performance by executing a flinked buffer "
> +	       "object repeatedly on different engines for a small timeout period");
igt_describe("Exercise implicit per-fd context creation");
>  	igt_subtest("basic-files")
>  		files(fd, 2, 1);
> +
> +	igt_describe("Checks the average performance by executing a flinked buffer "
> +	       "object repeatedly on different engines for a large timeout period");
igt_describe("Exercise long implicit per-fd context creation on 1 CPU");
>  	igt_subtest("files")
>  		files(fd, 20, 1);
> +
> +	igt_describe("Checks the average performance by executing a flinked buffer object repeatedly "
> +	       "on different engines for a large timeout period on multiple parallel threads");
igt_describe("Exercise implicit per-fd context creation on all CPUs");
>  	igt_subtest("forked-files")
>  		files(fd, 20, ncpus);
>  
> +	igt_describe("Checks the average performance of context creation and "
> +	       "it's execution on all engines");
igt_describe("Excercise a trivial allocation failure on 1 CPU and measure performance"
>  	/* NULL value means all engines */
>  	igt_subtest("active-all")
>  		active(fd, NULL, 20, 1);
> +
> +	igt_describe("Checks the average performance of context creation and it's execution "
> +	       "using all engines on multiple parallel threads");
igt_describe("Excercise a trivial allocation failure on all CPUs and measure performance"
>  	igt_subtest("forked-active-all")
>  		active(fd, NULL, 20, ncpus);
>  
> +	igt_describe("For each engine, checks the average performance of context creation "
> +	       "and execution");
gt_describe("For each engine check the average performance of context creation "
      "and execution");
>  	igt_subtest_with_dynamic("active") {
>  		__for_each_physical_engine(fd, e) {
>  			igt_dynamic_f("%s", e->name)
>  				active(fd, e, 20, 1);
>  		}
>  	}
> +
> +	igt_describe("For each engine, checks the average performance of context creation "
> +	       "and execution on multiple parallel threads");
igt_describe("For each engine check the average performance of context creation "
       "and execution on multiple parallel threads");
>  	igt_subtest_with_dynamic("forked-active") {
>  		__for_each_physical_engine(fd, e) {
>  			igt_dynamic_f("%s", e->name)
>  				active(fd, e, 20, ncpus);
>  		}
>  	}
> +
> +	igt_describe("For each engine, checks the average performance of context creation "
> +	       "and execution while all other engines are hogging the resources");
s/engine, checks the/engine check the/
>  	igt_subtest_with_dynamic("hog") {
>  		__for_each_physical_engine(fd, e) {
>  			igt_dynamic_f("%s", e->name)
It looks like you findings were correct, my suggeston is to re-word them
slightly.

Kasia :)



> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
