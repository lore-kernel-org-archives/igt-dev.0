Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DF910E99B
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 15:46:13 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 21:15:47 +0530
Message-Id: <20220506154553.6146-4-anshuman.gupta@intel.com>
In-Reply-To: <20220506154553.6146-1-anshuman.gupta@intel.com>
References: <20220506154553.6146-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 3/9] lib/igt_pm: D3Cold runtime pm
 infrastructure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Enable gfx card pci devices runtime pm for all pci devices
and bridge under the topology of Gfx Card root port.

Added a library function to get the PCI root port ACPI
D state and to print the pci card devices runtime pm
status.

v2:
- Save pci dev power attrs to dynamically allocated array. [Rodrigo]
- Set autosuspend delay to 0 on supported devices. [Rodrigo]
- %s/else if/else in  igt_pm_get_acpi_real_d_state. [Kamil]
v3:
- Add comment for MAX_PCI_DEVICES. [Badal]
- Use static global arrary __pci_dev_pwrattr[]. [Rodrigo]
- Use pci_slot_match iter. [Badal]
- Destroy the iter. [Badal]
v4:
- Added igt_pm_enbale_pci_card_autosuspend() to avoid any
  control attr save/restore by exit handler. [Rodrigo]
v5:
- Code refactoring to avoid code duplication.
  Few function name changed. [Rodrigo]
  %s/igt_pm_enbale_pci_card_autosuspend/igt_pm_enable_runtime_pm.
  %s/__igt_pm_setup_pci_card_runtime_pm/igt_pm_setup_pci_dev_power_attrs.
  %s/igt_pm_setup_power_attr/igt_pm_write_power_attr.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_pm.c | 317 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  24 ++++
 2 files changed, 341 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index b409ec463..412b420b6 100644
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
@@ -75,6 +76,8 @@ enum {
 #define MIN_POWER_STR		"min_power\n"
 /* Remember to fix this if adding longer strings */
 #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
+/* Root Port bus can have max 32 dev and each dev can have max 8 func */
+#define MAX_PCI_DEVICES		256
 int8_t *__sata_pm_policies;
 int __scsi_host_cnt;
 
@@ -856,3 +859,317 @@ bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
 
 	return strstr(buf, "LPSP: capable");
 }
