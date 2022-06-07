Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D289D12AF00
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 08:01:51 +0000 (UTC)
From: Luca Coelho <luca@coelho.fi>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Jun 2022 10:42:37 +0300
Message-Id: <20220607074240.1202404-2-luca@coelho.fi>
In-Reply-To: <20220607074240.1202404-1-luca@coelho.fi>
References: <20220607074240.1202404-1-luca@coelho.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/kms_sysfs_edid_timing: increase
 max time thresholds
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

From: Luca Coelho <luciano.coelho@intel.com>

Currently, some connectors take longer than 10ms to reprobe, so we're
getting warnings that they take too long.  The times chosen for this
test seems to have been arbitrary, and it turns out that now they're
too short.

Increase both the per connector threshold and the total time
threshold to avoid unwarranted warnings.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 12013881b200..028a5323c0b2 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -26,8 +26,8 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 
-#define THRESHOLD_PER_CONNECTOR	10
-#define THRESHOLD_TOTAL		50
+#define THRESHOLD_PER_CONNECTOR	50
+#define THRESHOLD_TOTAL		150
 #define CHECK_TIMES		15
 
 IGT_TEST_DESCRIPTION("This check the time we take to read the content of all "
@@ -82,15 +82,14 @@ igt_simple_main
 			  mean.mean, mean.mean / 1e3, mean.mean / 1e6);
 
 		if (mean.max > (THRESHOLD_PER_CONNECTOR * 1e6)) {
-			igt_warn("%s: probe time exceed 10ms, "
-				 "max=%.2fms, avg=%.2fms\n", de->d_name,
+			igt_warn("%s: probe time exceed %dms, max=%.2fms, avg=%.2fms\n",
+				 de->d_name, THRESHOLD_PER_CONNECTOR,
 				 mean.max / 1e6, mean.mean / 1e6);
 		}
 		igt_assert_f(mean.mean < (THRESHOLD_TOTAL * 1e6),
-			     "%s: average probe time exceeded 50ms, "
-			     "max=%.2fms, avg=%.2fms\n", de->d_name,
+			     "%s: average probe time exceeded %dms, max=%.2fms, avg=%.2fms\n",
+			     de->d_name, THRESHOLD_TOTAL,
 			     mean.max / 1e6, mean.mean / 1e6);
-
 	}
 	closedir(dirp);
 
-- 
2.36.1
