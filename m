Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993F0EDB7E7
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 10:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A5310E3A9;
	Tue,  7 Apr 2026 10:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8/JKsWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76A310E3BA
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555977; x=1807091977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nobX11iemGK3cYcp9YN6U4AqMCW5uA8PfmZDoUXt3AA=;
 b=H8/JKsWpf6BDrt9GUvHFC96y/eZWPuhxnydKCCo7TP/aF6qcL6AX79Ig
 vVtAzp2Cla5wRiLub+uyXxHwIZZ7IpfxrSr5TqVyBZN1rO8HZCI1a/Kry
 EgDBcewfR1nPLu+cAB67693VzDdNOGm0f+aPdg+U1pD024qlDVf3BWNR+
 hVv6QRiZ0/XSeqESJ4wUjfKudwUB+/asrGA1nfDgdSj+z62qgMM0eZZUR
 OgumAYpSzafWXEPjP24XA2nqVkRKx5htXMESjHb7QYLXW8XiK2xvVObYQ
 BDp+RvW1Oc5NGf+BJeUMRkI1fPnm6/vDSJBo41sSHrUpjd59E5ujnDRZM Q==;
X-CSE-ConnectionGUID: V2kLOqraR1ygycz0aYS2Dw==
X-CSE-MsgGUID: 4xYAANKxS92XZ1MirAuAIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87589086"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87589086"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:37 -0700
X-CSE-ConnectionGUID: VMkjvG3hSxu7eeyO0hTXRA==
X-CSE-MsgGUID: jFGX6jJDSMiE46r5ScYTpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228400106"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:35 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH i-g-t v2 5/8] tests/intel/kms_frontbuffer_tracking: use a
 bigger fbc status buffer
Date: Tue,  7 Apr 2026 12:58:40 +0300
Message-ID: <20260407095843.43679-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407095843.43679-1-vinod.govindapillai@intel.com>
References: <20260407095843.43679-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As the FBC status now include plane specific FBC status as well, we
need a bigger buffer to capture the complete FBC status. Define the
buffer length in a single place and use it across places where the
test need to assess the FBC status

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c                   |  2 --
 lib/i915/intel_fbc.h                   |  2 ++
 tests/intel/kms_frontbuffer_tracking.c | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 81aa5c5a5..a7a18cba2 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -10,8 +10,6 @@
 
 #include "intel_fbc.h"
 
-#define FBC_STATUS_BUF_LEN 128
-
 void intel_fbc_enable(igt_display_t *display)
 {
 	igt_set_module_param_int(display->drm_fd, "enable_fbc", 1);
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index d62ad73fc..3dd15de31 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -8,6 +8,8 @@
 
 #include "igt.h"
 
+#define FBC_STATUS_BUF_LEN 512
+
 enum psr_mode;
 
 const char *const no_fbc_reasons[] = {
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 602dd86d0..36797c143 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1570,7 +1570,7 @@ static void drrs_print_status(void)
 static struct timespec fbc_get_last_action(void)
 {
 	struct timespec ret = { 0, 0 };
-	char buf[128];
+	char buf[FBC_STATUS_BUF_LEN];
 	char *action;
 	ssize_t n_read;
 
@@ -1620,7 +1620,7 @@ static void fbc_update_last_action(void)
 static void fbc_setup_last_action(void)
 {
 	ssize_t n_read;
-	char buf[128];
+	char buf[FBC_STATUS_BUF_LEN];
 	char *action;
 
 	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
@@ -1640,7 +1640,7 @@ static void fbc_setup_last_action(void)
 
 static bool fbc_is_compressing(void)
 {
-	char buf[128];
+	char buf[FBC_STATUS_BUF_LEN];
 
 	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
 
@@ -1655,7 +1655,7 @@ static bool fbc_wait_for_compression(void)
 static bool fbc_found_skip_reason(void)
 {
 	bool found_reason = false;
-	char fbc_status[128];
+	char fbc_status[FBC_STATUS_BUF_LEN];
 	int i;
 
 	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
@@ -1671,7 +1671,7 @@ static bool fbc_found_skip_reason(void)
 
 static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
 {
-	char buf[PATH_MAX];
+	char buf[FBC_STATUS_BUF_LEN];
 	char buf_plane[128];
 
 	sprintf(buf_plane, "%d%s", plane_index, igt_crtc_name(crtc));
-- 
2.43.0

