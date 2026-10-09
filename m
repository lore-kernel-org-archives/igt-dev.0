Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CD8CA5FED
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 05:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D16410E0FD;
	Fri,  9 Oct 2026 05:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFHPSJD8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997110E0FD
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 05:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791523601; x=1823059601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yDzVrMwTlS9BvdUh2k2UwxOFMgjW1jDuTfUk5ecjzt0=;
 b=aFHPSJD8cbciZQVzF1RTtf5hdx8wC7VggIv2dgTwqA9sPmRy2zSfhVJf
 nCan9QO2D4Fl9aDj5W/SMbVcEp22BAats5Zw63hcynAlMQsv9D4GArcuh
 zZQOq9KZ2BD9XSRLWoofJ07/EElRRWKjwPTjYrvKrp1QLC/LmCTf3KVk0
 D5qT7AmTW7TDQq+Xr4SshiBh03K82GbG2NXVKsqJ0wDYmWV5uoXaRVuJu
 cPXqzJp4fBSkJ35utyYAyLEgYZrfx4uwjDkHh1tQr9oP8+/xH6GKSlc4F
 B20ZIdIDa8U1j8gESPaucXJBe4w8Pq2ekL0PE/jSKZ0vxru3lmKNsJdnh w==;
X-CSE-ConnectionGUID: sD5RfLaDSFa4M+0FYBKt1Q==
X-CSE-MsgGUID: /bCqhvp1S/+V6qACqlSJMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="318186"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="318186"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:26:41 -0700
X-CSE-ConnectionGUID: BdIRbTpYTM+bnR3Re+2UAw==
X-CSE-MsgGUID: WXaPjbigSRCNAyN6RF4SUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2040542"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:26:39 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/7] lib/igt_pm: Add PCI PME capability and D state
 accessors
Date: Fri,  9 Oct 2026 10:56:20 +0530
Message-ID: <20261009052625.419259-3-pranay.samala@intel.com>
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

Add four helpers that read the PCI Power Management capability.

igt_pm_pci_pme_supported() says whether the device can send a PME from a
given D state, by testing one bit of the PME_Support field.
The state matters. Intel graphics devices support PME in D3hot but not in
D3cold.

igt_pm_pci_pme_enabled() reads PME_En, which says whether the device is
armed to send a PME. Its kerneldoc notes that a driver may arm PME from
its own runtime suspend hook rather than leaving it to the PCI/PM core,
and that xe does so subject to device_may_wakeup(), i.e. subject to
power/wakeup.

igt_pm_pci_pme_status() reads PME_Status, which says whether the device has
a PME pending. Because the bit is write-1-to-clear and nothing but software
clears it, a test that expected a wakeup and did not get one can use this
to tell a device that never signalled from one whose signal was never
delivered.

igt_pm_pci_get_d_state() reads the PowerState field. Its kerneldoc points
out that PMCS can only ever report D0-D3hot, and that it cannot be used to
detect D3cold: config space here is reached through sysfs, where
pci_config_pm_runtime_get() resumes a device in D3cold before the read, so
such a device reports D0.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 162 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |   5 ++
 2 files changed, 167 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1e3cc7757..b1f9868eb 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1524,6 +1524,168 @@ bool igt_has_pci_pm_capability(struct pci_device *pci_dev)
 	return (offset > 0);
 }
 
