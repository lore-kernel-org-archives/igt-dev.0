Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1998910E201
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Feb 2023 14:30:09 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Feb 2023 16:29:51 +0200
Message-Id: <20230228142951.972328-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_pm: make igt_pm_dmc_loaded() more
 robust
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make igt_pm_dmc_loaded() more robust against changes in the debugfs
file. Read the entire contents of the file, at least with the current
output. Preserve logged output even if something gets added in front of
the file, and don't depend on exact length of the first line.

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_pm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 26e8c9f05fdf..6c84e94f6307 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -785,6 +785,11 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 	return ret;
 }
 
+static const char *yesno(bool x)
+{
+	return x ? "yes" : "no";
+}
+
 /**
  * dmc_loaded:
  * @debugfs: fd to the debugfs dir.
@@ -798,7 +803,8 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
  */
 bool igt_pm_dmc_loaded(int debugfs)
 {
-	char buf[15];
+	char buf[512];
+	bool loaded;
 	int len;
 
 	len = igt_sysfs_read(debugfs, "i915_dmc_info", buf, sizeof(buf) - 1);
@@ -807,8 +813,10 @@ bool igt_pm_dmc_loaded(int debugfs)
 
 	buf[len] = '\0';
 
-	igt_info("DMC: %s\n", buf);
-	return strstr(buf, "fw loaded: yes");
+	loaded = strstr(buf, "fw loaded: yes");
+	igt_info("DMC: fw loaded: %s\n", yesno(loaded));
+
+	return loaded;
 }
 
 /**
-- 
2.39.1
