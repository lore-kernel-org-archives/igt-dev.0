Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB45DD3B9A9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7092910E6D8;
	Wed, 10 Dec 2025 10:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgmwwOu2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CA610E6D8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765363461; x=1796899461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u4gGqsyvTLTt/9/QILCnxey8GL++/+RS6yC38soypXE=;
 b=ZgmwwOu2M8rinO7KsI5WyJ1Gnja2I8Ju1+ycL2+3g+Cb3BF0L2GDW8js
 c2/4BrxhXOrD1WntZ4Ui7zay7oFG+LOU4sniLjT6PQQQnaCZotEM51zqZ
 UQHthUHQs2XMsmeml8Z28fNf/JaBkeFXmeoz8AH+S03KHLQ7DwbA+D5IY
 O2MVn/ovvYQFYJGQGnHMHuhbmBsWJsSO07JKqggG5ey3s3FzUJQcSutxS
 QrCecZziT3K0+schxaTTuOm3XdCcePJJEkvpBda8CPWln1TKHrZL0ieTw
 JsCNZR+pO6GIJCVOzAx3yFY6KSz4Cd0JuNom5qF1azxaBtQwmtp9zyAiW Q==;
X-CSE-ConnectionGUID: IEpORN0fQT2OqEwG6aIXvw==
X-CSE-MsgGUID: Nao9rqLjTP2EtVAKzPEeIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84742815"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="84742815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:44:21 -0800
X-CSE-ConnectionGUID: 05KNoZc/QjSm2FGqiv9+xg==
X-CSE-MsgGUID: IgY0H6X8TxaC2sbYg76NiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="201598232"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:44:17 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v6 1/2] lib/igt_device: Add API to get pci device
 upstream port
Date: Wed, 10 Dec 2025 16:13:59 +0530
Message-Id: <20251210104400.4141969-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251210104400.4141969-1-karthik.poosa@intel.com>
References: <20251210104400.4141969-1-karthik.poosa@intel.com>
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

