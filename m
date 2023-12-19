Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D9610E3DF
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Dec 2023 05:01:25 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v4 3/9] tests/kms_vrr: Allow test rate to be altered from the
 command line
Date: Tue, 19 Dec 2023 10:26:18 +0530
Message-Id: <20231219045618.128087-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231219020613.113772-4-bhanuprakash.modem@intel.com>
References: <20231219020613.113772-4-bhanuprakash.modem@intel.com>
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

Instead of always using the midpoint, introduce optional argument
--refresh-rate to allow callers to specify the target refresh rate for
the test.

v2:
- Add short opt to the main callsite (Bhanu)
v3: (Bhanu)
- Rebase
v4: (Bhanu)
- Not necessary to keep the refresh rate within the VRR range

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 505bad44b..553b8d356 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -102,7 +102,7 @@ typedef struct range {
 
 typedef struct vtest_ns {
 	uint64_t min;
-	uint64_t mid;
+	uint64_t rate_ns;
 	uint64_t max;
 } vtest_ns_t;
 
@@ -266,10 +266,15 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	mode = *igt_output_get_mode(output);
 
 	data->vtest_ns.min = rate_from_refresh(data->range.min);
-	data->vtest_ns.mid = rate_from_refresh(
-				(data->range.min + data->range.max) / 2);
 	data->vtest_ns.max = rate_from_refresh(data->range.max);
 
+	/* If unspecified on the command line, default rate to the midpoint */
+	if (data->vtest_ns.rate_ns == 0) {
+		range_t *range = &data->range;
+		data->vtest_ns.rate_ns = rate_from_refresh(
+						(range->min + range->max) / 2);
+	}
+
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -413,7 +418,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	prepare_test(data, output, pipe);
 	range = data->range;
 	vtest_ns = data->vtest_ns;
-	rate = vtest_ns.mid;
+	rate = vtest_ns.rate_ns;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
@@ -466,7 +471,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	}
 
 	if (flags & ~TEST_NEGATIVE) {
-		rate = vtest_ns.mid;
+		rate = vtest_ns.rate_ns;
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
@@ -487,7 +492,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * a VRR capable panel.
 	 */
 	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
-	rate = vtest_ns.mid;
+	rate = vtest_ns.rate_ns;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
@@ -535,7 +540,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
-	rate = vtest_ns.mid;
+	rate = vtest_ns.rate_ns;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(vrr ? (result > 75) : (result < 10),
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
@@ -655,10 +660,30 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 	}
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
 {
-	data_t data = {};
+	data_t *data = _data;
+
+	switch (opt) {
+	case 'r':
+		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
+		break;
+	}
+	return IGT_OPT_HANDLER_SUCCESS;
+}
 
+static const struct option long_opts[] = {
+	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
+	{}
+};
+
+static const char help_str[] =
+	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
+
+static data_t data;
+
+igt_main_args("r:", long_opts, help_str, opt_handler, &data)
+{
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-- 
2.40.0
