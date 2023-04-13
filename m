Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA9210EC29
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 20:22:38 +0000 (UTC)
From: Matt Atwood <matthew.s.atwood@intel.com>
Date: Thu, 13 Apr 2023 13:22:33 -0700
Message-Id: <20230413202233.43822-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/xe/xe_huc_copy: check debugfs for
 huc running
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Use debugfs to make sure that huc is loaded for xe_huc_copy. This
test will eventually need to determine if huc failed to load or if the
platform supports it period.

v2: support multitile (Lucas)

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 tests/xe/xe_huc_copy.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index cd68dbb5ac..65eb747687 100644
--- a/tests/xe/xe_huc_copy.c
+++ b/tests/xe/xe_huc_copy.c
@@ -152,6 +152,27 @@ test_huc_copy(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+static bool
+is_huc_running(int fd)
+{
+	char buf[4096];
+	char *s;
+	int gt;
+
+	xe_for_each_gt(fd, gt)
+	{
+		char name[256];
+
+		sprintf(name, "gt%d/uc/huc_info", gt);
+		igt_debugfs_read(fd, name, buf);
+		s = strstr(buf, "RUNNING");
+
+		if (s)
+			return true;
+	}
+	return false;
+}
+
 igt_main
 {
 	int xe;
@@ -162,7 +183,11 @@ igt_main
 	}
 
 	igt_subtest("huc_copy") {
-		igt_skip_on(!IS_TIGERLAKE(intel_get_drm_devid(xe)));
+		/*
+		 * TODO: eventually need to differentiate huc failed to load vs
+		 * platform doesnt have huc
+		 */
+		igt_skip_on(!is_huc_running(xe));
 		test_huc_copy(xe);
 	}
 
-- 
2.39.2


