Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BBE89F38
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:11:32 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 18:42:44 +0530
Message-Id: <20220906131245.4757-3-swati2.sharma@intel.com>
In-Reply-To: <20220906131245.4757-1-swati2.sharma@intel.com>
References: <20220906131245.4757-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] lib/pm: Add helper functions to get
 runtime suspended time
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

Added helper function to get runtime suspended time.
This will be used to extend dc9 validation.

v2: -created separate helper igt_pm_get_power_attr_fd_rdonly() (imre)
    -fixed igt_pm_get_runtime_suspended_time() (imre)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_pm.c | 36 ++++++++++++++++++++++++++++++++++--
 lib/igt_pm.h |  1 +
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 99251b40b..65f1fc866 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -953,13 +953,27 @@ static int igt_pm_get_power_attr_fd(struct pci_device *pci_dev, const char *attr
 	return fd;
 }
 
-static bool igt_pm_read_power_attr(int fd, char *attr, int len, bool autosuspend_delay)
+static int igt_pm_get_power_attr_fd_rdonly(struct pci_device *pci_dev, const char *attr)
+{
+	char name[PATH_MAX];
+	int fd;
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/%s",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, attr);
+
+	fd = open(name, O_RDONLY);
+	igt_assert_f(fd >= 0, "Can't open %s\n", attr);
+
+	return fd;
+}
+
+static bool igt_pm_read_power_attr(int fd, char *attr, int len, bool power_attr)
 {
 	int size;
 
 	size = read(fd, attr, len - 1);
 
-	if (autosuspend_delay) {
+	if (power_attr) {
 		if (size < 0 && errno == EIO)
 			return false;
 	} else {
@@ -1219,3 +1233,21 @@ bool i915_is_slpc_enabled(int fd)
 	else
 		return strstr(buf, "SLPC state: running");
 }
+
+int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
+{
+	char time_str[64];
+	int time, time_fd;
+
+	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_suspended_time");
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)){
+		igt_assert(sscanf(time_str, "%d", &time) > 0);
+
+		igt_info("runtime suspend time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
+
+		return time;
+	}
+
+	return -1;
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index cbbde12b5..a7d621366 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -80,5 +80,6 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
 void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled(int fd);
+int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 
 #endif /* IGT_PM_H */
-- 
2.25.1
