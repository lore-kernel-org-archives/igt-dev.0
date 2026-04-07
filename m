Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5B5EDB7E3
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 09:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722CC10E3BB;
	Tue,  7 Apr 2026 09:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JToMubmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D63110E2EF
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555974; x=1807091974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yC7r1XN2M/FVRK7JXfejRxn0IypJ5oINJKH3eP0JAcs=;
 b=JToMubmFU9aeg8C9/zbM4ELhnLSrK5lxk3mdwwyOIW2nMDo46rB6HJLl
 ZaPBfb/Qvpq2HohfrcdsbwTlc/SQJ4omucrCfLGWdtsmVBce4pCUZv7P5
 kE8Rc1X0xkMkvKqaqtRG21aOm/2JB5iJg8COHzUuPxH1yfhZpmFhzLWdP
 J5JcUEb+SuXwVw2OS6RtTN1/Y/YLVTnmjEJLLYZAfsC+9zSQJXYZOkVGi
 RRS++wlQd1JuSssOZULE5/tKlbLnWOc7Z+ktpW9gsZ1ofh4KzAudpNrUz
 bkjJAg/4XSL3NQNUtfVtX8A1qw2NP1E88BJ3LzxBG6xmF5gxImtbr+DjS g==;
X-CSE-ConnectionGUID: b5icQjVMQ/K4WCq4dQgkAw==
X-CSE-MsgGUID: Ss3L1eijT0id6qwVssAuDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87589082"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87589082"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:34 -0700
X-CSE-ConnectionGUID: yQttNCC4SNCFWzn44/SCRA==
X-CSE-MsgGUID: K6eOdNA0SXqfBakJ/vka4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228400098"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:31 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH i-g-t v2 4/8] tests/intel/kms_frontbuffer_tracking: use
 intel_fbc_get_fbc_status()
Date: Tue,  7 Apr 2026 12:58:39 +0300
Message-ID: <20260407095843.43679-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407095843.43679-1-vinod.govindapillai@intel.com>
References: <20260407095843.43679-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Use the common intel_fbc_get_fbc_status() to get the fbc status

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 427cf3262..602dd86d0 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1574,8 +1574,8 @@ static struct timespec fbc_get_last_action(void)
 	char *action;
 	ssize_t n_read;
 
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
 	action = strstr(buf, "\nLast action:");
 	igt_assert(action);
 
@@ -1623,8 +1623,8 @@ static void fbc_setup_last_action(void)
 	char buf[128];
 	char *action;
 
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
 	action = strstr(buf, "\nLast action:");
 	if (!action) {
 		igt_info("FBC last action not supported\n");
@@ -1642,7 +1642,8 @@ static bool fbc_is_compressing(void)
 {
 	char buf[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(buf, "\nCompressing: yes\n") != NULL;
 }
 
@@ -1657,7 +1658,7 @@ static bool fbc_found_skip_reason(void)
 	char fbc_status[128];
 	int i;
 
-	debugfs_read_crtc("i915_fbc_status", fbc_status);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
 	if (strstr(fbc_status, "FBC Enabled\n"))
 		return false;
@@ -1675,7 +1676,8 @@ static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
 
 	sprintf(buf_plane, "%d%s", plane_index, igt_crtc_name(crtc));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(strstr(buf, "*"), buf_plane);
 }
 
-- 
2.43.0

