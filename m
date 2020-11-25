Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B616E99E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 11:25:46 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 25 Nov 2020 13:25:38 +0200
Message-Id: <20201125112540.426554-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
References: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/3] tests/i915/perf: constify report
 checks functions
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Those don't need to modify the reports they inspect.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index caeabd623..2fbea0f0c 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -206,9 +206,10 @@ static bool *undefined_a_counters;
 static uint64_t oa_exp_1_millisec;
 
 static igt_render_copyfunc_t render_copy = NULL;
-static uint32_t (*read_report_ticks)(uint32_t *report,
+static uint32_t (*read_report_ticks)(const uint32_t *report,
 				     enum drm_i915_oa_format format);
-static void (*sanity_check_reports)(uint32_t *oa_report0, uint32_t *oa_report1,
+static void (*sanity_check_reports)(const uint32_t *oa_report0,
+				    const uint32_t *oa_report1,
 				    enum drm_i915_oa_format format);
 
 static void
@@ -354,7 +355,7 @@ sysfs_read(const char *path)
  * but it's not included in all of the formats.
  */
 static uint32_t
-hsw_read_report_ticks(uint32_t *report, enum drm_i915_oa_format format)
+hsw_read_report_ticks(const uint32_t *report, enum drm_i915_oa_format format)
 {
 	uint32_t *c = (uint32_t *)(((uint8_t *)report) + get_oa_format(format).c_off);
 
@@ -364,13 +365,13 @@ hsw_read_report_ticks(uint32_t *report, enum drm_i915_oa_format format)
 }
 
 static uint32_t
-gen8_read_report_ticks(uint32_t *report, enum drm_i915_oa_format format)
+gen8_read_report_ticks(const uint32_t *report, enum drm_i915_oa_format format)
 {
 	return report[3];
 }
 
 static void
-gen8_read_report_clock_ratios(uint32_t *report,
+gen8_read_report_clock_ratios(const uint32_t *report,
 			      uint32_t *slice_freq_mhz,
 			      uint32_t *unslice_freq_mhz)
 {
@@ -554,7 +555,8 @@ emit_report_perf_count(struct intel_bb *ibb,
 }
 
 static void
-hsw_sanity_check_render_basic_reports(uint32_t *oa_report0, uint32_t *oa_report1,
+hsw_sanity_check_render_basic_reports(const uint32_t *oa_report0,
+				      const uint32_t *oa_report1,
 				      enum drm_i915_oa_format fmt)
 {
 	uint32_t time_delta = timebase_scale(oa_report1[1] - oa_report0[1]);
@@ -639,7 +641,8 @@ hsw_sanity_check_render_basic_reports(uint32_t *oa_report0, uint32_t *oa_report1
 }
 
 static uint64_t
-gen8_read_40bit_a_counter(uint32_t *report, enum drm_i915_oa_format fmt, int a_id)
+gen8_read_40bit_a_counter(const uint32_t *report,
+			  enum drm_i915_oa_format fmt, int a_id)
 {
 	struct oa_format format = get_oa_format(fmt);
 	uint8_t *a40_high = (((uint8_t *)report) + format.a40_high_off);
@@ -757,7 +760,8 @@ accumulator_print(struct accumulator *accumulator, const char *title)
 
 /* The TestOa metric set is designed so */
 static void
-gen8_sanity_check_test_oa_reports(uint32_t *oa_report0, uint32_t *oa_report1,
+gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
+				  const uint32_t *oa_report1,
 				  enum drm_i915_oa_format fmt)
 {
 	struct oa_format format = get_oa_format(fmt);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
