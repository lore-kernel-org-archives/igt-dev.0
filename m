Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F6410E1D7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 13:18:00 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 Oct 2023 15:17:52 +0200
Message-ID: <20231016131752.39196-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tools/intel_gpu_frequency: fix device
 opening
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

High-level device open cleans device cache before running a test
by using debugfs. This may be a problem when using a tool to
change GPU frequency as there are systems with debugfs turned off
or protected, as seen in bug report:

(intel_gpu_frequency:14896) igt_debugfs-CRITICAL: Test assertion failure function igt_drop_caches_set, file ../lib/igt_debugfs.c:1142:

[ 3553.930373] Lockdown: intel_gpu_frequ: debugfs access is restricted; see man kernel_lockdown.7
none [integrity] confidentiality

intel_gpu_frequency is the tool, not a test, so fixed this by
using more suitable device opening function.

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/146
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_frequency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 3ed331ab4..de0c6ddba 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -283,7 +283,7 @@ int main(int argc, char *argv[])
 	bool write, fail, targets[MAX+1] = {false};
 	int i, fd, try = 1, set_freq[MAX+1] = {0};
 
-	fd = drm_open_driver(DRIVER_INTEL);
+	fd = __drm_open_driver(DRIVER_INTEL);
 	devid = intel_get_drm_devid(fd);
 	device = igt_device_get_card_index(fd);
 	close(fd);
-- 
2.42.0
