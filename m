Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3BE10E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Sep 2022 09:33:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Sep 2022 15:04:44 +0530
Message-Id: <20220913093446.27842-4-swati2.sharma@intel.com>
In-Reply-To: <20220913093446.27842-1-swati2.sharma@intel.com>
References: <20220913093446.27842-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 3/5] lib/pm: Add helper functions to get
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
v3: -revert var name change (imre)
    -add space (imre)
v4: -changed igt_info to igt_debug print

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_pm.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index edebfdec3..312288d03 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -954,6 +954,20 @@ static int igt_pm_get_power_attr_fd(struct pci_device *pci_dev, const char *attr
 	return fd;
 }
 
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
 static bool igt_pm_read_power_attr(int fd, char *attr, int len, bool autosuspend_delay)
 {
 	int size;
@@ -1266,3 +1280,21 @@ bool i915_is_slpc_enabled(int fd)
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
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
+		igt_assert(sscanf(time_str, "%d", &time) > 0);
+
+		igt_debug("runtime suspend time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
+
+		return time;
+	}
+
+	return -1;
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 52c03cc51..e81fceb89 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -84,5 +84,6 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
 void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled(int fd);
+int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 
 #endif /* IGT_PM_H */
-- 
2.25.1
