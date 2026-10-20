Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74C60A4AFE
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ih0Cfqa6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BF010EBD0;
	Tue, 20 Oct 2026 14:17:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F5F10F243
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792505525; x=1824041525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=//YKG03XJT9FQH5bqmLdYLLrDWDdXhy8or8fdHKI7G8=;
 b=ih0Cfqa6/QzsBIVsRefdINL65+YmeiAhclHpCqcPaRZ/H/a09GtQZ77g
 TfIeaHZKX3GcRGzwJg2Ea0q5GbXQrIzYnjLnW43lWTwCTtuabwWi8dA7H
 1hRbXr11bC7SHQi8fD/HWLyqHgCOakP9ANsC+lUncPpfB6UqPGk70DF5s
 BZIicbsTmNVaBfxwUOGor1PQk+4UlKm2BjO/VOvF4NiqZP+rIDZ5aB20i
 GUSZbrFyKue72nILR+kdflJ1iNUmXzPbHfoc4Z1Rial+KjIIhXNxFaHBq
 C+NMP8yWqx+IQSUPrEoOGnJJxU/ooFJo3i58XQ/jQEK9TOGiYVQ5RCmNm w==;
X-CSE-ConnectionGUID: 9V/Uy+9gTRqwrxbctTNHhQ==
X-CSE-MsgGUID: LGW/rdKHSmuQfvpepE8EqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309548"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1309548"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:05 -0700
X-CSE-ConnectionGUID: Ozu29P3pRaKtjNowEFIq9w==
X-CSE-MsgGUID: EWShNxErSuCFtiHwQTb/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2775724"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:04 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/7] lib/igt_pm: Add PCI PME capability and D state
 accessors
Date: Tue, 20 Oct 2026 19:41:46 +0530
Message-ID: <20261020141151.753331-3-pranay.samala@intel.com>
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

Add helpers that read the PCI Power Management capability:

- igt_pm_pci_pme_supported(): whether PME_Support allows a PME from a
  given D state. Support is per state, e.g. D3hot but not D3cold.
- igt_pm_pci_pme_enabled(): PME_En, whether the device is armed.
- igt_pm_pci_pme_status(): PME_Status, whether a PME is pending. It is
  write-1-to-clear, so it tells a device that never signalled from one
  whose PME was never delivered.
- igt_pm_pci_get_d_state(): the PowerState field.

Config space is read through sysfs, which resumes a device in D3cold
before the read. So the helpers check power_state first and, if it
reports D3cold, skip config space and igt_pm_pci_get_d_state() returns
D3cold.

pme_enabled() and pme_status() return a negative error code if the
register cannot be read, so a failed read is not mistaken for a clear
bit.

v3:
- Check power_state before touching config space, to avoid resuming a
  D3cold device, and report D3cold from it (Kunal)
- Keep the kerneldoc generic, drop the Intel and xe specific notes (Kunal)
- Return an error from pme_enabled/pme_status on read failure, and
  igt_debug() the failure (Kunal)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 233 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |   5 ++
 2 files changed, 238 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1e3cc7757..688bcd7d2 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1524,6 +1524,239 @@ bool igt_has_pci_pm_capability(struct pci_device *pci_dev)
 	return (offset > 0);
 }
 
