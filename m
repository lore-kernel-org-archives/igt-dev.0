Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A445F8A151
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D42210E098;
	Thu, 16 Apr 2026 09:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZddoIKp1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB12610E098
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331577; x=1807867577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wujm9BNuRnRgaNzH8zmxLupiw/+rh3PHNLp9tQp4PZI=;
 b=ZddoIKp1FaUEpDDRF5qDWgBXoNn6RWMtmNUSHojD0sGlbeIk84hT8l4z
 smnZSSlP0DwsC2oNgk8vN/RSwyGyekmzdPGstEeL2loyaKpyjL2bwbQFA
 X7C6k1/NxjdmpcW23n0LWEXpiPfIdmtceTdGXuDXZbCBko28VPoUHcUjF
 4+5H7usISQXy1KMgJwPYfqnpeJ7k/K6cJO4L8RDw27uGF6v23wg+DP9T7
 QxRKfK0/jQB1pXGujpyLig8Tzv+oDaDr8Kd0zRALvgPFbxjN9G/sRrAm3
 88fSjlR3VuA+4p9D3cF3ybPepK47pmw79MvMwuvEuLwl7wddJSpPz9wFJ w==;
X-CSE-ConnectionGUID: hSdotqxURJCUFtlDrt9nHA==
X-CSE-MsgGUID: YB44b5M5SBeq8nPnw5DWag==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775883"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:17 -0700
X-CSE-ConnectionGUID: vwKi6SacSOi6yVIcdQtFmw==
X-CSE-MsgGUID: w5/kGMcbTsuPDeHjZ02/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235062977"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:15 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 01/11] lib/i915/fbc: extract
 intel_fbc_get_fbc_status()
Date: Thu, 16 Apr 2026 12:25:49 +0300
Message-ID: <20260416092559.88735-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416092559.88735-1-vinod.govindapillai@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
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
 lib/i915/intel_fbc.c | 55 ++++++++++++++++++++++++++++++++++++--------
 lib/i915/intel_fbc.h |  3 +++
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index b8c714d43..47f0e2fc1 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -22,6 +22,47 @@ void intel_fbc_disable(igt_display_t *display)
 	igt_set_module_param_int(display->drm_fd, "enable_fbc", 0);
 }
 
+/**
+ * intel_fbc_get_fbc_status_crtc_index
+ * @device: fd of the device
+ * @crtc: crtc index
+ * @fbc_status: Buffer to fill the current fbc status
+ * @buf_size: Size of the buffer to be filled
+ *
+ * Read the debugfs entry for current fbc status of a crtc
+ *
+ * Returns:
+ * None
+ */
+void intel_fbc_get_fbc_status_crtc_index(int device, int crtc_index,
+					 char *fbc_status, int buf_size)
+{
+	int dir;
+
+	dir = igt_debugfs_crtc_dir(device, crtc_index);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_fbc_status", fbc_status, buf_size);
+	close(dir);
+}
+
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
+	intel_fbc_get_fbc_status_crtc_index(crtc->display->drm_fd,
+					    crtc->crtc_index, fbc_status,
+					    buf_size);
+}
+
 /**
  * intel_fbc_supported:
  * @crtc: CRTC
@@ -34,12 +75,9 @@ void intel_fbc_disable(igt_display_t *display)
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
 
@@ -51,12 +89,9 @@ static bool _intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level, char *last_fb
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
index 8e2662824..f8a506f23 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -17,5 +17,8 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
 bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode);
+void intel_fbc_get_fbc_status_crtc_index(int device, int crtc_index,
+					 char *fbc_status, int buf_size);
+void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
 
 #endif
-- 
2.43.0

