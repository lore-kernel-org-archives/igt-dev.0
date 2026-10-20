Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142C606A32A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n3wylPNr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942E610E270;
	Tue, 20 Oct 2026 14:14:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB8F10F1A7
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792505530; x=1824041530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zulkY+PkDtRptHCgax2xbNF2AzZZCfjFFSLic/s1dno=;
 b=n3wylPNrFXEliE8uQ0MyUxSRHvCGyMizcd/mGQ8jeed8M2zvbfSqv8Rj
 NLt4yXUe+M4UajPppy+cR0gajgXuDpDNF4pDIFX0cUDia1nICvz9LNyNj
 Z3I8jXGvFHRd9TOEEJp7g1McTj64EBu7cHY4LiWgs/O0h2qML3Z3vvJqC
 Q3sDdrGVDfO2Y5jMy6i5rPFY4soo+FJGRHDxcLi68HFyg+xKGWpSC44Vn
 1P15ypAcW4I46YHkrg9WAHzsBfa2WoSevzbHMnSsEsx2E1h5Hn/a84F2p
 hhtobjSYHUVzk+jKpAEGkL/SEg5EaYl5lzRCjZMJvtvneAR1hEUHQNuqk A==;
X-CSE-ConnectionGUID: 9tmu+Sz9QoOEVXIZbe6X9A==
X-CSE-MsgGUID: vV24Ga8bQRKURzeGBfxd/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309578"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1309578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:09 -0700
X-CSE-ConnectionGUID: rr3Z6Q+nTR6cWNAqCCiJFA==
X-CSE-MsgGUID: FtRejk6LSBax1eJsoFXETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2775752"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:08 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 5/7] lib/igt_pm: Add power/wakeup_active_count
 accessor
Date: Tue, 20 Oct 2026 19:41:49 +0530
Message-ID: <20261020141151.753331-6-pranay.samala@intel.com>
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

Add igt_pm_get_wakeup_active_count(), the number of times the device's
wakeup source was activated.

Every PCI PME delivery route ends in pci_wakeup_event(), which bumps
this count: the native PCIe PME interrupt, an ACPI GPE, and the PCI
core PME poll (pci_pme_list_scan(), every 1s), which is the likely
route for an integrated GPU without a GPE. An increment across a
suspended window therefore means the device woke itself with a PME,
rather than the host waking it.

power/wakeup_count does not work for this, as it only moves during
system suspend, and neither does PME_Status, which the PCI core clears
while handling the wakeup.

The count is unavailable while power/wakeup is disabled. Since 0 is a
valid count, return -1 then, so callers can tell "no wakeup source"
from "no PME".

v3:
- Mention the PCI core PME poll route, and correct the PCIe route, which
  is pcie_pme_handle_request() rather than pci_pme_wakeup() (Kunal)
- Return int64_t, -1 when there is no wakeup source, instead of 0 (Kunal)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1173b2b68..f4d5d5c7b 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1498,6 +1498,35 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 	return usage;
 }
 
+/*
+ * Read an unsigned power attribute of @pci_dev, returning -1 if the attribute
+ * does not exist or does not hold a number.
+ *
+ * The latter is not hypothetical: the wakeup counters exist for every wakeup
+ * capable device, but the PM core emits a bare newline for them while the
+ * device has no wakeup source, i.e. while power/wakeup is disabled. Since 0 is
+ * a valid count, that case has to be told apart from it.
+ */
+static int64_t igt_pm_read_power_attr_u64(struct pci_device *pci_dev,
+					  const char *attr)
+{
+	char buf[64];
+	int64_t val;
+	int fd;
+
+	fd = __igt_pm_get_power_attr_fd(pci_dev, attr, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	if (!igt_pm_read_power_attr(fd, buf, sizeof(buf), false) ||
+	    sscanf(buf, "%" SCNd64, &val) != 1 || val < 0)
+		val = -1;
+
+	close(fd);
+
+	return val;
+}
+
 #define IGT_PM_WAKEUP_ENABLED_STR "enabled\n"
 #define IGT_PM_WAKEUP_DISABLED_STR "disabled\n"
 
@@ -1638,6 +1667,30 @@ void igt_pm_restore_wakeup(void)
 	__igt_pm_wakeup.pci_dev = NULL;
 }
 
+/**
+ * igt_pm_get_wakeup_active_count:
+ * @pci_dev: PCI device struct
+ *
+ * Reads power/wakeup_active_count, the number of times the device's wakeup
+ * source was activated. An increment across a runtime suspended window means
+ * the resume was signalled by the device, i.e. a PME arrived, rather than
+ * initiated by something host side such as HPD polling.
+ *
+ * Use this and not power/wakeup_count, which is only incremented under
+ * events_check_enabled and so never moves for a runtime resume.
+ *
+ * The count only exists while the device has a wakeup source, i.e. while
+ * power/wakeup is enabled, and restarts from 0 each time one is created. See
+ * igt_pm_set_wakeup_enabled().
+ *
+ * Return: the wakeup active count, or -1 if the device is not wakeup capable,
+ * has power/wakeup disabled, or the count could not be read.
+ */
+int64_t igt_pm_get_wakeup_active_count(struct pci_device *pci_dev)
+{
+	return igt_pm_read_power_attr_u64(pci_dev, "wakeup_active_count");
+}
+
 /**
  * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index c3facbd69..3d857080a 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -106,6 +106,7 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 bool igt_pm_has_wakeup_support(struct pci_device *pci_dev);
 void igt_pm_set_wakeup_enabled(struct pci_device *pci_dev, bool enable);
 void igt_pm_restore_wakeup(void);
+int64_t igt_pm_get_wakeup_active_count(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
 bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
-- 
2.53.0

