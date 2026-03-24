Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903AAF532FA
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1BA10E637;
	Tue, 24 Mar 2026 09:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqS0YGX+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A89610E637
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774342939; x=1805878939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SpZYbHIPu/jfEHmk9WlYRLHeb7XQpw1Z+AOQeYSux4E=;
 b=UqS0YGX+AHbJeaSGwk2qZNSpRK96O5J4pQgzrOvGcpCgnn4zdGiyeynR
 mmnux1nAIqqoyMgUuCnL+6aG8yZEIDnWfzvjvk1WPh7c6lYrvcHgoGLq0
 w1acPo0X2a3zUR4V99PwzOX9WHBE2jSJu71Wk2YLyL7CVRx6zio1WTQ5N
 ynTdHpN9oUf8hWP5SbmEbsjeL4QTcotgQh7FIfQaQsKBOM7wFh1zsoJbD
 U/XySb6W8gAOYpv4g8oOG3pgt09PYi7icA5vCk2VuwqE8CnJFrZu5Mqd/
 q6ofiRV/Rk49vl4y5yqty1l+lR0++gQX3fLvNX+Ulu8HA8mEvcr+xBk9D A==;
X-CSE-ConnectionGUID: QHSQhU3hTq+maLt4yOu8+Q==
X-CSE-MsgGUID: nqbX3TyeS5yGYIw3ypso6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74536291"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74536291"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:19 -0700
X-CSE-ConnectionGUID: xv62MsmDRoWfgF/tD4oqdQ==
X-CSE-MsgGUID: XNxV225KQDGRjoaLDRJUyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="224526801"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [CI 5/5] lib/kms: convert igt_crtc_for_pipe() into a proper function
Date: Tue, 24 Mar 2026 11:01:51 +0200
Message-ID: <34be225409522d0697318b37cdbf0ee78fce41d5.1774342824.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774342824.git.jani.nikula@intel.com>
References: <cover.1774342824.git.jani.nikula@intel.com>
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
index 481b893fc025..56289eec55e5 100644
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
index d7cc22d6cd61..10ef5a56a1ed 100644
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

