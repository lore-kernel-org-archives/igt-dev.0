Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491D610EB97
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 08:50:35 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Mar 2023 14:22:59 +0530
Message-Id: <20230324085259.30854-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: SKIP subtest if
 num_planes < 2
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

Min 2 planes required for planes combo scaling test. Add that
check before executing the sub-test.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 8e988058d..69df6d9aa 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -732,12 +732,16 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 {
 	igt_display_t *display = &d->display;
 	drmModeModeInfo *mode;
+	int n_planes;
 
 	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
+	n_planes = display->pipes[pipe].n_planes;
+	igt_require(n_planes >= 2);
+
 	switch (test_type) {
 	case TEST_PLANES_UPSCALE:
 		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
@@ -759,7 +763,7 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 		igt_assert(0);
 	}
 
-	for (int k = 0; k < display->pipes[pipe].n_planes - 1; k += 2) {
+	for (int k = 0; k < n_planes - 1; k += 2) {
 		igt_plane_t *p1, *p2;
 
 		p1 = &display->pipes[pipe].planes[k];
-- 
2.25.1
