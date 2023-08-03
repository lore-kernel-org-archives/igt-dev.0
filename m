Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E524310E596
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 05:02:15 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 10:36:07 +0530
Message-Id: <20230803050609.2835714-3-riana.tauro@intel.com>
In-Reply-To: <20230803050609.2835714-1-riana.tauro@intel.com>
References: <20230803050609.2835714-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_pm: change d3cold_allowed
 function parameters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Change function parameter of d3cold_allowed get/set functions
to pci slot name. Change the data type from char to uint32_t
as it is more appropriate.

This change is done so that both xe tests and i915 test can
use the same library function.
Modify i915_suspend to use these functions.
No Functional Changes.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_pm.c              | 22 +++++++++++-----------
 lib/igt_pm.h              |  4 ++--
 tests/i915/i915_suspend.c |  8 ++++----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index ba591f0f8..11cf82950 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1204,47 +1204,47 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_d3cold_allowed:
- * @igt_device_card: device card
- * @val: value to be read into
+ * @pci_slot_name: slot name of the pci device
+ * @value: value to be read into
  *
  * Reads the value of d3cold_allowed attribute
  * of the pci device
  */
-void igt_pm_get_d3cold_allowed(struct igt_device_card *card, char *val)
+void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 {
 	char name[PATH_MAX];
 	int fd;
 
 	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%s",
-		 card->pci_slot_name);
+		 pci_slot_name);
 
 	fd = open(name, O_RDONLY);
 	igt_assert_f(fd >= 0, "Can't open %s\n", name);
 
-	igt_sysfs_read(fd, "d3cold_allowed", val, sizeof(val));
+	__igt_sysfs_get_u32(fd, "d3cold_allowed", value);
 
 	close(fd);
 }
 
 /**
- * igt_pm_get_d3cold_allowed:
- * @igt_device_card: device card
- * @val: value to be written
+ * igt_pm_set_d3cold_allowed:
+ * @pci_slot_name: slot name of pci device
+ * @value: value to be written
  *
  * writes the value to d3cold_allowed attribute of pci device
  */
-void igt_pm_set_d3cold_allowed(struct igt_device_card *card, const char *val)
+void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value)
 {
 	char name[PATH_MAX];
 	int fd;
 
 	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%s",
-		 card->pci_slot_name);
+		 pci_slot_name);
 
 	fd = open(name, O_RDONLY);
 	igt_assert_f(fd >= 0, "Can't open %s\n", name);
 
-	igt_sysfs_write(fd, "d3cold_allowed", val, sizeof(val));
+	__igt_sysfs_set_u32(fd, "d3cold_allowed", value);
 	close(fd);
 }
 
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 71ec2f239..306a9eb46 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -79,8 +79,8 @@ enum igt_acpi_d_state
 igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);
 void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
 				       struct pci_device *i915);
-void igt_pm_get_d3cold_allowed(struct igt_device_card *card, char *val);
-void igt_pm_set_d3cold_allowed(struct igt_device_card *card, const char *val);
+void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value);
+void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value);
 void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
 void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 851e797c2..c25805584 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -283,7 +283,7 @@ static void
 test_suspend_without_i915(int state)
 {
 	struct igt_device_card card;
-	char d3cold_allowed[2];
+	uint32_t d3cold_allowed;
 	int fd;
 
 	fd = __drm_open_driver(DRIVER_INTEL);
@@ -297,8 +297,8 @@ test_suspend_without_i915(int state)
 	 */
 	if (state == SUSPEND_STATE_FREEZE &&
 	    igt_device_find_first_i915_discrete_card(&card)) {
-		igt_pm_get_d3cold_allowed(&card, d3cold_allowed);
-		igt_pm_set_d3cold_allowed(&card, "0\n");
+		igt_pm_get_d3cold_allowed(card.pci_slot_name, &d3cold_allowed);
+		igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
 	}
 	drm_close_driver(fd);
 
@@ -308,7 +308,7 @@ test_suspend_without_i915(int state)
 	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
 
 	if (state == SUSPEND_STATE_FREEZE && strlen(card.card))
-		igt_pm_set_d3cold_allowed(&card, d3cold_allowed);
+		igt_pm_set_d3cold_allowed(card.pci_slot_name, d3cold_allowed);
 
 	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
 	igt_assert_eq(igt_i915_driver_load(NULL), 0);
-- 
2.40.0
