Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2875E6E3C1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 17:57:39 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Fri, 23 Oct 2020 23:21:57 +0530
Message-Id: <20201023175158.391450-2-ayaz.siddiqui@intel.com>
In-Reply-To: <20201023175158.391450-1-ayaz.siddiqui@intel.com>
References: <20201023175158.391450-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_device_scan:Add function to get
 pci subsystem of requested card
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

intel_gpu_top requires card information and PCI_SLOT_NAME for dGPU.
Only pci subsystem contains both information.
In case of user filter is other than pci subsystem then we need card
information of associated pci subsystem which is stored as parent of
requested card if available.

A new api has been added to cater intel_gpu_top requirement.

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Cc: Dixit Ashutosh <ashutosh.dixit@intel.com>
---
 lib/igt_device_scan.c | 55 ++++++++++++++++++++++++++++++++-----------
 lib/igt_device_scan.h |  2 ++
 tools/intel_gpu_top.c |  2 +-
 3 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index f4d43c733..55aa8159d 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1237,18 +1237,9 @@ static bool igt_device_filter_apply(const char *fstr)
 	return true;
 }
 
-/**
- * igt_device_card_match
- * @filter: filter string
- * @card: pointer to igt_device_card struct
- *
- * Function applies filter to match device from device array.
- *
- * Returns:
- * false - no card pointer was passed or card wasn't matched,
- * true - card matched and returned.
- */
-bool igt_device_card_match(const char *filter, struct igt_device_card *card)
+
+static bool __igt_device_card_match(const char *filter,
+			struct igt_device_card *card, bool request_pci_ss)
 {
 	struct igt_device *dev = NULL;
 
@@ -1266,10 +1257,46 @@ bool igt_device_card_match(const char *filter, struct igt_device_card *card)
 
 	/* We take first one if more than one card matches filter */
 	dev = igt_list_first_entry(&igt_devs.filtered, dev, link);
+	if (request_pci_ss && !is_pci_subsystem(dev) && dev->parent
+		&& is_pci_subsystem(dev->parent))
+		__copy_dev_to_card(dev->parent, card);
+	else
+		__copy_dev_to_card(dev, card);
+	return true;
+}
 
-	__copy_dev_to_card(dev, card);
+/**
+ * igt_device_card_match
+ * @filter: filter string
+ * @card: pointer to igt_device_card struct
+ *
+ * Function applies filter to match device from device array.
+ *
+ * Returns:
+ * false - no card pointer was passed or card wasn't matched,
+ * true - card matched and returned.
+ */
+bool igt_device_card_match(const char *filter, struct igt_device_card *card)
+{
+       return __igt_device_card_match(filter, card, false);
+}
 
-	return true;
+/**
+ * igt_device_card_match_pci
+ * @filter: filter string
+ * @card: pointer to igt_device_card struct
+ *
+ * Function applies filter to match device from device array.
+ * Populate associated pci subsystem data if available.
+ *
+ * Returns:
+ * false - no card pointer was passed or card wasn't matched,
+ * true - card matched and returned.
+ */
+bool igt_device_card_match_pci(const char *filter,
+			struct igt_device_card *card)
+{
+       return __igt_device_card_match(filter, card, true);
 }
 
 /**
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index bd937d227..544e982c4 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -68,6 +68,8 @@ const char *igt_device_filter_get(int num);
 
 /* Use filter to match the device and fill card structure */
 bool igt_device_card_match(const char *filter, struct igt_device_card *card);
+bool igt_device_card_match_pci(const char *filter,
+	struct igt_device_card *card);
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 int igt_open_card(struct igt_device_card *card);
 int igt_open_render(struct igt_device_card *card);
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 79a936ffb..1b6c8633b 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1393,7 +1393,7 @@ int main(int argc, char **argv)
 	}
 
 	if (opt_device != NULL) {
-		ret = igt_device_card_match(opt_device, &card);
+		ret = igt_device_card_match_pci(opt_device, &card);
 		if (!ret)
 			fprintf(stderr, "Requested device %s not found!\n", opt_device);
 		free(opt_device);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
