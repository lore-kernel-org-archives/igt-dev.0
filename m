Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362EC6E96B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 10:16:21 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 20 Oct 2021 13:16:13 +0300
Message-Id: <20211020101614.4101-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20211020101614.4101-1-ville.syrjala@linux.intel.com>
References: <20211020101614.4101-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] tests/crc:
 s/"auto"/IGT_PIPE_CRC_SOURCE_AUTO/
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
Cc: Petri Latvala <petri.latvala@intel.com>
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

Suggested-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_hotplug.c       | 3 ++-
 tests/amdgpu/amd_link_settings.c | 3 ++-
 tests/kms_bw.c                   | 3 ++-
 tests/kms_pipe_crc_basic.c       | 3 ++-
 tests/nouveau_crc.c              | 7 ++++---
 5 files changed, 12 insertions(+), 7 deletions(-)

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
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 7822683d1ab2..1ea82fd76926 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -116,7 +116,8 @@ static void test_init(data_t *data, igt_output_t *output)
 	igt_require(data->pipe_id != PIPE_NONE);
 
 	data->pipe = &data->display.pipes[data->pipe_id];
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id, "auto");
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(output, data->pipe_id);
 
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index a4553cdee5ba..8dd6b8bd0fa2 100644
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
index ebfa68d4c1be..b27b314832ff 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -237,7 +237,8 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
 	igt_display_require_output_on_pipe(display, pipe);
 	output = igt_get_single_output_for_pipe(display, pipe);
 
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
2.32.0
