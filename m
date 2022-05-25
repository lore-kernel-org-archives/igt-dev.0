Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD2510E26E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 15:23:15 +0000 (UTC)
Date: Wed, 25 May 2022 17:23:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yo5J3LeT7aQBrgeV@kamilkon-desk1>
References: <20220523121916.25932-1-sai.gowtham.ch@intel.com>
 <20220523121916.25932-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220523121916.25932-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_exec_create: Added test
 description for test case.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2022-05-23 at 17:49:15 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Added test description for all the subtests that are available.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_exec_create.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index 78d5ffb3..fd09ef02 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -47,6 +47,10 @@
>  #include "i915_drm.h"
>  #include "i915/intel_memory_region.h"
>  
> +IGT_TEST_DESCRIPTION("\n This test overloads the driver with transient active "
------------------------ ^ ^
Remove these white chars from beginning.

> +		"objects and checks if we don't kill the system under the "
> +		"mempressure. Some of the symptoms this test look for include "
---------------- ^
s/mempressure/memory pressure/

> +		"mysterious hangs.");
>  #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
>  static double elapsed(const struct timespec *start, const struct timespec *end)
> @@ -166,6 +170,7 @@ igt_main
>  					    I915_DEVICE_MEMORY);
>  	}
>  
> +	igt_describe("Checks if we kill the systems by overloading it with active objects");
s/systems/system/

Please add use of only legacy engines here.

>  	igt_subtest_with_dynamic("legacy")
>  		for_each_combination(regions, 1, set) {
>  			char *sub_name = memregion_dynamic_subtest_name(regions);
> @@ -177,6 +182,7 @@ igt_main
>  			free(sub_name);
>  		}
>  
> +	igt_describe("Quick sanitycheck of the above test setup iterating over engines");

Please do not make remarks about "above test", order can change
later, so 
s/sanitycheck/sanity check/
s/of the above test setup//
s/over/over all/

>  	igt_subtest_with_dynamic("basic")
>  		for_each_combination(regions, 1, set) {
>  			char *sub_name = memregion_dynamic_subtest_name(regions);
> @@ -188,6 +194,7 @@ igt_main
>  			free(sub_name);
>  		}
>  
> +	igt_describe("This test does a concurrent execution");

Please find better description here.

>  	igt_subtest_with_dynamic("forked")
>  		for_each_combination(regions, 1, set) {
>  			char *sub_name = memregion_dynamic_subtest_name(regions);
> @@ -199,6 +206,9 @@ igt_main
>  			free(sub_name);
>  		}
>  
> +
> +	igt_describe("This test does a forced reclaim, behaving like a bad application"
> +		     " leaking its bo cache");
>  	igt_subtest_with_dynamic("madvise")
>  		for_each_combination(regions, 1, set) {
>  			char *sub_name = memregion_dynamic_subtest_name(regions);
> -- 
> 2.35.1
> 

BR,
Kamil
