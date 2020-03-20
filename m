Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844C66E171
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2020 15:36:40 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 20 Mar 2020 16:36:23 +0100
Message-Id: <20200320153623.4780-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Fix device lists not cleaned up
 sufficiently before rescan
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Some effort is already taken to clean up previous content of device
lists before forced device rescan is performed but it is not
sufficient.  An attempt to use forced device rescan in a test results
in that test crashing or spinning until being killed by OOM killer.
Fix it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index b3f79c81e..db4da30d3 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -353,14 +353,11 @@ static void set_vendor_device(struct igt_device *dev)
 	dev->device = strndup(pci_id + 5, 4);
 }
 
-/* Allocate arrays for keeping scanned devices */
+/* Initialize lists for keeping scanned devices */
 static bool prepare_scan(void)
 {
-	if (igt_devs.all.prev == NULL || igt_devs.all.next == NULL)
-		IGT_INIT_LIST_HEAD(&igt_devs.all);
-
-	if (igt_devs.filtered.prev == NULL || igt_devs.filtered.next == NULL)
-		IGT_INIT_LIST_HEAD(&igt_devs.filtered);
+	IGT_INIT_LIST_HEAD(&igt_devs.all);
+	IGT_INIT_LIST_HEAD(&igt_devs.filtered);
 
 	return true;
 }
@@ -595,8 +592,15 @@ void igt_devices_scan(bool force)
 {
 	if (force && igt_devs.devs_scanned) {
 		struct igt_device *dev, *tmp;
+
+		igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered,
+					     link) {
+			igt_list_del(&dev->link);
+			free(dev);
+		}
 		igt_list_for_each_entry_safe(dev, tmp, &igt_devs.all, link) {
 			igt_device_free(dev);
+			igt_list_del(&dev->link);
 			free(dev);
 		}
 
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
