Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C488C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 18:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9AD10E695;
	Tue,  4 Mar 2025 18:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msrWEnGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF9510E695
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741114628; x=1772650628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EgV+vs7rv6vCfKGkKFnfOwVpvTARvxA+tzbVAeBHVdM=;
 b=msrWEnGGou1dMCr/KKicoGMPRLiQ9O6W40+bqiqWCzOgZ4cSTw09MzJm
 1+wZZBsPTalgL2Oa02r+OVCp9OAY8puueDdIYpFQoc2s9Nur7PKIIQ0cH
 4/l1kR0YPTy4943jAJgbS7na6v8P26IDX+e8Np2PlaeKw/qQxD72obK0c
 H7PTvOvD2oylEHKROW2ACWBieO0jcLg92AR1xtRT4fd0nmHblftr3AFtu
 iftB4lcVb/1PmnQ0uuB7oc1gKB8aFEUCTjvnLs4Dwpkmcu+G+rvOtdpiz
 NDxzUwRgmr80ZLXKzAktyDaHZwUC1vsBpXXmhLIf6fztLVpKrmCBN53lX g==;
X-CSE-ConnectionGUID: 8dne0zwxRbi6QpJbg4iP1g==
X-CSE-MsgGUID: kPggJzwiTxuI/sLgn6nYSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53453149"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="53453149"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 10:57:08 -0800
X-CSE-ConnectionGUID: s2diPhBbRvO2qYQvoAY6Mg==
X-CSE-MsgGUID: XqTcyXxQR4ScsY2ncJxL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="118284324"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.17.221])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 10:57:06 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_drm_fdinfo: Fail
 basic_engine_utilization if no utilization data
Date: Tue,  4 Mar 2025 19:56:40 +0100
Message-Id: <20250304185640.1333849-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
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

Replace igt_require with igt_assert to enforce that num_engines is
nonzero rather than skipping the test. This ensures the test fails
explicitly if engine utilization data is missing.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index d18fe10d8..ddf6efb2b 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -367,7 +367,7 @@ static void basic_engine_utilization(int xe)
 				   ARRAY_SIZE(engine_map), NULL, 0);
 	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
 	igt_assert(!strcmp(info.driver, "xe"));
-	igt_require(info.num_engines);
+	igt_assert(info.num_engines);
 }
 
 static void
-- 
2.31.1

