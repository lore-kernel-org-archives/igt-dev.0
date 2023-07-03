Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3DE10E0A6
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jul 2023 06:27:44 +0000 (UTC)
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Jul 2023 11:56:55 +0530
Message-Id: <20230703062655.15433-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230627203406.2502811-1-mohammed.thasleem@intel.com>
References: <20230627203406.2502811-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 2/2] tests/i915/kms_cdclk: Fixed mode selection
 for MST modeset
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

From: Mohammed Thasleem <mohammed.thasleem@intel.com>

When two monitors connected through MST. This will find the
connector mode combo that fits into the bandwidth when more
than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

v2: -Removed if loop checks.
    -Added igt override to avoid dp mst bw failure.
v3: Rebased conflict.
v4: Skip the test if available mode is less than 4k.
v5: Check all connected displays for less than 4k mode.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_cdclk.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 40eca24f0..eac0af85e 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -43,6 +43,7 @@ typedef struct {
 	int drm_fd;
 	int debugfs_fd;
 	uint32_t devid;
+	igt_output_t *mst_output[2];
 	igt_display_t display;
 } data_t;
 
@@ -252,11 +253,12 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
-	drmModeModeInfo *mode, *mode_hi, *mode_lo;
+	drmModeModeInfo *mode, *mode_hi, *mode_lo, *mst_mode;
 	igt_output_t *output;
 	int valid_outputs = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
+	bool found;
 	struct igt_fb fb;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane;
@@ -332,6 +334,19 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		j++;
 	}
 
+	/* In case of DP-MST find suitable mode(s) to fit into the link BW. */
+	found = igt_override_all_active_output_modes_to_fit_bw(display);
+	igt_require_f(found, "No valid mode combo found for MST modeset.\n");
+
+	if (found) {
+
+		for_each_connected_output(display, output) {
+			mst_mode = igt_output_get_mode(output);
+			igt_require_f((mst_mode->hdisplay < HDISPLAY_4K &&
+				       mst_mode->vdisplay < VDISPLAY_4K), "Found less than 4k mode\n");
+		}
+	}
+
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_new = get_current_cdclk_freq(debugfs_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
-- 
2.25.1
