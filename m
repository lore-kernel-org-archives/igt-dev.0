Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD36C001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3B6113410;
	Wed, 17 Apr 2024 11:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+qc70Vm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90D511340F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713353567; x=1744889567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6klLX3Qqv7/at4X+2C0QK3pqWYWDbtpT5y1d68Wzeg=;
 b=F+qc70VmUBzGZ6oYTrm5LP15xpz62O7Revz+kiQ1Xwx1agg9WsPt5g+P
 6X47hskJztm4nBGaCZBW2YkldjoROhzKeoiOQ6wtkxoevu/iLVChP2wRh
 Vo96XgJIQay57zGCVdeNwmkQxTsQ7W8twB4g7Kmc9B0kdj4RA5dJlOGYB
 FOHO5p5UW25l7qJkso02HBDMtSyA8EO+tHRKTVQn53xNZjozocI7lFLM5
 KJmRQzQaSQsTaZNHsMqyc2si97InH3zorrJGHwrQECvRLXDQ7MVdjDE8e
 DmuXwxEHUfLrbIba99WqRUaNi/c8Jtro8VfAST2mdsg3/XsJXsLfwDfRU A==;
X-CSE-ConnectionGUID: 9/0cRpkQQQqfCFqr+Zp9eg==
X-CSE-MsgGUID: 6UGzMlIXQguVuNUbIEMsjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8719257"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8719257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:32:46 -0700
X-CSE-ConnectionGUID: 14aavK9vS/+c/cMoRhoC3Q==
X-CSE-MsgGUID: QpbctF+SS3ii3jW8pRmHEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22658162"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 04:32:45 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 6/6] HAX: Do not merge
Date: Wed, 17 Apr 2024 17:13:26 +0530
Message-Id: <20240417114326.2245087-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240417114326.2245087-1-kunal1.joshi@intel.com>
References: <20240417114326.2245087-1-kunal1.joshi@intel.com>
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..0fc41236f 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_big_joiner@basic
+igt@kms_big_joiner@invalid-modeset
+igt@kms_big_joiner@basic-force-joiner
+igt@kms_big_joiner@invalid-modeset-force-joiner
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

