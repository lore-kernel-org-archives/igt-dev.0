Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC6BF46C71
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 18:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9FB10E29C;
	Mon,  6 Apr 2026 18:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ix8USEAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941A710E29E
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775500949; x=1807036949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kVP4jJYtbOx+4Zwjd2cg+7aEr7w5WmGlemv5rHm/nrw=;
 b=ix8USEAFmsKX31cY/l/wwqm6H44ZHrPV1EI2nUTH+zsb7uq5qVflKlam
 VTqH0geMtov87qGEyx4FQchZJU0x1JNA2gQR2uaJpyq77ly9TuIsihlJE
 GSbLNsbETRotgMBN1IocmuHlahd6J/8Qp+7kdqJ5Npl3OKEOpVxHeSUMG
 3Fel4NWpaNVUoxoKjX8GdadXc+6S2InrOphjqpAJOpJW+8Nt0SAAVv2CR
 wP77CcG4E29stP9dRJiv8Lbp17luL0WQhLoWufZZklLzmgWtqCYZFqQ9q
 YtFnJkaWPOM/SPmo4Rvt2g0OmezwaEQadWoUPZm2VjPQRrc6fwfZMGy/e g==;
X-CSE-ConnectionGUID: DcEClbbIQUCHfqnmgPDzxA==
X-CSE-MsgGUID: LPqiz7ruR5milhfFOxuqQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80342966"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80342966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 11:42:28 -0700
X-CSE-ConnectionGUID: cKyHiPjkRQS7iy2yqmUNfQ==
X-CSE-MsgGUID: F5vDRi6+TeqMlqkAwHFO9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225193408"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 11:42:27 -0700
From: Brian Nguyen <brian3.nguyen@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 3/4] tests/xe: Add transient display PRL skip
Date: Mon,  6 Apr 2026 18:42:30 +0000
Message-ID: <20260406184226.1294486-9-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406184226.1294486-6-brian3.nguyen@intel.com>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
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

Page reclamation may be suppressed for various reasons. In this case,
transient display vma ranges will not use page reclamation, so ensure
that behavior in this subtest.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Suggested-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_page_reclaim.c | 87 +++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tests/intel/xe_page_reclaim.c b/tests/intel/xe_page_reclaim.c
index 7741063d2..6cc29d8d3 100644
--- a/tests/intel/xe_page_reclaim.c
+++ b/tests/intel/xe_page_reclaim.c
@@ -4,7 +4,10 @@
  */
 
 #include <fcntl.h>
+#include <linux_scaffold.h>
 
+#include "igt_syncobj.h"
+#include "intel_pat.h"
 #include "ioctl_wrappers.h"
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
@@ -44,6 +47,33 @@ static struct xe_prl_stats get_prl_stats(int fd, int gt)
 	return stats;
 }
 
+#define XE2_L3_POLICY		GENMASK(5, 4)
+#define L3_CACHE_POLICY_XD	1
+
+static int get_xd_pat_idx(int fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	struct intel_pat_cache pat_config = {};
+	int32_t parsed;
+	int i;
+
+	if (intel_graphics_ver(dev_id) < IP_VER(20, 0))
+		return -1;
+
+	parsed = xe_get_pat_sw_config(fd, &pat_config, 0);
+	if (parsed <= 0)
+		return -1;
+
+	for (i = 0; i < parsed; i++) {
+		if (pat_config.entries[i].rsvd)
+			continue;
+		if (FIELD_GET(XE2_L3_POLICY, pat_config.entries[i].pat) == L3_CACHE_POLICY_XD)
+			return i;
+	}
+
+	return -1;
+}
+
 static void log_prl_stat_diff(struct xe_prl_stats *stats_before, struct xe_prl_stats *stats_after)
 {
 	igt_debug("PRL stats diff: 4K: %d->%d, 64K: %d->%d, 2M: %d -> %d, issued: %d->%d, aborted: %d->%d\n",
@@ -535,7 +565,61 @@ static void test_binds_1g_partial(int fd)
 	stats_before = get_prl_stats(fd, 0);
 	vma_range_list_with_unbind_and_offsets(fd, sizes, count, (1ull << 30), SZ_1G + SZ_2M, offsets);
 	stats_after = get_prl_stats(fd, 0);
+	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
+}
 
+/**
+ * SUBTEST: pat-index-xd
+ * Description: Create a VM binding with a BO that has PAT INDEX with XD
+ *      (transient display) property to test page reclamation
+ *      with transient cache entries on XE2+ platforms.
+ */
+static void test_pat_index_xd(int fd)
+{
+	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
+	uint32_t vm, bo;
+	uint64_t size = SZ_4K;
+	uint64_t addr = 1ull << 30;
+	int pat_idx_xd, err;
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+
+	pat_idx_xd = get_xd_pat_idx(fd);
+	igt_require_f(pat_idx_xd >= 0, "XD PAT index not available on this platform\n");
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create_caching(fd, 0, size, system_memory(fd), 0,
+				  DRM_XE_GEM_CPU_CACHING_WC);
+
+	/* Bind with XD PAT index - synchronous operation */
+	sync.handle = syncobj_create(fd, 0);
+	err = __xe_vm_bind(fd, vm, 0, bo, 0, addr,
+			   size, DRM_XE_VM_BIND_OP_MAP, 0, &sync, 1, 0,
+			   pat_idx_xd, 0);
+	igt_assert_eq(err, 0);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync.handle);
+
+	/*
+	 * Page reclamation should skip over the XD pat vma pages.
+	 * PRL is still issued because pages are still valid, just handled
+	 * elsewhere so no invalidation required to ensure not squashing valid
+	 * PRL entries from other VMAs.
+	 */
+	expected_stats.prl_4k_entry_count = 0;
+	expected_stats.prl_64k_entry_count = 0;
+	expected_stats.prl_2m_entry_count = 0;
+	expected_stats.prl_issued_count = 1;
+	expected_stats.prl_aborted_count = 0;
+
+	stats_before = get_prl_stats(fd, 0);
+	xe_vm_unbind_sync(fd, vm, 0, addr, size);
+	stats_after = get_prl_stats(fd, 0);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
 	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
 }
 
@@ -587,6 +671,9 @@ int igt_main()
 	igt_subtest("binds-1g-partial")
 		test_binds_1g_partial(fd);
 
+	igt_subtest("pat-index-xd")
+		test_pat_index_xd(fd);
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

