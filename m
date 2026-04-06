Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F962FB5173
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A524810E2EC;
	Mon,  6 Apr 2026 22:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+2O5Op3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB78810E2E2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514439; x=1807050439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zLs9sehnenyFZlvLRwFPW6KkVTxij0/z7wTEaAz8kSc=;
 b=O+2O5Op39Bmxq6bmQUaYfArfzvdtqXvmf8Ae4KGA2M+nW2G+1XypXBxo
 zqWnM+oHQBOakhaR/8S9iJZ3bXOfo+QueQTbYkzRDdXBj28iLiQPpnuTG
 zt+Kzllguq3zOoCpksdaHzXCiwLD9RXEHJw10MYkEUfwC49wKDa24Gx8J
 DFKMwWBE3ZrpkIcIHY0xACwwYfftk4tVMSWqSmM+mgR2AImpdYukbj2da
 FQcR3FAV+I8cU7lHOp0uU79ikJTuRMs9D7ekH+/2XSmGQ8II0VkFPpVCX
 fMawBdjXPiLRBN/G4Qsa5NsVPxPxTmQfadECEpaxSXwyKXWtb9L+597D5 w==;
X-CSE-ConnectionGUID: D5+NA198QB+I/acltL2EpA==
X-CSE-MsgGUID: JXDGuXWyRiWes7YlGg8H9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99094817"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="99094817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:27:19 -0700
X-CSE-ConnectionGUID: 3F4CZ16bRayyXAJn64pesg==
X-CSE-MsgGUID: 0nD5kuvCQeCSVLDNgQqakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="221416443"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 15:27:18 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 1/5] fixup! tests/intel/xe_pat: limit number of dynamic tests
Date: Mon,  6 Apr 2026 22:26:59 +0000
Message-ID: <20260406222703.3217769-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406222703.3217769-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
 <20260406222703.3217769-1-zongyao.bai@intel.com>
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

Fix typo error of r1_entry.force_cpu_wc

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 81c28677a..e53e08877 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1515,7 +1515,7 @@ static void subtest_pat_index_modes_with_regions(int fd,
 							  r1_entry.force_cpu_wc, p.r1_compressed);
 						igt_debug("[r2]: r: %u, idx: %u (%s), coh: %u, wc: %d, comp: %d, w: %u, h: %u, a: %u\n",
 							  p.r2, p.r2_pat_index, r2_entry.name, r2_entry.coh_mode,
-							  r1_entry.force_cpu_wc, p.r2_compressed,
+							  r2_entry.force_cpu_wc, p.r2_compressed,
 							  p.size->width, p.size->height,
 							  p.size->alignment);
 
-- 
2.43.0

