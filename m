Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D65EC79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 14:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC3310E4B7;
	Mon,  7 Sep 2026 14:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoUp9UIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624E210E851
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788790156; x=1820326156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awIu8pIwSyFA179oj2zef1N0qFcPnZica+4s2dOBDzE=;
 b=PoUp9UInMI0xsu6st5+/wvjq+E283Cou81ZKSuRLKK4BPshG98ZJqp9g
 RRXTjf7I1y2nv3J/gN86ceTvzzMZucWW7D5wtfJ7MGzpxZ08iIopZgF7r
 xG8RvwrQXi4hGwpeK2s4yKolCoJSOJgpJUXfy04ic8FIK1VCggpttufEI
 6UkbWvqSnn3El6XdDDZV7wk587x3SMlu6C/8qP1Mdabr1OQpo9muLvVYU
 AdP5KanzIa+3Ltaw/Z4Pf9HNv7KkG4lMDyEjUQFaWPVgoDw8sQmVytumc
 tuyZKK55Oh7t08nRuLYOl48iHma0KAQVYERR3bqGYOx5ZoZCC5FkZA0VJ Q==;
X-CSE-ConnectionGUID: jn+n0yo4TUmAo6+dcVmJVQ==
X-CSE-MsgGUID: A3zVg8kbSXaZGx0fmHRYKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100355100"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100355100"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:09:16 -0700
X-CSE-ConnectionGUID: fDDJBG8bTX+zsTi2GxzPcw==
X-CSE-MsgGUID: tuWRwIblSquBc0PufpvF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274522322"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 07:09:14 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 4/7] lib/igt_pm: Add power/wakeup accessors
Date: Mon,  7 Sep 2026 19:52:56 +0530
Message-ID: <20260907142259.750528-5-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907142259.750528-1-pranay.samala@intel.com>
References: <20260907142259.750528-1-pranay.samala@intel.com>
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
index 6536405df..a3ad80580 100644
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
index 2784e97be..12617c2ef 100644
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

