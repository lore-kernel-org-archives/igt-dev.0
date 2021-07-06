Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4C989F03
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jul 2021 15:38:31 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Tue,  6 Jul 2021 20:58:32 +0530
Message-Id: <1625585312-8797-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1625327579-28710-1-git-send-email-vidya.srinivas@intel.com>
References: <1625327579-28710-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip
 coverage-vs-premult-vs-none for 6bpc panels
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Intel Gen11 6bpc panels are giving CRC mismatch in coverage-vs-premult-vs-none
6bpc panel has dithering ON and CRC test with dithering ON might result in
mismatch. Hence, skipping this subtest for 6bpc panels.

Credits-to: Uma Shankar <uma.shankar@intel.com>
Credits-to: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a37cb27c7d62..7f9738545f0a 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -25,6 +25,7 @@
  */
 
 #include "igt.h"
+#include "igt_edid.h"
 
 IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
 
@@ -442,10 +443,38 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
+uint8_t get_edid_bpc(data_t *data, igt_output_t *output)
+{
+	bool ok;
+	uint64_t edid_blob_id;
+	drmModePropertyBlobRes *edid_blob;
+	const struct edid *edid;
+
+	ok = kmstest_get_property(data->gfx_fd, output->id,
+			DRM_MODE_OBJECT_CONNECTOR, "EDID",
+			NULL, &edid_blob_id, NULL);
+
+	if (!ok || !edid_blob_id)
+		return 0;
+
+	edid_blob = drmModeGetPropertyBlob(data->gfx_fd, edid_blob_id);
+	igt_assert(edid_blob);
+
+	edid = (const struct edid *) edid_blob->data;
+	igt_assert(edid);
+
+	drmModeFreePropertyBlob(edid_blob);
+	return ((edid->input & 0x70) >> 3) + 4;
+}
+
 static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
+	igt_output_t *output = igt_get_single_output_for_pipe(display, pipe);
+	uint8_t current_bpc = get_edid_bpc(data, output);
+
+	igt_require(current_bpc >= 8);
 
 	/* Set a background color on the primary fb for testing */
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
