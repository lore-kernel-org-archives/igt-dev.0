Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE04E9B36D
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 12:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762FF10E132;
	Mon,  2 Mar 2026 12:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvVXAjEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B56310E132
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772454335; x=1803990335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gqWeivFkI0WzohERaG35+EZO39Upa7g2BXPUNH63bTg=;
 b=nvVXAjEYqMLFUYvgcZk6TGrVG5/918NZManXpKpIUAHGWg0+TNBOGgKt
 JL5bOk8G3E7JkBHTyAGAPBGo/7gFjQGqNsc9oG61vYodVpDoSY3B+1g19
 vkBai/bjTRgn6511E8grIy+oDOCBXoB2lFa09Qxft5yBWOZO1tSiMCvnj
 kj10n+tYX+7+hfw2FkQcCtXQ03G8dNNGiLqt9gg0t+F7zE3SxW247zGzH
 MAeNH+Y6gOE4NHM82fj0sbNMmTe5ZXlDFBtgGvPLxGu0Zpm75mxhaVbYm
 ElPh2jxuiZlb4ctpPuF4rOf6Z+v1VpR/1X5s2CtOX0Ru2Bh1SkDU9oe9s w==;
X-CSE-ConnectionGUID: aXfelFcpS/ixbYW5nkqmSA==
X-CSE-MsgGUID: dNSGNct2SXqOdaZMFvYb/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84098046"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84098046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:25:35 -0800
X-CSE-ConnectionGUID: WpWLnu3fSducDt2N5xt3Xg==
X-CSE-MsgGUID: 83jZM34RR26w67q3SYPXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="217662983"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:25:34 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v2 3/5] lib/intel_compute: Use user offsets and loop
 size if provided
Date: Mon,  2 Mar 2026 13:25:21 +0100
Message-ID: <20260302122517.4126472-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302122517.4126472-7-zbigniew.kempczynski@intel.com>
References: <20260302122517.4126472-7-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If user passes its own input/output or number of iterations start
to use it instead of hardcoded ones. This pattern was already used
in other pipelines and only Xe3p missed this.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/intel_compute.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 1165bdafd9..bfe0a75a7c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2189,6 +2189,8 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	struct inline_data idata = {};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
 	int entries = ARRAY_SIZE(bo_dict);
 	int64_t timeout_one_ns = 1;
@@ -2205,7 +2207,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	memset(bo_dict[1].data, 0, 4096);
 
-	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
+	xe3p_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
 				  execenv.loop_count);
 	idata.xe3p.indirect_addr_lo = indirect_addr;
 	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
@@ -2233,7 +2235,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	}
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
-- 
2.43.0

