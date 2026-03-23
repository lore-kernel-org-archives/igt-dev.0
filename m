Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B591D58CDC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 06:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F3E10E30E;
	Mon, 23 Mar 2026 06:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4pBPG23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B530810E30D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 06:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774247689; x=1805783689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbxzC83wBFeYqvvpZcEnVVf2T77ImIG4N11dYPSRSVI=;
 b=m4pBPG239K6YjhJXoq1bGMytdhuEOaA20cUO2HVi592+UeKjHI0watH4
 35DgILHFZd9fdCViPrbp6NpIJ+KBo8rooCm+4FbhNOCKf/Nic42Mwuq/9
 bbV2vhsSmWWMc9LIfYMz1zyBmaxulX+BafjGPFoaLHG8OYr2qxo+PUJPc
 3vujmO3crKus50NFx8DyrJLteEjLbqGC63kpcHBr31iyQS+lqLsyuELzj
 xfh16N+F219tpEintjpM1xQI/mDCf0bJHPq/HmPDHG9f49DLsREVez+eS
 bLHBkvewaTOnsE68TlWlNgRHhDcGMjkQMkQmWt/QGjl4v8QHzCGdACp2E g==;
X-CSE-ConnectionGUID: dHIpxok5SYiDmuC20uf3dQ==
X-CSE-MsgGUID: ikWaHE7gS8mlBkcdihQADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75123229"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75123229"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:34:43 -0700
X-CSE-ConnectionGUID: Yo6j6CfTQYuFonPuAGRlUw==
X-CSE-MsgGUID: wjt9KPdRS46ixIb8zO7o/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228008481"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 23:34:42 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_vrr: Avoid unnecessary PSR disable
Date: Mon, 23 Mar 2026 12:03:08 +0530
Message-ID: <20260323063309.99649-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323063309.99649-1-jeevan.b@intel.com>
References: <20260323063309.99649-1-jeevan.b@intel.com>
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

Use output instead of NULL in PSR helpers so PSR is disabled only
when supported by the sink, avoiding unnecessary global checks and
ensuring correct behavior on multi-eDP setups.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index ec0692b2f..ec17366c8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -912,9 +912,9 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 			igt_skip("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
 				 igt_output_name(output));
 
-		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
-			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, output) ||
+		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, output))
+			psr_disable(data->drm_fd, data->debugfs_fd, output);
 	}
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
-- 
2.43.0

