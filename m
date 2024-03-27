Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D300FCD1280
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 05:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A42810ED34;
	Wed, 27 Mar 2024 05:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAaOxUJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1FB10EEAC
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 05:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711518490; x=1743054490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYtsVBT2K79etpi00/vKpg96GqZP/Sj9VFS6ikeHIJ4=;
 b=SAaOxUJqxfOuBmE5fE3Jxgon20hHcNnXdbHbA7Ymc2A7/Vngod2/JpU3
 tpoX+QPbXadcMaJGaNn0tq/d6uOhuVJUuSEHm6MxvxAxk7sEyzVgzx8o2
 5KUlIGWvwzNt0gx1pOpzVq8FMN9ioI8rmRhcbZHtfDJV435kVMKNJs2m0
 3XecBbO+YsgVu3qZVP2Lccy7nET3dU3wi+7NSsUwG6Er3WJ6AlbQ8ItaK
 FmjZK3Q8xmVXBRJJBnrpKAkWOI7vnns+1xwLPHOYDG8L3FYdvmgmoMxBg
 QscAe6E0VMkRCCREYDkqDhCwexBVax08P9n+USOBWQPJqhKDZHOvNO0EY w==;
X-CSE-ConnectionGUID: WSdtaNXeR3CdsHMGbig5GA==
X-CSE-MsgGUID: jTegTVaORzWlYqCB9uXBvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6710548"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6710548"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 22:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="16569667"
Received: from andrea7x-mobl2.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.39.156])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 22:48:09 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_fbt: Remove checking display_ver
 for fpcpsr tests
Date: Wed, 27 Mar 2024 07:47:50 +0200
Message-Id: <20240327054750.159017-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327054750.159017-1-jouni.hogander@intel.com>
References: <20240327054750.159017-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We have now solution to check if fbcpsr tests can be run which works for
any display version. Remove redundant related display version check.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 6d5395a0c..e45d17dd6 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2925,13 +2925,6 @@ static void check_test_requirements(const struct test_mode *t)
 
 	if (opt.only_pipes != PIPE_COUNT)
 		igt_require(t->pipes == opt.only_pipes);
-
-	/* Kernel disables fbc for display versions 12 and 13 if psr is enabled. */
-	if (drm.display_ver >= 12 && drm.display_ver <= 13)
-		igt_require_f(!((t->feature & FEATURE_PSR) &&
-				(t->feature & FEATURE_FBC)),
-			      "Can't test PSR and FBC together\n");
-
 }
 
 static void set_crtc_fbs(const struct test_mode *t)
-- 
2.34.1

