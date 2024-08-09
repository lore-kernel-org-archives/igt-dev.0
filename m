Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E39C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 11:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA57E10E8B9;
	Fri,  9 Aug 2024 11:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKxWZE1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0441C10E8B9
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723201299; x=1754737299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPNX8wzUrubNqwu7khnbdhluM6MuHdBnrPr68bWejNQ=;
 b=BKxWZE1w2HkQyKL11EdyMCZ6FdnIv/h6zJijGSbRWv4P9W57NroOBw++
 4ckZ9B3XjJKslw1SvgevM9F48j3CvdWZVBAy2DPXT4g8FNUiwP+VKq6xd
 lbYAIsBLmGSPIYg4RgBiUIG6l3+52WU0gCSHCStpqgamK9w2Tek0es76g
 AZqhG7Sc6xJewWK4R4hPWZkj6u/NASOBkxRTPP0UhuvJnMB7ynPT/1Liu
 obTowSefRND6h11T5qxMMJSlLRe0D6j3nhKBrsKQMO4uhlTlblKxp9JnO
 xH/MvX9SJdFlbqRASDno72RUwMv0BgAJLUh9iCDcUL5FP/2+KpQIi/f9f w==;
X-CSE-ConnectionGUID: qZtbnmT9QEGmzv8n9vaMgw==
X-CSE-MsgGUID: GN8UTfS/T3iC2WiHUmk12w==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21495643"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21495643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:01:37 -0700
X-CSE-ConnectionGUID: VIDmzpzCQF21dzQbetQ42w==
X-CSE-MsgGUID: zXl1rOlVQEOTlyzta+1ISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57503172"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:01:35 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 4/4] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Fri,  9 Aug 2024 13:01:12 +0200
Message-ID: <20240809110112.25685-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809110112.25685-1-kamil.konieczny@linux.intel.com>
References: <20240809110112.25685-1-kamil.konieczny@linux.intel.com>
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

Test solution which should allow igt runner to properly
classify xe_wedged tests as success, so adding two into
xe BAT runs:

igt@xe_wedged@basic-wedged

igt@xe_wedged@wedged-at-any-timeout

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..4c53839be 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,12 +1,16 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@xe_wedged@basic-wedged
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@xe_wedged@wedged-at-any-timeout
+
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.43.0

