Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F06BA46C9
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 10:52:37 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Jul 2022 16:26:12 +0530
Message-Id: <20220714105612.3025-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_invalid_mode: Avoid usage of same
 pipe on multiple outputs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Fixes: 6725767a8410 (tests/kms_invalid_mode: Test Cleanup)
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_invalid_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 21ee91ab..0ae98a31 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -185,6 +185,7 @@ test_output(data_t *data)
 	int ret;
 	drmModeModeInfo *mode;
 
+	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, data->pipe);
 
 	igt_create_fb(data->drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
@@ -202,7 +203,6 @@ test_output(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_output_override_mode(output, NULL);
 	/*unset_all_crtcs*/
-	igt_display_reset(&data->display);
 	igt_display_commit(&data->display);
 }
 
-- 
2.26.2
