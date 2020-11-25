Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5956EAAB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 22:12:28 +0000 (UTC)
Date: Wed, 25 Nov 2020 14:12:27 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20201125221227.GE4371@orsosgc001.ra.intel.com>
References: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
 <20201125112540.426554-3-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125112540.426554-3-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] tests/i915/perf: deal with 0
 delta reports
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

On Wed, Nov 25, 2020 at 01:25:39PM +0200, Lionel Landwerlin wrote:
>More thorough testing shows that it is possible to get a timer report
>followed by a context-switch report with the same timestamp.
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

nit below.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>---
> tests/i915/perf.c | 91 +++++++++++++++++++++++++----------------------
> 1 file changed, 49 insertions(+), 42 deletions(-)
>
>diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>index 2fbea0f0c..811067aad 100644
>--- a/tests/i915/perf.c
>+++ b/tests/i915/perf.c
>@@ -778,15 +778,14 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
> 	uint32_t b;
> 	uint32_t ref;
>
>+	igt_debug("report type: %s->%s %p/%p\n",
>+		  gen8_read_report_reason(oa_report0),
>+		  gen8_read_report_reason(oa_report1),
>+		  oa_report0, oa_report1);
>
>-	igt_assert_neq(time_delta, 0);
>-	igt_assert_neq(clock_delta, 0);
>-
>-	freq = ((uint64_t)clock_delta * 1000) / time_delta;
>+	freq = time_delta ? ((uint64_t)clock_delta * 1000) / time_delta : 0;
> 	igt_debug("freq = %"PRIu64"\n", freq);

Maybe one more check:

igt_assert(freq || (report_reason0 != report_reason1));

>
>-	igt_assert(freq <= gt_max_freq_mhz);
>-
> 	igt_debug("clock delta = %"PRIu32"\n", clock_delta);
>
> 	max_delta = clock_delta * intel_perf->devinfo.n_eus;
>@@ -823,42 +822,50 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
> 	 * multiple of the gpu clock
> 	 */
> 	if (format.n_b) {
>-		b = rpt1_b[0] - rpt0_b[0];
>-		igt_debug("B0: delta = %"PRIu32"\n", b);
>-		igt_assert_eq(b, 0);
>-
>-		b = rpt1_b[1] - rpt0_b[1];
>-		igt_debug("B1: delta = %"PRIu32"\n", b);
>-		igt_assert_eq(b, clock_delta);
>-
>-		b = rpt1_b[2] - rpt0_b[2];
>-		igt_debug("B2: delta = %"PRIu32"\n", b);
>-		igt_assert_eq(b, clock_delta);
>-
>-		b = rpt1_b[3] - rpt0_b[3];
>-		ref = clock_delta / 2;
>-		igt_debug("B3: delta = %"PRIu32"\n", b);
>-		igt_assert(b >= ref - 1 && b <= ref + 1);
>-
>-		b = rpt1_b[4] - rpt0_b[4];
>-		ref = clock_delta / 3;
>-		igt_debug("B4: delta = %"PRIu32"\n", b);
>-		igt_assert(b >= ref - 1 && b <= ref + 1);
>-
>-		b = rpt1_b[5] - rpt0_b[5];
>-		ref = clock_delta / 3;
>-		igt_debug("B5: delta = %"PRIu32"\n", b);
>-		igt_assert(b >= ref - 1 && b <= ref + 1);
>-
>-		b = rpt1_b[6] - rpt0_b[6];
>-		ref = clock_delta / 6;
>-		igt_debug("B6: delta = %"PRIu32"\n", b);
>-		igt_assert(b >= ref - 1 && b <= ref + 1);
>-
>-		b = rpt1_b[7] - rpt0_b[7];
>-		ref = clock_delta * 2 / 3;
>-		igt_debug("B7: delta = %"PRIu32"\n", b);
>-		igt_assert(b >= ref - 1 && b <= ref + 1);
>+		if (clock_delta > 0) {
>+			b = rpt1_b[0] - rpt0_b[0];
>+			igt_debug("B0: delta = %"PRIu32"\n", b);
>+			igt_assert_eq(b, 0);
>+
>+			b = rpt1_b[1] - rpt0_b[1];
>+			igt_debug("B1: delta = %"PRIu32"\n", b);
>+			igt_assert_eq(b, clock_delta);
>+
>+			b = rpt1_b[2] - rpt0_b[2];
>+			igt_debug("B2: delta = %"PRIu32"\n", b);
>+			igt_assert_eq(b, clock_delta);
>+
>+			b = rpt1_b[3] - rpt0_b[3];
>+			ref = clock_delta / 2;
>+			igt_debug("B3: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+
>+			b = rpt1_b[4] - rpt0_b[4];
>+			ref = clock_delta / 3;
>+			igt_debug("B4: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+
>+			b = rpt1_b[5] - rpt0_b[5];
>+			ref = clock_delta / 3;
>+			igt_debug("B5: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+
>+			b = rpt1_b[6] - rpt0_b[6];
>+			ref = clock_delta / 6;
>+			igt_debug("B6: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+
>+			b = rpt1_b[7] - rpt0_b[7];
>+			ref = clock_delta * 2 / 3;
>+			igt_debug("B7: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+		} else {
>+			for (int j = 0; j < format.n_b; j++) {
>+				b = rpt1_b[j] - rpt0_b[j];
>+				igt_debug("B%i: delta = %"PRIu32"\n", j, b);
>+				igt_assert_eq(b, 0);
>+			}
>+		}
> 	}
>
> 	for (int j = 0; j < format.n_c; j++) {
>-- 
>2.29.2
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
