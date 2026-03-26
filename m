Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AFD103A9A0
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DA910E2F6;
	Thu, 26 Mar 2026 07:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioKue025";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0E110E2EA
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774509997; x=1806045997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fq2GyuTHCw+6qwyk1VzkmzBHOT+AcIVguHO/NPKCv/c=;
 b=ioKue025Ai2HcRUMUjS/5qyZzjf4pY2g8gSKSZPnGRkvLH4xNvkCo0li
 YlFgk9bACy1MQ83vJ/umoG9TxASqHf72pQUhXNI1J/+t2k9GSy4CpQhSw
 b+jDHmgkNLyEMqQB2yi3+56AMuEPdOiYRMjsOdrc/6VJLsPHPVNijtAcU
 1uQuhJorL9xKeqE0qLgG6+aI5/mXKc+k/+4+Fh/uAURImKpigoXctxWrF
 5wo9pG7+W5SQiq8n33KAavkLb2Bl5YqqSkcd6vgUGYcdylrvmh7mkKTMB
 cxx+zxVC8BjEJX9iMcpzAMJiXF2GdDoB+7UEUiTN4kIJV+cBpgaprPJzH Q==;
X-CSE-ConnectionGUID: PlFz4OB1Tfq3Rvc8GLMQXQ==
X-CSE-MsgGUID: Gq4KBlQGTKqW3yy4TBNSJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85866205"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="85866205"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:36 -0700
X-CSE-ConnectionGUID: rtyy8XCKQ6W0yuus9jeFag==
X-CSE-MsgGUID: JUgucBSVR3qHchnvgocFzQ==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.223])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:34 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t 2/4] lib/i915/fbc: extract intel_fbc_get_fbc_status()
Date: Thu, 26 Mar 2026 09:25:53 +0200
Message-ID: <20260326072555.160329-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326072555.160329-1-vinod.govindapillai@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
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
index 8e2662824..99ea3ffe1 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -17,5 +17,6 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
 bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode);
+void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
 
 #endif
-- 
2.43.0

