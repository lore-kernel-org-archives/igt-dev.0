Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC0AE668A2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 23:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5F510F10A;
	Fri, 19 Dec 2025 23:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0UHjyyW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB5C10E91D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766187981; x=1797723981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Trp835PYCXcYCrciN4RIjV1Utfyj61mQ7/BsmWLYcs=;
 b=V0UHjyyWfbIlq2V1y/7i+gpj7ZwgOrBe/hqLBkVun+/oXzr+Mr1r3gyC
 l+5GwXBk4thQPLyEhyfY+b9vOTud8ZYl+bxkLH5j6//Eznf0aiMhaa6cI
 qDSR0CnVbQcwzUz6VxRVamp29buWxKjXI/NDUzUkB+tW0PRSXZk5I5FX/
 7QaDTG2yJAUnfmJJupf/2+/qrV5gRHrgz9Wr60hNkPsg0693F8r/hIBsB
 48R4qx2L7C6SjXq6YMA0t0IfG05LeAJeLlMiPe8hwnDe2p1197jf4Z9vC
 +tBdurFrM4OBBXHAi7O03avUd+e8ZBwHRWNRfmjXefrs12ofg6Aevc074 w==;
X-CSE-ConnectionGUID: HPdUCIMDQxCY3xkjL1zZBg==
X-CSE-MsgGUID: jOMc3VJfQ8mZ+KWxjxEUng==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67146943"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="67146943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 15:46:20 -0800
X-CSE-ConnectionGUID: GX32/qIcRzOUzo7xiKvNJw==
X-CSE-MsgGUID: Ra4chdmSQiuDPIG1/XhhAA==
X-ExtLoop1: 1
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa003.fm.intel.com with ESMTP; 19 Dec 2025 15:46:20 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, zbigniew.kempczynski@intel.com,
 Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v8 2/2] tests/intel/xe_pat: validate PAT table using debugfs
Date: Fri, 19 Dec 2025 23:46:14 +0000
Message-ID: <20251219234615.90213-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219234615.90213-1-x.wang@intel.com>
References: <20251219234615.90213-1-x.wang@intel.com>
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

Use xe_get_pat_sw_config() to parse the kernel-exposed PAT layout from
debugfs and validate it against IGT's predefined UC/WT/WB/UC_COMP mapping
returned by intel_get_pat_idx_*().

This helps catch drift as new platforms are added, while keeping the
common library path free of debugfs dependencies.

Also use the debugfs-provided reserved flags to determine which PAT
indices should be rejected by the kernel, instead of hard-coding the
reserved range.

V2:
 - Validate the parsed sw config against intel_pat getters

CC: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 48 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2fd3635fd..9b8ea165f 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -77,6 +77,18 @@ static void userptr_coh_none(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+#define BITS_TO(n)		(n >= sizeof(long) * 8 ? ~0 : (1UL << (n)) - 1)
+#define BITMASK(high, low)	(uint32_t)(BITS_TO(high+1) & ~BITS_TO(low))
+#define FIELD_GET(val, high, low)	(((val) & (BITMASK(high, low))) >> (low))
+#define FIELD_GET_BIT(val, n)		FIELD_GET(val, n, n)
+
+#define XE_NO_PROMOTE(val)	FIELD_GET_BIT(val, 10)
+#define XE_COMP_EN(val)		FIELD_GET_BIT(val, 9)
+#define XE_L3_CLOS(val)		FIELD_GET(val, 7, 6)
+#define XE_L3_POLICY(val)	FIELD_GET(val, 5, 4)
+#define XE_L4_POLICY(val)	FIELD_GET(val, 3, 2)
+#define XE_COH_MODE(val)	FIELD_GET(val, 1, 0)
+
 /**
  * SUBTEST: pat-index-all
  * Test category: functionality test
@@ -86,6 +98,7 @@ static void pat_index_all(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
 	size_t size = xe_get_default_alignment(fd);
+	struct intel_pat_cache pat_sw_config = {};
 	uint32_t vm, bo;
 	uint8_t pat_index;
 
@@ -114,10 +127,41 @@ static void pat_index_all(int fd)
 
 	igt_assert(intel_get_max_pat_index(fd));
 
+	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
+		/* Get the Xe PAT software configuration from the debugfs.*/
+		int32_t parsed = xe_get_pat_sw_config(fd, &pat_sw_config);
+		igt_require_f(parsed > 0,
+			      "Couldn't get Xe PAT software configuration\n");
+		for (int i = 0; i < parsed; i++) {
+			uint32_t pat = pat_sw_config.entries[i].pat;
+			igt_debug("PAT[%2d] = [ %u, %u, %u, %u, %u, %u]  (%#8x)%s\n", i,
+				  XE_NO_PROMOTE(pat),
+				  XE_COMP_EN(pat),
+				  XE_L3_CLOS(pat),
+				  XE_L3_POLICY(pat),
+				  XE_L4_POLICY(pat),
+				  XE_COH_MODE(pat),
+				  pat,
+				  pat_sw_config.entries[i].rsvd ? " *" : "");
+		}
+
+		/* Validate the parsed sw config against intel_pat getters */
+		igt_assert(pat_sw_config.max_index == intel_get_max_pat_index(fd));
+		igt_assert(pat_sw_config.uc == intel_get_pat_idx_uc(fd));
+		igt_assert(pat_sw_config.wb == intel_get_pat_idx_wb(fd));
+		if (intel_graphics_ver(dev_id) != IP_VER(35, 11)) {
+			igt_assert(pat_sw_config.wt == intel_get_pat_idx_wt(fd));
+			igt_assert(pat_sw_config.uc_comp == intel_get_pat_idx_uc_comp(fd));
+		}
+	}
+
 	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
 	     pat_index++) {
-		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
-		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
+
+		bool hw_reserved = intel_graphics_ver(dev_id) >= IP_VER(20, 0) ?
+				   pat_sw_config.entries[pat_index].rsvd : false;
+
+		if (hw_reserved) {
 			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
 						   pat_index, 0),
-- 
2.43.0

