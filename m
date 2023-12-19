Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB2D10E3E8
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Dec 2023 02:11:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v3 4/9] tests/kms_vrr: Allow test duration to be specified
 from the command line
Date: Tue, 19 Dec 2023 07:36:08 +0530
Message-Id: <20231219020613.113772-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20231219020613.113772-1-bhanuprakash.modem@intel.com>
References: <20231219020613.113772-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Using --duration argument, otherwise use default.

v2:
- Add short opt to the main callsite (Bhanu)
v3: (Bhanu)
- Rebase
- Nit: 's/d:r:/dr:/'

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 014497bcd..cf42b4345 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -114,6 +114,7 @@ typedef struct data {
 	range_t range;
 	drmModeModeInfo switch_modes[RR_MODES_COUNT];
 	vtest_ns_t vtest_ns;
+	uint64_t duration_ns;
 } data_t;
 
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
@@ -278,6 +279,9 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 		     data->vtest_ns.rate_ns >= data->vtest_ns.max,
 		     "Invalid test rate specified!\n");
 
+	if (data->duration_ns == 0)
+		data->duration_ns = TEST_DURATION_NS;
+
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -467,7 +471,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.max + 5);
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     (range.max + 5), rate, result);
@@ -475,7 +479,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & ~TEST_NEGATIVE) {
 		rate = vtest_ns.rate_ns;
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     ((range.max + range.min) / 2), rate, result);
@@ -483,7 +487,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.min - 5);
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
 			     (range.min - 5), rate, result);
@@ -496,7 +500,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
 	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
 		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
@@ -520,7 +524,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 		set_vrr_on_pipe(data, pipe, false, true);
 
 	rate = vtest_ns.max;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
 		     data->range.max, rate, vrr ? "on" : "off", result);
@@ -532,7 +536,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 	rate = vtest_ns.min;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
 		     data->range.min, rate, vrr ? "on" : "off", result);
@@ -544,7 +548,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(vrr ? (result > 75) : (result < 10),
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
 		     ((data->range.max + data->range.min) / 2), rate,
@@ -668,6 +672,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	data_t *data = _data;
 
 	switch (opt) {
+	case 'd':
+		data->duration_ns = atoi(optarg) * NSECS_PER_SEC;
+		break;
 	case 'r':
 		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
 		break;
@@ -676,16 +683,18 @@ static int opt_handler(int opt, int opt_index, void *_data)
 }
 
 static const struct option long_opts[] = {
+	{ .name = "duration", .has_arg = true, .val = 'd', },
 	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
 	{}
 };
 
 static const char help_str[] =
+	"  --duration <duration-seconds>\t\tHow long to run the test for\n"
 	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
 
 static data_t data;
 
-igt_main_args("r:", long_opts, help_str, opt_handler, &data)
+igt_main_args("dr:", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-- 
2.40.0
