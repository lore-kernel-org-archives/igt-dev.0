Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA33DCA5FED
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 05:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BA810E0FD;
	Fri,  9 Oct 2026 05:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HS5oD+JU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFC210E0FD
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791523605; x=1823059605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZQCfp2jGj1wIVynlEvshPu/4LJHQKZWtn4pU+CvNhUo=;
 b=HS5oD+JUyzM+Qp90JHWGNdCFDTNc8cx/PX1QJXpSg3txPIxKIvWZ6pOA
 w6bmYPfP0C2/7wU4zwwctacInkU/6+VkAVFmtYGcwIugivSXFb4nmapAk
 VW9APKXnIWWxbM95E9/RbGhXLphzgCPnB8RXhZgZAuqEHCwyk6h5HQ1bi
 9R2iYtpd5RZjFse3xnkIIq0731+2Mai6qGxAEL8BpOM1QSg0y1ZO3m8fS
 H7uCEHdqB/fOvoVIUGCnJl7MHFJY6rQ8Pi0FAfZGPqijeB6RP39lDhJ25
 IV29bdgw3kS/B9tEULOjObZIZ0NCAcxX7iE3oWuAmHHDjKlyjz+km2cml w==;
X-CSE-ConnectionGUID: DeV5OJTASaOurAMt4BGfdg==
X-CSE-MsgGUID: cSPwiDJNRbGTnodrWJjeow==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="318191"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="318191"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:26:44 -0700
X-CSE-ConnectionGUID: a8lEqIEBT1S4LiagBAKUJA==
X-CSE-MsgGUID: IZguRhetRdiPp2sXoDwZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2040575"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:26:42 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 4/7] lib/igt_pm: Add power/wakeup accessors
Date: Fri,  9 Oct 2026 10:56:22 +0530
Message-ID: <20261009052625.419259-5-pranay.samala@intel.com>
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

Add PCI power/wakeup accessors for igt_pm:

igt_pm_has_wakeup_support()
igt_pm_set_wakeup_enabled()
igt_pm_restore_wakeup()

These helpers expose whether the device supports wakeup accounting and allow
tests to enable/restore the power/wakeup sysfs attribute. This is needed for
PME-based HPD tests, where both device wakeup support and the PM wakeup source
must be enabled.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 133 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |   3 ++
 2 files changed, 136 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 7ad56fbce..b8b66e120 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1498,6 +1498,139 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 	return usage;
 }
 
