Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA3606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O5vJ36mr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53C310E227;
	Thu,  5 Nov 2026 04:43:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBC910E227
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 04:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793853773; x=1825389773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dw3s0TvvB6Ci+PRWfUm74rzwsln7paAUb8nAO2Cqblk=;
 b=O5vJ36mr0gBn/Y3NgeiICPq0RNxl/PKVH+Seo7de5ZYI2nI+KIT6ExkD
 3/kaxBXHcizeuUci3N7/C7qrJNT2ERmL9n//VO4Q9+ADShzvhz/P3Q5Om
 dDyVsnd7JqNX6Q9ktjDZu16ulgddjMxlJ63rr5XDH7yQIEesFoI0Lfo1a
 tyJvA7e/UqCISrk8FTsu36hcA1uoG03OiP8789nKJXEBYbYvOVRxdyC5l
 Tt51k9eB+1WyLUm6PJwn+ZYAjzHLQ28/wen8zhD4beqjtpgG/R4x82GC6
 2aZEx8VzYCCKTSeGKwTHri4JCGuLvEUP6E9lCtOJLMKTPhv2mmRW5lfdb A==;
X-CSE-ConnectionGUID: TlMW8iB4SJSX1qW6z5tCrQ==
X-CSE-MsgGUID: qtAHtplER2OL3uZdNiEblw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2530579"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2530579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 20:42:53 -0800
X-CSE-ConnectionGUID: oDDsB+srS4+WWRMNxuE/dg==
X-CSE-MsgGUID: GM52scXvTxawQ4SlSYRYxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7239012"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.76])
 by fmviesa001.fm.intel.com with ESMTP; 04 Nov 2026 20:42:52 -0800
From: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Subject: [PATCH i-g-t] test/intel-ci: Add xe.multigpu.blocklist to config.json
Date: Thu,  5 Nov 2026 10:16:09 +0530
Message-ID: <20261105044609.365584-1-venkateswara.rao.muppidi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add xe.multigpu.blocklist.txt to the "GPU excluded platform" section of
xe_test_config.json as MULTIGPU-CRI, so that testlists can be generated
for the multi-GPU CRI configuration for CI execution.

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
---
 tests/intel/xe_test_config.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 43c758f5c..f6524166e 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -82,6 +82,7 @@
 			{ "CRI": "../intel-ci/xe.cri.core.blocklist.txt" },
 			{ "NVL": "../intel-ci/xe.nvl.core.blocklist.txt" },
 			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
+			{ "MULTIGPU-CRI": "../intel-ci/xe.multigpu.blocklist.txt" },
 			{ "WCL": "../intel-ci/xe.wcl.core.blocklist.txt" },
 			{ "all": "../intel-ci/xe.blocklist.txt" }
 		    ]
-- 
2.43.0

