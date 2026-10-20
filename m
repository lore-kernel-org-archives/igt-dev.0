Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B837606A328
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PWwJdkbV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0006310E270;
	Tue, 20 Oct 2026 14:16:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2609910F1A7
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792505523; x=1824041523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0lnWJf2f+PFkYihGFIk4yEd4cwOjdsQz4KGKaBhASqA=;
 b=PWwJdkbVh2FK5tXwp5+v/EUCcFq4MZOkgdF+F6tIjrg2acS8pSSUO8Di
 NvllzRotBOHZgYcQcBY+TssZEEAviBSuGNR40nCd9ERA777K2vVu3vk+G
 tNgfwNn7VuG40rlePImgX8XAwJ6wDVdLjaTnLgj9iQJsYfZRuTM8xkKRU
 a/Gj3SUFfYLkxpX2EZJ6cjeP6+3Kjy0uKzRS2oVzetPMr0KPlyYmkb5vv
 IsQCIrDIjlJov9o+hiMvoWmM/JyTDIi+k1ZQP9RTapd8Ha6MJCmTWENGK
 Q/W/Cgru2Li2QL26Ugh1xdI59SVvS1z6FI4LZ0O91ESPQGu9Re8cYZ1zY Q==;
X-CSE-ConnectionGUID: TmSlSeh5QHqT6h5V4E5RbQ==
X-CSE-MsgGUID: rsVaZ8W1S66czXFLOweLCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309541"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1309541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:03 -0700
X-CSE-ConnectionGUID: fV8oDfPCS1WVfroDpCyltA==
X-CSE-MsgGUID: 0A81twSNRzizWfd61XzqIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2775712"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:02 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/7] lib/igt_pci: Add PCI Power Management capability
 register layout
Date: Tue, 20 Oct 2026 19:41:45 +0530
Message-ID: <20261020141151.753331-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020141151.753331-1-pranay.samala@intel.com>
References: <20261020141151.753331-1-pranay.samala@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
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

