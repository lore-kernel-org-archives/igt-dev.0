Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D87CD343F
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 03:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F169710E2CC;
	Mon, 18 May 2026 03:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ01SibC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1087710E2CC
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 03:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779076388; x=1810612388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1ATHPDxyVVSJUn/S7rfh0huQimd9e/VRyqI8SEaThE=;
 b=HZ01SibCnHiA+gpJZKRY9VeOvH6Mgn/whvAmvRBRnfpGWVljQ0zNQ472
 0oYBcYJUkiZuTbSn/XMuZVNgY4vRRpOr+N9NXwbicaKOVFWVtrHU0ECh1
 mFJ0ar5b5S7wVhb9BfIAy/592k/v2AFU1GvCI/wLtcyCJfOLmk3uHkp3l
 0XujMi2tHG4Kla0+yrJj8FH78DnvGnL9ZNm8QiC9z2xUeqYrBGcV3eGMH
 LWzOWif57hMtJlHXtz9yQwIGa0wp43A3yMWynV9xvtp2B0GbvuviJRVsX
 jjeRjqgesPrO7EgsbgGf/i2lqZVeIAhlsFYu3uF3QUxG9FuvLonVZeVsh g==;
X-CSE-ConnectionGUID: 5Hn29nyYRqKbRm4o6FH5RQ==
X-CSE-MsgGUID: /LJmOgmySG6/oTKLU5UTZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79970573"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79970573"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 20:53:08 -0700
X-CSE-ConnectionGUID: GI5kayBURwSYOMJccKc4Tg==
X-CSE-MsgGUID: u1rGiXrUQHGAN7KR+jz9jg==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa003.fm.intel.com with ESMTP; 17 May 2026 20:53:06 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 2/3] lib/igt_kms: make max bpc query return status
Date: Mon, 18 May 2026 09:33:52 +0530
Message-Id: <20260518040353.212734-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518040353.212734-1-pranay.samala@intel.com>
References: <20260518040353.212734-1-pranay.samala@intel.com>
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

Change igt_get_output_max_bpc() to return bool and fill an
output parameter instead of asserting/requiring internally.
This allows callers to handle debugfs read/parse failures
gracefully.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c | 38 ++++++++++++++++++++++++++------------
 lib/igt_kms.h |  2 +-
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99fc9fa05..e1dd56aad 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6657,32 +6657,43 @@ bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
 
 /**
  * igt_get_output_max_bpc:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
+ * @output: Output to query.
+ * @maximum: Returned maximum bpc value.
  *
- * Returns: The maximum bpc from the connector debugfs.
+ * Returns: true on success, false on failure.
  */
-unsigned int igt_get_output_max_bpc(igt_output_t *output)
+bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum)
 {
 	igt_display_t *display = output->display;
 	int drmfd = display->drm_fd;
 	char buf[24];
 	char *start_loc;
 	int fd, res;
-	unsigned int maximum;
+
+	if (!maximum)
+		return false;
+
+	*maximum = 0;
 
 	fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
-	igt_assert(fd >= 0);
+	if (fd < 0)
+		return false;
 
 	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
-	igt_require(res > 0);
-
 	close(fd);
+	if (res <= 0)
+		return false;
+
+	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
+
+	start_loc = strstr(buf, "Maximum: ");
+	if (!start_loc)
+		return false;
 
-	igt_assert(start_loc = strstr(buf, "Maximum: "));
-	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
+	if (sscanf(start_loc, "Maximum: %u", maximum) != 1)
+		return false;
 
-	return maximum;
+	return true;
 }
 
 /**
@@ -6726,9 +6737,12 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
 static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
 				    unsigned int bpc)
 {
-	unsigned int maximum = igt_get_output_max_bpc(output);
+	unsigned int maximum;
 	unsigned int current = igt_get_crtc_current_bpc(crtc);
 
+	igt_require_f(igt_get_output_max_bpc(output, &maximum),
+		      "Failed to read max bpc for %s\n", igt_output_name(output));
+
 	igt_require_f(maximum >= bpc,
 		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
 		      maximum);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a58cb5cd3..cb3640976 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1238,7 +1238,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
 bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
-unsigned int igt_get_output_max_bpc(igt_output_t *output);
+bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum);
 unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
 void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
 				 unsigned int bpc);
-- 
2.34.1

