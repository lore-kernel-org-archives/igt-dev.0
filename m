Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945C010E391
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 10:50:33 +0000 (UTC)
Date: Fri, 18 Feb 2022 12:49:36 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <Yg95wGpP06QHIf0n@platvala-desk.ger.corp.intel.com>
References: <20220217154434.13877-1-anshuman.gupta@intel.com>
 <20220217154434.13877-3-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217154434.13877-3-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/perf_pmu: Change module unload
 assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 09:14:34PM +0530, Anshuman Gupta wrote:
> Update the module unload assertion values according to
> to returned values from igt_i915_driver_unload() and
> __igt_i915_driver_unload() instead of IGT process exit
> values.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/perf_pmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 4f3cb6145..a8ea914ca 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -2101,7 +2101,7 @@ static void test_unload(unsigned int num_engines)
>  
>  		igt_debug("Read %d events from perf and trial unload\n", count);
>  		pmu_read_multi(fd[0], count, buf);
> -		igt_assert_eq(__igt_i915_driver_unload(NULL), IGT_EXIT_SKIP);
> +		igt_assert(__igt_i915_driver_unload(NULL) != 0);

igt_assert_neq(__igt_i915_driver_unload(NULL), 0)


-- 
Petri Latvala


>  		pmu_read_multi(fd[0], count, buf);
>  
>  		igt_debug("Close perf\n");
> @@ -2114,7 +2114,7 @@ static void test_unload(unsigned int num_engines)
>  	igt_waitchildren();
>  
>  	igt_debug("Final unload\n");
> -	igt_assert_eq(__igt_i915_driver_unload(NULL), IGT_EXIT_SUCCESS);
> +	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
>  }
>  
>  #define test_each_engine(T, i915, ctx, e) \
> @@ -2394,7 +2394,7 @@ igt_main
>  	}
>  
>  	igt_subtest("module-unload") {
> -		igt_require(igt_i915_driver_unload() == IGT_EXIT_SUCCESS);
> +		igt_require(igt_i915_driver_unload() == 0);
>  		for (int pass = 0; pass < 3; pass++)
>  			test_unload(num_engines);
>  	}
> -- 
> 2.26.2
> 
