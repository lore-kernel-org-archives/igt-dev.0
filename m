Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAA4D18151
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 21:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174AF10E4D5;
	Mon, 14 Oct 2024 21:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2nXZW2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8645210E4D5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728941978; x=1760477978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KRj8tSC6KiQ0CWqVXNrETC+Ixj4m32yCcNGVltO+pXk=;
 b=h2nXZW2L22Yy/Tf96AAYhKfS2Y7mCSTZnm8I6rgzaHjMkuNdkAtOEomc
 qA5btzYvhQ7IUQwSuLN3AsrdeNbVt4v/WBiNXMU+oWC33QNCIRGXTfCd6
 EQQdE8L9A/cSx1qxifkYv/NC1ZbhpLep4n6pPabAqnZ5J4A6ycmosGMp3
 FhifsL/v8H8W4u8PHIaQu5LtpCsSleQSkpyTENM/ejSpm+1Q4IlvXs2dB
 XH50wnYizinSnSV4tSkEJ3mvcPw2CDAZLBNha6kRbLbhF9Hvp3HT4tlgy
 jA24HXax6kBFktd97Y8tMxRnt86hgNnGOd2eEyydy0mYdi5ouj3i137Hl Q==;
X-CSE-ConnectionGUID: ZJeKhg9zSUyeW6e3us3Y1w==
X-CSE-MsgGUID: J8JSe843QJiW8/szVZ0+Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28399853"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28399853"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:39:37 -0700
X-CSE-ConnectionGUID: v6RUXsLNReeW+Cehq3KNbw==
X-CSE-MsgGUID: 7Kr5uko0R5ygXMvKm2zbhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="78518475"
Received: from dut138lnl.fm.intel.com (HELO jcavitt-DESK.fm.intel.com)
 ([10.105.23.14])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:39:37 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH] tests/intel/xe_exec_reset: Explicitly declare exec
Date: Mon, 14 Oct 2024 21:39:36 +0000
Message-ID: <20241014213937.255940-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

In the gt-reset-stress subtest, we define a drm_xe_exec exec without
declaring any of its variable values.  Explicitly declare exec to equal
an empty struct to prevent any values from being assigned garbage data
during execution.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Jani Saarinen <jani.saarinen@intel.com>
---
 tests/intel/xe_exec_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index b5d5f43eab..fdfefa91cc 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -628,7 +628,7 @@ static void submit_jobs(struct gt_thread_data *t)
 			.engine_instance = 0,
 			.gt_id = 0,
 		};
-		struct drm_xe_exec exec;
+		struct drm_xe_exec exec = {};
 		int ret;
 
 		/* GuC IDs can get exhausted */
-- 
2.43.0

