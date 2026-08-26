Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E306CC5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 09:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F2D10E275;
	Wed, 26 Aug 2026 09:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwb+5OGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5914A10EC9B
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737976; x=1819273976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GgU3pIDzZ9Mr/YNdJm2T9BlPhb7qL4WYT45Ue59axZQ=;
 b=fwb+5OGHjicFFpxh2cdkqvqJkchHlgnKuBpRBI8HS6e3aXCn6ASlrSlr
 cLKEe4KkZWNR2ltqNc65QKhuAAV4dt9VYBY+Whj9S8LR3hyc56ulzDEc9
 +ShahP+W2oJ20DZkeJoE0YpaQCM6FiZ1n4QUy4Vy89uW1arbL/mVG7aO6
 2WZeR0bCVjUJYWeZKxobv7foBsE5uu9HuCxFhAmi/LmhtnWc2t07NN1ox
 lAxw597aXTNkDlxS/URTB8n53cSGQE3jkPsF6F0epSpa6ySxsjIjEvr8y
 aJJG7hQI06ZlnX8Waql1RHZtej6Y7yYJN2Ws0l4Fpv0e8Hu8azhADl/z9 w==;
X-CSE-ConnectionGUID: XhpBbsrnQzWsMHOsVDWG+w==
X-CSE-MsgGUID: wV/DjqziRJ6kBC5GTJLOZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88344855"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88344855"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:52:56 -0700
X-CSE-ConnectionGUID: Zrh4DRl8TwGnKMespLFtEg==
X-CSE-MsgGUID: 2ZgDksD+S3WhuV0NsGdgaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="292388838"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:52:55 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [RFC 1/7] lib/igt_pci: Add PCI Power Management capability register
 layout
Date: Wed, 26 Aug 2026 15:36:32 +0530
Message-ID: <20260826100639.273731-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826100639.273731-1-pranay.samala@intel.com>
References: <20260826100639.273731-1-pranay.samala@intel.com>
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

