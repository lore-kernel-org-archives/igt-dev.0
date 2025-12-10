Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F05D2CE17
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 05:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BA510E09D;
	Wed, 10 Dec 2025 05:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XE2m4dGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7943510E09D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765344266; x=1796880266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EoP9XuMnjFobOuxnFpI2cPNF932nB4iiejPyLeX0ZPk=;
 b=XE2m4dGAGnKLKpLEf3ohAovuokFoD0rLdt9eEss6j1KydQ33QGD7QvZN
 F8sQ05DdesoXu7drrY56SmozyLqjH+cC0doaMgEPl6NnNJNv7jnUCxFmc
 mV1tifRa4QEt+Y1dUr2q8gcK5TegzsRygQDmxjKpa1bTJu1seGU0YnPPq
 MxUPee/8+VJ5NNqqG4oRKSM7HNzgBu9CaYtxzY9dYLM/JdNZZvxvHeb1P
 X3emN4qt0osYjy4VVbNou/Pj4+EyNicsIZ9m1+OL7tKAvLbnKjujzSkIk
 Ecq7rQM2Pdvgd2Nft/nwSvCNT9M89/EXgu8lHwsLc9uTATbZMb7OHCjdL A==;
X-CSE-ConnectionGUID: 7vPENMMrQP+67RQnzTmEKw==
X-CSE-MsgGUID: bKU+lIEBQ/GOmYnNoCRnIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71172945"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71172945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:24:25 -0800
X-CSE-ConnectionGUID: P1QEDUN1RA+4PSUDUF7nzw==
X-CSE-MsgGUID: 1enNA050St+qyZOM9dK2AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="227461494"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 21:24:25 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, Xin Wang <x.wang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 2/2] tests/intel/xe_pat: sync with Xe PAT debugfs parser
Date: Wed, 10 Dec 2025 05:24:22 +0000
Message-ID: <20251210052422.149552-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206011241.67825-2-x.wang@intel.com>
References: <20251206011241.67825-2-x.wang@intel.com>
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

Pull in the Xe PAT table parsed by lib/intel_pat so Xe2+ tests use
the driver-provided entries instead of hard-coded reservations.

CC: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 59dfb6b11..82891b6f7 100644
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
+	struct xe_pat_entry xe_pat_table[XE_PAT_MAX_ENTRIES] = {0};
 	uint32_t vm, bo;
 	uint8_t pat_index;
 
@@ -114,10 +127,31 @@ static void pat_index_all(int fd)
 
 	igt_assert(intel_get_max_pat_index(fd));
 
+	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
+		/* Get the Xe PAT entries from debugfs */
+		uint8_t pat_entries = xe_get_pat_entries(fd, xe_pat_table);
+
+		for (int i = 0; i < pat_entries; i++) {
+			uint32_t pat = xe_pat_table[i].pat;
+			igt_debug("PAT[%2d] = [ %u, %u, %u, %u, %u, %u]  (%#8x)%s\n", i,
+				  XE_NO_PROMOTE(pat),
+				  XE_COMP_EN(pat),
+				  XE_L3_CLOS(pat),
+				  XE_L3_POLICY(pat),
+				  XE_L4_POLICY(pat),
+				  XE_COH_MODE(pat),
+				  pat,
+				  xe_pat_table[i].rsvd ? " *" : "");
+		}
+	}
+
 	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
 	     pat_index++) {
-		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
-		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
+
+		bool hw_reserved = intel_graphics_ver(dev_id) >= IP_VER(20, 0) ?
+			      xe_pat_table[pat_index].rsvd : false;
+
+		if (hw_reserved) {
 			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
 						   pat_index, 0),
-- 
2.43.0

