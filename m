Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBDEC5CFC1
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 09:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB7710E2C2;
	Tue, 11 Aug 2026 09:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEVXKvpF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55D410E2C2
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786441225; x=1817977225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M3530eclzHb4pFXPexuuJH0kBVhlChx8gcNtlFINVr4=;
 b=dEVXKvpFdKauE6l327Wi099YL5iNB3KfAnlTDLIjjVsN2KoZ6BUltKEu
 +WyjWfgM45jXVjGd/BT3nAws6e9+4qIgnvKUAI/eXjOnnL6wwWCDw3O1r
 UUx3n7nzDNuJfhTb3dAbphEToIxE1GFXekklM7T1EHnjRSW05fmv+UV2K
 7o1h6IswGO0EbPXsaDA8UJjRQbiowN71ELTotads53jFKIsVz1mGHTwQv
 JiWB9AqbEEHDKdoMjDohI3k40xx88v1VjRQoqMEwT0k6VmY93A9j5M7Rz
 GUc2+mF52I9LCLCrnBtJRlbs4XUH+PwAoUSA5L1Om4aZlxymUR/t4Hn8c w==;
X-CSE-ConnectionGUID: jtZqn8tYQee7s702xbjQLA==
X-CSE-MsgGUID: 9M6URBXvRhuPEstZyMgIBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86089193"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86089193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:40:24 -0700
X-CSE-ConnectionGUID: UQQODvVrT6qsn7nHPRWP9A==
X-CSE-MsgGUID: GJEY4w3dShmuPV7wiCfEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="259027099"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Aug 2026 02:40:23 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: skip PSR/FBC
 subtests disabled by modparam
Date: Tue, 11 Aug 2026 09:40:21 +0000
Message-ID: <20260811094021.2094676-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

The enable_fbc and enable_psr module parameters can force FBC and PSR
off regardless of chipset or sink support, but setup_fbc() and
setup_psr() didn't check for that, so the related subtests ran and
failed instead of being skipped.

Check intel_fbc_enable_possible() and is_psr_enable_possible() (also
against PR_MODE, since a sink may use Panel Replay instead of PSR1) in
setup_fbc()/setup_psr() so fbc.can_test/psr.can_test reflect the
modparam state.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/i915/intel_fbc.c                   | 22 ++++++++++++++++++++++
 lib/i915/intel_fbc.h                   |  1 +
 tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++++++++++++--
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index ad78ee2a3..9833cc9e3 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -20,6 +20,28 @@ void intel_fbc_disable(igt_display_t *display)
 	igt_set_module_param_int(display->drm_fd, "enable_fbc", 0);
 }
 
+/**
+ * intel_fbc_enable_possible:
+ * @drm_fd: Device file descriptor
+ *
+ * Check if FBC is allowed to be enabled by reading the enable_fbc modparam.
+ *
+ * Returns:
+ * true if enable_fbc modparam allows FBC to be enabled, false otherwise.
+ */
+bool intel_fbc_enable_possible(int drm_fd)
+{
+	char *param_value;
+	int enable_fbc;
+
+	param_value = __igt_params_get(drm_fd, "enable_fbc");
+	igt_assert_f(param_value, "Could not read enable_fbc modparam\n");
+	enable_fbc = atoi(param_value);
+	free(param_value);
+
+	return enable_fbc != 0;
+}
+
 /**
  * intel_fbc_get_status_crtc_index
  * @device: fd of the device
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index a82a96d20..1192ebf1b 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -14,6 +14,7 @@ enum psr_mode;
 
 void intel_fbc_enable(igt_display_t *display);
 void intel_fbc_disable(igt_display_t *display);
+bool intel_fbc_enable_possible(int drm_fd);
 bool intel_fbc_supported(igt_crtc_t *crtc);
 bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 594644632..4dd2f4e70 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2195,6 +2195,12 @@ static void setup_fbc(void)
 		return;
 	}
 
+	if (!intel_fbc_enable_possible(drm.fd)) {
+		igt_info("Can't test FBC: disabled by enable_fbc modparam\n");
+		fbc.can_test = false;
+		return;
+	}
+
 	fbc.can_test = true;
 
 	fbc_setup_last_action();
@@ -2227,6 +2233,20 @@ static void setup_psr(void)
 		igt_info("Can't test PSR: not supported by sink.\n");
 		return;
 	}
+
+	if (!is_psr_enable_possible(drm.fd, PSR_MODE_1)) {
+		igt_info("Can't test PSR: disabled by enable_psr modparam\n");
+		psr.can_test = false;
+		return;
+	}
+
+	if (psr_sink_support(drm.fd, drm.debugfs, PR_MODE, NULL) &&
+	    !is_psr_enable_possible(drm.fd, PR_MODE)) {
+		igt_info("Can't test Panel Replay: Panel Replay disabled by enable_panel_replay modparam\n");
+		psr.can_test = false;
+		return;
+	}
+
 	psr.can_test = true;
 }
 
@@ -2688,11 +2708,11 @@ static void check_test_requirements(const struct test_mode *t)
 
 	if (t->feature & FEATURE_FBC)
 		igt_require_f(fbc.can_test,
-			      "Can't test FBC with this chipset\n");
+			      "Can't test FBC (unsupported or disabled by enable_fbc modparam)\n");
 
 	if (t->feature & FEATURE_PSR) {
 		igt_require_f(psr.can_test,
-			      "Can't test PSR with the current outputs\n");
+			      "Can't test PSR (unsupported or disabled by enable_psr modparam)\n");
 	}
 
 	if (t->feature & FEATURE_DRRS)
-- 
2.43.0

