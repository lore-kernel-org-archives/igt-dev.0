Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B25D10ED57
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Apr 2023 13:57:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 14 Apr 2023 19:23:14 +0530
Message-Id: <20230414135319.1270913-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230414135319.1270913-1-bhanuprakash.modem@intel.com>
References: <20230414135319.1270913-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 1/6] lib/igt_kms: Fix Bigjoiner checks
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

Bigjoiner will come in the picture when the resolution > 5K or
clock > max dot-clock. Add a support to check the selected mode
clock is greater than the max dot-clock.

V2: - Update helper comments (Ankit)
    - New helper to check Bigjoiner requirement (Ankit)
V3: - For older Kernels, readback from i915_frequency_info

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_kms.h |  2 ++
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 50655f136b8..4b3eeffc7f3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5813,6 +5813,66 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 	return false;
 }
 
+/*
+ * igt_get_max_dotclock:
+ * @fd: A drm file descriptor
+ *
+ * Get the Max pixel clock frequency from intel specific debugfs
+ * "i915_frequency_info".
+ *
+ * Returns: Max supported pixel clock frequency.
+ */
+int igt_get_max_dotclock(int fd)
+{
+	char buf[4096];
+	char *s;
+	int dir, res, max_dotclock = 0;
+
+	if (!is_i915_device(fd))
+		return max_dotclock;
+
+	dir = igt_debugfs_dir(fd);
+	igt_require(dir);
+
+	/*
+	 * Display specific clock frequency info is moved to i915_cdclk_info,
+	 * On older kernels if this debugfs is not found, fallback to read from
+	 * i915_frequency_info.
+	 */
+	res = igt_debugfs_simple_read(dir, "i915_cdclk_info",
+				      buf, sizeof(buf));
+	if (res <= 0)
+		res = igt_debugfs_simple_read(dir, "i915_frequency_info",
+					      buf, sizeof(buf));
+	close(dir);
+
+	igt_require(res > 0);
+
+	igt_assert(s = strstr(buf, "Max pixel clock frequency:"));
+	igt_assert_eq(sscanf(s, "Max pixel clock frequency: %d kHz", &max_dotclock), 1);
+
+	/* 100 Mhz to 5 GHz seem like reasonable values to expect */
+	igt_assert_lt(max_dotclock, 5000000);
+	igt_assert_lt(100000, max_dotclock);
+
+	return max_dotclock;
+}
+
+/* igt_bigjoiner_possible:
+ * @mode: libdrm mode
+ * @max_dotclock: Max pixel clock frequency
+ *
+ * Bigjoiner will come into the picture, when the requested
+ * mode resolution > 5K or mode clock > max_dotclock.
+ *
+ * Returns: True if mode requires Bigjoiner, else False.
+ */
+bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
+{
+	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
+		mode->clock > max_dotclock);
+}
+
 /*
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
@@ -5835,6 +5895,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 		enum pipe idx;
 		drmModeModeInfo *mode;
 	} pipes[IGT_MAX_PIPES];
+	int max_dotclock;
 
 	/* Get total enabled pipes. */
 	for_each_pipe(display, p)
@@ -5858,22 +5919,24 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 		return true;
 	}
 
+	max_dotclock = igt_get_max_dotclock(display->drm_fd);
+
 	/*
-	 * if mode.hdisplay > 5120, then ignore
+	 * if mode resolution > 5K (or) mode.clock > max dot-clock, then ignore
 	 *  - if the consecutive pipe is not available
 	 *  - last crtc in single/multi-connector config
 	 *  - consecutive crtcs in multi-connector config
 	 *
 	 * in multi-connector config ignore if
-	 *  - previous crtc mode.hdisplay > 5120 and
+	 *  - previous crtc (mode resolution > 5K or mode.clock > max dot-clock) and
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if (((pipes[i].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
+		if ((igt_bigjoiner_possible(pipes[i].mode, max_dotclock) &&
 		     ((pipes[i].idx >= (total_pipes - 1)) ||
 		      (!display->pipes[pipes[i].idx + 1].enabled) ||
 		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
-		    ((i > 0) && (pipes[i - 1].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
+		    ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock) &&
 		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
 		      (abs(pipes[i].idx - pipes[i - 1].idx) <= 1)))) {
 			igt_debug("Pipe/Output combo is not possible with selected mode(s).\n");
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2b917925158..df90bb2330d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -990,6 +990,8 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 
 bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
+int igt_get_max_dotclock(int fd);
+bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
-- 
2.40.0
