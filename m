Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609A3F3C269
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19ADA10E15A;
	Mon,  9 Mar 2026 14:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4po5aWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503CC10E503
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066158; x=1804602158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9J45SuuCU1ArmQsBv//xcqUMP6A/PkW9NyIs7+Q4Iic=;
 b=n4po5aWB8UXRSERPxkv2UxnQK44b0pMqD2LWAeyE+ONVcBARwfoKyKgW
 5hQLam2WT5jyTtYQ3NUfvLJKIWnxDSu3Fztff3KbJo8SiD25Qpbdvqc8m
 LoTFCFwoGagNtyd+LkkAxCiwqlm8Cu0UO49iTikFpPSCumI7LONYqMB/4
 m5zLYIG+BJQZVvDPxEDRnQIuRGBGdVQZUNI+5gBfUOI6y0KMcIhtkM0bs
 QBmx3cDycmyvE0UiTcgs3rDe6B5R8arcESyNufzAaflHSnlv93x6x3Wtt
 mub0DjYnzOM7DiJirlGJgF5JQjrXt+5FTQk64YhMsrkSOSYcTbq6rcDYe w==;
X-CSE-ConnectionGUID: 39XpP0SPQu6F5ORr8b3AsA==
X-CSE-MsgGUID: Uzhhhpw/SvO9E4adRKcBeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91660533"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="91660533"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:38 -0700
X-CSE-ConnectionGUID: QuFBHNerQQq0lyuKMN9uBQ==
X-CSE-MsgGUID: CNFhqbMnTG+5QbUwE33I3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="250241432"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 09/10] tests/kms_cursor_legacy: use CRTC indexes instead
 of pipes for CRTC tracking
Date: Mon,  9 Mar 2026 16:21:43 +0200
Message-ID: <6290bd63ff9b874232d51882e3eb789f422335ee.1773066012.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
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

The test tracks CRTC ids in an array for picking random CRTCs. This does
not depend on pipes in any way. Switch to using CRTC indexes instead.

The test could be refactored to use igt_random_crtc(), but leave that
for another time, and do the minimal fix now.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_cursor_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 2d74c7cac8ba..5399ef4819fa 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -288,7 +288,7 @@ static void stress(igt_display_t *display,
 	if (!crtc) {
 		num_crtcs = igt_display_n_crtcs(display);
 		for_each_crtc(display, crtc) {
-			arg.crtc_id = crtc_id[crtc->pipe] = crtc->crtc_id;
+			arg.crtc_id = crtc_id[crtc->crtc_index] = crtc->crtc_id;
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
 		}
 	} else {
-- 
2.47.3

