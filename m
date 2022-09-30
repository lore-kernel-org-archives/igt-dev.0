Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C0310E222
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 11:59:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Sep 2022 17:29:12 +0530
Message-Id: <20220930115913.2640024-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220930115913.2640024-1-bhanuprakash.modem@intel.com>
References: <20220930115913.2640024-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 2/3] tests/kms_vrr: Add a test for VRR range
 capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

VRR range capability is parsed from EDID and reported to debugfs.
The new tests check if the parsing is correct by reading it from
EDID.

V2:
- Fix the crash in CI

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 68c4f264..3734e3a5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -24,6 +24,7 @@
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
+#include "igt_edid.h"
 
 #define NSECS_PER_SEC (1000000000ull)
 
@@ -46,6 +47,7 @@ enum {
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
 	TEST_NEGATIVE = 1 << 4,
+	TEST_RANGE = 1 << 5,
 };
 
 typedef struct range {
@@ -453,6 +455,80 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_remove_fb(data->drm_fd, &data->fb0);
 }
 
+static struct detailed_data_monitor_range
+detailed_timing_get_monitor_range(const struct edid *edid)
+{
+       uint8_t i;
+       struct detailed_data_monitor_range mr = {0, 0};
+
+       for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
+               struct detailed_non_pixel *other_data;
+               struct detailed_timing timings = edid->detailed_timings[i];
+
+               /*
+                * From EDID Display Range Limits Descriptor specs:
+                *
+                * Bytes        Description
+                *  0–1         00 00 = Display Descriptor
+                *   2          00 = reserved
+                *   3          FD = Display Range Limits Descriptor
+                *   10         01 = No timing information.
+                *
+                */
+               if (timings.pixel_clock[0] != 0x00 ||
+                   timings.pixel_clock[1] != 0x00)
+                       continue;
+
+               other_data = &timings.data.other_data;
+               if (other_data->pad1 != 0x00 ||
+                   other_data->type != EDID_DETAIL_MONITOR_RANGE)
+                       continue;
+
+               /* Check for flag range limits only. */
+               if (other_data->data.range.flags != 0x01)
+                       continue;
+
+               mr = other_data->data.range;
+               break;
+       }
+
+       return mr;
+}
+
+static void
+test_vrr_range(data_t *data, enum pipe pipe,
+		igt_output_t *output, uint32_t flags)
+{
+	uint64_t edid_blob_id;
+	const struct edid *edid;
+	struct detailed_data_monitor_range expected_range;
+	drmModePropertyBlobPtr edid_blob = NULL;
+	drmModeConnector *connector = output->config.connector;
+
+	igt_assert(kmstest_get_property(data->drm_fd, connector->connector_id,
+					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+					&edid_blob_id, NULL));
+	edid_blob = drmModeGetPropertyBlob(data->drm_fd, edid_blob_id);
+	igt_require_f(edid_blob, "EDID blob is NULL\n");
+
+	edid = (const struct edid *) edid_blob->data;
+	igt_assert(edid);
+
+	expected_range = detailed_timing_get_monitor_range(edid);
+	drmModeFreePropertyBlob(edid_blob);
+
+	data->range = get_vrr_range(data, output);
+	igt_info("Monitor range from EDID: %d-%d, Kernel parsed VRR range as: %d-%d\n",
+			expected_range.min_vfreq, expected_range.max_vfreq,
+			data->range.min, data->range.max);
+
+	igt_assert_f(data->range.min == expected_range.min_vfreq &&
+		     data->range.max == expected_range.max_vfreq,
+		     "Expecting VRR range %d-%d, got %d-%d\n",
+		     expected_range.min_vfreq, expected_range.max_vfreq,
+		     data->range.min, data->range.max);
+}
+
 /* Runs tests on outputs that are VRR capable. */
 static void
 run_vrr_test(data_t *data, test_t test, uint32_t flags)
@@ -469,7 +545,8 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 		if ((flags & TEST_NEGATIVE) && vrr_capable(output))
 			continue;
 
-		if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
+		/* Range test doesn't care about VRR capability. */
+		if ((flags & ~(TEST_RANGE | TEST_NEGATIVE)) && !vrr_capable(output))
 			continue;
 
 		for_each_pipe(&data->display, pipe) {
@@ -520,6 +597,11 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Read the monitor RR range from monitor and make sure that "
+		     "Kernel is parsing it properly.");
+	igt_subtest_with_dynamic("parse-vrr-range")
+		run_vrr_test(&data, test_vrr_range, TEST_RANGE);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.37.3
