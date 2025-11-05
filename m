Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA8BCCFA04
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 08:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A0F10E6DD;
	Wed,  5 Nov 2025 08:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S93yR6/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423B810E6DC
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762332284; x=1793868284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WWjRLuBQsadeQRIhLk6g6YKzxNEQiByILrQISoSMFfs=;
 b=S93yR6/m1w1iwgHRWS8twqneIIHwof3H5IGomWyzxAE3qUemJX1XRhyd
 1VktRZhkRVNL1DdcDO6G8O5+4VsjVYOJWk/HemzsAJoBb9fnAn7DULkRj
 N/2nh2KSYPe1iUUIdapLvX1xAGjGW2fvw/Nnz2JfNdc97e2MAAIsmjlpS
 cg/XOuDlCKaXGjUMf0RUtJdIe4MGRpzqlN+Gq+a83BLIleI7G7XRuijtY
 C9rxeOp2vEnKG/HoC2IEn6OQ1dJLYfCumlL/z1CvkZZWZbyX/4N2MbuQ7
 GhO5WEbE0ULUZ8Yx6EJ4G39bl9H4IPvSSRiGKgX6mahhmXpoKH0Y+vMEU Q==;
X-CSE-ConnectionGUID: JvAN9sg3QDKyc7XDLxsJyA==
X-CSE-MsgGUID: UElGQf8jQhy7/dZjxnqBwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67055696"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="67055696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 00:44:44 -0800
X-CSE-ConnectionGUID: XFWBxt4UTCONCmLF5mFbFg==
X-CSE-MsgGUID: rZcyURxISFyaTpFjA/Xjkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="186685301"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 00:44:41 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/igt_device: Add API to get pci device
 upstream port
Date: Wed,  5 Nov 2025 14:14:25 +0530
Message-Id: <20251105084426.601123-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251105084426.601123-1-karthik.poosa@intel.com>
References: <20251105084426.601123-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 lib/igt_device.c | 27 +++++++++++++++++++++++++++
 lib/igt_device.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index c24f6a58d..17b6c578a 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -308,3 +308,30 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
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
+	pci_dev = igt_device_get_pci_device(fd);
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

