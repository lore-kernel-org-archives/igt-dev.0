Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A3610E155
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 15:32:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 20:58:18 +0530
Message-Id: <20230418152822.1655272-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418152822.1655272-1-bhanuprakash.modem@intel.com>
References: <20230418152822.1655272-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 1/5] lib: Use i915 namespace for XE debugfs
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

As of now XE is going to use i915 namespace for their debugfs.
Example: i915_current_bpc is applicable for both i915 & XE

V2: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.c | 4 ++--
 lib/igt_psr.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a80b26a846b..e085e234a98 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5706,7 +5706,7 @@ unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe)
 	fd = igt_debugfs_pipe_dir(drmfd, pipe, O_RDONLY);
 	igt_assert(fd >= 0);
 
-	if (is_i915_device(drmfd))
+	if (is_intel_device(drmfd))
 		strcpy(debugfs_name, "i915_current_bpc");
 	else if (is_amdgpu_device(drmfd))
 		strcpy(debugfs_name, "amdgpu_current_bpc");
@@ -5828,7 +5828,7 @@ int igt_get_max_dotclock(int fd)
 	char *s;
 	int dir, res, max_dotclock = 0;
 
-	if (!is_i915_device(fd))
+	if (!is_intel_device(fd))
 		return max_dotclock;
 
 	dir = igt_debugfs_dir(fd);
diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index a2d88031268..13f7c567dc9 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -277,7 +277,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
 	int debugfs_fd;
 	bool ret;
 
-	if (!is_i915_device(drm_fd))
+	if (!is_intel_device(drm_fd))
 		return false;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
@@ -303,7 +303,7 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
 	int debugfs_fd;
 	bool ret = false;
 
-	if (!is_i915_device(drm_fd))
+	if (!is_intel_device(drm_fd))
 		return ret;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-- 
2.40.0
