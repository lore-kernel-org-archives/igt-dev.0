Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2110F080
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 11:04:12 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 May 2022 16:33:47 +0530
Message-Id: <20220505110354.30768-3-anshuman.gupta@intel.com>
In-Reply-To: <20220505110354.30768-1-anshuman.gupta@intel.com>
References: <20220505110354.30768-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/9] lib/igt_device: Get gfx PCI card
 root port
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

Utility library function to get the Gfx Card PCI topology
root port pci device using libpaciaccess.
root port will be used to get the real ACPI D state.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_device.c | 28 ++++++++++++++++++++++++++++
 lib/igt_device.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index 9794a9928..fddfba72c 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -257,3 +257,31 @@ struct pci_device *igt_device_get_pci_device(int fd)
 
 	return pci_dev;
 }
+
+/**
+ * igt_device_get_pci_root_port:
+ * @fd: the device.
+ *
+ * Looks up the graphics pci device root port using libpciaccess.
+ *
+ * Returns:
+ * The root port pci_device.
+ */
+struct pci_device *
+igt_device_get_pci_root_port(int fd)
+{
+	struct pci_device *pci_dev, *prev;
+
+	pci_dev = __igt_device_get_pci_device(fd, 0);
+	igt_require(pci_dev);
+
+	while (pci_dev) {
+		prev = pci_dev;
+		pci_dev = pci_device_get_parent_bridge(pci_dev);
+	}
+
+	igt_debug("Root Port PCI device %04x:%02x:%02x.%01x\n",
+		  prev->domain, prev->bus, prev->dev, prev->func);
+
+	return prev;
+}
diff --git a/lib/igt_device.h b/lib/igt_device.h
index 1aaa840e2..800a0fcc3 100644
--- a/lib/igt_device.h
+++ b/lib/igt_device.h
@@ -34,5 +34,6 @@ void igt_device_drop_master(int fd);
 int igt_device_get_card_index(int fd);
 struct pci_device *igt_device_get_pci_device(int fd);
 struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
+struct pci_device *igt_device_get_pci_root_port(int fd);
 
 #endif /* __IGT_DEVICE_H__ */
-- 
2.26.2
