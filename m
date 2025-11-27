Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0953D111A8
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 15:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BF210E109;
	Thu, 27 Nov 2025 15:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex0APbV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C4210E819
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764258505; x=1795794505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u4gGqsyvTLTt/9/QILCnxey8GL++/+RS6yC38soypXE=;
 b=Ex0APbV80GwjBcjTIxbfb9L1JW/tjZRXcLHCWiVXw15COl3WYi5KM9ll
 BX4fQfvbSiX+FgzPTpseDWKNVFcm5JZBtTBzang7wk9kxeflI1jUX3Qot
 QyXSRE+oK0U+Rnc6Y4WfNQi7FNU4/89al0pOtKqiiYS4RU0+JjLg/71HX
 6Qg9iBOU9P8qZCGxlx63oCEnM2ezmxph4aeVx1aEWWKrQf0njERG91gnP
 udnxW2JkUBlJgeSQrumMAGIoKZSNydt8q3pb9Cjsf2lCLbeYwoPXcwsAk
 IS/F7ffoFfgosSDa6+guwmLVNekmxdImvxCgjxrDF4YjOEbfj+lOkzbsU Q==;
X-CSE-ConnectionGUID: +gLIzW+TSfiSgdakMyd0Jg==
X-CSE-MsgGUID: zqDhb24RSTmQ50SyVvFsAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66345769"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66345769"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 07:48:25 -0800
X-CSE-ConnectionGUID: gN5omdCNT66yG6nakYC5qw==
X-CSE-MsgGUID: O4nl33CxSDqBfVrKQiAJwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="216618384"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 07:48:22 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v5 1/2] lib/igt_device: Add API to get pci device
 upstream port
Date: Thu, 27 Nov 2025 21:18:06 +0530
Message-Id: <20251127154807.2899369-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251127154807.2899369-1-karthik.poosa@intel.com>
References: <20251127154807.2899369-1-karthik.poosa@intel.com>
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

Add API igt_device_get_pci_usp() to get pci device's upstream port.
This API returns struct pci_device* of the upstream port that is closest
to the root port within the device's hierarchy.

v2: Avoid igt_require in igt_device_get_pci_usp(). (Kamil)

v3: Rename igt_device_get_pci_usp() to igt_device_get_pci_upstream_port(). (Kamil)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device.c | 30 ++++++++++++++++++++++++++++++
 lib/igt_device.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index c24f6a58d..f46af746e 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -308,3 +308,33 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
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
+	struct pci_device *pci_dev, *prev = NULL, *parent;
+
+	pci_dev = __igt_device_get_pci_device(fd, 0);
+	if(!pci_dev)
+		return NULL;
+
+	parent = pci_device_get_parent_bridge(pci_dev);
+	while (parent) {
+		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+		igt_debug("PCI device parent %04x:%02x:%02x.%01x\n", parent->domain, parent->bus, parent->dev, parent->func);
+		prev = pci_dev;
+		pci_dev = parent;
+		parent = pci_device_get_parent_bridge(pci_dev);
+	}
+
+	return prev;
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
-- 
2.25.1

