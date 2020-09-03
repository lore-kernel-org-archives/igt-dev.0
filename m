Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04706E9A9
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2020 11:04:57 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Thu,  3 Sep 2020 16:31:10 +0530
Message-Id: <20200903110110.2403699-3-ayaz.siddiqui@intel.com>
In-Reply-To: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
References: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_device_scan: Select intel as
 default vendor for intel_gpu_top
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

intel_gpu_top is selecting first discrete device as default drm subsystem.
In case of multi drm device if the first device is not intel gpu
then it will lead to an error while running intel_gpu_top.

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
---
 lib/igt_device_scan.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3583c69c7..3e183423c 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -426,6 +426,25 @@ static struct igt_device *igt_device_find(const char *subsystem,
 	return NULL;
 }
 
+static bool is_vendor_matched(struct igt_device *dev, const char *vendor)
+{
+	const char *vendor_id;
+
+	if (!dev->vendor || !vendor)
+		return false;
+
+	/* First we compare vendor id, like 8086 */
+	if (!strcasecmp(dev->vendor, vendor))
+		return true;
+
+	/* Likely we have vendor string instead of id */
+	vendor_id = get_pci_vendor_id_by_name(vendor);
+	if (!vendor_id)
+		return false;
+
+	return !strcasecmp(dev->vendor, vendor_id);
+}
+
 static void
 __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
 {
@@ -455,7 +474,7 @@ void igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
 
 	igt_list_for_each_entry(dev, &igt_devs.all, link) {
 
-		if (!is_pci_subsystem(dev))
+		if (!is_pci_subsystem(dev) || !is_vendor_matched(dev, "intel"))
 			continue;
 
 		if ((strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID, PCI_SLOT_NAME_SIZE)) != 0) {
@@ -889,25 +908,6 @@ static bool parse_filter(const char *fstr, struct filter *filter)
 	return false;
 }
 
-static bool is_vendor_matched(struct igt_device *dev, const char *vendor)
-{
-	const char *vendor_id;
-
-	if (!dev->vendor || !vendor)
-		return false;
-
-	/* First we compare vendor id, like 8086 */
-	if (!strcasecmp(dev->vendor, vendor))
-		return true;
-
-	/* Likely we have vendor string instead of id */
-	vendor_id = get_pci_vendor_id_by_name(vendor);
-	if (!vendor_id)
-		return false;
-
-	return !strcasecmp(dev->vendor, vendor_id);
-}
-
 /* Filter which matches subsystem:/sys/... path.
  * Used as first filter in chain.
  */
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
