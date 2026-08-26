Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABE7C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 09:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8E010E275;
	Wed, 26 Aug 2026 09:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Msem4lcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E984B10E275
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737983; x=1819273983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=roJqpnmKJuyxNd06diblf3a2NIZmAyq3spw6kzu9Zz0=;
 b=Msem4lcl1WfYsIHCNXvKWeltRM8I9DVFjYNdG8gkjDmI673luHpatnno
 r8/DP0kqYdtHlJDO3iUJXR7HxJJ1cJhQZvXF7MfstC2E9VonSbjEEuNLn
 ikCn/jPqIXcUmKfoxV9/A4a426eoTpFVDLst5kChjlo429AUCyDfyu5SU
 QcunzSBdBeFnRZ+Crw4i+6PZRB1yo/gJrWteKGe2iePK8TUyzs2acClVM
 DKb505EF+EeeRPCN8YPCg5drnF6CnzhvSqJahEFac/3Rg2KHdFiOzcAXq
 bVywXhOu8PY5h5gmrZRhIBa35hsCytEEoksnoEhBkiimfAEH4RZ6fX2zn w==;
X-CSE-ConnectionGUID: p7E3mXPMTd2mXzUsT+sKPw==
X-CSE-MsgGUID: fHjPamQQRn63RTSkkF1szw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88344873"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88344873"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:53:03 -0700
X-CSE-ConnectionGUID: XaZVTwlSTBSi2MxZlQNYOw==
X-CSE-MsgGUID: OTNvPORYT/GbHeHkYxf1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="292388889"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:53:01 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [RFC 5/7] lib/igt_pm: Add power/wakeup_active_count accessor
Date: Wed, 26 Aug 2026 15:36:36 +0530
Message-ID: <20260826100639.273731-6-pranay.samala@intel.com>
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

Add igt_pm_get_wakeup_active_count(), which reads how many times the
device's wakeup source has been activated.

wakeup_source_activate() bumps this unconditionally, so it counts runtime
resumes too, on both the PCIe (pci_pme_wakeup()) and ACPI GPE
(pci_acpi_wake_dev()) delivery routes. An increment across a suspended
window therefore means the device signalled the resume itself, i.e. a PME
arrived, rather than the host waking it.

Neither alternative works: power/wakeup_count only moves under
events_check_enabled, which the PM core sets for system suspend and
hibernate, and PME_Status is cleared by the PCI/PM core as it handles the
wakeup, so it cannot be sampled afterwards.

Parsing uses a checked sscanf() rather than an asserted one, since the
counter reads back as a bare newline when the device has no wakeup source,
that is when power/wakeup is disabled. That has to give 0, not a failure.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 49 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 748b3f86d..4296169f3 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1498,6 +1498,34 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 	return usage;
 }
 
+/*
+ * Read an unsigned power attribute of @pci_dev, returning 0 if the attribute
+ * does not exist or does not hold a number.
+ *
+ * The latter is not hypothetical: the wakeup counters exist for every wakeup
+ * capable device, but the PM core emits a bare newline for them while the
+ * device has no wakeup source, i.e. while power/wakeup is disabled.
+ */
+static uint64_t igt_pm_read_power_attr_u64(struct pci_device *pci_dev,
+					   const char *attr)
+{
+	char buf[64];
+	uint64_t val;
+	int fd;
+
+	fd = __igt_pm_get_power_attr_fd(pci_dev, attr, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	if (!igt_pm_read_power_attr(fd, buf, sizeof(buf), false) ||
+	    sscanf(buf, "%" SCNu64, &val) != 1)
+		val = 0;
+
+	close(fd);
+
+	return val;
+}
+
 #define IGT_PM_WAKEUP_ENABLED_STR "enabled\n"
 #define IGT_PM_WAKEUP_DISABLED_STR "disabled\n"
 
@@ -1627,6 +1655,26 @@ void igt_pm_restore_wakeup(void)
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
+ * Return: the wakeup active count, or 0 if the device is not wakeup capable or
+ * has power/wakeup disabled.
+ */
+uint64_t igt_pm_get_wakeup_active_count(struct pci_device *pci_dev)
+{
+	return igt_pm_read_power_attr_u64(pci_dev, "wakeup_active_count");
+}
+
 /**
  * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 12617c2ef..eba54efa2 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -106,6 +106,7 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 bool igt_pm_has_wakeup_support(struct pci_device *pci_dev);
 void igt_pm_set_wakeup_enabled(struct pci_device *pci_dev, bool enable);
 void igt_pm_restore_wakeup(void);
+uint64_t igt_pm_get_wakeup_active_count(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
 bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
-- 
2.53.0

