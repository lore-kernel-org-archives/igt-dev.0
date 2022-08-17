Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FA210E118
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 04:46:36 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 Aug 2022 09:47:57 +0530
Message-Id: <20220817041757.30267-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/kms_big_fb: First async flip
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
 tests/i915/kms_big_fb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index d50fde45..0c4cd95e 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -518,6 +518,16 @@ max_hw_stride_async_flip_test(data_t *data)
 		igt_display_commit_atomic(&data->display,
 					  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
+		/* First async flip on Gen13+ will be treated as a sync flip*/
+		if (intel_display_ver(data->devid) >= 13) {
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