+/*
+ * Read the kernel's view of the device's D state from the power_state sysfs
+ * attribute. Unlike a config space read this has no runtime PM side effects,
+ * so it is safe to use on a device in D3cold.
+ */
+static enum igt_acpi_d_state igt_pm_pci_get_power_state(struct pci_device *pci_dev)
+{
+	char name[PATH_MAX];
+	char d_state[16];
+	int fd, n_read;
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power_state",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	fd = open(name, O_RDONLY);
+	if (fd < 0)
+		return IGT_ACPI_UNKNOWN_STATE;
+
+	n_read = read(fd, d_state, sizeof(d_state) - 1);
+	close(fd);
+	if (n_read <= 0)
+		return IGT_ACPI_UNKNOWN_STATE;
+
+	d_state[n_read] = '\0';
+	d_state[strcspn(d_state, "\n")] = '\0';
+
+	if (!strcmp(d_state, "D0"))
+		return IGT_ACPI_D0;
+	if (!strcmp(d_state, "D1"))
+		return IGT_ACPI_D1;
+	if (!strcmp(d_state, "D2"))
+		return IGT_ACPI_D2;
+	if (!strcmp(d_state, "D3hot"))
+		return IGT_ACPI_D3Hot;
+	if (!strcmp(d_state, "D3cold"))
+		return IGT_ACPI_D3Cold;
+
+	return IGT_ACPI_UNKNOWN_STATE;
+}
+
+/*
+ * Read a 16 bit register of the PCI Power Management capability, at @reg_offset
+ * from the start of the capability.
+ *
+ * Config space is read through sysfs, where pci_config_pm_runtime_get() resumes
+ * a device in D3cold before the access. To avoid waking the device being
+ * inspected, refuse with -EBUSY if the kernel reports it in D3cold. A device in
+ * D3hot is not resumed, so the registers can be read while it stays suspended.
+ *
+ * Returns: 0 on success, -EBUSY if the device is in D3cold, -ENODEV if it has no
+ * PM capability or did not respond, or -EIO if the config space read failed.
+ */
+static int igt_pm_read_pci_pm_reg(struct pci_device *pci_dev, int reg_offset,
+				  uint16_t *val)
+{
+	int offset;
+
+	if (igt_pm_pci_get_power_state(pci_dev) == IGT_ACPI_D3Cold) {
+		igt_debug("PCI '%04x:%02x:%02x.%01x' is in D3cold, not reading config space\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+		return -EBUSY;
+	}
+
+	offset = find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
+	if (offset <= 0) {
+		igt_debug("PCI '%04x:%02x:%02x.%01x' PM capability %s\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func,
+			  offset ? "lookup failed" : "not present");
+		return offset ? -EIO : -ENODEV;
+	}
+
+	if (pci_device_cfg_read_u16(pci_dev, val, offset + reg_offset)) {
+		igt_debug("PCI '%04x:%02x:%02x.%01x' config read at 0x%x failed\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func,
+			  offset + reg_offset);
+		return -EIO;
+	}
+
+	/*
+	 * A device that has gone away reads back as all ones, which would
+	 * otherwise decode as a valid register value: PMCS 0xffff means
+	 * PowerState = D3hot with PME_En set. Reject it.
+	 */
+	if (*val == 0xffff) {
+		igt_debug("PCI '%04x:%02x:%02x.%01x' config read at 0x%x returned all ones\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func,
+			  offset + reg_offset);
+		return -ENODEV;
+	}
+
+	return 0;
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
+ * PME support is advertised per D state, so a device may be able to signal from
+ * D3hot but not from D3cold. Query the state the device is expected to suspend
+ * into.
+ *
+ * Returns: true if the device can generate a PME from @state, false if it cannot
+ * or the register could not be read.
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
+	if (igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMC_OFFSET, &pmc))
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
+ * own suspend hook, in which case the driver's own conditions apply.
+ *
+ * Returns: 1 if the device is armed to generate PMEs, 0 if it is not, or a
+ * negative error code if the register could not be read.
+ */
+int igt_pm_pci_pme_enabled(struct pci_device *pci_dev)
+{
+	uint16_t pmcs;
+	int ret;
+
+	ret = igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET, &pmcs);
+	if (ret)
+		return ret;
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
+ * which the PCI/PM core does when it handles the PME. So finding it still set
+ * on a device that is still suspended means the device did signal but the
+ * platform never delivered the PME, whereas finding it clear means the device
+ * never signalled at all.
+ *
+ * Returns: 1 if the device has a PME pending, 0 if it does not, or a negative
+ * error code if the register could not be read.
+ */
+int igt_pm_pci_pme_status(struct pci_device *pci_dev)
+{
+	uint16_t pmcs;
+	int ret;
+
+	ret = igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET, &pmcs);
+	if (ret)
+		return ret;
+
+	return !!(pmcs & PCI_PM_PMCS_PME_STATUS);
+}
+
+/**
+ * igt_pm_pci_get_d_state:
+ * @pci_dev: PCI device struct
+ *
+ * Reads the PowerState field (bits [1:0]) of the PCI Power Management
+ * Control/Status (PMCS) register, i.e. the D state as reported by the device.
+ *
+ * PMCS can only express D0-D3hot, and a device in D3cold cannot answer config
+ * space reads at all. So if the kernel's power_state attribute reports D3cold,
+ * that is returned instead, without touching config space and so without
+ * resuming the device.
+ *
+ * Returns: the D state of the device, or IGT_ACPI_UNKNOWN_STATE if the device
+ * has no PM capability or the read failed.
+ */
+enum igt_acpi_d_state igt_pm_pci_get_d_state(struct pci_device *pci_dev)
+{
+	static const enum igt_acpi_d_state d_states[] = {
+		IGT_ACPI_D0, IGT_ACPI_D1, IGT_ACPI_D2, IGT_ACPI_D3Hot,
+	};
+	uint16_t pmcs;
+	int ret;
+
+	ret = igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET, &pmcs);
+	if (ret == -EBUSY)
+		return IGT_ACPI_D3Cold;
+	if (ret)
+		return IGT_ACPI_UNKNOWN_STATE;
+
+	return d_states[pmcs & PCI_PM_PMCS_PSTATE_MASK];
+}
+
 /**
  * igt_pm_dpms_toggle:
  * @output: igt output for which DPMS toggle has to be performed
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 328875f9c..861741b89 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -105,6 +105,11 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
+bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
+			      enum igt_acpi_d_state state);
+int igt_pm_pci_pme_enabled(struct pci_device *pci_dev);
+int igt_pm_pci_pme_status(struct pci_device *pci_dev);
+enum igt_acpi_d_state igt_pm_pci_get_d_state(struct pci_device *pci_dev);
 void igt_pm_dpms_toggle(igt_output_t *output);
 uint32_t igt_get_dc_counter(const char *dc_data);
 bool igt_support_dc6(int debugfs_fd);
-- 
2.53.0

