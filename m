Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FC3C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 10:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A7A10E223;
	Mon, 19 Aug 2024 10:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvSEeFiK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F2B10E223
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724063768; x=1755599768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPNX8wzUrubNqwu7khnbdhluM6MuHdBnrPr68bWejNQ=;
 b=bvSEeFiKR85OqR+MIftr6k0jA24Pe0J55ELGBWRAkESDbbEeOfq0gQ8f
 NJCC/Q0qksxrrWW/JBnwfoHITfU833RXek/oyKH+qRF2tUNZalrTSV/2h
 qc3JpIDvvQk7t3BMJIGxsK+GqqCWYW75d/vMTIUDGSDegWITJIN1Z4RRZ
 vRxC+mKeRc5PlCXeSbWTpNkyyRDszfbtwow6bBDfhkX+jaZSEpEdXCKOV
 Yds48IbB9hwbsdeRq2+xlQs5q/x8fS0NnjD8ugv/CURqjvWU0eS8mpH8V
 eL4qnKIx9Q6ZHAkRZgGkXufWxXnPkbG0NjqLHyo/BlOTU50hjACXtWkgA w==;
X-CSE-ConnectionGUID: SeX1FqggTMaZbrjZ3Zedwg==
X-CSE-MsgGUID: 70D6KWlhR1OEeWQPfWWCxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="39763376"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="39763376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 03:35:58 -0700
X-CSE-ConnectionGUID: Iv8ubUbuSdqgTpK6MR3pjg==
X-CSE-MsgGUID: jmYPlMOISJmackwds2J+jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65286350"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.144])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 03:35:58 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 4/4] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Mon, 19 Aug 2024 12:32:42 +0200
Message-ID: <20240819103242.26527-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
References: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
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