+
+/**
+ * igt_pm_acpi_d3cold_supported:
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
+	if  (strncmp(acpi_d_state, "D1\n", n_read) == 0)
+		return IGT_ACPI_D1;
+	if  (strncmp(acpi_d_state, "D2\n", n_read) == 0)
+		return IGT_ACPI_D2;
+	if  (strncmp(acpi_d_state, "D3hot\n", n_read) == 0)
+		return IGT_ACPI_D3Hot;
+	if  (strncmp(acpi_d_state, "D3cold\n", n_read) == 0)
+		return IGT_ACPI_D3Cold;
+
+	return IGT_ACPI_UNKNOWN_STATE;
+}
+
+static struct igt_pm_pci_dev_pwrattr  __pci_dev_pwrattr[MAX_PCI_DEVICES];
+
+static void __igt_pm_pci_card_exit_handler(int sig)
+{
+	igt_pm_restore_pci_card_runtime_pm();
+}
+
+static int igt_pm_get_power_attr_fd(struct pci_device *pci_dev, const char *attr)
+{
+	char name[PATH_MAX];
+	int fd;
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/%s",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, attr);
+
+	fd = open(name, O_RDWR);
+	igt_assert_f(fd >= 0, "Can't open %s\n", attr);
+
+	return fd;
+}
+
+static bool igt_pm_save_power_attr(int fd, char *attr, int len, bool autosuspend_delay)
+{
+	int size;
+
+	size = read(fd, attr, len - 1);
+
+	if (autosuspend_delay) {
+		if (size < 0 && errno == EIO)
+			return false;
+	} else {
+		igt_assert(size > 0);
+	}
+
+	attr[size] = '\0';
+	strchomp(attr);
+
+	return true;
+}
+
+static void igt_pm_write_power_attr(int fd, const char *val)
+{
+	int size, len;
+	char buf[6];
+
+	len = strlen(val);
+
+	size = write(fd, val, len);
+	if (size < 0 && errno == EIO)
+		return;
+
+	igt_assert_eq(size, len);
+	lseek(fd, 0, SEEK_SET);
+	size = read(fd, buf, ARRAY_SIZE(buf));
+	igt_assert_eq(size, len);
+	igt_assert(strncmp(buf, val, len) == 0);
+}
+
+static void
+igt_pm_setup_pci_dev_power_attrs(struct pci_device *pci_dev, struct igt_pm_pci_dev_pwrattr *pwrattr)
+{
+	int control_fd, delay_fd, control_size, delay_size;
+	char *control, *delay;
+
+	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
+	control_fd = igt_pm_get_power_attr_fd(pci_dev, "control");
+
+	if (!pwrattr)
+		goto write_power_attr;
+
+	control = pwrattr->control;
+	control_size =  sizeof(pwrattr->control);
+	delay = pwrattr->autosuspend_delay;
+	delay_size =  sizeof(pwrattr->autosuspend_delay);
+	pwrattr->pci_dev = pci_dev;
+	pwrattr->autosuspend_supported = true;
+
+	if (!igt_pm_save_power_attr(delay_fd, delay, delay_size, true)) {
+		pwrattr->autosuspend_supported = false;
+		igt_debug("PCI '%04x:%02x:%02x.%01x' doesn't support auto_suspend\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+	}
+
+	igt_pm_save_power_attr(control_fd, control, control_size, false);
+	igt_debug("PCI '%04x:%02x:%02x.%01x' Saved 'control, autosuspend_delay_ms' as '%s, %s'\n",
+		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, control,
+		  pwrattr->autosuspend_supported ? delay : "NA");
+
+	igt_install_exit_handler(__igt_pm_pci_card_exit_handler);
+
+write_power_attr:
+	igt_pm_write_power_attr(delay_fd, "0\n");
+	igt_pm_write_power_attr(control_fd, "auto\n");
+
+	close(delay_fd);
+	close(control_fd);
+}
+
+static void
+igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs)
+{
+	int primary, secondary, subordinate, ret;
+	struct pci_device_iterator *iter;
+	struct pci_slot_match match;
+	struct pci_device *dev;
+	int i = 0;
+
+	ret = pci_device_get_bridge_buses(pci_dev, &primary, &secondary, &subordinate);
+	igt_assert(!ret);
+
+	ret = pci_system_init();
+	igt_assert(!ret);
+
+	match.domain = pci_dev->domain;
+	match.bus = PCI_MATCH_ANY;
+	match.dev = PCI_MATCH_ANY;
+	match.func = PCI_MATCH_ANY;
+	iter = pci_slot_match_iterator_create(&match);
+	igt_assert(iter);
+
+	/* Setup power attrs for PCI root port */
+	igt_pm_setup_pci_dev_power_attrs(pci_dev, save_attrs ? &__pci_dev_pwrattr[i++] : NULL);
+	while ((dev = pci_device_next(iter)) != NULL) {
+		if (dev->bus >= secondary && dev->bus <= subordinate) {
+			igt_pm_setup_pci_dev_power_attrs(dev,
+							 save_attrs ? &__pci_dev_pwrattr[i++] : NULL);
+			if (save_attrs)
+				igt_assert(i <  MAX_PCI_DEVICES);
+		}
+	}
+
+	pci_iterator_destroy(iter);
+}
+
+/**
+ * igt_pm_enable_pci_card_runtime_pm:
+ * @pci_dev: root port pci_dev.
+ * Enable runtime PM for all PCI endpoints devices for a given root port by
+ * setting power/control attr to "auto" and setting autosuspend_delay_ms
+ * to zero.
+ */
+void igt_pm_enable_pci_card_runtime_pm(struct pci_device *pci_dev)
+{
+	igt_pm_setup_pci_card_power_attrs(pci_dev, false);
+	pci_system_cleanup();
+}
+
+/**
+ * igt_pm_setup_pci_card_runtime_pm:
+ * @pci_dev: root port pci_dev.
+ * Setup runtime PM for all PCI endpoints devices for a given root port by
+ * enabling runtime suspend and setting autosuspend_delay_ms to zero.
+ * It also saves and restore power control attribute for all PCI endpoints
+ * devices under given root port.
+ */
+void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
+{
+	memset(__pci_dev_pwrattr, 0, sizeof(__pci_dev_pwrattr));
+	igt_pm_setup_pci_card_power_attrs(pci_dev, true);
+}
+
+static void
+igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *val, int len)
+{
+	int fd;
+
+	igt_debug("PCI '%04x:%02x:%02x.%01x' Restoring %s attr to '%s'\n",
+		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, attr, val);
+
+	fd = igt_pm_get_power_attr_fd(pci_dev, attr);
+	igt_assert(write(fd, val, len) == len);
+
+	close(fd);
+}
+
+/**
+ * igt_pm_restore_pci_card_runtime_pm:
+ * Restore control and autosuspend_delay_ms power attribute for all
+ * PCI endpoints devices under gfx root port, which were saved earlier
+ * by igt_pm_setup_pci_card_runtime_pm().
+ */
+void igt_pm_restore_pci_card_runtime_pm(void)
+{
+	int i = 0;
+
+	for (i = 0; i < MAX_PCI_DEVICES; i++) {
+		if (!__pci_dev_pwrattr[i].pci_dev)
+			break;
+
+		igt_pm_restore_power_attr(__pci_dev_pwrattr[i].pci_dev, "control",
+					  __pci_dev_pwrattr[i].control,
+					  sizeof(__pci_dev_pwrattr[i].control));
+
+		if (!__pci_dev_pwrattr[i].autosuspend_supported)
+			continue;
+
+		igt_pm_restore_power_attr(__pci_dev_pwrattr[i].pci_dev, "autosuspend_delay_ms",
+					  __pci_dev_pwrattr[i].autosuspend_delay,
+					  sizeof(__pci_dev_pwrattr[i].autosuspend_delay));
+	}
+
+	memset(__pci_dev_pwrattr, 0, sizeof(__pci_dev_pwrattr));
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
+		if (!__pci_dev_pwrattr[i].pci_dev)
+			break;
+
+		igt_pm_print_pci_dev_runtime_status(__pci_dev_pwrattr[i].pci_dev);
+	}
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 162d3ca3c..c53dae2c3 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -46,6 +46,23 @@ enum igt_runtime_pm_status {
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
+struct	igt_pm_pci_dev_pwrattr {
+	struct pci_device *pci_dev;
+	char control[64];
+	bool autosuspend_supported;
+	char autosuspend_delay[64];
+};
+
 bool igt_setup_runtime_pm(int device);
 void igt_disable_runtime_pm(void);
 void igt_restore_runtime_pm(void);
@@ -54,5 +71,12 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status);
 bool igt_pm_dmc_loaded(int debugfs);
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd);
 bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output);
+bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev);
+enum igt_acpi_d_state
+igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);
+void igt_pm_enable_pci_card_runtime_pm(struct pci_device *pci_dev);
+void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
+void igt_pm_restore_pci_card_runtime_pm(void);
+void igt_pm_print_pci_card_runtime_status(void);
 
 #endif /* IGT_PM_H */
-- 
2.26.2
