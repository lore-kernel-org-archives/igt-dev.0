Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E782EC1449
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 13:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F305F10E7F9;
	Tue,  3 Mar 2026 13:38:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771FE10E7F9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772545104; x=1804081104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gqWeivFkI0WzohERaG35+EZO39Upa7g2BXPUNH63bTg=;
 b=VyebWYDGpB2bupdKLtrmzZUgPHQr4WFDqVP4ulhXIx0mdlvYHTehEasp
 ZSms82Q6dKxhTvp/TGhIQ4WoDeywmvq33wZildI3gsd1XixuMmHpgTeMh
 YoKP3Qqu//LJth3f7kQ5erKQqEh6myGR2gHLmyzBmNRowOkcPyFA83LYD
 PG+J7dmy+be6EPlOtUkVDX+7/tlaTgKKxRBviXyKuJSZXHxlHgArh4DLF
 PZXwbLuZYwy6R82aRKOC+qaMd6jZr/IUvCw3kX1Gr9CnS1mjby1UIhwUk
 CHH/rPw0PasysBji/oVr8wk8+wjtZwqCcf8fLoemByvLlQuBWy2HcbmNP w==;
X-CSE-ConnectionGUID: wJKpIjxPSzOpRxdHKOkuOA==
X-CSE-MsgGUID: nA/lETQ0QieHrzJNj4093A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76180022"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76180022"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:38:23 -0800
X-CSE-ConnectionGUID: e9w3WJF7RUifCfEBkmTwyw==
X-CSE-MsgGUID: MqzX4azST5KjC9bb9JWSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217948774"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:38:21 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v3 3/5] lib/intel_compute: Use user offsets and loop
 size if provided
Date: Tue,  3 Mar 2026 14:38:02 +0100
Message-ID: <20260303133758.36553-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303133758.36553-7-zbigniew.kempczynski@intel.com>
References: <20260303133758.36553-7-zbigniew.kempczynski@intel.com>
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

