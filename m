Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AFF11BB69
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 07:51:00 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jun 2022 13:17:44 +0530
Message-Id: <20220628074744.32025-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220628074744.32025-1-mohammed.thasleem@intel.com>
References: <20220628074744.32025-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 2/2] tests/kms_rmfb: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_rmfb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 614bbac9..82826399 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -57,12 +57,14 @@ static void
 test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reopen)
 {
 	struct igt_fb fb, argb_fb;
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_plane_t *plane;
 	drmModeCrtc *crtc;
 	uint64_t cursor_width, cursor_height;
 	int num_active_planes = 0;
 
+	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
 
 	mode = igt_output_get_mode(output);
@@ -145,7 +147,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 		drmModeFreePlane(planeres);
 	}
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 }
 
 static void
@@ -184,6 +186,9 @@ igt_main
 
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+		igt_display_reset(&data.display);
+		igt_display_commit2(&data.display, data.display.is_atomic ?
+				    COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -196,5 +201,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
 	}
 }
-- 
2.25.1
