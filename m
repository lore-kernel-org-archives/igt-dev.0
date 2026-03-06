Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A09F01804
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 07:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE6F10E3A1;
	Fri,  6 Mar 2026 07:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmKJQO2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ECD10E3A2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772783897; x=1804319897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MhurkHipx9o35y1j7lauzYAAjxncUaka3EHp3bpjBL4=;
 b=FmKJQO2JBBWxCnsuOPAHT6+o71+tZ8C2mTLytsm+6WIonxLWNNpMQJsY
 eGNahB6zrPVWSrJlj+BqNpjcdMYXJuyy0tNdQTkCmJwpH2R2p+7TnNLeJ
 Fh8Fp3BRge5AOkGYXYjgt+boB/sKPoi3KhpKqBU8c1NqvWhdGd/RJlCJV
 7ivnN5iQe/6AZqzDpGKrFVnxtxjiEGAMi8wOUfDKt8Qn9POcRD3zxBXGq
 FL3/zioYez1B+zielvdwABjkkKVwBDdUSuesdBdicmWPMWCaSY+yqwhdf
 JfEXEWZYmwzZMfiSRLB8Ix08AYLi12aujsx8iuw1g99WJGa1bB/YX/2mQ w==;
X-CSE-ConnectionGUID: Zq8pid/lQYid3CMkcoHMpw==
X-CSE-MsgGUID: TEug+PVcQt6OpC6bRZQuFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73934231"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73934231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:16 -0800
X-CSE-ConnectionGUID: z0iCYbUOT42ovM/aq53hZQ==
X-CSE-MsgGUID: Wf+8YHJ4SPeKq+0LN4jRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="249416167"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:15 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6 3/6] lib/intel_compute: Enhance Xe3p pipeline to
 accept user data
Date: Fri,  6 Mar 2026 08:58:03 +0100
Message-ID: <20260306075759.1153032-11-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
References: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
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

Improve Xe3p pipeline flexibility by accepting user data like
input / output buffers and iteration count. This pattern was
already used in other pipelines and only Xe3p ignored these
overrides.

Cc: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index cff0a8345c..fa11b15f40 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2191,6 +2191,8 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	struct inline_data idata = {};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
 	int entries = ARRAY_SIZE(bo_dict);
 	int64_t timeout_one_ns = 1;
@@ -2207,7 +2209,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	memset(bo_dict[1].data, 0, 4096);
 
-	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
+	xe3p_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
 				  execenv.loop_count);
 	idata.xe3p.indirect_addr_lo = indirect_addr;
 	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
@@ -2235,7 +2237,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	}
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
-- 
2.43.0

