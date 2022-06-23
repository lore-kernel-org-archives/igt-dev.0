Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90ED10E4FF
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jun 2022 23:54:17 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Jun 2022 05:27:28 +0530
Message-Id: <20220623235728.5749-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220623235728.5749-1-nidhi1.gupta@intel.com>
References: <20220623235728.5749-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_invalid_mode: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_invalid_mode.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 7e1f683b..423d360f 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -184,9 +184,9 @@ test_output(data_t *data)
 	igt_output_t *output = data->output;
 	drmModeModeInfo mode;
 	struct igt_fb fb;
-	int ret;
-	uint32_t crtc_id;
 
+	igt_display_reset(&data->display);
+	igt_output_set_pipe(output, data->pipe);
 	/*
 	 * FIXME test every mode we have to be more
 	 * sure everything is really getting rejected?
@@ -203,12 +203,7 @@ test_output(data_t *data)
 
 	kmstest_unset_all_crtcs(data->drm_fd, data->res);
 
-	crtc_id = data->display.pipes[data->pipe].crtc_id;
-
-	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
-			     fb.fb_id, 0, 0,
-			     &output->id, 1, &mode);
-	igt_assert_lt(ret, 0);
+	igt_display_commit(&data->display);
 
 	igt_remove_fb(data->drm_fd, &fb);
 }
-- 
2.26.2
