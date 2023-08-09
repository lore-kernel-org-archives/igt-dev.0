Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A034B10E41C
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 09:37:18 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 15:12:24 +0530
Message-Id: <20230809094224.303723-1-riana.tauro@intel.com>
In-Reply-To: <20230809070640.270414-2-riana.tauro@intel.com>
References: <20230809070640.270414-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/5] lib/igt_device: Add a function to
 get the pci slot name
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

The existing d3cold_allowed get/set functions in igt_pm uses
igt_device_card as a function argument. Xe tests cannot use
this function as they use pci_device.
To have a common library function for both i915 and xe, use a
common parameter between both igt_device_card and
pci_device ie.pci_slot_name.

Add a helper function to get this pci slot name.

v2: Add justification for change in commit message (Anshuman)
v3: assert if pci_slot_name is NULL (Anshuman)
v4: move assert before snprintf (Anshuman)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_device.c | 21 +++++++++++++++++++++
 lib/igt_device.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index 49b771221..c24f6a58d 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -23,6 +23,7 @@
  */
 #include <sys/types.h>
 #include <fcntl.h>
+#include <limits.h>
 
 #include <sys/stat.h>
 #ifdef __linux__
@@ -287,3 +288,23 @@ igt_device_get_pci_root_port(int fd)
 
 	return prev;
 }
+
+/**
+ * igt_device_get_pci_slot_name:
+ * @fd: the device.
+ * @pci_slot_name: pci slot name
+ *
+ * Looks up the graphics pci device using libpciaccess
+ * and gets the slot name
+ */
+void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
+{
+	struct pci_device *pci_dev;
+
+	pci_dev = __igt_device_get_pci_device(fd, 0);
+	igt_require(pci_dev);
+
+	igt_assert(pci_slot_name);
+	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+}
diff --git a/lib/igt_device.h b/lib/igt_device.h
index 800a0fcc3..dad7bb047 100644
--- a/lib/igt_device.h
+++ b/lib/igt_device.h
@@ -36,4 +36,5 @@ struct pci_device *igt_device_get_pci_device(int fd);
 struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
 struct pci_device *igt_device_get_pci_root_port(int fd);
 
+void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
 #endif /* __IGT_DEVICE_H__ */
-- 
2.40.0
