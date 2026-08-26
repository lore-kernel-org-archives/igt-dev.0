Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2595CC5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 09:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8F910E275;
	Wed, 26 Aug 2026 09:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7I9DMz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0446210E275
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737978; x=1819273978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ssEcAfrgYNEqXAP2SXIdT3++0IL2WsQt3xrc6D7RgEg=;
 b=Q7I9DMz8Vhg2ItJ26KTgXy7De+2WgEAK25ruEWUaPcnSodqRiGwI9JDm
 0ZfluXlM5eYNSO3xmWQIVU7t2/dQzHtucwdTFs8hoLjpaDeuCmxA/75x6
 2QVCaftMmsrhbg3/kMwml5xrj2WLY2xj+yBW8F+9DnYXs17Xnch7tMqSF
 +s82iwcqxL6UdsjJY7eFnBPtYCYQ5sqtmTwwJw1SFpRWxLiL75oFn/PNX
 Pn1EVmJIJVNYvpDvkxFgVv5BB+3tdm9AvSMsgUvVH9+U2jnd+W/sgG8FN
 mh8Lxzrmy1yAmzA3Gec7+HfEAMvCF1qhXEku9rbageoC2XcKllYADzsUE A==;
X-CSE-ConnectionGUID: lBUzexxwR8qnkEpKYyxnUw==
X-CSE-MsgGUID: iUaH3LCrQ6W8BlX6Vi0MHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88344860"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88344860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:52:58 -0700
X-CSE-ConnectionGUID: LKIU8e7cQKilQmu2C+V5ow==
X-CSE-MsgGUID: jMhkuLnxRNG7Bj5JNWPaOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="292388847"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:52:56 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [RFC 2/7] lib/igt_pm: Add PCI PME capability and D state accessors
Date: Wed, 26 Aug 2026 15:36:33 +0530
Message-ID: <20260826100639.273731-3-pranay.samala@intel.com>
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

Add four helpers that read the PCI Power Management capability.

igt_pm_pci_pme_supported() says whether the device can send a PME from a
given D state, by testing one bit of the PME_Support field.
The state matters. Intel graphics devices support PME in D3hot but not in
D3cold.

igt_pm_pci_pme_enabled() reads PME_En, which says whether the device is
armed to send a PME. Its kerneldoc notes that the two suspend paths do not
use the same gate. The runtime path arms PME on capability alone.

igt_pm_pci_pme_status() reads PME_Status, which says whether the device has
a PME pending. Because the bit is write-1-to-clear and nothing but software
clears it, a test that expected a wakeup and did not get one can use this
to tell a device that never signalled from one whose signal was never
delivered.

igt_pm_pci_get_d_state() reads the PowerState field. Its kerneldoc points
out that PMCS can only ever report D0-D3hot, since a device in D3cold does
not answer config space reads at all.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 158 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |   5 ++
 2 files changed, 163 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 7905deb8d..559046f71 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1524,6 +1524,164 @@ bool igt_has_pci_pm_capability(struct pci_device *pci_dev)
 	return (offset > 0);
 }
 
+/*
+ * Read a 16 bit register of the PCI Power Management capability, at @reg_offset
+ * from the start of the capability. Returns false if the device has no PM
+ * capability, the config space read failed, or the device did not respond.
+ *
+ * Config space reads do not resume a device suspended into D3hot, so these are
+ * safe to use while the device is runtime suspended.
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
+	 * A device that is gone or in D3cold reads back as all ones, which
+	 * would otherwise decode as a valid register value: PMCS 0xffff means
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
+ * state it is suspending into. Note that the gate differs between the two
+ * suspend paths: pci_finish_runtime_suspend() arms PME based on
+ * pci_dev_run_wake() and device_can_wakeup(), which are capability checks,
+ * whereas the system suspend path also requires the device_may_wakeup() policy
+ * behind power/wakeup. A runtime suspended device can therefore be armed for PME
+ * even with power/wakeup disabled.
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
+ * Control/Status (PMCS) register. Note that PMCS can only express D0-D3hot;
+ * a device in D3cold is not reachable over config space at all, so use
+ * igt_pm_get_acpi_real_d_state() to distinguish D3hot from D3cold.
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
index cd9dceb1e..2784e97be 100644
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

