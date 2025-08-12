Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57973CA0EDA
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 13:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D52010E34C;
	Tue, 12 Aug 2025 13:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXmSVAjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659AB10E34C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755003724; x=1786539724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DU9tH53/DAVD5QTSAFxiowasooWPEeSDETwtF+NpnvA=;
 b=DXmSVAjh1PlpY7pqhT3DiG01jz77PqTvGQFS1vM/oOg8S2fXtHIPDmap
 8DeMdJSTa3Psn0vqnAPZp5fpg+vSB9WU5gNZuR2Fc9L7QFZfF5Mt/Cwjv
 wblMu7ShKHN6OVZXCSuG2Hix7VmLiuJAHCS7g0WOVD/wjgqN5Y0OTXDuR
 JBLzPXv/FvonXS//aVpBGzmKMbax0pGdLjsVzJ+/VBzRFeYzecg7ipXpc
 GDxY15K+uOqqmoEiWeEhFD9Fkmx3EynFKHNgDa8IB8QIbURwauTbCONNL
 1QjKdHgDEq8mwPAZ5uny1amYNdRWw8w9LipG/nE6s41t8gpyLAMMOp+cK w==;
X-CSE-ConnectionGUID: VYw1Crg+TPKqSUKq1+CvSA==
X-CSE-MsgGUID: /skkZBsERyGSTLwKO/nIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79849059"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="79849059"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:02:04 -0700
X-CSE-ConnectionGUID: VyTMZVzqTSmYaUbmb2kBcA==
X-CSE-MsgGUID: Aq2+TqazSZO8xJ9YBdpuJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170407106"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:02:03 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_vm: Add bind-array-flag-invalid
 subtest
Date: Tue, 12 Aug 2025 15:01:41 +0200
Message-ID: <20250812130142.37988-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250812130142.37988-1-christoph.manszewski@intel.com>
References: <20250812130142.37988-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Add a complementary subtest to 'bind-flag-invalid' which checks vm_bind
ioctl behavior when provided a invalid flag value when submitting an array
of bind operations.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_vm.c | 90 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 3ce54053c..236494407 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2271,6 +2271,93 @@ static void bind_flag_invalid(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+static void __bind_flag_valid(int fd, uint32_t bo, struct drm_xe_vm_bind bind,
+			      struct drm_xe_vm_bind_op *bind_ops, int num_binds)
+{
+	struct drm_xe_sync *sync = from_user_pointer(bind.syncs);
+	unsigned int valid_flags[] = {
+		0,
+		DRM_XE_VM_BIND_FLAG_READONLY,
+		DRM_XE_VM_BIND_FLAG_IMMEDIATE,
+		DRM_XE_VM_BIND_FLAG_NULL,
+		DRM_XE_VM_BIND_FLAG_DUMPABLE,
+		DRM_XE_VM_BIND_FLAG_CHECK_PXP,
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(valid_flags); i++) {
+		if (!pxp_interface_supported(fd) && valid_flags[i] == DRM_XE_VM_BIND_FLAG_CHECK_PXP)
+			continue;
+
+		for (int j = 0; j < num_binds; j++) {
+			bind_ops[j].flags = valid_flags[i];
+			bind_ops[j].obj = valid_flags[i] == DRM_XE_VM_BIND_FLAG_NULL ? 0 : bo;
+		}
+
+		igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+		syncobj_reset(fd, &sync[0].handle, 1);
+	}
+}
+
+/**
+ * SUBTEST: bind-array-flag-invalid
+ * Functionality: bind
+ * Description: Ensure invalid bind flags are rejected when submitting an array of binds.
+ * Test category: negative test
+ */
+static void test_bind_flag_invalid(int fd, int num_binds)
+{
+	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_vm_bind bind;
+	uint32_t vm;
+
+	uint32_t bo, bo_size = xe_get_default_alignment(fd);
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+
+	igt_assert(num_binds > 1);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	bind_ops = calloc(num_binds, sizeof(*bind_ops));
+	for (int i = 0; i < num_binds; i++) {
+		bind_ops[i].addr = addr + i * bo_size;
+		bind_ops[i].range = bo_size;
+		bind_ops[i].obj = bo;
+		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
+		bind_ops[i].pat_index = intel_get_pat_idx_wb(fd);
+	}
+
+	memset(&bind, 0, sizeof(bind));
+	bind.vector_of_binds = to_user_pointer(bind_ops);
+	bind.num_binds = num_binds;
+	bind.syncs = to_user_pointer(sync);
+	bind.num_syncs = 1;
+	bind.vm_id = vm;
+
+	/* Using valid flags should work */
+	__bind_flag_valid(fd, bo, bind, bind_ops, num_binds);
+
+	/* Using invalid flags should not work */
+	for (int i = 0; i < num_binds; i++) {
+		bind_ops[i].flags = BIT(30);
+		bind_ops[i].obj = bo;
+	}
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
+
+	/* Using valid flags should still work */
+	__bind_flag_valid(fd, bo, bind, bind_ops, num_binds);
+
+	syncobj_destroy(fd, sync[0].handle);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: invalid-flag-%s
  * Functionality: ioctl_input_validation
@@ -2658,6 +2745,9 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_bind_array_conflict(fd, hwe, false, true);
 
+	igt_subtest("bind-array-flag-invalid")
+		test_bind_flag_invalid(fd, 16);
+
 	for (bind_size = 0x1ull << 21; bind_size <= 0x1ull << 31;
 	     bind_size = bind_size << 1) {
 		igt_subtest_f("large-binds-%lld",
-- 
2.47.1

