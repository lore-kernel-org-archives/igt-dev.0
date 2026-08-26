Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917B2C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 09:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A92D10E275;
	Wed, 26 Aug 2026 09:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMSq10lV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8C710E275
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737984; x=1819273984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uZE6ewq7DMqjc7+XRU+ovxu8c4CM03FnaD9RvIMnAvM=;
 b=iMSq10lV64qS1PgtNIniQV0oU3L8lip2xOp8QNRSKt1wRcd/uK43EXbb
 szgiLJC6hQQR9Ibbx/Pe1nvgc4hNMFDXx/3vjh7+3Rd8nSti68+9mRO+H
 cfvUL6FMREVY+h91MpmL59+7hypBEu23qbs4Azrcs8QKil0H2cFPOxl1y
 iQnJNbTI1aXotk+RHI541M4Gjm162PMDYo9Vm9k4zru4h/+r1oqEHbPg/
 yH6ydpWXKKFC9A7oMHoixlCxQgzpAifVaT19FHsopbO6wrtsK1KvLzu2T
 LSZvtW1/9HDtTkAqiVGOGNYl0tLxuzYrwA9NN+MeUHuRjgkBCAgnHqRzs w==;
X-CSE-ConnectionGUID: apDsveGtTemumcEODbSckg==
X-CSE-MsgGUID: Bhn4EO+1Scixwi1c3L4fVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88344882"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88344882"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:53:04 -0700
X-CSE-ConnectionGUID: 65fehyj9TFi4FASaWqdPsA==
X-CSE-MsgGUID: bzCHr2y0RreSvx/JTu+xJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="292388897"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:53:03 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [RFC 6/7] lib/igt_pm: Add drm_kms_helper.poll save/restore helpers
Date: Wed, 26 Aug 2026 15:36:37 +0530
Message-ID: <20260826100639.273731-7-pranay.samala@intel.com>
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

The new PME hotplug subtest needs to save the drm_kms_helper.poll module
parameter and put it back on exit, so that an earlier test cannot leave
polling disabled and make the measurement pass for the wrong reason.

tests/intel/kms_pm_dc.c and tests/kms_prime.c already open code exactly
that, each with its own copy of the KMS_HELPER and KMS_POLL_DISABLE
defines and its own file scope kms_poll_saved_state global. Rather than
add a third copy, add igt_pm_kms_poll_save(), _set() and _restore().
Converting those two existing callers is left to a separate patch.

Save and set stay separate rather than becoming one "save and disable"
helper, because a caller may want to record the original value and put it
back on exit while leaving polling switched on.

igt_pm_kms_poll_save() installs the exit handler itself, and
igt_pm_kms_poll_restore() does nothing unless a save actually happened, so
a restore can never run without a matching save.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_pm.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  3 ++
 2 files changed, 93 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 4296169f3..ba53e2fc0 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1675,6 +1675,96 @@ uint64_t igt_pm_get_wakeup_active_count(struct pci_device *pci_dev)
 	return igt_pm_read_power_attr_u64(pci_dev, "wakeup_active_count");
 }
 
+#define IGT_KMS_HELPER_PARAMS "/sys/module/drm_kms_helper/parameters"
+
+static struct {
+	bool saved;
+	bool orig_poll;
+} __igt_pm_kms_poll;
+
+static void __igt_pm_kms_poll_exit_handler(int sig)
+{
+	igt_pm_kms_poll_restore();
+}
+
+/**
+ * igt_pm_kms_poll_save:
+ *
+ * Saves the current drm_kms_helper.poll value and installs an exit handler to
+ * restore it. Safe to call more than once, only the first value is kept.
+ *
+ * Returns: false if the module parameter is not available, in which case
+ * nothing was saved.
+ */
+bool igt_pm_kms_poll_save(void)
+{
+	int dir;
+
+	if (__igt_pm_kms_poll.saved)
+		return true;
+
+	dir = open(IGT_KMS_HELPER_PARAMS, O_RDONLY);
+	if (dir < 0)
+		return false;
+
+	if (!__igt_sysfs_get_boolean(dir, "poll", &__igt_pm_kms_poll.orig_poll)) {
+		close(dir);
+		return false;
+	}
+	close(dir);
+
+	__igt_pm_kms_poll.saved = true;
+	igt_install_exit_handler(__igt_pm_kms_poll_exit_handler);
+
+	igt_debug("Saved drm_kms_helper.poll = %s\n",
+		  __igt_pm_kms_poll.orig_poll ? "Y" : "N");
+
+	return true;
+}
+
+/**
+ * igt_pm_kms_poll_set:
+ * @enable: whether to enable connector polling
+ *
+ * Writes the drm_kms_helper.poll module parameter. Callers are expected to have
+ * called igt_pm_kms_poll_save() first so the original value is restored on exit.
+ */
+void igt_pm_kms_poll_set(bool enable)
+{
+	int dir;
+
+	dir = open(IGT_KMS_HELPER_PARAMS, O_RDONLY);
+	igt_assert_f(dir >= 0, "Can't open %s\n", IGT_KMS_HELPER_PARAMS);
+
+	igt_sysfs_set_boolean(dir, "poll", enable);
+	close(dir);
+
+	igt_debug("drm_kms_helper.poll = %s\n", enable ? "Y" : "N");
+}
+
+/**
+ * igt_pm_kms_poll_restore:
+ *
+ * Restores drm_kms_helper.poll to the value saved by
+ * igt_pm_kms_poll_save(). Does nothing if it was never saved, so it is safe to
+ * use as an exit handler that may run before any save happened.
+ */
+void igt_pm_kms_poll_restore(void)
+{
+	int dir;
+
+	if (!__igt_pm_kms_poll.saved)
+		return;
+
+	dir = open(IGT_KMS_HELPER_PARAMS, O_RDONLY);
+	if (dir >= 0) {
+		__igt_sysfs_set_boolean(dir, "poll", __igt_pm_kms_poll.orig_poll);
+		close(dir);
+	}
+
+	__igt_pm_kms_poll.saved = false;
+}
+
 /**
  * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index eba54efa2..307fd9e34 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -107,6 +107,9 @@ bool igt_pm_has_wakeup_support(struct pci_device *pci_dev);
 void igt_pm_set_wakeup_enabled(struct pci_device *pci_dev, bool enable);
 void igt_pm_restore_wakeup(void);
 uint64_t igt_pm_get_wakeup_active_count(struct pci_device *pci_dev);
+bool igt_pm_kms_poll_save(void);
+void igt_pm_kms_poll_set(bool enable);
+void igt_pm_kms_poll_restore(void);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
 bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
-- 
2.53.0

