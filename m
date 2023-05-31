Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460BA10E4D7
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 13:44:37 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 19:18:26 +0530
Message-Id: <20230531134831.2451929-2-kunal1.joshi@intel.com>
In-Reply-To: <20230531134831.2451929-1-kunal1.joshi@intel.com>
References: <20230531134831.2451929-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] RFC
 tests/i915/kms_frontbuffer_tracking: Add xe support
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

Add support for DRIVER_XE

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 650e14a7..c2b99670 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1338,7 +1338,7 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
 
 static void setup_drm(void)
 {
-	drm.fd = drm_open_driver_master(DRIVER_INTEL);
+	drm.fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 	drm.debugfs = igt_debugfs_dir(drm.fd);
 
 	kmstest_set_vt_graphics_mode();
-- 
2.25.1
