Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAFD10E169
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 19:59:01 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 15:58:59 -0400
Message-Id: <20221031195859.127493-2-rodrigo.vivi@intel.com>
In-Reply-To: <20221031195859.127493-1-rodrigo.vivi@intel.com>
References: <20221031195859.127493-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tools/intel_pm_rpm: Only init debufs_fd
 if needed.
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

So we can run a --setup-d3cold without depending on the presence
of a debugfs.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/intel_pm_rpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 05d7f6fb..17cd2bc1 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -197,10 +197,9 @@ int main(int argc, char *argv[])
 		goto exit;
 	}
 
-	data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
-
 	data.res = drmModeGetResources(data.drm_fd);
 	if (data.res) {
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 
@@ -240,7 +239,8 @@ exit:
 	if (data.res)
 		igt_display_fini(&data.display);
 
-	close(data.debugfs_fd);
+	if (data.debugfs_fd)
+		close(data.debugfs_fd);
 	close(data.drm_fd);
 	igt_devices_free();
 
-- 
2.37.3
