Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5E2EA812D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7418910E5AB;
	Tue, 10 Feb 2026 15:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtCrcdcg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9ED10E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737103; x=1802273103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKLutSLFXOJ0OFFqR7fY3ZVqG0dV4n+xLOd99BLrHXg=;
 b=BtCrcdcgYFNJ1GwTer+a+Qu5KnoP+v2c0Em3nhSfo65vWpTR4wxveDDU
 YoBUTHpGeJec1p+t9NHSkZBcaau92/U8GdCn2cQAuMqqzP86O4rBLpo/c
 dWL8ChmXUUsB6AEhkvgfunmcmsTufezF4QiLwBhOTIN6zx4fo4X1ukmkm
 VtTqhYXadC0rwoDXdZb9SozrcwFKgs7pKpioT6fYU2httRQNZIpRyprHl
 /AifWRM0wDscOpfW7pSi4wl+yF7lqBYtoUu8NcvJ1E4Hs3jfG1yjCSsRQ
 1bxx+wpOUUYm+fgAXICkP4xDuv8sOdxOr5I7WCpNADpP7UlIS6RsLejBh w==;
X-CSE-ConnectionGUID: OnFGIUjJQQ6DKYJoupVYfg==
X-CSE-MsgGUID: TE8UL/AlRuiHY0S5lHHfXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71912108"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71912108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:25:03 -0800
X-CSE-ConnectionGUID: qqJZI6uYRl6ArujrcXcuJA==
X-CSE-MsgGUID: EzmdngreTqqgNW9DJOlHxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212030422"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:25:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 10/11] lib/igt_kms: pass crtc to igt_crtc_init()
Date: Tue, 10 Feb 2026 17:23:51 +0200
Message-ID: <38cb7c5f5bda2294b5d38a75028bf12cb32f5cb2.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
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

The function immediately just figures out the crtc pointer. Pass it in
instead of the pipe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e6f45bb0ef9d..401b8d988309 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3062,10 +3062,8 @@ static void igt_crtc_plane_init(igt_display_t *display,
 	igt_fill_plane_format_mod(display, plane);
 }
 
-static void igt_crtc_init(igt_display_t *display,
-			  drmModeRes *resources, int i)
+static void igt_crtc_init(igt_display_t *display, drmModeRes *resources, igt_crtc_t *crtc)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
 	int crtc_mask;
 	int j;
 
@@ -3214,7 +3212,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	display->n_colorops = 0;
 
 	for_each_crtc(display, crtc)
-		igt_crtc_init(display, resources, crtc->pipe);
+		igt_crtc_init(display, resources, crtc);
 
 	drmModeFreeResources(resources);
 
-- 
2.47.3

