Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3620D10E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:16:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:12 +0530
Message-Id: <20230626051031.2363120-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 05/24] tests/amdgpu: Close the fd before exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Close the file descriptor before exiting the test.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 tests/amdgpu/amd_abm.c                 | 1 +
 tests/amdgpu/amd_assr.c                | 1 +
 tests/amdgpu/amd_freesync_video_mode.c | 1 +
 tests/amdgpu/amd_mem_leak.c            | 1 +
 tests/amdgpu/amd_psr.c                 | 3 ++-
 tests/amdgpu/amd_vrr_range.c           | 1 +
 6 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 9400ed806..082da7ed6 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -378,5 +378,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 80cbbe8e9..fc2367f99 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -299,5 +299,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 579d24436..62d42a06c 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -868,5 +868,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index dee563cbe..e4a4b5c47 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -232,5 +232,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 966a0dccf..3932e143a 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -640,7 +640,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	 * panning the primary plane at the top-left of screen
 	 * set alpha region in overlay plane and set alpha to 0.0 to show primary plane
 	 * set cursor plane and starting from position of (0, 0)
-	 */ 
+	 */
 	draw_color_alpha(&data->ov_fb[0], 0, 0, data->pfb_w, data->pfb_h, 1.0, 1.0, 1.0, .0);
 	igt_plane_set_fb(data->primary, &data->pm_fb[0]);
 	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
@@ -763,5 +763,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		}
 		close(data.debugfs_fd);
 		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 611f41f95..a77895622 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -408,5 +408,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
 	}
 }
-- 
2.40.0
