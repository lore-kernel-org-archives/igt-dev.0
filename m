Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB1A6E51C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 22:17:40 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 14 Oct 2021 01:17:22 +0300
Message-Id: <20211013221727.6392-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/8] tests/i915/kms_flip_tiling: Drop
 ancient stride change restrictin
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The restriction on page flips not being able to change the stride
was only relevant when i915 was still using CS flips. Ever since
we switched to pure mmio there is no limitation on what a page
flip can do (though the drm core still disallows pixel format
changes).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_flip_tiling.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 49ed7cb4863a..0ed08f78f917 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -72,7 +72,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	igt_plane_t *primary;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t reference_crc, crc;
-	int fb_id, ret, width;
+	int fb_id, ret;
 
 	pipe_crc = pipe_crc_new(data, pipe);
 	igt_output_set_pipe(output, pipe);
@@ -88,30 +88,17 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 
 	primary = igt_output_get_plane(output, 0);
 
-	width = mode->hdisplay;
-
-	if (modifier[0] != modifier[1] &&
-	    (modifier[0] != DRM_FORMAT_MOD_LINEAR ||
-	     modifier[1] != DRM_FORMAT_MOD_LINEAR)) {
-		/*
-		 * Since a page flip to a buffer with different stride
-		 * doesn't work, choose width so that the stride of both
-		 * buffers is the same.
-		 */
-		width = 512;
-		while (width < mode->hdisplay)
-			width *= 2;
-	}
-
-	fb_id = igt_create_pattern_fb(data->drm_fd, width, mode->vdisplay,
+	fb_id = igt_create_pattern_fb(data->drm_fd,
+				      mode->hdisplay, mode->vdisplay,
 				      data->testformat, modifier[0],
 				      &data->fb[0]);
 	igt_assert(fb_id);
 
 	/* Second fb has different background so CRC does not match. */
-	fb_id = igt_create_color_pattern_fb(data->drm_fd, width, mode->vdisplay,
-				      data->testformat, modifier[1],
-				      0.5, 0.5, 0.5, &data->fb[1]);
+	fb_id = igt_create_color_pattern_fb(data->drm_fd,
+					    mode->hdisplay, mode->vdisplay,
+					    data->testformat, modifier[1],
+					    0.5, 0.5, 0.5, &data->fb[1]);
 	igt_assert(fb_id);
 
 	/* Set the crtc and generate a reference CRC. */
-- 
2.32.0
