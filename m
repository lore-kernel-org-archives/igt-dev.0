Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B276E8B6
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 16:56:12 +0000 (UTC)
From: don.hiatt@intel.com
Date: Tue, 10 Mar 2020 10:09:28 -0700
Message-Id: <20200310170928.109826-1-don.hiatt@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_pm: Adjust pm status check timeout
 and log timing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Don Hiatt <don.hiatt@intel.com>

Increase the overall time we wait to achieve the desired runtime
status to 15 seconds to fix an occasional timeout and do so
in 1 second increments to speed up exiting. Also log the
amount of time we waited to get a handle on how much variation
we run into.

These changes will allow us to log more information on an
occassional timeout we are seeing when expecting the runtime
status to change, with the extra logs we hope to pinpoint the
race we suspect might be there. Also, on local runs we generally
see it only takes from 1-3 seconds so switching from a fixed
10 second timeout to a loop in 1 second increments will speed
things up for the majority of test runs.

v2: Update commit message

Signed-off-by: Don Hiatt <don.hiatt@intel.com>
Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 lib/igt_pm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 9d441e1b76ff..13675fca0c9d 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -747,8 +747,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
  * igt_wait_for_pm_status:
  * @status: desired runtime PM status
  *
- * Waits until for the driver to switch to into the desired runtime PM status,
- * with a 10 second timeout.
+ * Waits for the driver to switch into the desired runtime PM status,
+ * with up to a 15 second timeout in 1 second increments.
  *
  * Returns:
  * True if the desired runtime PM status was attained, false if the operation
@@ -758,7 +758,7 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 {
 	enum igt_runtime_pm_status expected = status;
 	bool ret;
-	int fd;
+	int fd, i;
 
 	if (__igt_pm_power < 0)
 		return false;
@@ -766,8 +766,16 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 	fd = openat(__igt_pm_power, "runtime_status", O_RDONLY);
 	igt_assert_f(fd >= 0, "Can't open runtime_status\n");
 
-	ret = igt_wait((status = __igt_get_runtime_pm_status(fd)) == expected,
-		       10000, 100);
+	for (i=1; i < 16; ++i) {
+		ret = igt_wait((status = __igt_get_runtime_pm_status(fd)) == expected,
+				1000, 100);
+
+		if (ret) {
+			igt_info("Got expected (%s) runtime pm status in %d second(s)\n",
+				 _pm_status_name(expected), i);
+			break;
+		}
+	}
 	close(fd);
 
 	if (!ret)
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
