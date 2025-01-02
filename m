Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1E6E77197
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 05:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ABC10E2EB;
	Thu,  2 Jan 2025 05:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnAvPIry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F4210E2EB
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 05:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735796736; x=1767332736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VRMITSZb/AFzR78scBWgGk+RwNhk5JOfOg60kiPx7Ck=;
 b=MnAvPIryKid/P0poujNyQrnvUKzck+H0lezfYvETtYeU/Bo6jS7ESwJF
 SAApfV0Fg8A5tN5Dn+Hl6k7m03Nsi4XkdR93o/8JspRr0ZsIVbrH0LpSa
 bOk144xMOr5r8fcno4FlufUoiHuZb5gZaRHD7qwrgelHSgWNV0VR0rk0t
 GmFCfLsE+htPUsuug8+fV/T3NIrdJCzbEPSYvIYoUF4dlmAnjj9EIHfyF
 Eu1CQLrSX1hDBI8JiLSjJSG0BCpuAAnuA04g3HNf1wWVRZ9AAYagzJAFn
 7Jf2Xr4nNpbPm11mz9IyfYb64p9lpA52Eajw3sBzXW9akafai8so7STo1 A==;
X-CSE-ConnectionGUID: FXmTuGY1RlyVHsy+8PqDWQ==
X-CSE-MsgGUID: Cy+w+/aNQ0q/qOEG3M/wvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35335278"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="35335278"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 21:45:36 -0800
X-CSE-ConnectionGUID: MDxBn9YMSSSQd5bSW34vAQ==
X-CSE-MsgGUID: 0QzL8j1gQViqv94Wv/ATBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105457686"
Received: from unknown (HELO
 dg2setup4-CoffeeLake-Client-Platform.iind.intel.com) ([10.145.169.180])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 21:45:35 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 2/2] lib/igt_kms.c: Enforce strict check for
 bigjoiner_possible
Date: Thu,  2 Jan 2025 11:14:57 +0530
Message-ID: <20250102054457.58520-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102054457.58520-1-santhosh.reddy.guddati@intel.com>
References: <20250102054457.58520-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
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

update bigjoiner_mode_found to check for ultrajoiner possibility.
This ensures that the mode is only set to bigjoiner if ultrajoiner
is not possible.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a67d17c4f..9fafd0ce0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6419,10 +6419,12 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	bool found = false;
 
 	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
-	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
+	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock) &&
+		!igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
 	if (!found) {
 		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
+		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock) &&
+			!igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
 	}
 	if (found)
 		*mode = connector->modes[0];
-- 
2.43.0

