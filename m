Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316EB10E51C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 05:05:24 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 10:39:25 +0530
Message-Id: <20230601050928.2487611-4-kunal1.joshi@intel.com>
In-Reply-To: <20230601050928.2487611-1-kunal1.joshi@intel.com>
References: <20230601050928.2487611-1-kunal1.joshi@intel.com>
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

v2: missed one tiling case

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 3bef46b6..de1a82a9 100644
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
 
@@ -3642,6 +3648,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 			for (t.tiling = TILING_LINEAR; t.tiling < TILING_COUNT;
 			     t.tiling++) {
+				if (is_xe && t.tiling != TILING_LINEAR)
+					continue;
+
 				if (t.tiling == TILING_X)
 					continue;
 
-- 
2.25.1
