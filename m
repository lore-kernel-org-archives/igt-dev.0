Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E909BC44536
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 14:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97110E849;
	Wed, 21 Jan 2026 14:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YN7YeeS0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E80A10E849
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769007112; x=1800543112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F+93XkvV7Kp7IFRoJlHGeNO9mxXWx++YLB/Je2Fgtp0=;
 b=YN7YeeS0u++9tBiFn3LK4PamBq0Xs163daPXkYlsscFh0x8haAL57iFI
 GDN2bF6Z1rT55zWsbkb7R3YTvfeONelZgI7mN3E4cNSK8uHZw3A1fxzGf
 ezWzJupmIe/hqNqGLP1zmJeXMC92co3QbFmFfFqdhWYP9oztqZeCXDzEr
 PmyBg89gPIoTjb4BLh00gqkzpXmRtwEhDt26EM9PmcYBbPSymwg8ZXri8
 g/GFe1OtJtsw6zmYAt0vWl4/XBHYmw3inaZLJ+JBaxt7BAuPSRlCrunb3
 hEQJJkci0UuohdjOn9Sin18oTcMdSEO3ax2D9kyNO3Rf6o4ByJmmX6/ks Q==;
X-CSE-ConnectionGUID: cksGH6ijQP2dHVjOFAC8kg==
X-CSE-MsgGUID: evH9c5pQQxS8RypcrPNi2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70146472"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70146472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:51:52 -0800
X-CSE-ConnectionGUID: y7yHyBvAS96DfbJhHuL0fw==
X-CSE-MsgGUID: +TOzZ6i4TYuXewYfh0XL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206534358"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:51:49 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v10 1/2] lib/igt_device: Add API to get pci device
 upstream port
Date: Wed, 21 Jan 2026 20:27:46 +0530
Message-Id: <20260121145747.1378494-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260121145747.1378494-1-karthik.poosa@intel.com>
References: <20260121145747.1378494-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add API igt_device_get_pci_upstream_port() to get pci device's
upstream port.
This API returns struct pci_device* of the upstream port that is closest
to the root port within the device's hierarchy.

v2: Avoid igt_require in igt_device_get_pci_usp(). (Kamil)

v3: Rename igt_device_get_pci_usp() to
    igt_device_get_pci_upstream_port(). (Kamil)

v4: Use device type from pci express capability of pci config space
    to identify upstream port. (Badal)

v5: Search for upstream port only two levels up of the endpoint as we want
    to verify ASPM only on PCIe link on which GPU card is present.

v6: Add missing spaces and new lines as per coding guidelines. (Kamil)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 lib/igt_device.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device.h |  1 +
 lib/igt_pci.h    |  2 ++
 3 files changed, 46 insertions(+)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index c24f6a58d..c617a98bc 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -32,6 +32,7 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_sysfs.h"
+#include "igt_pci.h"
 
 int __igt_device_set_master(int fd)
 {
@@ -308,3 +309,45 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
 	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
 		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
 }
+
+/**
+ * igt_device_get_pci_upstream_port:
+ * @fd: fd of the GPU endpoint.
+ *
+ * Looks up for the pci device's upstream port using libpciaccess.
+ *
+ * Returns:
+ * The pci_device of upstream port of the device referenced by fd, NULL on any failures.
+ */
+struct pci_device *
+igt_device_get_pci_upstream_port(int fd)
+{
+	struct pci_device *pci_dev = NULL;
+	uint8_t device_type = 0;
+	int offset = 0;
+	int level = 0;
+
+	pci_dev = __igt_device_get_pci_device(fd, 0);
+	if (!pci_dev) {
+		igt_warn("Couldn't get pci device for fd %d\n", fd);
+		return NULL;
+	}
+
+	for (pci_dev = pci_device_get_parent_bridge(pci_dev); (pci_dev && (level < 2));
+	     pci_dev = pci_device_get_parent_bridge(pci_dev), level++) {
+		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus,
+			  pci_dev->dev, pci_dev->func);
+		offset = find_pci_cap_offset(pci_dev, PCI_EXPRESS_CAP_ID);
+		if (offset <= 0) {
+			igt_warn("PCI Express Capability not found\n");
+			return NULL;
+		}
+
+		igt_assert(!pci_device_cfg_read_u8(pci_dev, &device_type,
+						   offset + PCI_DEVICE_TYPE_OFFSET));
+		if ((device_type >> 4) == PCI_DEVICE_TYPE_UPSTREAM_PORT)
+			return pci_dev;
+	}
+
+	return NULL;
+}
diff --git a/lib/igt_device.h b/lib/igt_device.h
index dad7bb047..781a72235 100644
--- a/lib/igt_device.h
+++ b/lib/igt_device.h
@@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
 struct pci_device *igt_device_get_pci_device(int fd);
 struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
 struct pci_device *igt_device_get_pci_root_port(int fd);
+struct pci_device *igt_device_get_pci_upstream_port(int fd);
 
 void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
 #endif /* __IGT_DEVICE_H__ */
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 92b9cc392..84355e9dd 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -20,6 +20,8 @@ enum pci_cap_id {
 	PCI_EXPRESS_CAP_ID = 0x10
 };
 
+#define PCI_DEVICE_TYPE_OFFSET 0x2
+#define PCI_DEVICE_TYPE_UPSTREAM_PORT	0x5
 #define PCI_SLOT_CAP_OFFSET 0x14
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
-- 
2.25.1

