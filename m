Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39A110E624
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jun 2022 10:11:53 +0000 (UTC)
Date: Fri, 24 Jun 2022 12:11:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrWN5urBygaMotWL@kamilkon-desk1>
References: <20220624095408.3440614-1-janga.rahul.kumar@intel.com>
 <20220624095408.3440614-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220624095408.3440614-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/i915/gem_exec_suspend : Added
 subtests description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-06-24 at 15:24:07 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2 : Modified subtest description and added description
>      to all the subtests.
> v3 : Modified description based on suggestions.
> v4 : Modified test description.
> v5 : Aligned description strings.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  tests/i915/gem_exec_suspend.c | 49 +++++++++++++++++++++++------------
>  1 file changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index 401026ef..3b59966a 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -37,6 +37,8 @@
>  #include "igt_gt.h"
>  #include "igt_sysfs.h"
>  
> +IGT_TEST_DESCRIPTION("Exercise simple execbufs runs across various suspend/resume cycles.");
> +
>  #define NOSLEEP 0
>  #define IDLE 1
>  #define SUSPEND_DEVICES 2
> @@ -286,29 +288,37 @@ igt_main
>  	const struct {
>  		const char *suffix;
>  		unsigned mode;
> +		const char *describe;
>  	} modes[] = {
> -		{ "", NOSLEEP },
> -		{ "-S3", SUSPEND },
> -		{ "-S4", HIBERNATE },
> -		{ NULL, 0 }
> +		{ "", NOSLEEP, "without suspend/resume cycle" },
> +		{ "-S3", SUSPEND, "suspend-to-mem" },
> +		{ "-S4", HIBERNATE, "suspend-to-disk" },
> +		{ NULL, 0, "" }
>  	}, *m;
>  	struct test {
>  		const char *name;
>  		unsigned int flags;
>  		void (*fn)(int, const intel_ctx_t *, unsigned, unsigned, uint32_t);
> +		const char *describe;
>  	} *test, tests_all_engines[] = {
> -		{ "basic", NOSLEEP, run_test },
> -		{ "basic-S0", IDLE, run_test },
> -		{ "basic-S3-devices", SUSPEND_DEVICES, run_test },
> -		{ "basic-S3", SUSPEND, run_test },
> -		{ "basic-S4-devices", HIBERNATE_DEVICES, run_test },
> -		{ "basic-S4", HIBERNATE, run_test },
> +		{ "basic", NOSLEEP, run_test, "Check basic functionality without any "
> +					      "suspend/resume cycle." },
> +		{ "basic-S0", IDLE, run_test, "Check with suspend-to-idle target state." },
> +		{ "basic-S3-devices", SUSPEND_DEVICES, run_test, "Check with suspend-to-mem "
> +								 "with devices only." },
> +		{ "basic-S3", SUSPEND, run_test, "Check full cycle of suspend-to-mem." },
> +		{ "basic-S4-devices", HIBERNATE_DEVICES, run_test, "Check with suspend-to-disk "
> +								   "with devices only." },
> +		{ "basic-S4", HIBERNATE, run_test, "Check full cycle of suspend-to-disk." },
>  		{ }
>  	}, tests_power_hang[] = {
> -		{ "hang-S3", SUSPEND | HANG, run_test },
> -		{ "hang-S4", HIBERNATE | HANG, run_test },
> -		{ "power-S0", IDLE, power_test },
> -		{ "power-S3", SUSPEND, power_test },
> +		{ "hang-S3", SUSPEND | HANG, run_test, "Check full cycle of suspend-to-mem with a "
> +						       "pending GPU hang." },
> +		{ "hang-S4", HIBERNATE | HANG, run_test, "Check full cycle of suspend-to-disk with "
> +							 "a pending GPU hang." },
> +		{ "power-S0", IDLE, power_test, "Check power consumption during idle state." },
> +		{ "power-S3", SUSPEND, power_test, "Check power consumption during "
> +						   "suspend-to-mem state." },
>  		{ }
>  	};
>  	const struct intel_execution_engine2 *e;
> @@ -359,20 +369,25 @@ igt_main
>  		} \
>  	}
>  
> -	for (test = tests_all_engines; test->name; test++)
> +	for (test = tests_all_engines; test->name; test++) {
> +		igt_describe(test->describe);
>  		subtest_for_each_combination(test->name, intel_ctx_0(fd), test->flags, test->fn);
> +	}
>  
>  	for (m = modes; m->suffix; m++) {
> +		igt_describe_f("Check %s state with fixed object.", m->describe);
>  		igt_subtest_with_dynamic_f("fixed%s", m->suffix) {
>  			igt_require(gem_has_lmem(fd));
>  			for_each_ctx_engine_combination(m->mode);
>  		}
>  
> +		igt_describe_f("Check %s state with uncached object.", m->describe);
>  		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
>  			igt_require(!gem_has_lmem(fd));
>  			for_each_ctx_engine_combination(m->mode | UNCACHED);
>  		}
>  
> +		igt_describe_f("Check %s state with cached object.", m->describe);
>  		igt_subtest_with_dynamic_f("cached%s", m->suffix) {
>  			igt_require(!gem_has_lmem(fd));
>  			for_each_ctx_engine_combination(m->mode | CACHED);
> @@ -384,8 +399,10 @@ igt_main
>  		hang = igt_allow_hang(fd, 0, 0);
>  	}
>  
> -	for (test = tests_power_hang; test->name; test++)
> +	for (test = tests_power_hang; test->name; test++) {
> +		igt_describe(test->describe);
>  		subtest_for_each_combination(test->name, intel_ctx_0(fd), test->flags, test->fn);
> +	}
>  
>  	igt_fixture {
>  		free(query_info);
> -- 
> 2.25.1
> 
