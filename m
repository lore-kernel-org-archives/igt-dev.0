Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391CD606AA10
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2pPgaJc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11E010E270;
	Tue, 20 Oct 2026 14:15:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4540B10F243
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792505532; x=1824041532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z/BazXvD7Scmcas96mV9IAwTPyIsWYBXjYiROWQSiuo=;
 b=Q2pPgaJcK7vD4bsE+7ccMWxwMHglR+SnNCgyOQ63torwyAQTfX3J0lhc
 iodci3XCkh98ikmPCkrHP1fs4TeFO9da9FN1pbQ679OZJqPHpJ8TSQjVA
 LpGBYuWzs9T9exrGiqK+xwIIjbuY+pejwxle/jJ1YheZleiuzB3HxgS2w
 miISwDGkS2etdtahbKwwxerBPm/9bOSx3wgscD6vRXsDcmQLwF98rEKm3
 eojoyouKJzZPc6n/lWSqpHgANvGVTReHYYMHv80bcHJqjbnLSVd18SEkl
 k7l+HPOBUBwn/wfjJf0tHidKzDX7SfuxY7h2bcW+gVFG9VXh3O9fIK3dQ Q==;
X-CSE-ConnectionGUID: l8n67LevSTOHQIZBGwVhcA==
X-CSE-MsgGUID: O4uz4b+XS3iCp/r4qB5Q/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309585"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1309585"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:11 -0700
X-CSE-ConnectionGUID: wCh1wifhQr66ShYaFEt3vQ==
X-CSE-MsgGUID: B5YOOmWLRPSUobUL1sWg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2775757"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:10 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 6/7] lib/igt_kms: Add drm_kms_helper.poll
 save/restore helpers
Date: Tue, 20 Oct 2026 19:41:50 +0530
Message-ID: <20261020141151.753331-7-pranay.samala@intel.com>
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

The new PME hotplug subtest needs to save the drm_kms_helper.poll module
parameter and put it back on exit, so that an earlier test cannot leave
polling disabled and make the measurement pass for the wrong reason.

tests/intel/kms_pm_dc.c and tests/kms_prime.c already open code that,
each with its own defines and saved state. Rather than add a third copy,
add igt_kms_poll_save(), _set() and _restore(). Converting those two
callers is left to a separate patch.

Save and set stay separate, because a caller may want to restore the
original value on exit while leaving polling switched on. Save installs
the exit handler itself, and restore does nothing without a save.

Writing the parameter does not by itself start or stop polling: the poll
worker stops at its next run after it is disabled, and is only restarted
by drm_kms_helper_poll_enable(), on driver load or system resume. The
kerneldoc says so, so callers that need polling running check for it.

v3:
- Move to igt_kms and rename from igt_pm_kms_poll_*() (Kunal)
- Document that setting the parameter does not restart a stopped poll
  worker (Kunal)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 ++
 2 files changed, 104 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af0f7c4e5..e1adf1b6f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6173,6 +6173,107 @@ void igt_cleanup_uevents(struct udev_monitor *mon)
 	udev_unref(udev);
 }
 
+#define IGT_KMS_HELPER_PARAMS "/sys/module/drm_kms_helper/parameters"
+
+static struct {
+	bool saved;
+	bool orig_poll;
+} __igt_kms_poll;
+
+static void __igt_kms_poll_exit_handler(int sig)
+{
+	igt_kms_poll_restore();
+}
+
+/**
+ * igt_kms_poll_save:
+ *
+ * Saves the current drm_kms_helper.poll value and installs an exit handler to
+ * restore it. Safe to call more than once, only the first value is kept.
+ *
+ * Returns: false if the module parameter is not available, in which case
+ * nothing was saved.
+ */
+bool igt_kms_poll_save(void)
+{
+	int dir;
+
+	if (__igt_kms_poll.saved)
+		return true;
+
+	dir = open(IGT_KMS_HELPER_PARAMS, O_RDONLY);
+	if (dir < 0)
+		return false;
+
+	if (!__igt_sysfs_get_boolean(dir, "poll", &__igt_kms_poll.orig_poll)) {
+		close(dir);
+		return false;
+	}
+	close(dir);
+
+	__igt_kms_poll.saved = true;
+	igt_install_exit_handler(__igt_kms_poll_exit_handler);
+
+	igt_debug("Saved drm_kms_helper.poll = %s\n",
+		  __igt_kms_poll.orig_poll ? "Y" : "N");
+
+	return true;
+}
+
+/**
+ * igt_kms_poll_set:
+ * @enable: whether to allow connector polling
+ *
+ * Writes the drm_kms_helper.poll module parameter. Callers are expected to have
+ * called igt_kms_poll_save() first so the original value is restored on exit.
+ *
+ * This only changes the parameter, it does not itself start or stop the poll
+ * worker. Disabling takes effect the next time the worker runs, at most one
+ * poll period later, and the worker then stops. Enabling does not restart a
+ * worker that has stopped: the kernel only does that from
+ * drm_kms_helper_poll_enable(), i.e. on driver load and, for most drivers,
+ * system resume. Callers that rely on polling actually running after enabling
+ * it must check for it.
+ */
+void igt_kms_poll_set(bool enable)
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
+ * igt_kms_poll_restore:
+ *
+ * Restores drm_kms_helper.poll to the value saved by igt_kms_poll_save(). Does
+ * nothing if it was never saved, so it is safe to use as an exit handler that
+ * may run before any save happened.
+ *
+ * As with igt_kms_poll_set(), restoring the parameter to enabled does not
+ * restart a poll worker that stopped while it was disabled.
+ */
+void igt_kms_poll_restore(void)
+{
+	int dir;
+
+	if (!__igt_kms_poll.saved)
+		return;
+
+	dir = open(IGT_KMS_HELPER_PARAMS, O_RDONLY);
+	if (dir >= 0) {
+		__igt_sysfs_set_boolean(dir, "poll", __igt_kms_poll.orig_poll);
+		close(dir);
+	}
+
+	__igt_kms_poll.saved = false;
+}
+
 /**
  * kmstest_get_vbl_flag:
  * @crtc_index: CRTC index to convert into DRM_IOCTL_WAIT_VBLANK parameter
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9b8779a62..c6081a16a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1239,6 +1239,9 @@ bool igt_connector_event_detected(struct udev_monitor *mon, uint32_t conn_id,
 				  uint32_t prop_id, int timeout_msecs);
 void igt_flush_uevents(struct udev_monitor *mon);
 void igt_cleanup_uevents(struct udev_monitor *mon);
+bool igt_kms_poll_save(void);
+void igt_kms_poll_set(bool enable);
+void igt_kms_poll_restore(void);
 
 bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
 					     uint32_t format, uint64_t modifier);
-- 
2.53.0

