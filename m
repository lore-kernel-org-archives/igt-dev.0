Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE04B108B8ED
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606610EA71;
	Fri, 20 Mar 2026 10:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQSoCEMR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2F410EA71
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003232; x=1805539232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2rLdK9P4gAff1C0POCuGyuOg+APCwAghD2syhH+b0Y=;
 b=EQSoCEMR7hWqAbX7uyhe31lix9Xk0z3tE2fcBNPd+Z5364r1L0LJcj86
 W7t04TcndKnrECsbPdN7+jMClSDWlFtDHXypYWUKbvYw1h5w5jfATKbgG
 xeE4CUhSTKdi9A2SDg6bjpPWQCU80HJ0ZEpjznuEEOvzzHAnfLmcZ274q
 eXbP1TEiE5EUJsWrHuRiaWa9a9HVrfbXKVhY3h5Bx2s7m0Pk5WDB8QsQ1
 M6mf5B5Wmkp5anPyieQ2sUnKBMjqxeikKsW8cFQ9cvXAwTxkPtEk4dou3
 EK54337J4hXcQtelOo+zypo64NhgWdCdZ5I/D1MZ5YEwb8rPYQ56l25Og g==;
X-CSE-ConnectionGUID: cG7mCad6Q1qYZTbdaFLlcw==
X-CSE-MsgGUID: tno+AoV4TTa5F3yJHJbj8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75052796"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75052796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:31 -0700
X-CSE-ConnectionGUID: uEA2FbF/QhyibPoD3Ksa3Q==
X-CSE-MsgGUID: bB9BzYL+TKm9UxJhH/xk6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223276367"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2 11/11] lib/kms: convert igt_crtc_for_pipe() into a
 proper function
Date: Fri, 20 Mar 2026 12:39:31 +0200
Message-ID: <5e3b6c23fcb58fd433e23f5ecedc5f194d5f99ad.1774002591.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774002591.git.jani.nikula@intel.com>
References: <cover.1774002591.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 8 ++++++++
 lib/igt_kms.h | 8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 197ed15d1380..ab120c807151 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8065,6 +8065,14 @@ igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
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
index 71ed4604e7e0..887099a7084d 100644
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

