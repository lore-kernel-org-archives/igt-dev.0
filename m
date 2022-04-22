Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4301121F9
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 07:54:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Apr 2022 13:22:22 +0530
Message-Id: <20220422075223.2792586-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220422075223.2792586-1-bhanuprakash.modem@intel.com>
References: <20220422075223.2792586-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/4] tests/kms_vrr: Add a test for VRR range
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

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7e06d39d..ad5b10ac 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -24,6 +24,7 @@
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
+#include "igt_edid.h"
 
 #define NSECS_PER_SEC (1000000000ull)
 
@@ -486,6 +487,47 @@ test_negative_basic(data_t *data, enum pipe pipe,
 	igt_remove_fb(data->drm_fd, &data->fb0);
 }
 
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
+	prepare_negative_test(data, output, pipe);
+	expected_range = detailed_timing_get_monitor_range(edid);
+	drmModeFreePropertyBlob(edid_blob);
+
+	igt_assert_f(data->range.min == expected_range.min_vfreq &&
+		     data->range.max == expected_range.max_vfreq,
+		     "Expecting VRR range %d-%d, got %d-%d\n",
+		     expected_range.min_vfreq, expected_range.max_vfreq,
+		     data->range.min, data->range.max);
+
+	igt_info("Monitor range from EDID: %d-%d, Kernel parsed VRR range as: %d-%d\n",
+			expected_range.min_vfreq, expected_range.max_vfreq,
+			data->range.min, data->range.max);
+
+	/* Clean-up */
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	set_vrr_on_pipe(data, pipe, false);
+
+	igt_remove_fb(data->drm_fd, &data->fb0);
+}
+
 /* Runs tests on outputs that are VRR capable. */
 static void
 run_vrr_test(data_t *data, test_t test, uint32_t flags)
@@ -518,6 +560,25 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 	}
 }
 
+static void
+run_parse_test(data_t *data, test_t test, uint32_t flags)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		enum pipe pipe;
+
+		for_each_pipe(&data->display, pipe) {
+			if (igt_pipe_connector_valid(pipe, output)) {
+				igt_dynamic_f("pipe-%s-%s",
+					      kmstest_pipe_name(pipe), output->name)
+					test(data, pipe, output, flags);
+				break;
+			}
+		}
+	}
+}
+
 igt_main
 {
 	data_t data = {};
@@ -555,6 +616,11 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_negative_basic, TEST_NEGATIVE);
 
+	igt_describe("Read the monitor RR range from monitor and make sure that "
+		     "Kernel is parsing it properly.");
+	igt_subtest_with_dynamic("parse-vrr-range")
+		run_parse_test(&data, test_vrr_range, TEST_NONE);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.35.1
