Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0BCD358F1
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 09:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8E010E127;
	Thu, 29 Jan 2026 09:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUkrvmlo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271D710E732
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769618722; x=1801154722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2hYScf8mjw0Cp/baRnNPQBYPbc1+Zd+vZY+mPTryGtE=;
 b=aUkrvmloNCh4WALr8kPOYc3JhRAl710DN5m9mb95Mn1HDM/9jTkJOe0b
 R4jXlJaClhTvLBNFwoOzkqgM7GGtrh/LphvgY+D5fTiFsD7PtBhDK6kKk
 IkpPhHfyHZWo2e2NBIzR3wwg1xxTrA2AllsRRBT6rKB/TR3ip+n7V2dKY
 vOA4vLOgFD/+kd2RQqZ/AIwzkFrIvlUPtAtjpnhvOh6VUQPMVWKuEfPiZ
 YComMXnaqaPb83VTu3ReF5kOyupOyZhxG5jAOkmV2bYk3MnHaAgq0+wLQ
 WAolXFPD8YR86Jn60OfnDf9pwkGbD+hWmfFV76Yw3T3Tg+LUeqxgu57cy w==;
X-CSE-ConnectionGUID: M5j8cQU6ShGjSEqczxjpyA==
X-CSE-MsgGUID: +F+Cac6kTyuEOPXe6qD5Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="71003922"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="71003922"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:45:21 -0800
X-CSE-ConnectionGUID: rPT7uerNQMqu3OzzwneeJg==
X-CSE-MsgGUID: q+hv6cerQZ6EZnscTYwGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208390803"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by orviesa007.jf.intel.com with ESMTP; 28 Jan 2026 08:45:20 -0800
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Fix UC PAT case timeout
Date: Wed, 28 Jan 2026 16:45:17 +0000
Message-ID: <20260128164518.44353-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 09:51:23 +0000
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
index 412ad0384..2938b3c87 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1692,6 +1692,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			prefetch_ns += (end - start);
 		}
 
+		if (pat_value == intel_get_pat_idx_uc ||
+		    pat_value == intel_get_pat_idx_uc_comp)
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
+					      "CLFLUSH support required for UC PAT index test\n");
+			}
+
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

