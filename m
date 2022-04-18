Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E860C10E397
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 12:51:08 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Apr 2022 18:20:42 +0530
Message-Id: <20220418125048.7969-4-anshuman.gupta@intel.com>
In-Reply-To: <20220418125048.7969-1-anshuman.gupta@intel.com>
References: <20220418125048.7969-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/9] lib/igt_pm: D3Cold runtime pm
 infrastructure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Enable gfx card pci devices runtime pm for all pci devices
and bridge under the topology of Gfx Card root port.

Added a library function to get the PCI root port ACPI
D state and to print the pci card devices runtime pm
status.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_pm.c | 226 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  21 +++++
 2 files changed, 247 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index b409ec463..8e8a330f8 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -28,6 +28,7 @@
 #include <fcntl.h>
 #include <stdio.h>
 #include <limits.h>
+#include <pciaccess.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
@@ -75,6 +76,7 @@ enum {
 #define MIN_POWER_STR		"min_power\n"
 /* Remember to fix this if adding longer strings */
 #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
+#define MAX_PCI_DEVICES		256
 int8_t *__sata_pm_policies;
 int __scsi_host_cnt;
 
@@ -856,3 +858,227 @@ bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
 
 	return strstr(buf, "LPSP: capable");
 }
+
+/**
+ * igt_pm_acpi_d3cold_suppoarted:
+ * @pci_dev: root port pci_dev.
+ * Check ACPI D3Cold support.
+ *
+ * Returns:
+ * True if ACPI D3Cold supported otherwise false.
+ */
+bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
+{
+	char name[PATH_MAX];
+	int dir, fd;
+
+	snprintf(name, PATH_MAX,
+		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	dir = open(name, O_RDONLY);
+	igt_require(dir > 0);
+
+	/* BIOS need to enable ACPI D3Cold Support.*/
+	fd = openat(dir, "real_power_state", O_RDONLY);
+	if (fd < 0 && errno == ENOENT)
+		return false;
+
+	igt_require(fd > 0);
+
+	return true;
+}
+
+/**
+ * igt_pm_get_acpi_real_d_state:
+ * @pci_dev: root port pci_dev.
+ * Get ACPI D state for a given root port.
+ *
+ * Returns:
+ * igt_acpi_d_state state.
+ */
+enum igt_acpi_d_state
+igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
+{
+	char name[PATH_MAX];
+	char acpi_d_state[64];
+	int fd, n_read;
+
+	snprintf(name, PATH_MAX,
+		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node/real_power_state",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	fd = open(name, O_RDONLY);
+	if (fd < 0)
+		return IGT_ACPI_UNKNOWN_STATE;
+
+	n_read = read(fd, acpi_d_state, sizeof(acpi_d_state) - 1);
+	igt_assert(n_read >= 0);
+	acpi_d_state[n_read] = '\0';
+	close(fd);
+
+	if (strncmp(acpi_d_state, "D0\n", n_read) == 0)
+		return IGT_ACPI_D0;
+	else if  (strncmp(acpi_d_state, "D1\n", n_read) == 0)
+		return IGT_ACPI_D1;
+	else if  (strncmp(acpi_d_state, "D2\n", n_read) == 0)
+		return IGT_ACPI_D2;
+	else if  (strncmp(acpi_d_state, "D3hot\n", n_read) == 0)
+		return IGT_ACPI_D3Hot;
+	else if  (strncmp(acpi_d_state, "D3cold\n", n_read) == 0)
+		return IGT_ACPI_D3Cold;
+	else
+		return IGT_ACPI_UNKNOWN_STATE;
+}
+
+static struct igt_pm_pci_dev_control  __igt_pm_pci_control[MAX_PCI_DEVICES];
+
+static void __igt_pm_pci_card_exit_handler(int sig)
+{
+	igt_pm_restore_pci_card_runtime_pm();
+}
+
+static void
+__igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev, int index)
+{
+	char name[PATH_MAX], buf[6];
+	int fd, control_size, size;
+	char *control;
+
+	igt_assert(index <  MAX_PCI_DEVICES);
+
+	control = __igt_pm_pci_control[index].control;
+	control_size =  sizeof(__igt_pm_pci_control[index].control);
+	__igt_pm_pci_control[index].pci_dev = pci_dev;
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/control",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	fd = open(name, O_RDWR);
+	igt_assert_f(fd >= 0, "Can't open control\n");
+
+	igt_assert(read(fd, control, control_size - 1) > 0);
+	strchomp(control);
+
+	igt_debug("Saved runtime power management for PCI '%04x:%02x:%02x.%01x' '%s'\n",
+		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, control);
+	igt_install_exit_handler(__igt_pm_pci_card_exit_handler);
+
+	size = write(fd, "auto\n", 5);
+	igt_assert(size == 5);
+
+	lseek(fd, 0, SEEK_SET);
+	size = read(fd, buf, ARRAY_SIZE(buf));
+	igt_assert(size == 5);
+	igt_assert(strncmp(buf, "auto\n", 5) == 0);
+
+	close(fd);
+}
+
+/**
+ * igt_pm_setup_pci_card_runtime_pm:
+ * @pci_dev: root port pci_dev.
+ * Setup runtime PM for all PCI endpoints devices for a given
+ * root port. It also save power control attribute for all PCI endpoints
+ * devices for a given root port.
+ */
+void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
+{
+	int primary, secondary, subordinate, ret;
+	struct pci_device_iterator *iter;
+	struct pci_device *dev;
+	int i = 0;
+
+	memset(__igt_pm_pci_control, 0, sizeof(__igt_pm_pci_control));
+	ret = pci_device_get_bridge_buses(pci_dev, &primary, &secondary, &subordinate);
+	igt_assert(!ret);
+
+	ret = pci_system_init();
+	igt_assert(!ret);
+
+	iter = pci_slot_match_iterator_create(NULL);
+	/* Setup runtime pm for PCI root port */
+	__igt_pm_setup_pci_card_runtime_pm(pci_dev, i++);
+	while ((dev = pci_device_next(iter)) != NULL) {
+		if (dev->bus >= secondary && dev->bus <= subordinate)
+			__igt_pm_setup_pci_card_runtime_pm(dev, i++);
+	}
+}
+
+static void igt_pm_restore_pci_dev_runtime_pm(struct pci_device *pci_dev, char *control, int len)
+{
+	char name[PATH_MAX];
+	int fd;
+
+	igt_debug("Restoring runtime power management for PCI '%04x:%02x:%02x.%01x' '%s'\n",
+		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, control);
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/control",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	fd = open(name, O_WRONLY);
+	igt_assert_f(fd >= 0, "Can't open control\n");
+
+	igt_assert(write(fd, control, len) == len);
+	close(fd);
+}
+
+/**
+ * igt_pm_restore_pci_card_runtime_pm:
+ * @pci_dev: root port pci_dev.
+ * Restore power control attribute for all PCI endpoints devices for a given
+ * root port.
+ */
+void igt_pm_restore_pci_card_runtime_pm(void)
+{
+	int i = 0;
+
+	for (i = 0; i < MAX_PCI_DEVICES; i++) {
+		if (!__igt_pm_pci_control[i].pci_dev)
+			break;
+
+		igt_pm_restore_pci_dev_runtime_pm(__igt_pm_pci_control[i].pci_dev,
+						  __igt_pm_pci_control[i].control,
+						  sizeof(__igt_pm_pci_control[i].control));
+	}
+
+	memset(__igt_pm_pci_control, 0, sizeof(__igt_pm_pci_control));
+	pci_system_cleanup();
+}
+
+static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
+{
+	char name[PATH_MAX], runtime_status[64];
+	int fd, n_read;
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/runtime_status",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	fd = open(name, O_RDONLY);
+	igt_assert_f(fd >= 0, "Can't open runtime_status\n");
+
+	n_read = read(fd, runtime_status, sizeof(runtime_status) - 1);
+	igt_assert(n_read >= 0);
+	runtime_status[n_read] = '\0';
+	igt_info("runtime suspend status for PCI '%04x:%02x:%02x.%01x' %s\n",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, runtime_status);
+	close(fd);
+}
+
+/**
+ * igt_pm_print_pci_card_runtime_status:
+ * @pci_dev: root port pci_dev.
+ * Print runtime suspend status for all PCI endpoints devices for a given
+ * root port.
+ */
+void igt_pm_print_pci_card_runtime_status(void)
+{
+	int i = 0;
+
+	for (i = 0; i < MAX_PCI_DEVICES; i++) {
+		if (!__igt_pm_pci_control[i].pci_dev)
+			break;
+
+		igt_pm_print_pci_dev_runtime_status(__igt_pm_pci_control[i].pci_dev);
+	}
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 162d3ca3c..a5a9c4760 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -46,6 +46,21 @@ enum igt_runtime_pm_status {
 	IGT_RUNTIME_PM_STATUS_UNKNOWN,
 };
 
+/* PCI ACPI firmware node real state */
+enum igt_acpi_d_state {
+	IGT_ACPI_D0,
+	IGT_ACPI_D1,
+	IGT_ACPI_D2,
+	IGT_ACPI_D3Hot,
+	IGT_ACPI_D3Cold,
+	IGT_ACPI_UNKNOWN_STATE,
+};
+
+struct	igt_pm_pci_dev_control {
+	struct pci_device *pci_dev;
+	char control[64];
+};
+
 bool igt_setup_runtime_pm(int device);
 void igt_disable_runtime_pm(void);
 void igt_restore_runtime_pm(void);
@@ -54,5 +69,11 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status);
 bool igt_pm_dmc_loaded(int debugfs);
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd);
 bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output);
+bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev);
+enum igt_acpi_d_state
+igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);
+void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
+void igt_pm_restore_pci_card_runtime_pm(void);
+void igt_pm_print_pci_card_runtime_status(void);
 
 #endif /* IGT_PM_H */
-- 
2.26.2
