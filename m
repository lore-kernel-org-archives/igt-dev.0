Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9376EC52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 13:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF9810E481;
	Wed, 14 Aug 2024 13:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvYgrA3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F9410E481
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723641902; x=1755177902;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1iNeFOaWCfQgovOEAAkbmqCYnFCziQQrXLkhoNhrbuE=;
 b=fvYgrA3cOwR16cZDtKFt54KWN0uEksH0YcHh8PqRdvWetzTgsMeCvmSB
 OV7xv3Cy6v9fUJPHFndkQFvyrr10X72/Xvitk2RGXtQotpf389m468TQd
 HmV8GGkTnuVnhjAVofhwwxtbubm1NFYaHxfN3ZN/KMdj9d4tge31um8+v
 f+/vnRv7dg56Q4jOBvBrproS4qbY7qkVCWszgeG4GUQUXyHThn35PrQ1D
 gRwGXbWpo+96YdammyLNiOFzuN/3OWtNuABl6BWwi//yraZjaWQ1T0W4l
 jQ8eCW5kbRLkpsB90yHSftWhxF5o3hf32vTf+rXloOpt4dAuc7hWwCRti w==;
X-CSE-ConnectionGUID: hpjPlabRQiiSQhNbwVCXxA==
X-CSE-MsgGUID: kqTmwwdiT3a2SWDNnGdx/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33243382"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="33243382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:25:01 -0700
X-CSE-ConnectionGUID: KFxpJuhDTByIWZ5ZNs5doQ==
X-CSE-MsgGUID: 1j3FdtjeSVi1edlWhWh5qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="58981900"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.89])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:24:58 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/gem_mmap_offset: Introduce
 mmap-boundaries test
Date: Wed, 14 Aug 2024 15:24:03 +0200
Message-ID: <20240814132404.18392-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814132404.18392-1-krzysztof.niemiec@intel.com>
References: <20240814132404.18392-1-krzysztof.niemiec@intel.com>
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

Introduce the mmap-boundaries test, which checks if mmap() correctly
calculates memory boundaries during the mapping.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_mmap_offset.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index 80ac8dc01..95e1b2106 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -63,6 +63,7 @@
  * SUBTEST: perf
  * SUBTEST: pf-nonblock
  * SUBTEST: ptrace
+ * SUBTEST: mmap-boundaries
  *
  */
 
@@ -989,6 +990,30 @@ static void partial_remap(int i915, struct gem_memory_region *r)
 	gem_close(i915, handle);
 }
 
+/* This test's failure is detected by checking the dmesg. */
+
+static void test_mmap_boundaries(int i915, struct gem_memory_region *r)
+{
+	const uint64_t map_size = SZ_128M - SZ_512K;
+	uint32_t handle;
+	uint8_t *map;
+
+	handle = gem_create_in_memory_region_list(i915, SZ_2G, 0, &r->ci, 1);
+
+	for_each_mmap_offset_type(i915, t) {
+		map = __mmap_offset(i915, handle, 0, map_size,
+				    PROT_READ | PROT_WRITE, t->type);
+
+		igt_assert_f(map != NULL, "Failed to map\n");
+
+		memset(map + map_size - SZ_1K, 0xab, SZ_1K);
+		for (uint64_t i = 0; i < SZ_1K; i++)
+			igt_assert_eq(map[map_size - SZ_1K + i], 0xab);
+
+		munmap(map, map_size);
+	}
+}
+
 static int mmap_gtt_version(int i915)
 {
 	int gtt_version = -1;
@@ -1082,6 +1107,14 @@ igt_main
 	igt_subtest_f("blt-coherency")
 		blt_coherency(i915);
 
+	igt_describe("Check for proper boundary calculation during mmap");
+	igt_subtest_with_dynamic("mmap-boundaries") {
+		for_each_memory_region(r, i915) {
+			igt_dynamic_f("%s", r->name)
+				test_mmap_boundaries(i915, r);
+		}
+	}
+
 	igt_fixture {
 		drm_close_driver(i915);
 	}
-- 
2.45.2

