Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC3010E097
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 20:40:24 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 02:04:06 +0530
Message-Id: <20230627203406.2502811-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230607115333.55940-3-mohammed.thasleem@intel.com>
References: <20230607115333.55940-3-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 2/2] tests/i915/kms_cdclk: Fixed mode selection
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_cdclk.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 0f9b8dc5..cf526ec0 100644
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
+	drmModeModeInfo *mode, *mode_hi, *mode_lo, *mst_mode[2];
 	igt_output_t *output;
-	int valid_outputs = 0;
+	int valid_outputs = 0, count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
+	bool found;
 	struct igt_fb fb;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane;
@@ -332,6 +334,24 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		j++;
 	}
 
+	/* In case of DP-MST find suitable mode(s) to fit into the link BW. */
+	found = igt_override_all_active_output_modes_to_fit_bw(display);
+	igt_require_f(found, "No valid mode combo found for MST modeset.\n");
+
+	if (found) {
+
+		for_each_connected_output(display, output)
+			data->mst_output[count++] = output;
+
+		mst_mode[0] = igt_output_get_mode(data->mst_output[0]);
+		mst_mode[1] = igt_output_get_mode(data->mst_output[1]);
+
+		igt_require_f((mst_mode[0]->hdisplay < HDISPLAY_4K &&
+			       mst_mode[0]->vdisplay < VDISPLAY_4K), "Found less than 4k mode\n");
+		igt_require_f((mst_mode[1]->hdisplay < HDISPLAY_4K &&
+			       mst_mode[1]->vdisplay < VDISPLAY_4K), "Found less than 4k mode\n");
+	}
+
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_new = get_current_cdclk_freq(debugfs_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
-- 
2.25.1
