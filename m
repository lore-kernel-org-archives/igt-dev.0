Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF92C0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E876A10E73F;
	Tue, 11 Feb 2025 17:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzLYPXRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF27610E744
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 17:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739296218; x=1770832218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A/Kkm19iNMujfWtMGrmeN/m94vufiJSrqZM65B4V438=;
 b=WzLYPXRlQcOl25HryECOGsuQGxh1Bo8471LNl3ygQcByf19HQKZTIkeX
 CfdU1LbhaVxtabUW1iUERBnBk9bPJxXDzGpmYgJZ2Hi0dZrQz8yvyBEZp
 G4eMbMZ7t4iOzyVb/WziQ+R6epHjDULoeyGm83fWPsX3AUTmYYNRgFS7t
 Tj22UBeSNUVbPVZhLvvuu1NG6e8krqI4eBBn6JNEFWn8SOL94lYChbHXA
 Z0uyzV8luWvIOC1MumyDlQETM5oZMoTJ5HkVvQEvzw+bcy+3b4tyji8Jc
 nIQLtUDStGCY4cariDcYX7LTY+bt3HMcsHwaLemWz/Z0c9puWShPpWi3n w==;
X-CSE-ConnectionGUID: iRpJkQxnTjaK0G6X+J9FzQ==
X-CSE-MsgGUID: sRsXdH8zTvOlOa0CDPx6dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57339106"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57339106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:17 -0800
X-CSE-ConnectionGUID: NJMzu703RMOXhR6ZX49oCQ==
X-CSE-MsgGUID: ukCcUJysTc2kMyeHuMc6Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149767544"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:17 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 7/7] HAX: Do not merge
Date: Tue, 11 Feb 2025 23:35:42 +0530
Message-Id: <20250211180542.1430676-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

Don't merge, just for CI testing

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 3 ++-
 tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..668fb3888 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_dp_linktrain_fallback@dsc-fallback
+igt@kms_dp_linktrain_fallback@dp-fallbck
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 0234d3e72..28f8b5015 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Should be the first test
 igt@xe_module_load@load
-
+igt@kms_dp_linktrain_fallback@dsc-fallback
+igt@kms_dp_linktrain_fallback@dp-fallback
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

