Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD3EF46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D346410E4A5;
	Mon, 16 Mar 2026 11:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyXRsy+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1416910E4AA
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773660018; x=1805196018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r7H2c7E4QwSgi/Wa2M9yGAWiWIJKNST0jAeWmFl+lSQ=;
 b=gyXRsy+lO7RRAetF80QrBkLewt6o46YbGIeI+WtYdiDHvdag7T2cjPFw
 YkEKuL/oqhvcPiCN8x6iz5YWw9b+k2ILtLYJiORlYZrxQ6DAm7UgWra4I
 C9jI4IFml4+TlKOBdsRJ7ACIhRDP6B8W22KxdldHA6mqzWppsWSFCcfFX
 YGFp+zJ8KggjS1fcpg9IFyO93QSKzkhdurCeGf1qube1GvsHSuHKviBcS
 OwPDtu/rAWLXVpqk0zCeav7kEdxjCrRnC481wVDmgcZGieKthkxP4ECdx
 U7gR1KT/cNxjndACOk3qThGSEja0kA1RHMHpbSS1xVaAJZtYXhh4266P7 w==;
X-CSE-ConnectionGUID: l3OvuNIpQDu/XGbsx+sIjA==
X-CSE-MsgGUID: PJiElIJ/RV6gZhYPGpv8SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78277275"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78277275"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:20:18 -0700
X-CSE-ConnectionGUID: aEVJGPg4R3ucs9mo2oTHow==
X-CSE-MsgGUID: 3RwQs2eeSOCMC3C+WchtOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226002323"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:20:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 12/12] lib/kms: convert igt_crtc_for_pipe() into a
 proper function
Date: Mon, 16 Mar 2026 13:19:14 +0200
Message-ID: <3f8e3317c1ecfc76349221d0ffdbc2f50b87a9f9.1773659680.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773659680.git.jani.nikula@intel.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The usage of igt_crtc_for_pipe() has been reduced so much that having it
as static inline is no longer justified for performance reasons. Prefer
hiding the implementation details instead by turning it into a proper
function.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 8 ++++++++
 lib/igt_kms.h | 8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 57f5e099a313..e831e3938f12 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8032,6 +8032,14 @@ igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
 	return NULL;
 }
 
+igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
+{
+	if (pipe == PIPE_NONE)
+		return NULL;
+
+	return &display->crtcs[pipe];
+}
+
 /*
  * igt_first_crtc:
  * @display: pointer to igt_display_t
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0bb2734ea3d7..19ebaf199d9b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -575,15 +575,9 @@ int igt_display_n_crtcs(igt_display_t *display);
 
 const char *igt_crtc_name(igt_crtc_t *crtc);
 
-static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
-{
-	if (pipe == PIPE_NONE)
-		return NULL;
-
-	return &display->crtcs[pipe];
-}
 igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id);
 igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index);
+igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe);
 igt_crtc_t *igt_first_crtc(igt_display_t *display);
 igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
 igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc);
-- 
2.47.3

