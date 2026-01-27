Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D78D2F000
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6D210E54C;
	Tue, 27 Jan 2026 11:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXqdqsu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0449D10E54C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769514988; x=1801050988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4v5nNwafts2KfsFJjjrVkyfQlXsCLzY6awA0sMckw7g=;
 b=SXqdqsu9j5Oqj7C0/i4jMclDpMghLltSBQTFRsppmSCOpRJSjdoPGP/v
 HfVPQWNgjS2q1k+IC5h2RuV7cUcU+zD5/dewHLiFJYnEzr69qa1rV7n0B
 t9dp9hykbZ9y98dfnYLGOGeir2jOX/N8Vjsp2nhMlsDWTS1Qn5ojWG5zG
 wkePrCAes6BVJ16nQTsViiGIiH2Jl8AZ5Rvbxw2qiZufYskU4CrX1jI8E
 drz1ztTona6IfGbfj3v7N84tb+lYgDBiAogK7JFt6xSujLcWN5iEZYNLk
 KUf2ypVdpo8uja5CVoDMMaE+8YfGDi7NutO1ynMxPwZs12SUsoBXsBjYT w==;
X-CSE-ConnectionGUID: QXnnmdrlRuKpWkcnmlHaSA==
X-CSE-MsgGUID: F7iI410lQcGnn6VavAR54A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81011353"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81011353"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:27 -0800
X-CSE-ConnectionGUID: QF82slYwRKiRtJh48deJLg==
X-CSE-MsgGUID: YZ1IgYuMQoqjBZdqwlAxpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208010886"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 3/8] tests/kms_setmode: drop redundant drmModeGetCrtc()
 call
Date: Tue, 27 Jan 2026 13:56:00 +0200
Message-ID: <ff336fd29c37b5fdb5a75c39cc28ee478a9f7b93.1769514879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769514879.git.jani.nikula@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
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

In setup_crtcs(), drmModeRes *resources is the result from
drmModeGetResources(). The resources->crtcs[] array already contains
CRTC IDs. There is no point in the drmModeGetCrtc() call to get from
CRTC ID to the same CRTC ID. Remove it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_setmode.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 108e713610fd..e17edb0d0dd0 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -343,17 +343,13 @@ static void setup_crtcs(const struct test_config *tconf,
 	config_valid = true;
 
 	while (i < connector_count) {
-		drmModeCrtc *drm_crtc;
 		unsigned long encoder_mask;
 		int j;
 
 		igt_assert_lt(crtc_count, MAX_CRTCS);
 
 		crtc->crtc_idx = cconf[i].crtc_idx;
-		drm_crtc = drmModeGetCrtc(drm_fd,
-					  resources->crtcs[crtc->crtc_idx]);
-		crtc->crtc_id = drm_crtc->crtc_id;
-		drmModeFreeCrtc(drm_crtc);
+		crtc->crtc_id = resources->crtcs[crtc->crtc_idx];
 		crtc->pipe_id = kmstest_get_pipe_from_crtc_id(drm_fd,
 							      crtc->crtc_id);
 
-- 
2.47.3

