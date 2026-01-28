Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF18ED25B77
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF71610E119;
	Wed, 28 Jan 2026 13:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGhFXSab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9E510E5D6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 00:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769560224; x=1801096224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yiDs4WrzIttZB2JLeMejkozfNcwful7s1abfh/3mtmY=;
 b=cGhFXSabPv8suYxKwPE3L8c5nPZ1diApx94v5z+cWW2a6OSIxFcKSzxx
 1PIcRo9Ju4HJ5vEVx2DsMUCHdoAcrXjmUw67/yG5nJBCBNJ6wpoS03Cp0
 4e7rh4OrtIp/ngC0AxkBip/mAB98zP4dSLm0a0fSgj63veP0Q7LTRYqLQ
 +ma0k0wbCBliFLnW4Btt9Ml/uRQ+1u+/DqBl7f9lTKGhsPPlCjjtEdEUy
 2TUPP1JWinKpTJL58DuBkKuoaLNYBi+T3rLAxzsG2dG3EPAakCHEk/4tt
 ifKO2JGHF4k76eDKbXUeHi2nkMN4ZPk6aLpWMDsmAb9MQD2aC+PhGS/DA Q==;
X-CSE-ConnectionGUID: D10405gnSP2hpW+8DP5Kog==
X-CSE-MsgGUID: mv9enStSSBi1Wal1VUNswQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81874805"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81874805"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:30:24 -0800
X-CSE-ConnectionGUID: 1xvWsrBzSe2DOaMSYUjB3A==
X-CSE-MsgGUID: MdWMCLRbRXqMr5juBhqI+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212662995"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by orviesa004.jf.intel.com with ESMTP; 27 Jan 2026 16:30:23 -0800
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_system_allocator: Fix UC PAT index
 test timeout
Date: Wed, 28 Jan 2026 00:30:21 +0000
Message-ID: <20260128003021.33204-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127215102.19951-1-jia.yao@intel.com>
References: <20260127215102.19951-1-jia.yao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Jan 2026 13:39:55 +0000
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

The pat-index-madvise-pat-idx-uc-single-vma subtest was intermittently
failing with 'Timer expired' error when waiting for user fence.

Root cause:
When the PAT index is set to UC (Uncached), the batch buffer written
by CPU may not be visible to GPU due to CPU cache not being flushed
to memory. The GPU would then read stale or corrupted batch commands,
causing the execution to hang and the user fence to never be signaled.

Fix:
- Use igt_clflush_range() to explicitly flush the batch buffer from
  CPU cache to memory before GPU execution
- Initialize clflush support in igt_fixture with igt_setup_clflush()

v2 (Xin Wang):
- Move igt_setup_clflush() from igt_fixture to just before
  xe_for_each_engine loop for UC PAT index subtests. This ensures
  clflush is only initialized when actually needed, and allows
  proper skip if clflush is not supported on the platform.

This ensures that when using UC PAT index, the GPU can read the
correct batch buffer data from memory.

Cc: Alex Zuo <alex.zuo@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 412ad0384..6970b8201 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1692,6 +1692,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			prefetch_ns += (end - start);
 		}
 
+		if (pat_value == intel_get_pat_idx_uc ||
+			pat_value == intel_get_pat_idx_uc_comp)
+			igt_clflush_range(data[idx].batch, sizeof(data[idx].batch));
+
 		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
 			addr + (char *)&data[idx].exec_sync - (char *)data;
 
@@ -2633,6 +2637,11 @@ int igt_main()
 			     !xe_has_vram(fd)) {
 				igt_skip("Skipping compression-related PAT index\n");
 			}
+			if (strstr(s->name, "madvise-pat-idx-uc-")) {
+				igt_require_f(igt_setup_clflush(),
+							  "CLFLUSH support required for UC PAT index test\n");
+			}
+
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

