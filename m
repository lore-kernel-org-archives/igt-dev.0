Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADC1C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 20:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B5F10E288;
	Thu,  6 Mar 2025 20:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQNosNMV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6657610E288
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741291298; x=1772827298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7gQzY8wqe/p+yGJ4jOwJZGQfPTuPyejdP+bRjNSB45I=;
 b=QQNosNMVJNjZqFFiVj/1r/4N7F4/ditRzxODpt1CGubzidbzGVBs+gVq
 WfDDKRoaN84nPj4LAim7LWaRKFJY92v1THSYVIxuwHogEk8WGVjEgJi8q
 aFQzKhh41Bnw7gVZ3/4PP/2mtEMidm38cUgCd/QuhgjxaVD1bjAPBt+rv
 9hcjNrOM0/nlwbwhBdDo2s1Yx/MN0k1GyN8NBh9HY39Rg1iBRf6djzIX5
 IUirEphhwnYQD/2QodxSpGPhnJcGJOGw/AaFc25Vm+Uw8r3OMECsGkUbE
 o3ubWSzgxiqmgLCjorf5slfWSWKObT8IPnivBhnsK0KwBVL4b1426KxPU A==;
X-CSE-ConnectionGUID: jbnsvDp/QD29rsE4R7CkXQ==
X-CSE-MsgGUID: z2rDpsrjQ7mUW2+WEjqv+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42211424"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="42211424"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:01:38 -0800
X-CSE-ConnectionGUID: qQqdQIJMTRKHwojYFxEyHw==
X-CSE-MsgGUID: PitLYSKmRe+j/mkmRnSs4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149914012"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.143])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:01:37 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 i-g-t 2/2] tests/intel/xe_drm_fdinfo: Fail
 basic_engine_utilization if no utilization data
Date: Thu,  6 Mar 2025 21:01:18 +0100
Message-Id: <20250306200118.1771514-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
References: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
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
index f166b73d6..9a8811b4c 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -377,7 +377,7 @@ static void basic_engine_utilization(int xe)
 				   ARRAY_SIZE(engine_map), NULL, 0);
 	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
 	igt_assert(!strcmp(info.driver, "xe"));
-	igt_require(info.num_engines);
+	igt_assert(info.num_engines);
 }
 
 static void
-- 
2.31.1

