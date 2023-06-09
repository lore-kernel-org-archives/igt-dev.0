Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AAC10E679
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 10:08:37 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 15:42:02 +0530
Message-Id: <20230609101205.2803975-3-kunal1.joshi@intel.com>
In-Reply-To: <20230609101205.2803975-1-kunal1.joshi@intel.com>
References: <20230609101205.2803975-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] RFC
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index c2b99670..45a601fe 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1341,6 +1341,19 @@ static void setup_drm(void)
 	drm.fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 	drm.debugfs = igt_debugfs_dir(drm.fd);
 
+	/*
+	 * Assert if xe device and tiling method specified
+	 * in opt_handler
+	 */
+	igt_assert(is_i915_device(drm.fd) || (is_xe_device(drm.fd) && (opt.tiling == TILING_DEFAULT ||
+		   opt.tiling == TILING_LINEAR)));
+
+	/*
+	 * XE only support linear tiling
+	 */
+	if (is_xe_device(drm.fd))
+		opt.tiling = TILING_LINEAR;
+
 	kmstest_set_vt_graphics_mode();
 	igt_display_require(&drm.display, drm.fd);
 
@@ -3634,6 +3647,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 			for (t.tiling = TILING_LINEAR; t.tiling < TILING_COUNT;
 			     t.tiling++) {
+
 				if (t.tiling == TILING_X)
 					continue;
 
@@ -3646,6 +3660,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
