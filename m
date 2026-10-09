Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571C2CA5FED
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 05:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D660410E0FD;
	Fri,  9 Oct 2026 05:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+Hvh31W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600510E0FD
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 05:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791523599; x=1823059599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GgU3pIDzZ9Mr/YNdJm2T9BlPhb7qL4WYT45Ue59axZQ=;
 b=j+Hvh31WDa/KfyXRZelZ272aqdS0XAX11c0ALpsTVaCJAnaOa1tfL00/
 Fy+GAkUybatGDMJ0LRvYC9uueEUzrP1d7ujpY83Hh0rjfDK/bEPeUgobl
 Ac+H75tphcFxQeYpy7RS1nTwNZDISeSF4Eb46g0a1PPpFl6TFxyTMIgJP
 WAqgt7gak7oDQNa9Y/mgM56UAJskeDPrETZXDUkREHpSXu3ghNDIHFkJr
 VvacrMf9jCwwGqO/xLf22CtdaafkgohZlw7jn0a1RJLMfVerwYHVQqVzj
 ILODeSaot/iSaKVACVPZuPOkDXQAJdOYDTdL27jxSfbeCjYDMXbQkykLM w==;
X-CSE-ConnectionGUID: mZ0BHr2pRx27AG+J/rU18A==
X-CSE-MsgGUID: rpAfTGgTT9qwq4KFqHjS2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="318185"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="318185"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:26:39 -0700
X-CSE-ConnectionGUID: t6KnRIs3R3aQrA1dBexDnw==
X-CSE-MsgGUID: CUBF2y8qSxm8eEei44GKcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2040525"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:26:37 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 1/7] lib/igt_pci: Add PCI Power Management capability
 register layout
Date: Fri,  9 Oct 2026 10:56:19 +0530
Message-ID: <20261009052625.419259-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009052625.419259-1-pranay.samala@intel.com>
References: <20261009052625.419259-1-pranay.samala@intel.com>
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

Add the register offsets and field masks of the PCI Power Management
capability. Two registers are needed.

PMC (PM Capabilities) holds the PME_Support field, which says what D states
the device can send a PME from.

PMCS (PM Control/Status) holds the PowerState field, the PME_En bit and the
PME_Status bit, which say what D state the device is in, whether it is
armed to send a PME, and whether it has one pending. PME_Status is
write-1-to-clear and stays set until someone acknowledges the PME, so it
distinguishes a device that never signalled from one whose signal was never
delivered.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 509345b2d..ae612d611 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -26,6 +26,18 @@ enum pci_cap_id {
 #define PCI_SLOT_CAP_OFFSET 0x14
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
+/*
+ * PCI Power Management capability registers, at the given offsets from the
+ * start of the PM capability as returned by find_pci_cap_offset().
+ */
+#define PCI_PM_PMC_OFFSET 0x2			/* PM Capabilities */
+#define  PCI_PM_PMC_PME_SUPPORT_SHIFT 11	/* PME_Support, bits [15:11] */
+#define  PCI_PM_PMC_PME_SUPPORT_MASK (0x1f << PCI_PM_PMC_PME_SUPPORT_SHIFT)
+#define PCI_PM_PMCS_OFFSET 0x4			/* PM Control/Status */
+#define  PCI_PM_PMCS_PSTATE_MASK 0x3		/* PowerState, bits [1:0] */
+#define  PCI_PM_PMCS_PME_EN (1 << 8)		/* PME_En */
+#define  PCI_PM_PMCS_PME_STATUS (1 << 15)	/* PME_Status, write 1 to clear */
+
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
 int igt_pci_device_unbind(const char *pci_slot);
 int igt_pci_driver_bind(const char *driver, const char *pci_slot);
-- 
2.53.0

