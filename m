Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDE710E9AC
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 16:30:36 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 19:30:28 +0300
Message-Id: <20221019163029.19301-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20221019163029.19301-1-ville.syrjala@linux.intel.com>
References: <20221019163029.19301-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/3] tests/crc:
 s/"auto"/IGT_PIPE_CRC_SOURCE_AUTO/
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the hand rolled "auto" string with the
define we have for it.

Simple cocci job:
@@
@@
 igt_pipe_crc_new(...,
- "auto"
+ IGT_PIPE_CRC_SOURCE_AUTO
 )

v2: Convert more stuff

Suggested-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_dp_dsc.c  | 3 ++-
 tests/amdgpu/amd_hotplug.c | 3 ++-
 tests/amdgpu/amd_plane.c   | 3 ++-
 tests/amdgpu/amd_psr.c     | 3 ++-
 tests/kms_bw.c             | 3 ++-
 tests/kms_pipe_crc_basic.c | 3 ++-
 tests/nouveau_crc.c        | 7 ++++---
 7 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 8a18df3bcd6e..e6b5a43be6fb 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -69,7 +69,8 @@ static void test_init(data_t *data)
 		data->primary[i] = igt_pipe_get_plane_type(
 				data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
 		data->pipe_crc[i] =
-				igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
+				igt_pipe_crc_new(data->fd, data->pipe_id[i],
+						 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0, n = 0; i < display->n_outputs && n < display->n_pipes; ++i) {
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 7e6b63db6323..736040a2c18e 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -59,7 +59,8 @@ static void test_init(data_t *data)
 		data->cursor[i] = igt_pipe_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
 		data->pipe_crc[i] =
-			igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
+			igt_pipe_crc_new(data->fd, data->pipe_id[i],
+					 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0, n = 0; i < display->n_outputs && n < max_pipes; ++i) {
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 4b2bee492255..b9eec677dc4a 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -162,7 +162,8 @@ static void test_init(data_t *data)
 		data->cursor[i] = igt_pipe_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
 		data->pipe_crc[i] =
-			igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
+			igt_pipe_crc_new(data->fd, data->pipe_id[i],
+					 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0, n = 0; i < display->n_outputs && n < max_pipes; ++i) {
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 695ea5a8842e..966a0dccfa12 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -190,7 +190,8 @@ static void test_init(data_t *data)
 	data->overlay =
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 
-	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id, "auto");
+	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 7bb1332ee881..2a8df5b3e4a2 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -82,7 +82,8 @@ static void test_init(data_t *data)
 		data->primary[i] = igt_pipe_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
 		data->pipe_crc[i] =
-			igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
+			igt_pipe_crc_new(data->fd, data->pipe_id[i],
+					 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 13dd549bd602..91a1b8ab12a8 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -237,7 +237,8 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_crc_t crc[2];
 	igt_plane_t *primary;
 
-	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
+	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 076cbda40ade..785d39bde6c6 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -122,7 +122,8 @@ static void test_ctx_flip_detection(data_t *data)
 	int start = -1, frame, start_color = -1, i;
 	bool found_skip = false;
 
-	pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe, "auto");
+	pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	create_crc_colors(data, colors, n_colors, pipe_crc);
 
@@ -232,7 +233,7 @@ static void test_ctx_flip_skip_current_frame(data_t *data)
 	const int n_colors = ARRAY_SIZE(colors);
 	const int n_crcs = 30;
 
-	pipe_crc = igt_pipe_crc_new(fd, data->pipe, "auto");
+	pipe_crc = igt_pipe_crc_new(fd, data->pipe, IGT_PIPE_CRC_SOURCE_AUTO);
 	create_crc_colors(data, colors, n_colors, pipe_crc);
 
 	set_crc_flip_threshold(data, 5);
@@ -264,7 +265,7 @@ static void test_ctx_flip_threshold_reset_after_capture(data_t *data)
 	igt_pipe_crc_t *pipe_crc;
 	const int fd = data->drm_fd;
 
-	pipe_crc = igt_pipe_crc_new(fd, data->pipe, "auto");
+	pipe_crc = igt_pipe_crc_new(fd, data->pipe, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	set_crc_flip_threshold(data, 5);
 	igt_pipe_crc_start(pipe_crc);
-- 
2.35.1
