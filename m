Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE585EA812E
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9018E10E5AE;
	Tue, 10 Feb 2026 15:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6a6WrrU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA4110E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737108; x=1802273108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K8fOu9c+M/t8oFi/x5b8hlDHsuD08slVhn6sd/kbNv4=;
 b=l6a6WrrUXJHlTi5TJifDZllJ2vKI6F77rzFz3kwxNbmEFRE3ymDQXKTd
 PFjd6Aq0TyCWWFBkxZ70Ae8cVy5PxYiu7C7qRdjOPp1d47/amRtjdEJY3
 dB99qRSZFngu5ila7ZaaaxQY66qZpissJ7+cI20cooAPpjdo137Wch0h9
 AUPTvfi0ZLX84WWMrjG+A0iCc7IpQasSZu+wjC6eZa+kvGFwtLfqV2OZD
 PM6Qe2T0X0h2T3zqTEnRWV6hUFxpIv0NGzm01cOQCt+6e3GAPgFqxyapq
 7p5fHVLiSz6TFqAVVa23+r/UUonQTQshXbUbXwfNDjIOwS8BWyq/Dpd9C g==;
X-CSE-ConnectionGUID: NjJM8zZSTQ2UHLYAzoD70A==
X-CSE-MsgGUID: YBkieAIpTX2r5RpSf4J4Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71912110"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71912110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:25:08 -0800
X-CSE-ConnectionGUID: 86YicO8oROyGCR9LYJ4miw==
X-CSE-MsgGUID: EBnWCGEbSfWb/qK9pV2o9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212030462"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:25:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 11/11] lib/igt_kms: use for_each_crtc() for cleaning up
 CRTCs
Date: Tue, 10 Feb 2026 17:23:52 +0200
Message-ID: <eaea641bf51adf9ad79ade3268f054a91f14b9c3.1770736961.git.jani.nikula@intel.com>
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

Avoid open-coded iterators where possible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 401b8d988309..20922d3cdbb1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3410,6 +3410,7 @@ static void igt_output_fini(igt_output_t *output)
  */
 void igt_display_fini(igt_display_t *display)
 {
+	igt_crtc_t *crtc;
 	int i;
 
 	for (i = 0; i < display->n_planes; ++i) {
@@ -3421,8 +3422,8 @@ void igt_display_fini(igt_display_t *display)
 		}
 	}
 
-	for (i = 0; i < igt_display_n_crtcs(display); i++)
-		igt_crtc_fini(igt_crtc_for_pipe(display, i));
+	for_each_crtc(display, crtc)
+		igt_crtc_fini(crtc);
 
 	for (i = 0; i < display->n_outputs; i++)
 		igt_output_fini(&display->outputs[i]);
-- 
2.47.3

