Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B60B6E97F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 08:35:36 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Tue, 30 Nov 2021 16:34:55 +0800
Message-ID: <20211130083503.10221-4-stylon.wang@amd.com>
In-Reply-To: <20211130083503.10221-1-stylon.wang@amd.com>
References: <20211130083503.10221-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 03/11] tests/amdgpu/amd_plane: fixes for
 test-4k-mpo
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
Cc: anson.jacob@amd.com, Bhawanpreet.Lakha@amd.com, Ahmad Othman <ahmad.othman@amd.com>, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Ahmad Othman <ahmad.othman@amd.com>

[Why]
The test wasn't working on some setups and needs fixing

[How]
Added output pipe initialization
Added checks for both 4k and 2160p

Signed-off-by: Ahmad Othman <ahmad.othman@amd.com>
---
 tests/amdgpu/amd_plane.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 09fd3b08..ba29bdd4 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -193,8 +193,10 @@ static void test_mpo_4k(data_t *data)
 	test_init(data);
 
 	/* Skip if not 4K resolution. */
-	igt_skip_on(!(data->mode[0].hdisplay == 3840
-		      && data->mode[0].vdisplay == 2160));
+	igt_skip_on(!((data->mode[0].hdisplay == 4096
+		      && data->mode[0].vdisplay == 2160)||
+		      (data->mode[0].hdisplay == 3840
+		      && data->mode[0].vdisplay == 2160)));
 
 	w = data->w[0];
 	h = data->h[0];
@@ -210,6 +212,7 @@ static void test_mpo_4k(data_t *data)
 	draw_color_alpha(&o_fb, cutout_x, cutout_y, cutout_w, cutout_h,
 			 0.00, 0.00, 0.00, 0.00);
 
+	igt_output_set_pipe(data->output[0], data->pipe_id[0]);
 	igt_plane_set_fb(data->primary[0], &r_fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-- 
2.33.1
