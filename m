Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACDE606AA06
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEqoiO1d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEA510E270;
	Tue, 20 Oct 2026 14:13:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4010E270
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792505528; x=1824041528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NOdlKM2EE+HPTVIhI/ePerGTME47NeiX6boC69wsWW4=;
 b=iEqoiO1dB1adgseCrSj4JHjdbWxhsDTf22cOHpZS2ez2dQXWg7cMPqj1
 IQbowmNf3kgcwSHpT5z6s9OKCsDSrqNC+irypcBh0Cj8rxRzhbcEBZ4wd
 lYtKLAQU7GMUyXX8AmbwhI6Mzf8dpqp7F/zCremdBAPtayC+HGDpRWbS/
 bC3lQtF5+TVvLysTq7vCQyK+EHZnhiyVtrwpHdLaDXjnZgT/WjkMF1pro
 8JIv3GJZS1cpypVM+I0LtuF0JSMZa/UJItOg54B/x9UfCibtmh8qyC7ii
 eQxrLKiNRRJezOIcCSOxE6AuSI3v2GMu2jH+LwY2h0VZb3fUt5aG+Fsod Q==;
X-CSE-ConnectionGUID: yDg/tuUOSfGngSbLTHXFZQ==
X-CSE-MsgGUID: KY2VXY+ATzu5QGR5YaQU0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309566"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1309566"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:08 -0700
X-CSE-ConnectionGUID: yt6JqbgfR5+pn637j4SbUQ==
X-CSE-MsgGUID: kslxrrdQS6aQlzIY30UrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2775744"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:07 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 4/7] lib/igt_pm: Add power/wakeup accessors
Date: Tue, 20 Oct 2026 19:41:48 +0530
Message-ID: <20261020141151.753331-5-pranay.samala@intel.com>
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

Add PCI power/wakeup accessors for igt_pm:

igt_pm_has_wakeup_support()
igt_pm_set_wakeup_enabled()
igt_pm_restore_wakeup()

These helpers expose whether the device supports wakeup accounting and allow
tests to enable/restore the power/wakeup sysfs attribute. This is needed for
PME-based HPD tests, where both device wakeup support and the PM wakeup source
must be enabled.

v3:
- Keep the kerneldoc generic, drop the xe specific note (Kunal)
- Document that enabling power/wakeup on a device that had it disabled
  creates a new wakeup source, so the power/wakeup_* counters restart
  from 0 and callers need a fresh baseline (Kunal)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 140 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |   3 ++
 2 files changed, 143 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index ccb2f17c4..1173b2b68 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1498,6 +1498,146 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
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
+ * also consult from its own suspend hooks.
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
+ * Enabling wakeup on a device that has it disabled makes the PM core create a
+ * new wakeup source, so all power/wakeup_* counters restart from 0. Callers
+ * that sample those counters must take a fresh baseline after this call.
+ * Enabling it when already enabled keeps the existing wakeup source and its
+ * counters.
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
+ *
+ * As with igt_pm_set_wakeup_enabled(), restoring an enabled value onto a
+ * disabled device restarts the power/wakeup_* counters from 0.
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
index 861741b89..c3facbd69 100644
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

