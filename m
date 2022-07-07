Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1F714A79D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 08:56:13 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Jul 2022 14:22:41 +0530
Message-Id: <20220707085241.13162-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220707085241.13162-1-mohammed.thasleem@intel.com>
References: <20220707085241.13162-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 2/2] tests/kms_rmfb: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Gupta@freedesktop.org, nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

v2: removed display reset and commit2 from igt_main.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
---
 tests/kms_rmfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index fb659054..7e43e1bd 100644
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
@@ -196,5 +198,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
 	}
 }
-- 
2.25.1
