Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3FD10F6B1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 10:04:34 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 Aug 2022 15:05:21 +0530
Message-Id: <20220801093521.16437-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: First async flip
 discarded on i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com, arun.r.murthy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Display 13 onwards, i915 uses the first async flip to update the
watermarks as per the watermark optimization. Hence the actual
async flip will happen from the subsequent flips.

To handle this, a dummy async flip has to be done in the async flip
subtests to allow the KMD to perform the watermark related updates
before writing to the surface base address.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_fb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index d50fde45..c2ee422b 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -470,6 +470,7 @@ max_hw_stride_async_flip_test(data_t *data)
 		       h = data->output->config.default_mode.vdisplay;
 	igt_plane_t *primary;
 	igt_crc_t compare_crc, async_crc;
+	uint32_t devid = intel_get_drm_devid(data->drm_fd);
 
 	igt_require(data->display.is_atomic);
 	igt_output_set_pipe(data->output, data->pipe);
@@ -518,6 +519,16 @@ max_hw_stride_async_flip_test(data_t *data)
 		igt_display_commit_atomic(&data->display,
 					  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
+		/* First async flip on Gen13+ will be treated as a sync flip*/
+		if (AT_LEAST_GEN(devid, 12)) {
+			do {
+				ret = drmModePageFlip(data->drm_fd, data->output->config.crtc->crtc_id,
+						      data->big_fb.fb_id,
+						      DRM_MODE_PAGE_FLIP_ASYNC, NULL);
+			} while (ret == -EBUSY);
+			igt_assert(ret == 0);
+		}
+
 		igt_wait_for_vblank(data->drm_fd, data->display.pipes[primary->pipe->pipe].crtc_offset);
 		startframe = kmstest_get_vblank(data->drm_fd, data->pipe, 0) + 1;
 
-- 
2.22.0
