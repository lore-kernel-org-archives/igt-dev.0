Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411A7D148B5
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 06:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D0210E69D;
	Thu,  8 Jan 2026 06:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLlFAus8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17B410E69B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767855576; x=1799391576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MsyGQ0MIeRqFowiY3MT8ktF6g4E+QgxJPoeEZDzjjHM=;
 b=cLlFAus8ckaW0sMlaXqziXLD37rTkhqYtvT8v+vk1s3v3OZkXzm4xyGs
 OFrye5DB/v3zNd6T9LrBGL9xNBswK+MZZYpNrD1DHnO9JokcctZOdNHuc
 HYEQxKedjiif2bK6nBy0BScEcBgoCCwOWNeFUdGyE0kOfd1B+45fXGWoy
 F9G2tct64ATdMVH/nkco06rxGR0mmRJRSCMEnUJZqUunYop8Eh8koKALb
 h5ynfOb7CG0Zn1w1MmW1KylnStk6BAUA08+WuysEIx68U0nlVpdn47OsY
 j9MD35v2SZHJHaWbMhqCBmewbLrx04a+OPec2HCOsa152Izi7AuMVqAyz Q==;
X-CSE-ConnectionGUID: AuraPu7XRMWcfa6f/zud1w==
X-CSE-MsgGUID: eWlI+nl0SPiA211bP2rgGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73078772"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="73078772"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:59:36 -0800
X-CSE-ConnectionGUID: HL7uNIC7QsyLwb3wI4OclA==
X-CSE-MsgGUID: o0P5jWyvTV2+mxMp4X3Odg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="203034233"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2026 22:59:36 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/4] tests/intel/xe_pat: add userptr-comp subtest
Date: Thu,  8 Jan 2026 06:59:30 +0000
Message-ID: <20260108065933.409757-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108065933.409757-1-x.wang@intel.com>
References: <20260108065933.409757-1-x.wang@intel.com>
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

Add a new xe_pat subtest that iterates the debugfs PAT table and
validates that userptr bindings are rejected for PAT entries
enabling compression and for COH_MODE_NONE entries.

Expected failures return -EINVAL.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 61 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index a7f8ab088..5ad4922dd 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -887,6 +887,64 @@ static void bo_comp_disable_bind(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: userptr-comp
+ * Test category: functionality test
+ * Description: Validate that userptr mappings cannot be bound with a PAT index
+ * that enables compression (expected to fail with -EINVAL).
+ */
+static void userptr_comp(int fd)
+{
+	size_t size = xe_get_default_alignment(fd);
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	struct intel_pat_cache pat_sw_config = {};
+	int32_t parsed;
+	uint32_t vm;
+	void *data;
+
+	igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
+
+	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
+
+	data = mmap(0, size, PROT_READ | PROT_WRITE,
+		    MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(data != MAP_FAILED);
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	for (int i = 0; i < parsed; i++) {
+		uint32_t pat;
+		uint32_t coh_mode;
+		bool compressed;
+		uint64_t va;
+		int expected;
+		int ret;
+
+		if (pat_sw_config.entries[i].rsvd)
+			continue;
+		pat = pat_sw_config.entries[i].pat;
+		compressed = !!(pat & XE2_COMP_EN);
+		coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat);
+
+		/* Spread VAs to keep each attempt independent. */
+		va = 0x40000ull + (uint64_t)i * 0x200000ull;
+
+		if (compressed || coh_mode == COH_MODE_NONE)
+			expected = -EINVAL;
+		else
+			expected = 0;
+		ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), va,
+				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
+				   i, 0);
+		igt_assert_eq(ret, expected);
+		if (!ret)
+			xe_vm_unbind_sync(fd, vm, 0, va, size);
+	}
+
+	munmap(data, size);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: display-vs-wb-transient
  * Test category: functionality test
@@ -1317,6 +1375,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("userptr-coh-none")
 		userptr_coh_none(fd);
 
+	igt_subtest("userptr-comp")
+		userptr_comp(fd);
+
 	igt_subtest("prime-self-import-coh")
 		prime_self_import_coh();
 
-- 
2.43.0

