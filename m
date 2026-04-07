Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E9DEDB7DF
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 09:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35C610E2EF;
	Tue,  7 Apr 2026 09:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkbrQlet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF66410E2EF
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555970; x=1807091970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aaen/oebkSIdE7UrtbBNndtxX+bSo28zg8t8yZx9qVk=;
 b=NkbrQletb/4T7v42dKPyD80IyCifeseRL2UvizVip8xVV3xmIcR1oSDQ
 bEjKSWLOpxO5P6VJJja7MVUfkgBvCoZQ3xnonE5okBmik5xPwXZBK4CB5
 VAE8zucHiUnHwelfKarOKPP8AbpIUJ89WSuqqPI/GIQFGDUir5DMv+u17
 XR8ki03hh/teODy+aibiRVxsQ+ea3CjGU1geiz+zxIuKXVXdMOiozqFsP
 kXoyafS58VPXB8XsswA988Ez11ROhUZvDBL/VXdnbtoPDnWn6dg7Z51a/
 IIWovzWNvwvsvk9OMOsasW+1mdrztRNh3BHZJEayv6+nqT/9tb2OG0xfr A==;
X-CSE-ConnectionGUID: O+EWV6AXSYWRjAUu1EK+5g==
X-CSE-MsgGUID: eKEk1tcRQqCqWqyaq632OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87589080"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87589080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:30 -0700
X-CSE-ConnectionGUID: Jv7oMxv0RtC+MEAurO1dEw==
X-CSE-MsgGUID: 0+kUR8BkRse+effIBlkzrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228400092"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:28 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH i-g-t v2 3/8] lib/i915/fbc: extract intel_fbc_get_fbc_status()
Date: Tue,  7 Apr 2026 12:58:38 +0300
Message-ID: <20260407095843.43679-4-vinod.govindapillai@intel.com>
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

Code to read the FBC status from the debugfs is being duplicated
in many places. Extract intel_fbc_get_fbc_status() to be used as
the single source to read the current FBC status.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 35 +++++++++++++++++++++++++----------
 lib/i915/intel_fbc.h |  1 +
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index b8c714d43..81aa5c5a5 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -22,6 +22,27 @@ void intel_fbc_disable(igt_display_t *display)
 	igt_set_module_param_int(display->drm_fd, "enable_fbc", 0);
 }
 
+/**
+ * intel_fbc_get_fbc_status
+ * @crtc: CRTC
+ * @fbc_status: Buffer to fill the current fbc status
+ * @buf_size: Size of the buffer to be filled
+ *
+ * Read the debugfs entry for current fbc status of a crtc
+ *
+ * Returns:
+ * None
+ */
+void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size)
+{
+	int dir;
+
+	dir = igt_crtc_debugfs_dir(crtc);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_fbc_status", fbc_status, buf_size);
+	close(dir);
+}
+
 /**
  * intel_fbc_supported:
  * @crtc: CRTC
@@ -34,12 +55,9 @@ void intel_fbc_disable(igt_display_t *display)
 bool intel_fbc_supported(igt_crtc_t *crtc)
 {
 	char buf[FBC_STATUS_BUF_LEN];
-	int dir;
 
-	dir = igt_crtc_debugfs_dir(crtc);
-	igt_require_fd(dir);
-	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
-	close(dir);
+	intel_fbc_get_fbc_status(crtc, buf, sizeof(buf));
+
 	if (*buf == '\0')
 		return false;
 
@@ -51,12 +69,9 @@ static bool _intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level, char *last_fb
 {
 	char buf[FBC_STATUS_BUF_LEN];
 	bool print = true;
-	int dir;
 
-	dir = igt_crtc_debugfs_dir(crtc);
-	igt_require_fd(dir);
-	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
-	close(dir);
+	intel_fbc_get_fbc_status(crtc, buf, sizeof(buf));
+
 	if (log_level != IGT_LOG_DEBUG)
 		last_fbc_buf[0] = '\0';
 	else if (strcmp(last_fbc_buf, buf))
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index b4596cca5..d62ad73fc 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -25,5 +25,6 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
 bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode);
+void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
 
 #endif
-- 
2.43.0

