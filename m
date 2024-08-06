Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C63C3DA64
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 14:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842DB10E39D;
	Tue,  6 Aug 2024 14:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFDmHzg3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE2C10E39D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722955436; x=1754491436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPNX8wzUrubNqwu7khnbdhluM6MuHdBnrPr68bWejNQ=;
 b=lFDmHzg3PSC6sb9489BrMI4siquJC9fIpJ2D059HbJHCJktDwLVBteXd
 YVHppnfq87ytbsULL5AGxLxGMhUn0yJEnfWPHsNVY1uWFOOy6NIgpnYds
 wuZ+AjqVuWo6Y6OXm8nj5seF658FwUYNsNww4WBGwd8vPlyh0Lop2GjlQ
 YOMeZawYNipaPNjVGnhaiEXjzkmbT1V6OYTqm7nnNfbK5TCMaIsmscQX9
 XWJz9n1BbHrS1C7Cm7TimgJ9KsiJU6Akyg9/0YYEGQgDMnt4x8S4P7WUj
 jVxvcEBSfOiRBWyEUs6jqh+0Qj+ulxRi0C41ZZ8OaPFSw67+RfSyUt0/r A==;
X-CSE-ConnectionGUID: GLPkIYR6TIWaaTeyT8GzCw==
X-CSE-MsgGUID: FbRjPZlbSs2e01XGcYcTfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24766626"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="24766626"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:43:55 -0700
X-CSE-ConnectionGUID: Hl8A1OofSQKlkP6uxncqDQ==
X-CSE-MsgGUID: 0AFQ8sX+TXGsxiyqCnj9YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56606706"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:43:54 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 4/4] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Tue,  6 Aug 2024 16:43:32 +0200
Message-ID: <20240806144332.80609-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
References: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
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

