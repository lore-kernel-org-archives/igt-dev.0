Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C50C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 16:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8BF10E798;
	Thu,  8 Aug 2024 16:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjAEmoUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B8510E798
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 16:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723135704; x=1754671704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPNX8wzUrubNqwu7khnbdhluM6MuHdBnrPr68bWejNQ=;
 b=GjAEmoUZUZqm1gvPbN+uSbSmHOw67O5x+w6BQAa4HBEa1IvEEKgnBepf
 o4L5HosFA3TKWzkxADS63xixBSs2ewmLP+IDxnaxJMUjvLyuQh17q3pRm
 mCzNQ6jFuB6BIYLjtL6zJ089GbwXnvojY9f9kp4XPhr7zN9uJa3gCgh01
 cGwz0+kPlEpVjx1auJOFGDMVuor8xZENjCk4bucy+8DnLkgRrSMhjhc92
 Rriwpft+Ho3ayTcHCDYJv37Yaf7CwiyY2OJfU8dK2+1J5fFZyAl8hHl2i
 MhuZruuIR9TQ/5JleCayJWHL6DHr3Ty0sNWvMplxeXPIXanbAQzjEIaXp g==;
X-CSE-ConnectionGUID: Qg2Su7KYQhi2z4ycDRnPZA==
X-CSE-MsgGUID: ejyjCamvQPm9N4PRqO6qLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43794178"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="43794178"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:48:24 -0700
X-CSE-ConnectionGUID: vtpHs8LAQfOdtvxqH4aSJA==
X-CSE-MsgGUID: 1LUSQraqTGWQvbM88sqCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57520207"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.125.108.94])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:48:24 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 4/4] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Thu,  8 Aug 2024 18:47:59 +0200
Message-ID: <20240808164759.133621-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808164759.133621-1-kamil.konieczny@linux.intel.com>
References: <20240808164759.133621-1-kamil.konieczny@linux.intel.com>
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

