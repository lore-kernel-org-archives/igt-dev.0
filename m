Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20DFCD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A8A10E97C;
	Mon,  1 Jun 2026 20:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i96Bj0RY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E7210E977
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346663; x=1811882663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JJ+1nM3iBz1tzUGP8otgzt+K6CKRleAJibVkyILJ08A=;
 b=i96Bj0RYGg15qLuF6JwGatJApnIKtfkwv4NCMaMIRps5f78he6pI20yI
 r33qAvQrxl0LR8N8eD75v+HLEP4ZwhyCNP9ymAikq+e+99HWHWf1WjQgy
 nqnGoKUe2amfZF0uhIPSWcNojsVmL/EuSkYf7rfCAty3yKkkmawxwaYXW
 Gc7x4ZoDi9VVDR6MmypWjlKMaYPUsqTD7oBdEewZWhdH9yiAQdjIunZxR
 bX+amVH2QetSw/6CIUN9AUoEBuxFRLGefL4kpaBVTWagcQBKdIkmKY7Vh
 p5LXYEURsV+Qb2mHvJ6/5V9RiEHnFhlYfUT5q2B7LTA9YVZV1+ctDraCc g==;
X-CSE-ConnectionGUID: qoVLiGOeToGxq5YR6joHFg==
X-CSE-MsgGUID: FnXSFCoOT72Gjj8LW7Dujg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652842"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652842"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:23 -0700
X-CSE-ConnectionGUID: kKuglHoKT1Cik1+834b86A==
X-CSE-MsgGUID: xmSN+1TnThirP+ufamYlEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331424"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:20 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 01/12] lib/i915/fbc: extract
 intel_fbc_get_fbc_status()
Date: Mon,  1 Jun 2026 23:43:56 +0300
Message-ID: <20260601204407.39934-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601204407.39934-1-vinod.govindapillai@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
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

v2: update the function name (Santhosh)

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 55 ++++++++++++++++++++++++++++++++++++--------
 lib/i915/intel_fbc.h |  3 +++
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index b8c714d43..4e629097a 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -22,6 +22,47 @@ void intel_fbc_disable(igt_display_t *display)
 	igt_set_module_param_int(display->drm_fd, "enable_fbc", 0);
 }
 
+/**
+ * intel_fbc_get_status_crtc_index
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
+void intel_fbc_get_status_crtc_index(int device, int crtc_index,
+				     char *fbc_status, int buf_size)
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
+ * intel_fbc_get_status
+ * @crtc: CRTC
+ * @fbc_status: Buffer to fill the current fbc status
+ * @buf_size: Size of the buffer to be filled
+ *
+ * Read the debugfs entry for current fbc status of a crtc
+ *
+ * Returns:
+ * None
+ */
+void intel_fbc_get_status(igt_crtc_t *crtc, char *fbc_status, int buf_size)
+{
+	intel_fbc_get_status_crtc_index(crtc->display->drm_fd,
+					crtc->crtc_index, fbc_status,
+					buf_size);
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
+	intel_fbc_get_status(crtc, buf, sizeof(buf));
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
+	intel_fbc_get_status(crtc, buf, sizeof(buf));
+
 	if (log_level != IGT_LOG_DEBUG)
 		last_fbc_buf[0] = '\0';
 	else if (strcmp(last_fbc_buf, buf))
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 8e2662824..60b86e366 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -17,5 +17,8 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
 bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode);
+void intel_fbc_get_status_crtc_index(int device, int crtc_index,
+				     char *fbc_status, int buf_size);
+void intel_fbc_get_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
 
 #endif
-- 
2.43.0

