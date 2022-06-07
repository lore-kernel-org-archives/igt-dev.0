Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487D212AEFC
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 08:01:48 +0000 (UTC)
From: Luca Coelho <luca@coelho.fi>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Jun 2022 10:42:39 +0300
Message-Id: <20220607074240.1202404-4-luca@coelho.fi>
In-Reply-To: <20220607074240.1202404-1-luca@coelho.fi>
References: <20220607074240.1202404-1-luca@coelho.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/kms_sysfs_edid_timing: clarify
 test description and thresholds
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

The description of this test was cryptic, mentioning a very old patch
and so on.  Clarify what the test actually does.

While at it, improve the assertion messages and clarify the threshold
macro names.

Additionally, change the mean time threshold per connector to
something shorter than the threshold per probe, since the former
cannot happen without the latter already causing an assertion failure.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index ea0e169e6ed9..4255cae3be17 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -26,16 +26,14 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 
-#define THRESHOLD_PER_CONNECTOR	50
-#define THRESHOLD_TOTAL		150
-#define CHECK_TIMES		15
-
-IGT_TEST_DESCRIPTION("This check the time we take to read the content of all "
-		     "the possible connectors. Without the edid -ENXIO patch "
-		     "(http://permalink.gmane.org/gmane.comp.video.dri.devel/62083), "
-		     "we sometimes take a *really* long time. "
-		     "So let's just check for some reasonable timing here");
+#define THRESHOLD_PER_CONNECTOR		50
+#define THRESHOLD_PER_CONNECTOR_MEAN	40
+#define CHECK_TIMES			15
 
+IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
+		     "connector and fails if either the time it takes for "
+		     "one reprobe is too long or if the mean time it takes "
+		     "to reprode one connector is too long.");
 
 igt_simple_main
 {
@@ -82,13 +80,13 @@ igt_simple_main
 			  mean.mean, mean.mean / 1e3, mean.mean / 1e6);
 
 		igt_assert_f(mean.max < THRESHOLD_PER_CONNECTOR * 1e6,
-			     "%s: probe time exceed %dms, max=%.2fms, avg=%.2fms\n",
+			     "%s: single probe time exceeded %dms, max=%.2fms, avg=%.2fms\n",
 			     de->d_name, THRESHOLD_PER_CONNECTOR,
 			     mean.max / 1e6, mean.mean / 1e6);
 
-		igt_assert_f(mean.mean < (THRESHOLD_TOTAL * 1e6),
-			     "%s: average probe time exceeded %dms, max=%.2fms, avg=%.2fms\n",
-			     de->d_name, THRESHOLD_TOTAL,
+		igt_assert_f(mean.mean < (THRESHOLD_PER_CONNECTOR_MEAN * 1e6),
+			     "%s: mean probe time exceeded %dms, max=%.2fms, avg=%.2fms\n",
+			     de->d_name, THRESHOLD_PER_CONNECTOR_MEAN,
 			     mean.max / 1e6, mean.mean / 1e6);
 	}
 	closedir(dirp);
-- 
2.36.1
