Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948266E52D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 14:37:43 +0000 (UTC)
Date: Thu, 19 Nov 2020 15:37:37 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201119143737.GY6508@kdec5-desk.ger.corp.intel.com>
References: <20200709043155.23839-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709043155.23839-1-ranjeet1.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t]i915/gem_exec_suspend: Added test
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
To: ranjeet1.kumar@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 10:01:55AM +0530, ranjeet1.kumar@intel.com wrote:
> From: ranjeet kumar <ranjeet1.kumar@intel.com>
> 
> Added test description for subtest.
> 
> Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
> Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
> ---
>  tests/i915/gem_exec_suspend.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index d768db91..8c9258f5 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -50,6 +50,9 @@
>  #define CACHED (1<<8)
>  #define HANG (2<<8)
>  
> +IGT_TEST_DESCRIPTION("executing batch buffer objects on suspend and then checks"
> +		     " for the result");
This description looks similar but somehow opposite to what is added above in
comment.
> +
>  static void run_test(int fd, unsigned ring, unsigned flags);
>  
>  static void check_bo(int fd, uint32_t handle)
> @@ -312,23 +315,33 @@ igt_main
>  		igt_fork_hang_detector(fd);
>  	}
>  
> +	igt_describe("checks normal condition before sending into suspend");
s/checks/Check/
s/sending/setting/
>  	igt_subtest("basic")
>  		run_test(fd, ALL_ENGINES, NOSLEEP);
Please add new line between all testcases here - it will be more readable.
> +	igt_describe("system in idle state no operation");
igt_describe("Put system to sleep state (freeze)");
>  	igt_subtest("basic-S0")
>  		run_test(fd, ALL_ENGINES, IDLE);
> +	igt_describe("suspend-to-mem target state and resume with with some operation");
igt_describe("Put system into suspend to mem and verify it still works after
resume.");
>  	igt_subtest("basic-S3-devices")
>  		run_test(fd, ALL_ENGINES, SUSPEND_DEVICES);
> +	igt_describe("suspend-to-mem and resume with no operation");
WHat does no operation mean here? ^

Looking libraries this case is performing suspend to mem, suspend sequence is to
be terminated when platfrom and devs are not suspended.

>  	igt_subtest("basic-S3")
>  		run_test(fd, ALL_ENGINES, SUSPEND);
> +	igt_describe("suspend-to-disk target state and resume with with some operation");
What is 'some operation'?
>  	igt_subtest("basic-S4-devices")
>  		run_test(fd, ALL_ENGINES, HIBERNATE_DEVICES);
> +	igt_describe("suspend-to-disk and resume with no operation");
What does 'no operation mean'?
>  	igt_subtest("basic-S4")
>  		run_test(fd, ALL_ENGINES, HIBERNATE);
Please be more specific in above cases. We need clear explanation what test is
doing. Please investigate lib/lib_aux.h and lib/lib_aux.c for more information.

>  	for (e = intel_execution_engines; e->name; e++) {
>  		for (m = modes; m->suffix; m++) {
> +			igt_describe("Test normal operation write and some reloc"
> +				     " operation performed");
>  			igt_subtest_f("%s-uncached%s", e->name, m->suffix)
>  				run_test(fd, eb_ring(e), m->mode | UNCACHED);
> +			igt_describe("Wraps the SET_CACHING ioctl and then performed"
> +				     " write and reloc operation");
>  			igt_subtest_f("%s-cached%s", e->name, m->suffix)
>  				run_test(fd, eb_ring(e), m->mode | CACHED);
I think these 2 description are showing what code is doing but not explaining
what for. Please dig IGT libraries and Linux kernel documentation to explain
why we need these tests.
>  	
}
> @@ -339,13 +352,19 @@ igt_main
>  		hang = igt_allow_hang(fd, 0, 0);
>  	}
>  
> +	igt_describe("Start a recursive call of batch on a ring and return structure"
> +		     " with suspended state");
Here again functions are described, but what is test doing? If you will look at
git blame you will see that these 2 cases are checkign if we can suspend GPU
even if it is busy with indefinite loop.
>  	igt_subtest("hang-S3")
>  		run_test(fd, 0, SUSPEND | HANG);
> +	igt_describe("Start a recursive call of batch on a ring and return structure"
> +		     " with hibernate state");
>  	igt_subtest("hang-S4")
>  		run_test(fd, 0, HIBERNATE | HANG);
>  

And these below are about mesuring power consumption during suspend.

Whole aim of documenting is to show aim of test, not tools that are used.
Kasia
> +	igt_describe("Test is to report energy level");
>  	igt_subtest("power-S0")
>  		power_test(fd, 0, IDLE);
> +	igt_describe("Test to report power consumed and discharge rate while suspended");
>  	igt_subtest("power-S3")
>  		power_test(fd, 0, SUSPEND);
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
