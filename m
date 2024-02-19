Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FB8C48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 16:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FD410E3E8;
	Mon, 19 Feb 2024 16:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZP3ELFyB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7136E10E3E4
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708359845; x=1739895845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i95+Kt9olPxMwKJeVbGZU+8DU782cyf6XmXYzw5l0uw=;
 b=ZP3ELFyBUjVqVp6MgbYgnTwgnqpngaVcEP1U5Nl0qRWYx78rbOUSyQ8N
 3F1IZXalj7Mgh2N8q/au7qvkpJgayDTN8THLmvaTkWG+eXa5ufb0DrHbf
 KWerAcwd/GbFJhrJIVgFf2zVlW6vNbfaY1EnO7gNEceSocIJUaZEUah1r
 oWoLX62roDGMu+P1/IJs3Hf/OpDiIunnfkZXrt5rm9PCk4paIDSlJnCH3
 MAhL555kXvKAAcV0EiJ/tR9ZfBHI0RE9UunIMW/7m+y2PpiliGaWhbbhm
 mCR3o4kMVxyJujNLXx1Kftd2FlByUGwK9l2qy8B56a/dWB03JaHiIU5w1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="12994803"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="12994803"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 08:24:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4439358"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 08:24:03 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_psr: add support for PR selective update
Date: Mon, 19 Feb 2024 22:03:32 +0530
Message-Id: <20240219163333.2339647-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219163333.2339647-1-kunal1.joshi@intel.com>
References: <20240219163333.2339647-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

adapt to kmd changes to support PR selective update
https://patchwork.freedesktop.org/patch/575163/?series=128193&rev=3

v2: "PSR2 selective fetch: enable" valid for both cases (Jouni)
v3: use check_psr2_support (Jouni)
v4: split patches (Jouni)
v5: drop changes on psr2_sel_fetch_to_psr1 and *_restore (Jouni)

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 20 ++++++++++++++------
 lib/igt_psr.h |  2 +-
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index cad8cce05..6008b73a6 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -41,7 +41,7 @@ bool psr_disabled_check(int debugfs_fd)
 	return strstr(buf, "PSR mode: disabled\n");
 }
 
-bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t *output)
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 {
 	char buf[PSR_STATUS_MAX_LEN];
 	char debugfs_file[128] = {0};
@@ -248,7 +248,9 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
 	case PR_MODE:
-		return strstr(line, "Panel Replay = yes");
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
+	case PR_MODE_SEL_FETCH:
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
 	default:
 		igt_assert_f(false, "Invalid psr mode\n");
 		return false;
@@ -317,7 +319,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
 		return false;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	ret = psr2_selective_fetch_check(debugfs_fd, output);
+	ret = selective_fetch_check(debugfs_fd, output);
 	close(debugfs_fd);
 
 	return ret;
@@ -343,7 +345,11 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
 		return ret;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	if (psr2_selective_fetch_check(debugfs_fd, output)) {
+	if (selective_fetch_check(debugfs_fd, output)) {
+		/*
+		 * With below we switch to PSR1 incase of PSR and
+		 * Panel Replay Full Frame update in case of Panel Replay.
+		 */
 		psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
 		ret = true;
 	}
@@ -389,11 +395,13 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
 
 	if (strstr(buf, "Panel Replay Enabled"))
 		return PR_MODE;
+	else if (strstr(buf, "Panel Replay Selective Update Enabled"))
+		return PR_MODE_SEL_FETCH;
 	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
-	else if (strstr(buf, "PSR2 enabled"))
+	else if (strstr(buf, "PSR2"))
 		return PSR_MODE_2;
-	else if (strstr(buf, "PSR1 enabled"))
+	else if (strstr(buf, "PSR1"))
 		return PSR_MODE_1;
 
 	return PSR_DISABLED;
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 372bef2b2..e8595fd8c 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -46,7 +46,7 @@ enum fbc_mode {
 };
 
 bool psr_disabled_check(int debugfs_fd);
-bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t *output);
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
-- 
2.25.1

