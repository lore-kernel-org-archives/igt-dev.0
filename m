Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA0FCF3186
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 09:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA73B10E5C9;
	Wed, 19 Nov 2025 09:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxgD2+TO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232A910E5C9
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763545928; x=1795081928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3nHkivkbVffUYutIeZZ+QKJ8ykLeEzoeQMx8EeIe6ls=;
 b=QxgD2+TOT57Alr8D3/jHmqeuuxwiNsPMc99R0PeGdr5E2V4rMyExsgaP
 ytLMczYrHifR3WCukPmNrwfF3IjCl0TlXiXv08K/cx+m27+sX5ADG4/R4
 /s/OGBGMA9X5qAg9aAOd6M+xNlV31x4W5C7dUkYIH19CFR+LsupXrWemT
 kxv86edwUfkJ4SYI1tMMPB/fsDtnKLL8SpjpsvmZssW8G2oGQURw+LZce
 EzNW41o3CJyn3HkcEE+02UjZWGYezSGB0c5QfGZ7IJHH1MpBVqnBCJiN0
 FuQWUAkZ5S5o54p6uTLrDwBNG0HFjyP6TUIfPSzb4Aack0F/hK5c5HbbI g==;
X-CSE-ConnectionGUID: W1dcUO3JSCmQogxzRMBruA==
X-CSE-MsgGUID: D47rSEvmSRe0IAg8E7y7sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83207060"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="83207060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:52:08 -0800
X-CSE-ConnectionGUID: vbom0lvFQSa3H65V0un+3Q==
X-CSE-MsgGUID: BfcH0LkrTHi6UB5mZRntWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195954669"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:52:05 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v4 1/2] lib/igt_device: Add API to get pci device
 upstream port
Date: Wed, 19 Nov 2025 15:21:53 +0530
Message-Id: <20251119095154.2501720-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251119095154.2501720-1-karthik.poosa@intel.com>
References: <20251119095154.2501720-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 lib/igt_device.c | 30 ++++++++++++++++++++++++++++++
 lib/igt_device.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index c24f6a58d..7e4175439 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -308,3 +308,33 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
 	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
 		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
 }
+
+/**
+ * igt_device_get_pci_usp:
+ * @fd: fd of the GPU endpoint.
+ *
+ * Looks up for the pci device's upstream port using libpciaccess.
+ *
+ * Returns:
+ * The pci_device of upstream port of the device referenced by fd, NULL on any failures.
+ */
+struct pci_device *
+igt_device_get_pci_usp(int fd)
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
index dad7bb047..7de464c0e 100644
--- a/lib/igt_device.h
+++ b/lib/igt_device.h
@@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
 struct pci_device *igt_device_get_pci_device(int fd);
 struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
 struct pci_device *igt_device_get_pci_root_port(int fd);
+struct pci_device *igt_device_get_pci_usp(int fd);
 
 void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
 #endif /* __IGT_DEVICE_H__ */
-- 
2.25.1

