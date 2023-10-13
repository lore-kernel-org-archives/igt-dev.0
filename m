Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F179710E5D1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 10:23:05 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 15:53:44 +0530
Message-Id: <20231013102346.95872-2-swati2.sharma@intel.com>
In-Reply-To: <20231013102346.95872-1-swati2.sharma@intel.com>
References: <20231013102346.95872-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_kms: cosmetic changes
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

Remove extra \n and fix documentation style.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 43 +++++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ec4cd78cd..8dc0edc89 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -857,7 +857,7 @@ const char *kmstest_pipe_name(enum pipe pipe)
 
 /**
  * kmstest_pipe_to_index:
- *@pipe: display pipe in string format
+ * @pipe: display pipe in string format
  *
  * Returns: index to corresponding pipe
  */
@@ -1144,7 +1144,6 @@ static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_idx)
  * value used in other helper functions.  Returns 0 if the index could not be
  * determined.
  */
-
 int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id)
 {
 	drmModeRes *res;
@@ -2112,7 +2111,6 @@ unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags)
  * @fd: Opened drm file descriptor
  *
  * Blocks until pageflip is completed
- *
  */
 void kmstest_wait_for_pageflip(int fd)
 {
@@ -2163,7 +2161,6 @@ bool kms_has_vblank(int fd)
 /*
  * A small modeset API
  */
-
 #define LOG_SPACES		"    "
 #define LOG_N_SPACES		(sizeof(LOG_SPACES) - 1)
 
@@ -2420,7 +2417,7 @@ void igt_display_reset(igt_display_t *display)
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane);
 static void igt_fill_display_format_mod(igt_display_t *display);
 
-/*
+/**
  * igt_require_pipe:
  * @display: pointer to igt_display_t
  * @pipe: pipe which need to check
@@ -2948,8 +2945,8 @@ drmModeModeInfo *igt_std_1024_mode_get(int vrefresh)
 	return igt_memdup(&std_1024_mode, sizeof(std_1024_mode));
 }
 
-/*
- * igt_modeset_disable_all_outputs
+/**
+ * igt_modeset_disable_all_outputs:
  * @diplay: igt display structure
  *
  * Modeset to disable all output
@@ -4484,7 +4481,7 @@ void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode)
 	}
 }
 
-/*
+/**
  * igt_output_preferred_vrefresh:
  * @output: Output whose preferred vrefresh is queried
  *
@@ -4502,7 +4499,7 @@ int igt_output_preferred_vrefresh(igt_output_t *output)
 		return 60;
 }
 
-/*
+/**
  * igt_output_set_pipe:
  * @output: Target output for which the pipe is being set to
  * @pipe: Display pipe to set to
@@ -4625,7 +4622,7 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
 	return __override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, 0);
 }
 
-/*
+/**
  * igt_pipe_refresh:
  * @display: a pointer to an #igt_display_t structure
  * @pipe: Pipe to refresh
@@ -5466,9 +5463,7 @@ bool igt_display_has_format_mod(igt_display_t *display, uint32_t format,
  * The blob information is exposed from drm/drm_connector.c in the kernel.
  * The format of the tile property is defined in the kernel as char tile[256]
  * that consists of 8 integers that are ':' separated.
- *
  */
-
 void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 		igt_tile_info_t *tile)
 {
@@ -5587,7 +5582,6 @@ uint32_t igt_reduce_format(uint32_t format)
  *
  * Iterates through list of connectors and
  * dumps their list of modes.
- *
  */
 void igt_dump_connectors_fd(int drmfd)
 {
@@ -5688,7 +5682,7 @@ void igt_dump_crtcs_fd(int drmfd)
 	drmModeFreeResources(mode_resources);
 }
 
-/*
+/**
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -5716,7 +5710,7 @@ unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name)
 	return maximum;
 }
 
-/*
+/**
  * igt_get_pipe_current_bpc:
  * @drmfd: A drm file descriptor
  * @pipe: Display pipe
@@ -5763,7 +5757,7 @@ static unsigned int get_current_bpc(int drmfd, enum pipe pipe,
 	return current;
 }
 
-/*
+/**
  * igt_assert_output_bpc_equal:
  * @drmfd: A drm file descriptor
  * @pipe: Display pipe
@@ -5780,7 +5774,7 @@ void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
 	igt_assert_eq(current, bpc);
 }
 
-/*
+/**
  * igt_check_output_bpc_equal:
  * @drmfd: A drm file descriptor
  * @pipe: Display pipe
@@ -5798,7 +5792,7 @@ bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
 	return (current == bpc);
 }
 
-/*
+/**
  * igt_max_bpc_constraint
  * @display: a pointer to an #igt_display_t structure
  * @pipe: Display pipe
@@ -5841,7 +5835,7 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 	return false;
 }
 
-/*
+/**
  * igt_get_max_dotclock:
  * @fd: A drm file descriptor
  *
@@ -5886,7 +5880,8 @@ int igt_get_max_dotclock(int fd)
 	return max_dotclock;
 }
 
-/* igt_bigjoiner_possible:
+/**
+ * igt_bigjoiner_possible:
  * @mode: libdrm mode
  * @max_dotclock: Max pixel clock frequency
  *
@@ -5901,7 +5896,7 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
 		mode->clock > max_dotclock);
 }
 
-/*
+/**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
  *
@@ -6002,7 +5997,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
 	return true;
 }
 
-/*
+/**
  * i915_pipe_output_combo_valid:
  * @display: a pointer to an #igt_display_t structure
  *
@@ -6047,7 +6042,7 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
 }
 
 /**
- * igt_check_output_is_dp_mst
+ * igt_check_output_is_dp_mst:
  * @output: Target output
  *
  * Returns: true if output is dp-mst, else false.
@@ -6071,7 +6066,7 @@ static int parse_path_connector(char *connector_path)
 }
 
 /**
- * igt_get_dp_mst_connector_id
+ * igt_get_dp_mst_connector_id:
  * @output: Target output
  *
  * Returns: connector id if output is dp-mst, else -EINVAL.
-- 
2.25.1
