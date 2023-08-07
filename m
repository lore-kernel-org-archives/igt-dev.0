Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7219B10E394
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 20:02:45 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 01:24:55 +0530
Message-Id: <20230807195500.4103092-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
References: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 15/20] tests/i915/kms_fbcon_fbt: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_fbcon_fbt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
index 71c5285f1..5fe6caae7 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -378,7 +378,7 @@ static void setup_environment(struct drm_info *drm)
 {
 	int i;
 
-	drm->fd = drm_open_driver_master(DRIVER_INTEL);
+	drm->fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 	igt_require(drm->fd >= 0);
 	drm->debugfs_fd = igt_debugfs_dir(drm->fd);
 	igt_require(drm->debugfs_fd >= 0);
-- 
2.40.0
