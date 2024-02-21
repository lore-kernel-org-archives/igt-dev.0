Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD89FC48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 08:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5484F10E2E1;
	Wed, 21 Feb 2024 08:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MU2HHTqt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AF210E2E1
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708505544; x=1740041544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uQIIabMn6ET2GyCQFr/ta8DNtR2TuBPbofYSkbwhwZk=;
 b=MU2HHTqtBkRpaymJyRPR+dmgS989U9XI33UX0du5BEv9unUrF1CNSd6m
 QLb30Me2savG2AvX5w3WUTZZLzyNX42pg+XmZjSWXy0GbpFL8xKNYzDC+
 sy1/l8cP5dMre1PZfN5lNyijU/CAP8d4O7vbGd7QazxKYCt3iNgchZp+i
 YNDK74yGFNIsczA4QnJTNX+I3xC6oO6tJ4SHV3N2FmBraRwzQbNK8lXO+
 j06HMoeb1GrAoUTs+rFv+l28tiqQpvMb4rkIz+kU10v37O25pv2/Qg8xy
 bTbUklGyHUu9PdALq2uS1i+QQr32lbCiU6j2ap5NYKHX7ByZJLp/6AtL1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5607573"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5607573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 00:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5041099"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 00:52:22 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_psr: add support for PR selective update
Date: Wed, 21 Feb 2024 14:31:47 +0530
Message-Id: <20240221090148.2447585-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221090148.2447585-1-kunal1.joshi@intel.com>
References: <20240221090148.2447585-1-kunal1.joshi@intel.com>
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
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
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

