Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8F410E38E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:40:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 22:02:01 +0530
Message-Id: <20230816163206.402705-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
References: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 15/20] tests/i915/kms_fbcon_fbt: Add XE support
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
index e65cbda93..9ee14f3b1 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -420,7 +420,7 @@ static void setup_environment(struct drm_info *drm)
 {
 	int i;
 
-	drm->fd = drm_open_driver_master(DRIVER_INTEL);
+	drm->fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 	igt_require(drm->fd >= 0);
 	drm->debugfs_fd = igt_debugfs_dir(drm->fd);
 	igt_require(drm->debugfs_fd >= 0);
-- 
2.40.0
