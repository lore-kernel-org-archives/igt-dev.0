Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DB010E48A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 19:31:11 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 18:57:19 +0000
Message-ID: <20231005185745.3056219-2-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
References: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 01/17] lib/igt_device_scan: added functions
 to get first Xe card
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added functions to get integrated or first discrete Xe card.

v2:
- renamed __find_first_i915_card to
  __find_first_intel_card_by_driver_name (Zbyszek)
v3:
- added documentation to public functions (Kamil)
v4:
- updated commit description (Kamil)

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_device_scan.c | 52 +++++++++++++++++++++++++++++++++++--------
 lib/igt_device_scan.h |  2 ++
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index ae69ed09f..f4f95fef3 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -769,25 +769,27 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
  * Iterate over all igt_devices array and find first discrete/integrated card.
  * card->pci_slot_name will be updated only if a card is found.
  */
-static bool __find_first_i915_card(struct igt_device_card *card, bool discrete)
+static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
+				bool want_discrete, const char *drv_name)
 {
 	struct igt_device *dev;
-	int cmp;
+	int is_integrated;
 
+	igt_assert(drv_name);
 	memset(card, 0, sizeof(*card));
 
 	igt_list_for_each_entry(dev, &igt_devs.all, link) {
 
-		if (!is_pci_subsystem(dev) || strcmp(dev->driver, "i915"))
+		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
 			continue;
 
-		cmp = strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
-			      PCI_SLOT_NAME_SIZE);
+		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
+					 PCI_SLOT_NAME_SIZE);
 
-		if (discrete && cmp) {
+		if (want_discrete && !is_integrated) {
 			__copy_dev_to_card(dev, card);
 			return true;
-		} else if (!discrete && !cmp) {
+		} else if (!want_discrete && is_integrated) {
 			__copy_dev_to_card(dev, card);
 			return true;
 		}
@@ -800,14 +802,46 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
 {
 	igt_assert(card);
 
-	return __find_first_i915_card(card, true);
+	return __find_first_intel_card_by_driver_name(card, true, "i915");
+}
+
+/**
+ * igt_device_find_first_xe_discrete_card
+ * @card: pointer to igt_device_card structure
+ *
+ * Iterate over all igt_devices array and find first xe discrete card.
+ * card will be updated only if a device is found.
+ *
+ * Returns: true if device is found, false otherwise.
+ */
+bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card)
+{
+	igt_assert(card);
+
+	return __find_first_intel_card_by_driver_name(card, true, "xe");
 }
 
 bool igt_device_find_integrated_card(struct igt_device_card *card)
 {
 	igt_assert(card);
 
-	return __find_first_i915_card(card, false);
+	return __find_first_intel_card_by_driver_name(card, false, "i915");
+}
+
+/**
+ * igt_device_find_xe_integrated_card
+ * @card: pointer to igt_device_card structure
+ *
+ * Iterate over all igt_devices array and find first xe integrated card.
+ * card will be updated only if a device is found.
+ *
+ * Returns: true if device is found, false otherwise.
+ */
+bool igt_device_find_xe_integrated_card(struct igt_device_card *card)
+{
+	igt_assert(card);
+
+	return __find_first_intel_card_by_driver_name(card, false, "xe");
 }
 
 static struct igt_device *igt_device_from_syspath(const char *syspath)
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index e6b0f1b90..b8f6a843d 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -87,6 +87,8 @@ bool igt_device_card_match_pci(const char *filter,
 	struct igt_device_card *card);
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
+bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
+bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
 char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
 int igt_open_card(struct igt_device_card *card);
 int igt_open_render(struct igt_device_card *card);
-- 
2.42.0
