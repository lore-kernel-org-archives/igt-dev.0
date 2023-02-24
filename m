Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC3F10E7CA
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 10:44:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Feb 2023 11:44:38 +0100
Message-Id: <20230224104443.62373-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230224104443.62373-1-zbigniew.kempczynski@intel.com>
References: <20230224104443.62373-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/8] lib/igt_pm: Add a helper to query
 the runtime_usage.
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

It will be useful so the tests can assert the expected
usage counter movement depending on the operation.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_pm.c | 18 ++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 26e8c9f0..d405861e 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1355,3 +1355,21 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 
 	return -1;
 }
+
+/**
+ * igt_pm_get_runtime_usage:
+ * @pci_dev: pci device
+ *
+ * Reports the runtime PM usage count of a device.
+ */
+int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
+{
+	char usage_str[64];
+	int usage, fd;
+
+	fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_usage");
+	if (igt_pm_read_power_attr(fd, usage_str, 64, true))
+		igt_assert(sscanf(usage_str, "%d", &usage) > 0);
+
+	return usage;
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index f65b960c..d0d6d673 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -86,5 +86,6 @@ void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled(int fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 
 #endif /* IGT_PM_H */
-- 
2.34.1
