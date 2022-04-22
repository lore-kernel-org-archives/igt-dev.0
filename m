Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2711121FB
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 07:54:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Apr 2022 13:22:23 +0530
Message-Id: <20220422075223.2792586-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220422075223.2792586-1-bhanuprakash.modem@intel.com>
References: <20220422075223.2792586-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/4] HAX: Add VRR negative tests to BAT
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 tests/kms_vrr.c                       | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index f6329708..71ff4748 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -134,6 +134,8 @@ igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
 igt@kms_psr@primary_mmap_gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_vrr@negative-basic
+igt@kms_vrr@parse-vrr-range
 igt@i915_pm_backlight@basic-brightness
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index ad5b10ac..974a7ec2 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -465,6 +465,7 @@ static void
 test_negative_basic(data_t *data, enum pipe pipe,
 		    igt_output_t *output, uint32_t flags)
 {
+	uint64_t vrr_enabled;
 	igt_info("VRR Negative Test execution on %s, PIPE_%s.\n",
 			output->name, kmstest_pipe_name(pipe));
 
@@ -476,8 +477,10 @@ test_negative_basic(data_t *data, enum pipe pipe,
 	 * enabled the VRR on selected pipe.
 	 */
 	igt_wait_for_vblank(data->drm_fd, data->display.pipes[pipe].crtc_offset);
-	igt_assert_f(!igt_pipe_get_prop(&data->display, pipe, IGT_CRTC_VRR_ENABLED),
-		     "VRR shouln't be enabled on Non-VRR panel.\n");
+	vrr_enabled = igt_pipe_get_prop(&data->display, pipe, IGT_CRTC_VRR_ENABLED);
+
+	igt_info("VRR_ENABLED: %ld\n", vrr_enabled);
+	igt_assert_f(!vrr_enabled, "VRR shouln't be enabled on Non-VRR panel.\n");
 
 	/* Clean-up */
 	igt_plane_set_fb(data->primary, NULL);
-- 
2.35.1
