Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCE910E32D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 14:24:15 +0000 (UTC)
Date: Tue, 22 Feb 2022 15:24:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YhTyCoTEKwTSClkA@kamilkon-DESK1>
References: <20220221072459.4423-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221072459.4423-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v4] i915/gem_ctx_create: Added test description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Apoorva,

one final nit, please ajust strings to be on the same columns,
see below.

Dnia 2022-02-21 at 12:54:59 +0530, apoorva1.singh@intel.com napisał(a):
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Added test and subtests description
> 
> v2: Modified description to be more precise
> 
> v3: Rebase
> 
> v4: Incorporated minor changes in description based
>     on feedback
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_ctx_create.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 44846652..c90a2e20 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -36,6 +36,8 @@
>  #include "igt_rand.h"
>  #include "sw_sync.h"
>  
> +IGT_TEST_DESCRIPTION("Test the context create ioctls");
> +
>  #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
>  static unsigned all_engines[I915_EXEC_RING_MASK + 1];
> @@ -585,6 +587,7 @@ igt_main
>  		igt_fork_hang_detector(fd);
>  	}
>  
> +	igt_describe("Test random context creation");
>  	igt_subtest("basic") {
>  		memset(&create, 0, sizeof(create));
>  		create.ctx_id = rand();
> @@ -594,41 +597,67 @@ igt_main
>  		gem_context_destroy(fd, create.ctx_id);
>  	}
>  
> +	igt_describe("Verify valid and invalid context extensions");
>  	igt_subtest("ext-param")
>  		basic_ext_param(fd);
> +
> +	igt_describe("Set, validate and execute particular context params");
>  	igt_subtest("iris-pipeline")
>  		iris_pipeline(fd);
>  
> +	igt_describe("Create contexts upto available RAM size, calculate the average "
-------------------- ^
> +	       "performance of their execution on multiple parallel processes");
-------------------- ^

here it should look like:

+	igt_describe("Create contexts upto available RAM size, calculate the average "
+		     "performance of their execution on multiple parallel processes");

Please use tabs, then spaces. Please make same edits below. 

>  	igt_subtest("maximum-mem")
>  		maximum(fd, &cfg, ncpus, CHECK_RAM);
> +
> +	igt_describe("Create contexts upto available RAM+SWAP size, calculate the average "
> +	       "performance of their execution on multiple parallel processes");

ajust here

>  	igt_subtest("maximum-swap")
>  		maximum(fd, &cfg, ncpus, CHECK_RAM | CHECK_SWAP);
>  
> +	igt_describe("Exercise implicit per-fd context creation");
>  	igt_subtest("basic-files")
>  		files(fd, &cfg, 2, 1);
> +
> +	igt_describe("Exercise implicit per-fd context creation on 1 CPU for long duration");
>  	igt_subtest("files")
>  		files(fd, &cfg, 20, 1);
> +
> +	igt_describe("Exercise implicit per-fd context creation on all CPUs for long duration");
>  	igt_subtest("forked-files")
>  		files(fd, &cfg, 20, ncpus);
>  
> +	igt_describe("Calculate the average performance of context creation and "
> +	       "it's execution using all engines");

ajust here

>  	/* NULL value means all engines */
>  	igt_subtest("active-all")
>  		active(fd, &cfg, NULL, 20, 1);
> +
> +	igt_describe("Calculate the average performance of context creation and it's execution "
> +	       "using all engines on multiple parallel processes");

ajust here

>  	igt_subtest("forked-active-all")
>  		active(fd, &cfg, NULL, 20, ncpus);
>  
> +	igt_describe("For each engine calculate the average performance of context creation "
> +	       "and execution");

ajust here

>  	igt_subtest_with_dynamic("active") {
>  		for_each_ctx_cfg_engine(fd, &cfg, e) {
>  			igt_dynamic_f("%s", e->name)
>  				active(fd, &cfg, e, 20, 1);
>  		}
>  	}
> +
> +	igt_describe("For each engine calculate the average performance of context creation "
> +	       "and execution on multiple parallel processes");

ajust here

>  	igt_subtest_with_dynamic("forked-active") {
>  		for_each_ctx_cfg_engine(fd, &cfg, e) {
>  			igt_dynamic_f("%s", e->name)
>  				active(fd, &cfg, e, 20, ncpus);
>  		}
>  	}
> +
> +	igt_describe("For each engine calculate the average performance of context creation "
> +	       "and execution while all other engines are hogging the resources");

ajust here

>  	igt_subtest_with_dynamic("hog") {
>  		for_each_ctx_cfg_engine(fd, &cfg, e) {
>  			igt_dynamic_f("%s", e->name)
> -- 
> 2.25.1
> 
Regards,
Kamil
