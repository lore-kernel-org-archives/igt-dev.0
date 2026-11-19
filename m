Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F2F606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 00:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cuIdSSnT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6807A10E7E9;
	Thu, 19 Nov 2026 00:53:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948201120F4
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 00:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795049426; x=1826585426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=utXhID8IYm+vXXR9j+MN2ruf2nMbveed5vh2m6e2aPc=;
 b=cuIdSSnTmYT0lMTzlGxVeZtuUlZqE0QmQ0U2lKl94ANjJdFCSLy9rB0L
 ZJrMLNlkU5RJwQTDlOIL6rtupsUErLRHzOzjQ/XTMfyy5BQypOyzpIwTx
 9nllD2WZjpZk6dpUE1Ebj5VI3P+rYoAseiekpFy9OhOFhGDg7V5hY3oD/
 067K8TPiY8Eu1bwi5Wu+hTUVFymQlH+x0EwHzkuDTCbyVb3Z5cWt3IWDr
 lbRCWREleQjaVqE1/d8VjRcriEkbEX0K1b/6HDTS17oRCJphfKhCRJGH9
 OFPtfm5UaB4e+GQjL/IXBg2phdQrSqn/61Xg4PQe5b6Gen9RiTdoMaqgt g==;
X-CSE-ConnectionGUID: MAb59U/BRHKjdfkyQoMC8A==
X-CSE-MsgGUID: 1w9k0wxfSYKglvBt92FG0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3771130"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3771130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:50:16 -0800
X-CSE-ConnectionGUID: mdPaWSu7Q5G0thzRLHIJdg==
X-CSE-MsgGUID: Ef7q2dJcSha8BcjW+L2hgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10679607"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 16:50:17 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, shuicheng.lin@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 3/3] tests/intel/xe_pmu: Wait for stable C6 in gt-c6-idle
Date: Wed, 18 Nov 2026 16:50:09 -0800
Message-ID: <20261119005009.364632-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119005009.364632-1-zongyao.bai@intel.com>
References: <20261119005009.364632-1-zongyao.bai@intel.com>
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

Same as for xe_pm_residency: a single transient visit to C6 does not
guarantee the GT is idle for the following 3s measurement window. Use
xe_gt_wait_c6_stable() before comparing the increment of the gt-c6 PMU
residency with the elapsed PMU timestamp delta.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index de07c2236..31b5cbafe 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -878,9 +878,9 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
-	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10) ||
+	igt_require_f(xe_gt_wait_c6_stable(xe, gt, 500, 5000) ||
 		      xe_gt_dump_debug_info(xe, gt),
-		      "GT %d should be in C6\n", gt);
+		      "GT %d should be in stable C6\n", gt);
 
 	/* While idle check full RC6. */
 	start = read_idle_residency(xe, gt);
-- 
2.43.0

