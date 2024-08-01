Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F34C3DA7F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 19:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D349410E0CD;
	Thu,  1 Aug 2024 19:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/Dlrgmk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1AF10E094
 for <IGT-Dev@lists.freedesktop.org>; Thu,  1 Aug 2024 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722541892; x=1754077892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WwSZnoDLwVJ9kQSAAK4zeP6d8irCx7tYSEg1WYZ7ofg=;
 b=g/DlrgmkzETqfPTg5EPHmXp1aftW0buvUEqAbV/jdJEHYLju6R4AFOyQ
 5xhNuwkpSPJwA0PQeQdNkJ1QrvtRuRft4MIMzjklmXVdrs0DES4DU5j6c
 8Zo28va8dKxGD+u6E6T/uhr0QOrdaXwXAfeYrM/9xgJPMuaedQvnBY3pc
 UopoLRE8CYK7/1Hjgu53j6WXY38K8Rh2dZzgYktqmwAAUCqYqYauQfBvC
 9E3nNyZgvvnT5ekfc1yixypQrAwljpPHRxjMEX3XXjmyY7aPZEdMrxXeg
 HEKHK3PLDTeBV0ZK4VxHB+sRF64U1hh8k/UKlITkCrjSMoU49sT9V5MwF Q==;
X-CSE-ConnectionGUID: tmjxCfazSE6v4MOv8TcW+g==
X-CSE-MsgGUID: PViGGdIUSr2C/14cbRATZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31181959"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31181959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 12:51:31 -0700
X-CSE-ConnectionGUID: rcQoKSh7QlermlfCWLTc4g==
X-CSE-MsgGUID: wOddogqGTlOYFjGE1+71bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="60182923"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 01 Aug 2024 12:51:30 -0700
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_query: Fail on unknown hwconfig
 entries
Date: Thu,  1 Aug 2024 12:51:28 -0700
Message-ID: <20240801195129.3667206-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801195129.3667206-1-John.C.Harrison@Intel.com>
References: <20240801195129.3667206-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There is a test that the hwconfig table is valid. However, if there
was an unknown entry (corrupted table or out of date test) all it did
was print a debug message of "please fix"! So the test would still
pass and CI would not notice the problem.

Add in some actual asserts that the enum value is within the valid
range and that it is not missing from the switch statement.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/intel/xe_query.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index c6d88b258fb3..6ebf5e4b6d71 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -137,7 +137,8 @@ const char* get_hwconfig_name(int param)
 	CASE_STRINGIFY(MIN_MESH_URB_ENTRIES);
 	CASE_STRINGIFY(MAX_MESH_URB_ENTRIES);
 	}
-	return "?? Please fix "__FILE__;
+	igt_assert_lt(param, __INTEL_HWCONFIG_KEY_LIMIT);
+	igt_assert(!"Missing config table enum");
 }
 #undef CASE_STRINGIFY
 
-- 
2.45.2

