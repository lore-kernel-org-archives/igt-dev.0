Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C8CF6BF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 05:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0723110E099;
	Wed,  7 Jan 2026 05:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpJ3m7+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC7210E048
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 05:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767763450; x=1799299450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zRKKQ/tKqk6Q+5gs8KfY1+/J1XcJz2vce0WYjxccrTs=;
 b=bpJ3m7+fV+7OUFpw/G28cXk28AweIJrTDW9WZbdfLJ00VtSp6huw06EV
 W4ovw9yF0TXe7GUdfRQvxnxgAzpljpC90u9XbVqyPfGcPknqlg6TwTQjn
 dGMTQmDaa8r6kagvGH00p4FLnDEhFYgHP6kM6Kq2dITOwJLlpDhTSKue0
 r+PZOlSk8LYvjFE0WLQD2lTYjolghay9kRx9tO9aUKHHefo0fcAJKnkDq
 P0xRkv48Bya23v7Uga+kVSNw4iwRzBmzTT6yOvEGQ4pGEbakdoPWTFPdS
 VH7aLsm+EzpDppxEE+T4D/5htTGmeugkvQsVBmIcJGxIOcA4t2WEMtDYa g==;
X-CSE-ConnectionGUID: Sn0CVa7FSfu/wnoS9Yehbg==
X-CSE-MsgGUID: vxjGMiZoS/OUm3a19Z3c9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68869464"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68869464"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:24:09 -0800
X-CSE-ConnectionGUID: emeuMT5tTuiYHANUruKcpg==
X-CSE-MsgGUID: Roy+IdgZS8moxYmdHZHtoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202047233"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa010.jf.intel.com with ESMTP; 06 Jan 2026 21:24:09 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/4] tests/xe_pat: add prime-external-import-comp PAT test
Date: Wed,  7 Jan 2026 05:24:04 +0000
Message-ID: <20260107052406.21678-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107052406.21678-1-x.wang@intel.com>
References: <20260107052406.21678-1-x.wang@intel.com>
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

Add a xe_pat subtest that imports a vgem dma-buf into Xe and
verifies that binding it with any compression-enabled PAT index
is rejected with -EINVAL.

Also keep a WB sanity bind to ensure imports still work with
non-compressed caching.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_pat.c | 74 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 5ad4922dd..8af6ad174 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -831,6 +831,77 @@ static void prime_external_import_coh(void)
 	drm_close_driver(fd2);
 }
 
+/**
+ * SUBTEST: prime-external-import-comp
+ * Test category: functionality test
+ * Description: Validate that imported dma-bufs cannot be bound with a PAT index
+ * that enables compression (expected to fail with -EINVAL).
+ */
+static void prime_external_import_comp(void)
+{
+	uint16_t dev_id;
+	struct intel_pat_cache pat_sw_config = {};
+	int32_t parsed;
+	struct vgem_bo vgem_bo = {};
+	int fd_vgem, fd_xe;
+	int dma_buf_fd;
+	uint32_t handle_import;
+	uint32_t vm;
+	int bpp = 32;
+	int size;
+
+	fd_vgem = drm_open_driver(DRIVER_VGEM);
+	fd_xe = drm_open_driver(DRIVER_XE);
+
+	dev_id = intel_get_drm_devid(fd_xe);
+	igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
+
+	parsed = xe_fetch_pat_sw_config(fd_xe, &pat_sw_config);
+
+	vgem_bo.width = 1024;
+	vgem_bo.height = 512;
+	vgem_bo.bpp = bpp;
+	vgem_create(fd_vgem, &vgem_bo);
+
+	size = vgem_bo.width * vgem_bo.height * bpp / 8;
+
+	dma_buf_fd = prime_handle_to_fd(fd_vgem, vgem_bo.handle);
+	handle_import = prime_fd_to_handle(fd_xe, dma_buf_fd);
+
+	vm = xe_vm_create(fd_xe, 0, 0);
+
+	for (int i = 0; i < parsed; i++) {
+		uint32_t pat;
+		bool compressed;
+		int ret;
+
+		if (pat_sw_config.entries[i].rsvd)
+			continue;
+		pat = pat_sw_config.entries[i].pat;
+		compressed = !!(pat & XE2_COMP_EN);
+		if (!compressed)
+			continue;
+		ret = __xe_vm_bind(fd_xe, vm, 0, handle_import, 0, 0x40000,
+				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+				   i, 0);
+		xe_vm_unbind_sync(fd_xe, vm, 0, 0x40000, size);
+		igt_assert_eq(ret, -EINVAL);
+	}
+
+	/* Sanity: non-compressed WB should still be accepted for imports. */
+	igt_assert_eq(__xe_vm_bind(fd_xe, vm, 0, handle_import, 0, 0x40000,
+			   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+			   intel_get_pat_idx_wb(fd_xe), 0),
+		      0);
+	xe_vm_unbind_sync(fd_xe, vm, 0, 0x40000, size);
+
+	xe_vm_destroy(fd_xe, vm);
+	close(dma_buf_fd);
+
+	drm_close_driver(fd_vgem);
+	drm_close_driver(fd_xe);
+}
+
 static bool has_no_compression_hint(int fd)
 {
 	struct drm_xe_query_config *config = xe_config(fd);
@@ -1384,6 +1455,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("prime-external-import-coh")
 		prime_external_import_coh();
 
+	igt_subtest("prime-external-import-comp")
+		prime_external_import_comp();
+
 	igt_subtest("bo-comp-disable-bind")
 		bo_comp_disable_bind(fd);
 
-- 
2.43.0