+/*
+ * Read a 16 bit register of the PCI Power Management capability, at @reg_offset
+ * from the start of the capability. Returns false if the device has no PM
+ * capability, the config space read failed, or the device did not respond.
+ *
+ * Config space reads do not resume a device suspended into D3hot, so these are
+ * safe to use while the device is runtime suspended. They are not a way to
+ * observe D3cold though: the read goes through sysfs, where
+ * pci_config_pm_runtime_get() resumes a device in D3cold first, so such a
+ * device answers as D0 rather than dropping off the bus.
+ */
+static bool igt_pm_read_pci_pm_reg(struct pci_device *pci_dev, int reg_offset,
+				   uint16_t *val)
+{
+	int offset;
+
+	offset = find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
+	if (offset <= 0)
+		return false;
+
+	if (pci_device_cfg_read_u16(pci_dev, val, offset + reg_offset))
+		return false;
+
+	/*
+	 * A device that has gone away reads back as all ones, which would
+	 * otherwise decode as a valid register value: PMCS 0xffff means
+	 * PowerState = D3hot with PME_En set. Reject it.
+	 */
+	return *val != 0xffff;
+}
+
+/**
+ * igt_pm_pci_pme_supported:
+ * @pci_dev: PCI device struct
+ * @state: D state to query PME support for
+ *
+ * Reads the PME_Support field (bits [15:11]) of the PCI Power Management
+ * Capabilities (PMC) register and reports whether the device is able to
+ * generate a Power Management Event from @state.
+ *
+ * Note that PME support is per D state: Intel graphics devices typically
+ * advertise PME support in D3hot but not in D3cold, so a state agnostic check
+ * is not sufficient to decide whether PME based signalling can be used.
+ *
+ * Returns: true if the device can generate a PME from @state, false otherwise.
+ */
+bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
+			      enum igt_acpi_d_state state)
+{
+	uint16_t pmc;
+	int bit;
+
+	switch (state) {
+	case IGT_ACPI_D0:
+		bit = 0;
+		break;
+	case IGT_ACPI_D1:
+		bit = 1;
+		break;
+	case IGT_ACPI_D2:
+		bit = 2;
+		break;
+	case IGT_ACPI_D3Hot:
+		bit = 3;
+		break;
+	case IGT_ACPI_D3Cold:
+		bit = 4;
+		break;
+	default:
+		igt_debug("Invalid D state %d for PME support query\n", state);
+		return false;
+	}
+
+	if (!igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMC_OFFSET, &pmc))
+		return false;
+
+	igt_debug("PCI '%04x:%02x:%02x.%01x' PMC = 0x%04x, PME_Support = 0x%02x\n",
+		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, pmc,
+		  (pmc & PCI_PM_PMC_PME_SUPPORT_MASK) >> PCI_PM_PMC_PME_SUPPORT_SHIFT);
+
+	return !!(pmc & (1 << (PCI_PM_PMC_PME_SUPPORT_SHIFT + bit)));
+}
+
+/**
+ * igt_pm_pci_pme_enabled:
+ * @pci_dev: PCI device struct
+ *
+ * Reads PME_En (bit 8) of the PCI Power Management Control/Status (PMCS)
+ * register, i.e. whether the device is armed to generate PMEs.
+ *
+ * The PCI/PM core sets this on suspend if the device can generate a PME from the
+ * state it is suspending into, but a driver may also arm PME itself from its
+ * runtime suspend hook, in which case the driver's own conditions apply. xe does
+ * exactly that, and requires the device_may_wakeup() policy behind power/wakeup,
+ * so on xe this bit follows power/wakeup even for a runtime suspend. See
+ * igt_pm_set_wakeup_enabled().
+ *
+ * Returns: true if the device is armed to generate PMEs, false otherwise.
+ */
+bool igt_pm_pci_pme_enabled(struct pci_device *pci_dev)
+{
+	uint16_t pmcs;
+
+	if (!igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET, &pmcs))
+		return false;
+
+	return !!(pmcs & PCI_PM_PMCS_PME_EN);
+}
+
+/**
+ * igt_pm_pci_pme_status:
+ * @pci_dev: PCI device struct
+ *
+ * Reads PME_Status (bit 15) of the PCI Power Management Control/Status (PMCS)
+ * register, i.e. whether the device has a PME pending.
+ *
+ * The bit is write-1-to-clear and the device does not clear it itself. It stays
+ * set from the moment the device signals a PME until software acknowledges it,
+ * which for a runtime resume is pci_pme_wakeup() on the way back to D0. So
+ * finding it still set on a device that is still suspended means the device did
+ * signal but the platform never delivered the PME, whereas finding it clear
+ * means the device never signalled at all.
+ *
+ * Returns: true if the device has a PME pending, false otherwise.
+ */
+bool igt_pm_pci_pme_status(struct pci_device *pci_dev)
+{
+	uint16_t pmcs;
+
+	if (!igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET, &pmcs))
+		return false;
+
+	return !!(pmcs & PCI_PM_PMCS_PME_STATUS);
+}
+
+/**
+ * igt_pm_pci_get_d_state:
+ * @pci_dev: PCI device struct
+ *
+ * Reads the PowerState field (bits [1:0]) of the PCI Power Management
+ * Control/Status (PMCS) register.
+ *
+ * PMCS can only express D0-D3hot, and it is no help in detecting D3cold either:
+ * a device in D3cold is resumed by the config space read itself and so reports
+ * D0. A runtime suspended device that reports D3hot here is genuinely in D3hot.
+ *
+ * Returns: the D state the device reports, or IGT_ACPI_UNKNOWN_STATE if the
+ * device has no PM capability or the read failed.
+ */
+enum igt_acpi_d_state igt_pm_pci_get_d_state(struct pci_device *pci_dev)
+{
+	static const enum igt_acpi_d_state d_states[] = {
+		IGT_ACPI_D0, IGT_ACPI_D1, IGT_ACPI_D2, IGT_ACPI_D3Hot,
+	};
+	uint16_t pmcs;
+
+	if (!igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET, &pmcs))
+		return IGT_ACPI_UNKNOWN_STATE;
+
+	return d_states[pmcs & PCI_PM_PMCS_PSTATE_MASK];
+}
+
 /**
  * igt_pm_dpms_toggle:
  * @output: igt output for which DPMS toggle has to be performed
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 328875f9c..ccb000998 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -105,6 +105,11 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
+bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
+			      enum igt_acpi_d_state state);
+bool igt_pm_pci_pme_enabled(struct pci_device *pci_dev);
+bool igt_pm_pci_pme_status(struct pci_device *pci_dev);
+enum igt_acpi_d_state igt_pm_pci_get_d_state(struct pci_device *pci_dev);
 void igt_pm_dpms_toggle(igt_output_t *output);
 uint32_t igt_get_dc_counter(const char *dc_data);
 bool igt_support_dc6(int debugfs_fd);
-- 
2.53.0

