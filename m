Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBA710E53F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 10:28:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Aug 2023 15:50:44 +0530
Message-Id: <20230802102059.3650360-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
References: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 02/17] tests/kms_cursor_edge_walk: Fix intel
 specific checks
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

Use the correct helper to check for the intel hardware.
s/is_i915_device/is_intel_device/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_edge_walk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 462b51e20..5d3ca9567 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -335,7 +335,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-		if (is_i915_device(data.drm_fd))
+		if (is_intel_device(data.drm_fd))
 			data.devid = intel_get_drm_devid(data.drm_fd);
 
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &max_curw);
-- 
2.40.0
