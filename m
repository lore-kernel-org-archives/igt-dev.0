Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBB410E985
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 21:06:01 +0000 (UTC)
From: Matt Atwood <matthew.s.atwood@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 14:05:58 -0700
Message-Id: <20230412210558.18837-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_huc_copy: check debugfs for huc
 running
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

Use debugfs to make sure that huc is loaded for xe_huc_copy. This
function will need to be updated for multitile functionality.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 tests/xe/xe_huc_copy.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index cd68dbb5ac..58d770106e 100644
--- a/tests/xe/xe_huc_copy.c
+++ b/tests/xe/xe_huc_copy.c
@@ -152,6 +152,22 @@ test_huc_copy(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+static bool
+is_huc_running(int fd)
+{
+	char buf[4096];
+	char *s;
+
+	/*
+	 * TODO: add multi tile support
+	 */
+
+	igt_debugfs_read(fd, "gt0/uc/huc_info", buf);
+	s = strstr(buf, "RUNNING");
+
+	return s;
+}
+
 igt_main
 {
 	int xe;
@@ -162,7 +178,7 @@ igt_main
 	}
 
 	igt_subtest("huc_copy") {
-		igt_skip_on(!IS_TIGERLAKE(intel_get_drm_devid(xe)));
+		igt_skip_on(!is_huc_running(xe));
 		test_huc_copy(xe);
 	}
 
-- 
2.39.2
