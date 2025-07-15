Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB875C83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 11:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8929010E59B;
	Tue, 15 Jul 2025 11:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGjVUZ7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A059010E59C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752579446; x=1784115446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QepGE5zM6+iBdtnYev49qillM4gMG4+/N8jDLU129jU=;
 b=BGjVUZ7wHyx9kaImj5fC/+IoC7do9Gi7dAOUvTkD0WlyjYBwRme8ABsS
 nZA6KeQzGQOrSxwuYDa4ehLcf2gigJUa8su2OLwdNKMW59HWA7cO/bHvu
 ++dc1nGTt9NXOs+RQgIm+18424Ja+OnymGWmDxnYfco9U2d55amsoNmVe
 FJUnJgSD8KFoEQvfhnRP5GktmV6Gv5DBx/yNiY++6UVhhPn6p25cVkmDJ
 2hI13/aBACTCbsAwumCi//Ulvsjj6tvXQjVdkxQDCP6TbDyllY6dsaTqX
 K4dhbdxCs7HeoJxmZ0AoiSGgSbnsr8CODKj57eXf4tlyYDNgNg5akv3EG g==;
X-CSE-ConnectionGUID: 59OQe8KQSjmR8ypT+apqow==
X-CSE-MsgGUID: fMs+FxVtScexpTZ3Fzb0Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54948552"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54948552"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 04:37:26 -0700
X-CSE-ConnectionGUID: mm9DffdXT/2IoepGoN3WKQ==
X-CSE-MsgGUID: bCVQ5lcXQfWXAhpF78TedA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161758091"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP; 15 Jul 2025 04:37:25 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_frontbuffer_tracking: pass non-NULL
 output pointer
Date: Tue, 15 Jul 2025 13:38:22 +0200
Message-ID: <20250715113822.831686-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250715113822.831686-1-michal.grzelak@intel.com>
References: <20250715113822.831686-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Currently, there is NULL pointer passed to the test as output. Pass
non-NULL output pointer to the test.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 66dcdc281..c55b296ec 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2329,7 +2329,7 @@ static void do_status_assertions(int flags)
 	}
 
 	if (flags & ASSERT_PSR_ENABLED) {
-		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
+		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, prim_mode_params.output),
 			     "PSR still disabled\n");
 		psr_sink_error_check(drm.debugfs, PSR_MODE_1, prim_mode_params.output);
 	} else if (flags & ASSERT_PSR_DISABLED)
-- 
2.45.2

