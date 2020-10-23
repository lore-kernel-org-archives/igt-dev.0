Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957D46E3CE
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 17:57:41 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Fri, 23 Oct 2020 23:21:58 +0530
Message-Id: <20201023175158.391450-3-ayaz.siddiqui@intel.com>
In-Reply-To: <20201023175158.391450-1-ayaz.siddiqui@intel.com>
References: <20201023175158.391450-1-ayaz.siddiqui@intel.com>
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

intel_gpu_top is selecting first discrete device as default drm subsystem.
In case of multi-gpu system if the first device is not intel gpu
then it will lead to an error while running intel_gpu_top.

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Cc: Dixit Ashutosh <ashutosh.dixit@intel.com>
---
 lib/igt_device_scan.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 55aa8159d..0967c6450 100644
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
@@ -457,7 +476,7 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
 
 	igt_list_for_each_entry(dev, &igt_devs.all, link) {
 
-		if (!is_pci_subsystem(dev))
+		if (!is_pci_subsystem(dev) || !is_vendor_matched(dev, "intel"))
 			continue;
 
 		if ((strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID, PCI_SLOT_NAME_SIZE)) != 0) {
@@ -893,25 +912,6 @@ static bool parse_filter(const char *fstr, struct filter *filter)
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
