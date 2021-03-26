Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892FD6E12E
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Mar 2021 10:53:09 +0000 (UTC)
From: "Ram Moon, AnandX" <anandx.ram.moon@intel.com>
Date: Fri, 26 Mar 2021 10:53:05 +0000
Message-ID: <SA2PR11MB5068C839EBD50D718999C2A8AE619@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20210326090326.2160-1-anandx.ram.moon@intel.com>
 <0e8ec332-52d5-53b4-0019-7d51a732efe9@intel.com>
In-Reply-To: <0e8ec332-52d5-53b4-0019-7d51a732efe9@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v2] tests/i915/perf: Added check for testcase
 to get discarded on less than gen12 platform
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
To: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi All,

-----Original Message-----
From: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com> 
Sent: Friday, March 26, 2021 3:38 PM
To: Ram Moon, AnandX <anandx.ram.moon@intel.com>; igt-dev@lists.freedesktop.org; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Latvala, Petri <petri.latvala@intel.com>
Subject: Re: [i-g-t v2] tests/i915/perf: Added check for testcase to get discarded on less than gen12 platform

On 26/03/2021 11:03, Anand Moon wrote:
> Added check for testcase to get discarded on less than gen12 platform
>
> v2: Added check in gen12 sub testcase to return.
>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
> ---
>   tests/i915/perf.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c index 
> 664fd0a9..b78a714e 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -2389,6 +2389,9 @@ gen12_test_oa_tlb_invalidate(void)
>   	int num_reports1, num_reports2, num_expected_reports;
>   	int64_t duration;
>   
> +	if (intel_gen(devid) < 12)
> +		return;
> +
>   	/* Capture reports for 5 seconds twice and then make sure you get around
>   	 * the same number of reports. In the case of failure, the number of
>   	 * reports will vary largely since the beginning of the OA buffer 
> @@ -3003,6 +3006,9 @@ gen12_test_mi_rpc(void)
>   	size_t format_size_32;
>   	struct oa_format format = get_oa_format(test_set->perf_oa_format);
>   
> +	if (intel_gen(devid) < 12)
> +		return;
> +
>   	/* Ensure perf_stream_paranoid is set to 1 by default */
>   	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
>   
> @@ -4115,6 +4121,9 @@ gen12_test_single_ctx_render_target_writes_a_counter(void)
>   	int child_ret;
>   	struct igt_helper_process child = {};
>   
> +	if (intel_gen(devid) < 12)
> +		return;
> +
>   	/* Ensure perf_stream_paranoid is set to 1 by default */
>   	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
>   
> @@ -5062,8 +5071,6 @@ igt_main
>   	}
>   
>   	igt_subtest_group {
> -		igt_fixture igt_require(intel_gen(devid) >= 12);
> -
>   		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
>   		igt_subtest("gen12-mi-rpc")
>   			gen12_test_mi_rpc();

Could you maybe explain how those tests are run on gen < 12 when there is a igt_fixture igt_require(intel_gen(devid) >= 12); that is supposed to prevent that from happening?

On EHL gen11 platform I am observing following when we run this test case.

gta@DUT057-EHL:~/anand_devel/igt-gpu-tools/build/tests$ sudo ./perf --r stress-open-close
IGT-Version: 1.25-ge7603927 (x86_64) (Linux: 5.12.0-rc4-9900 x86_64)
Test requirement not met in function __real_main4900, file ../tests/i915/perf.c:5065:
Test requirement: intel_gen(devid) >= 12
Last errno: 2, No such file or directory
Starting subtest: stress-open-close
Subtest stress-open-close: SUCCESS (2.256s)

So in order to fix this issue I propose to add below code in subtest. 

igt_skip_on(intel_gen(devid) < 12);

So that the testcase will changes from SUCCESS to SKIP. Is this ok with you.

Subtest gen8-unprivileged-single-ctx-counters: SUCCESS (0.197s)
Starting subtest: gen12-mi-rpc
Test requirement not met in function gen12_test_mi_rpc, file ../tests/i915/perf.c:3008:
Test requirement: !(intel_gen(devid) < 12)
Subtest gen12-mi-rpc: SKIP (0.000s)
Starting subtest: gen12-oa-tlb-invalidate
Test requirement not met in function gen12_test_oa_tlb_invalidate, file ../tests/i915/perf.c:2392:
Test requirement: !(intel_gen(devid) < 12)
Subtest gen12-oa-tlb-invalidate: SKIP (0.000s)
Starting subtest: gen12-unprivileged-single-ctx-counters
Test requirement not met in function gen12_test_single_ctx_render_target_writes_a_counter, file ../tests/i915/perf.c:4122:
Test requirement: !(intel_gen(devid) < 12)
Subtest gen12-unprivileged-single-ctx-counters: SKIP (0.000s)

Thanks
-Anand


Thanks,


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
