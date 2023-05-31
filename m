Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAA610E4DC
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 13:44:41 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 19:18:28 +0530
Message-Id: <20230531134831.2451929-4-kunal1.joshi@intel.com>
In-Reply-To: <20230531134831.2451929-1-kunal1.joshi@intel.com>
References: <20230531134831.2451929-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] RFC
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

XE doesn't support tiling as of now, so set tiling to linear

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 3bef46b6..5e9fb55a 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1349,6 +1349,12 @@ static void setup_drm(void)
 	 */
 	is_xe = is_xe_device(drm.fd);
 
+	/*
+	 * XE only support linear tiling
+	 */
+	if (is_xe)
+		opt.tiling = TILING_LINEAR;
+
 	kmstest_set_vt_graphics_mode();
 	igt_display_require(&drm.display, drm.fd);
 
-- 
2.25.1
