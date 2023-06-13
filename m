Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EC110E0BF
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:55:53 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 22:29:32 +0530
Message-Id: <20230613165936.2930050-3-kunal1.joshi@intel.com>
In-Reply-To: <20230613165936.2930050-1-kunal1.joshi@intel.com>
References: <20230613165936.2930050-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] RFC
 tests/i915/kms_frontbuffer_tracking: xe doesn't support tiling as of now
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

XE doesn't support tiling as of now, so set tiling to linear

v2: use is_xe_device() instead of static variable (Jouni)
    assert if xe device and unsupported tiling method specified
    in opt handler (Jouni)
v3: Fix condition in igt_assert
v4: Keep tiling check in igt_require (Bhanu)
v5: Handle opt.tiling elegantly (Bhanu)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index c2b99670..61403afb 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -261,7 +261,6 @@ struct {
 	.only_pipes = PIPE_COUNT,
 	.shared_fb_x_offset = 248,
 	.shared_fb_y_offset = 500,
-	.tiling = TILING_DEFAULT,
 };
 
 struct modeset_params {
@@ -1341,6 +1340,16 @@ static void setup_drm(void)
 	drm.fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 	drm.debugfs = igt_debugfs_dir(drm.fd);
 
+	/*
+	 * Skip if xe device and unsupported tiling method specified
+	 * in opt_handler
+	 */
+	if (opt.tiling)
+		igt_require(is_i915_device(drm.fd) ||
+			    (is_xe_device(drm.fd) && opt.tiling == TILING_LINEAR));
+	else
+		opt.tiling = is_i915_device(drm.fd) ? TILING_DEFAULT : TILING_LINEAR;
+
 	kmstest_set_vt_graphics_mode();
 	igt_display_require(&drm.display, drm.fd);
 
@@ -3634,6 +3643,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 			for (t.tiling = TILING_LINEAR; t.tiling < TILING_COUNT;
 			     t.tiling++) {
+
 				if (t.tiling == TILING_X)
 					continue;
 
@@ -3646,6 +3656,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					      feature_str(t.feature),
 					      tiling_str(t.tiling)) {
 
+					if (is_xe_device(drm.fd))
+						igt_require(t.tiling == TILING_LINEAR);
+
 					/* Tiling Y is only supported on GEN9+ */
 					if (t.tiling == TILING_Y) {
 						igt_require(AT_LEAST_GEN(devid, 9));
-- 
2.34.1
