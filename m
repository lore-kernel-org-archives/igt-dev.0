Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B200610E4C4
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 11:59:26 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Jun 2023 17:23:33 +0530
Message-Id: <20230607115333.55940-3-mohammed.thasleem@intel.com>
In-Reply-To: <20230607115333.55940-1-mohammed.thasleem@intel.com>
References: <20230607115333.55940-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/kms_cdclk: Fixed mode
 selection for MST modeset
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
v3: Rebased on tip.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_cdclk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 0f9b8dc5..bf93d940 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -257,6 +257,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	int valid_outputs = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
+	bool found;
 	struct igt_fb fb;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane;
@@ -332,6 +333,10 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		j++;
 	}
 
+	/* In case of DP-MST find suitable mode(s) to fit into the link BW. */
+	found = igt_override_all_active_output_modes_to_fit_bw(display);
+	igt_require_f(found, "No valid mode combo found for MST modeset.\n");
+
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_new = get_current_cdclk_freq(debugfs_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
-- 
2.25.1
