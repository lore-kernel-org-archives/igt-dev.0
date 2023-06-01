Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F4B10E11C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 11:44:51 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 17:18:53 +0530
Message-Id: <20230601114856.2500802-3-kunal1.joshi@intel.com>
In-Reply-To: <20230601114856.2500802-1-kunal1.joshi@intel.com>
References: <20230601114856.2500802-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v2: use is_xe_device() instead of static variable (Jouni)
    assert if xe device and unsupported tiling method specified
    in opt handler (Jouni)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index c2b99670..9b4c6e59 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1340,6 +1340,19 @@ static void setup_drm(void)
 {
 	drm.fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 	drm.debugfs = igt_debugfs_dir(drm.fd);
+	
+	/*
+	 * Assert if xe device and tiling method specified
+	 * in opt_handler
+	 */
+	igt_assert(is_xe_device(drm.fd) && (opt.tiling == TILING_DEFAULT ||
+		   opt.tiling == TILING_LINEAR));
+
+	/*
+	 * XE only support linear tiling
+	 */
+	if (is_xe_device(drm.fd))
+		opt.tiling = TILING_LINEAR;
 
 	kmstest_set_vt_graphics_mode();
 	igt_display_require(&drm.display, drm.fd);
@@ -3634,6 +3647,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 			for (t.tiling = TILING_LINEAR; t.tiling < TILING_COUNT;
 			     t.tiling++) {
+				if (is_xe_device(drm.fd) && t.tiling != TILING_LINEAR)
+					continue;
+
 				if (t.tiling == TILING_X)
 					continue;
 
-- 
2.25.1
