Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E05CDC19C
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 13:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072D510E507;
	Tue,  6 Jan 2026 13:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzFg2vGQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DF810E507
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767707153; x=1799243153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F+93XkvV7Kp7IFRoJlHGeNO9mxXWx++YLB/Je2Fgtp0=;
 b=KzFg2vGQR14NDu4giEloWRD3TsxSiR8otuhBexSX5n6GLtCNlCnEY0vp
 OxF7u/0rUvdYSp6SPb64b5Ych9rdWWp7qotld9S5xRnQFM/0KSbrR04nr
 MBdpIMK2cDP9FySr3wQDURM/yZAxxhMUAm089reNBOpPV7KAWHEelEBOl
 2RDnfOc4ku9btPTfiIPyAd1/SBRjKrm5dvZ25G3+89ckuSptJRfTWxs2w
 WZTnTLSK+v9KBURqM6y2sT/a8/dZhxWevoW2rdYUcwmQFAiIgQLmtzbd/
 FmkbcgDIS040SdgC5Q7O4Al/30ZaAZi9kqMDUo1PT+33McTBXIUgl+aN+ w==;
X-CSE-ConnectionGUID: OkmkVWMPQYy9XZI9wuHhEg==
X-CSE-MsgGUID: +dE/qOAURq6FpUlSaSUtLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72916802"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="72916802"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 05:45:52 -0800
X-CSE-ConnectionGUID: V27NhsriSB6El7dr3tjeQQ==
X-CSE-MsgGUID: t50dxAOiT4S9V9lN5QTTVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202277955"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 05:45:50 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v10 1/2] lib/igt_device: Add API to get pci device
 upstream port
Date: Tue,  6 Jan 2026 19:21:53 +0530
Message-Id: <20260106135154.33722-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260106135154.33722-1-karthik.poosa@intel.com>
References: <20260106135154.33722-1-karthik.poosa@intel.com>
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