+#define IGT_PM_WAKEUP_ENABLED_STR "enabled\n"
+#define IGT_PM_WAKEUP_DISABLED_STR "disabled\n"
+
+static struct {
+	struct pci_device *pci_dev;
+	bool orig_enabled;
+} __igt_pm_wakeup;
+
+static void __igt_pm_wakeup_exit_handler(int sig)
+{
+	igt_pm_restore_wakeup();
+}
+
+/**
+ * igt_pm_has_wakeup_support:
+ * @pci_dev: PCI device struct
+ *
+ * The power/wakeup* sysfs attributes only exist for devices the PM core
+ * considers wakeup capable, so their presence is the check for whether wakeup
+ * source accounting is available at all for @pci_dev.
+ *
+ * Returns: true if the device exposes power/wakeup, false otherwise.
+ */
+bool igt_pm_has_wakeup_support(struct pci_device *pci_dev)
+{
+	int fd = __igt_pm_get_power_attr_fd(pci_dev, "wakeup", O_RDONLY);
+
+	if (fd < 0)
+		return false;
+
+	close(fd);
+
+	return true;
+}
+
+/*
+ * Read power/wakeup, i.e. whether the device is permitted to wake the system.
+ * Returns false if wakeup is disabled or the device is not wakeup capable.
+ *
+ * This gates two separate things. It is the device_may_wakeup() policy, which
+ * the system suspend path requires before arming PME, and which a driver may
+ * also consult from its own runtime suspend hook - xe does, so on xe this
+ * decides whether PME is armed for a runtime suspend at all, see
+ * igt_pm_pci_pme_enabled().
+ *
+ * It also gates the device's wakeup source object: writing "disabled" makes the
+ * PM core drop dev->power.wakeup, after which wakeup events are not accounted
+ * at all and the power/wakeup_* counters read back as a bare newline. Tests
+ * that sample those counters therefore need wakeup enabled, whether or not they
+ * care about system wakeup.
+ */
+static bool igt_pm_get_wakeup_enabled(struct pci_device *pci_dev)
+{
+	char buf[64];
+	int fd;
+	bool enabled;
+
+	fd = __igt_pm_get_power_attr_fd(pci_dev, "wakeup", O_RDONLY);
+	if (fd < 0)
+		return false;
+
+	enabled = igt_pm_read_power_attr(fd, buf, sizeof(buf), false) &&
+		  !strcmp(buf, "enabled");
+
+	close(fd);
+
+	return enabled;
+}
+
+/**
+ * igt_pm_set_wakeup_enabled:
+ * @pci_dev: PCI device struct
+ * @enable: whether to allow the device to wake the system
+ *
+ * Writes power/wakeup. The original value is saved on the first call and
+ * restored by an exit handler, or explicitly via igt_pm_restore_wakeup().
+ *
+ * Callers must gate on igt_pm_has_wakeup_support() first.
+ */
+void igt_pm_set_wakeup_enabled(struct pci_device *pci_dev, bool enable)
+{
+	const char *val = enable ? IGT_PM_WAKEUP_ENABLED_STR :
+				   IGT_PM_WAKEUP_DISABLED_STR;
+	int len = strlen(val);
+	int fd, size;
+
+	fd = __igt_pm_get_power_attr_fd(pci_dev, "wakeup", O_RDWR);
+	igt_assert_f(fd >= 0, "Device has no power/wakeup attribute\n");
+
+	if (!__igt_pm_wakeup.pci_dev) {
+		__igt_pm_wakeup.orig_enabled = igt_pm_get_wakeup_enabled(pci_dev);
+		__igt_pm_wakeup.pci_dev = pci_dev;
+		igt_install_exit_handler(__igt_pm_wakeup_exit_handler);
+	}
+
+	size = write(fd, val, len);
+	close(fd);
+
+	igt_assert_f(size == len, "Failed to %s power/wakeup\n",
+		     enable ? "enable" : "disable");
+
+	igt_debug("PCI '%04x:%02x:%02x.%01x' power/wakeup = %s\n",
+		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func,
+		  enable ? "enabled" : "disabled");
+}
+
+/**
+ * igt_pm_restore_wakeup:
+ *
+ * Restores power/wakeup to the value it had before the first
+ * igt_pm_set_wakeup_enabled() call. Does nothing if it was never changed.
+ */
+void igt_pm_restore_wakeup(void)
+{
+	struct pci_device *pci_dev = __igt_pm_wakeup.pci_dev;
+	const char *val;
+	int fd;
+
+	if (!pci_dev)
+		return;
+
+	val = __igt_pm_wakeup.orig_enabled ? IGT_PM_WAKEUP_ENABLED_STR :
+					     IGT_PM_WAKEUP_DISABLED_STR;
+
+	fd = __igt_pm_get_power_attr_fd(pci_dev, "wakeup", O_RDWR);
+	if (fd >= 0) {
+		igt_ignore_warn(write(fd, val, strlen(val)));
+		close(fd);
+	}
+
+	__igt_pm_wakeup.pci_dev = NULL;
+}
+
 /**
  * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index ccb000998..d15b01ec9 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -103,6 +103,9 @@ bool i915_is_slpc_enabled(int drm_fd);
 uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
+bool igt_pm_has_wakeup_support(struct pci_device *pci_dev);
+void igt_pm_set_wakeup_enabled(struct pci_device *pci_dev, bool enable);
+void igt_pm_restore_wakeup(void);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
 bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
-- 
2.53.0

