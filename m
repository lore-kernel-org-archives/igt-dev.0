Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FC712AF03
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 08:01:53 +0000 (UTC)
From: Luca Coelho <luca@coelho.fi>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Jun 2022 10:42:40 +0300
Message-Id: <20220607074240.1202404-5-luca@coelho.fi>
In-Reply-To: <20220607074240.1202404-1-luca@coelho.fi>
References: <20220607074240.1202404-1-luca@coelho.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_sysfs_edid_timing: add total
 mean assertion threshold
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

Add an assertion to make sure that the mean time it takes to probe all
connectors doesn't exceed 30 ms.  This is an arbitrary but reasonable
amount of time.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 4255cae3be17..680e4ef5985e 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -28,21 +28,27 @@
 
 #define THRESHOLD_PER_CONNECTOR		50
 #define THRESHOLD_PER_CONNECTOR_MEAN	40
+#define THRESHOLD_ALL_CONNECTORS_MEAN	30
 #define CHECK_TIMES			15
 
 IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
 		     "connector and fails if either the time it takes for "
 		     "one reprobe is too long or if the mean time it takes "
-		     "to reprode one connector is too long.");
+		     "to reprode one connector is too long.  Additionally, "
+		     "make sure that the mean time for all connectors is "
+		     "not too long.");
 
 igt_simple_main
 {
 	DIR *dirp;
 	struct dirent *de;
+	struct igt_mean all_mean;
 
 	dirp = opendir("/sys/class/drm");
 	igt_assert(dirp != NULL);
 
+	igt_mean_init(&all_mean);
+
 	while ((de = readdir(dirp))) {
 		struct igt_mean mean = {};
 		struct stat st;
@@ -88,7 +94,14 @@ igt_simple_main
 			     "%s: mean probe time exceeded %dms, max=%.2fms, avg=%.2fms\n",
 			     de->d_name, THRESHOLD_PER_CONNECTOR_MEAN,
 			     mean.max / 1e6, mean.mean / 1e6);
+
+		igt_mean_add(&all_mean, mean.mean);
 	}
-	closedir(dirp);
 
+	igt_assert_f(all_mean.mean < THRESHOLD_ALL_CONNECTORS_MEAN * 1e6,
+		     "Mean of all connector means exceeds %dms, max=%.2fms, mean=%.2fms\n",
+		     THRESHOLD_ALL_CONNECTORS_MEAN, all_mean.max / 1e6,
+		     all_mean.mean / 1e6);
+
+	closedir(dirp);
 }
-- 
2.36.1
