Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D78CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 14:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F89310E7CC;
	Thu, 18 Jun 2026 14:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsuCX7j9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB5E10E7CC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781791802; x=1813327802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIU0KpW5nS48as06pWf0pnp7KLUqQB/688JGyv0nOuw=;
 b=WsuCX7j91mEwbEpjx+2t8rQHYgklCZh6Gk4bHcZG59QzRRAF18auRp3G
 VMExVvS5TVdyCz9tXiqDGUBksQo/JwaSDISADb5jeNN9BjhjG/SCV4xSV
 kBZ4pYRqaiTqEd73em2St0Nu81YhP3ss0CmlQ1dIJkEstSL0RQ8kPy2D8
 ZgQyL8vWTuBi7h/KBXjTOJTb9kTjtGfZkqOmNR3mPpL7vM5+2rcwxDCyy
 tDnqQ1201n32w8ievwazJvKmmOnk/KjQiPXYwnaMJbAs72Xe6zZGoZbrq
 8pJjJRy7stw7y5+kIFZ4r4fwijHFBy0jEKD4myp72BYzINjewWOy5Z7LI g==;
X-CSE-ConnectionGUID: 1bHpSdp1T+iu/0nprp/dWQ==
X-CSE-MsgGUID: HfVWQCF8Rryufargfm8l3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86538743"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86538743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:10:01 -0700
X-CSE-ConnectionGUID: 3aNZX24pR2CFpRDF3lQJTQ==
X-CSE-MsgGUID: zIwRQs+EQ+mVlMtPrkWC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="286502535"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:10:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 1/5] lib/kms: simplify igt_random_crtc()
Date: Thu, 18 Jun 2026 17:09:49 +0300
Message-ID: <d19355cb9a4952af550912ef95fd4d79b653050c.1781791747.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781791747.git.jani.nikula@intel.com>
References: <cover.1781791747.git.jani.nikula@intel.com>
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

Now that igt_display_n_crtcs() reflects the actual number of CRTCs
again, we no longer have to count them separately.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e82d32130666..06138ad7125d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7922,16 +7922,11 @@ igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
  */
 igt_crtc_t *igt_random_crtc(igt_display_t *display)
 {
-	igt_crtc_t *crtcs[IGT_MAX_PIPES];
-	igt_crtc_t *crtc;
-	int n = 0;
-
-	for_each_crtc(display, crtc)
-		crtcs[n++] = crtc;
+	int n = igt_display_n_crtcs(display);
 
 	igt_skip_on_f(!n, "No CRTCs on device\n");
 
-	return crtcs[rand() % n];
+	return igt_crtc_for_crtc_index(display, rand() % n);
 }
 
 static drmModeConnectorPtr igt_wait_for_connector(int drm_fd, unsigned int connector_id,
-- 
2.47.3

