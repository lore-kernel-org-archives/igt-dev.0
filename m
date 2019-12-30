Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0637F89CFA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 03:41:20 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 30 Dec 2019 05:40:36 +0200
Message-Id: <20191230034040.21943-7-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-1-imre.deak@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/10] tests/kms_ccs: Add support for
 testing multiple formats
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

Prepare for testing the media compression functionality with YUV
formats.

No functional change.

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_ccs.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index d5178824..32b69f3b 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -58,6 +58,7 @@ typedef struct {
 	enum test_flags flags;
 	igt_plane_t *plane;
 	igt_pipe_crc_t *pipe_crc;
+	uint32_t format;
 	uint64_t ccs_modifier;
 } data_t;
 
@@ -70,6 +71,10 @@ static const struct {
 	{0.0, 1.0, 0.0}
 };
 
+static const uint32_t formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t ccs_modifiers[] = {
 	LOCAL_I915_FORMAT_MOD_Y_TILED_CCS,
 	LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS,
@@ -134,7 +139,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	if (data->flags & TEST_BAD_PIXEL_FORMAT)
 		format = DRM_FORMAT_RGB565;
 	else
-		format = DRM_FORMAT_XRGB8888;
+		format = data->format;
 
 	igt_create_bo_for_fb(data->drm_fd, width, height, format, modifier, fb);
 	igt_assert(fb->gem_handle > 0);
@@ -206,12 +211,12 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	primary = igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
-	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
+	if (!igt_plane_has_format_mod(primary, data->format,
 				      data->ccs_modifier))
 		return false;
 
 	if (data->plane && fb_flags & FB_COMPRESSED) {
-		if (!igt_plane_has_format_mod(data->plane, DRM_FORMAT_XRGB8888,
+		if (!igt_plane_has_format_mod(data->plane, data->format,
 					      data->ccs_modifier))
 			return false;
 
@@ -316,8 +321,13 @@ static int __test_output(data_t *data)
 	igt_output_set_pipe(data->output, data->pipe);
 
 	for (i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
+		int j;
+
 		data->ccs_modifier = ccs_modifiers[i];
-		valid_tests += test_ccs(data);
+		for (j = 0; j < ARRAY_SIZE(formats); j++) {
+			data->format = formats[j];
+			valid_tests += test_ccs(data);
+		}
 	}
 
 	igt_output_set_pipe(data->output, PIPE_NONE);
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
