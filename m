Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8527410E167
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 19:59:01 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 15:58:58 -0400
Message-Id: <20221031195859.127493-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tools/intel_pm_rpm: Remove unused devid.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Just a small clean-up. No functional change.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/intel_pm_rpm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 53ad252d..05d7f6fb 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -40,7 +40,6 @@
 typedef struct {
 	int drm_fd;
 	int debugfs_fd;
-	uint32_t devid;
 	drmModeResPtr res;
 	igt_display_t display;
 } data_t;
@@ -199,7 +198,6 @@ int main(int argc, char *argv[])
 	}
 
 	data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
-	data.devid = intel_get_drm_devid(data.drm_fd);
 
 	data.res = drmModeGetResources(data.drm_fd);
 	if (data.res) {
-- 
2.37.3
