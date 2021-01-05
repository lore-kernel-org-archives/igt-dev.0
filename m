Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C97589DD3
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 20:39:10 +0000 (UTC)
Date: Tue, 5 Jan 2021 12:39:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20210105203901.GA71203@orsosgc001.ra.intel.com>
References: <20201216083820.41756-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216083820.41756-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/perf: drop check on report
 reason
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 10:38:20AM +0200, Lionel Landwerlin wrote:
>Learning the experimental way that ICL can generate 2 back to back
>timer reports with the same timestamp...
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Hmm, it's tough to generalize this check then, agree to drop it.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>---
> tests/i915/perf.c | 9 ---------
> 1 file changed, 9 deletions(-)
>
>diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>index f09431472..664fd0a94 100644
>--- a/tests/i915/perf.c
>+++ b/tests/i915/perf.c
>@@ -780,7 +780,6 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
> 					format.b_off);
> 	uint32_t *rpt1_b = (uint32_t *)(((uint8_t *)oa_report1) +
> 					format.b_off);
>-	uint32_t report_reason0, report_reason1;
> 	uint32_t b;
> 	uint32_t ref;
>
>@@ -791,14 +790,6 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
> 	freq = time_delta ? ((uint64_t)clock_delta * 1000) / time_delta : 0;
> 	igt_debug("freq = %"PRIu64"\n", freq);
>
>-	/* Either we have 2 reports back to back with the same
>-	 * timestamp and those should have different reason, or we
>-	 * were able to compute a frequency because the timestamps are
>-	 * different.
>-	 */
>-	igt_assert(freq || (gen8_report_reason(oa_report0) !=
>-			    gen8_report_reason(oa_report1)));
>-
> 	igt_debug("clock delta = %"PRIu32"\n", clock_delta);
>
> 	max_delta = clock_delta * intel_perf->devinfo.n_eus;
>-- 
>2.29.2
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
