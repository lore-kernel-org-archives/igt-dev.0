Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39A9C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 12:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF3810E08E;
	Thu, 22 Aug 2024 12:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mu38pFPa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163A610E08E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 12:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724330884; x=1755866884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c7aJAK9DH5tk1US3c8X4yJy3SsOHQwd8Cm0xYI9F4CI=;
 b=mu38pFPadP+HI7XEaGundCfFFacFo8t6fLaK0PawHstS86JLLnUDA4lz
 sHcN9FHIjSqjhrsfARfEJds+CPd+Ju2xu0LPfn+i0LJWxYZT3v0EOHkXX
 ehpxc24iNYPJpRhuYHLHaWak81XrBnYcOPbIQwTQZZucP4qKmyvIhOYyg
 FHQTtaiqLKmfxjVQGMmTswlhsxiUhaJfzuwyaAaiUglNNe7+pu2l5ls2X
 SMgb+PuepfTRGzqCgwxaFZTH/UQq/SOK3nUDNnF63fMDvwBLg95icLeox
 KexF6JKC8jb4DNgmodvefAAfIi/dBWzKdTXPmSZOTfgLrCU/tBxt6Ow06 A==;
X-CSE-ConnectionGUID: Kp7rPvCbS7mGJZCs7rN1zA==
X-CSE-MsgGUID: fASuD3iST02hN+wa+7l1Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25636501"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="25636501"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:48:04 -0700
X-CSE-ConnectionGUID: Pr6iV3XXRpiLy4OABBolmg==
X-CSE-MsgGUID: +Ay9fgP2SAqBzFvAgCAqPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="92231800"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.123])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:47:59 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3 1/3] tests/intel/gem_mmap_offset: Partial mmap and
 munmap
Date: Thu, 22 Aug 2024 14:47:42 +0200
Message-ID: <20240822124744.13054-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822124744.13054-1-krzysztof.niemiec@intel.com>
References: <20240822124744.13054-1-krzysztof.niemiec@intel.com>
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Based on a test case developed by Lionel Landwerlin, this exercises
creation of partial mmaps using both direct methods of a partial mmap()
(where the mmap() only covers a portion of the object) and
munmap() to do the same.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_mmap_offset.c | 133 ++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index d0e439fea..80ac8dc01 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -57,6 +57,9 @@
  * SUBTEST: isolation
  * SUBTEST: oob-read
  * SUBTEST: open-flood
+ * SUBTEST: partial-mmap
+ * SUBTEST: partial-unmap
+ * SUBTEST: partial-remap
  * SUBTEST: perf
  * SUBTEST: pf-nonblock
  * SUBTEST: ptrace
@@ -875,6 +878,117 @@ static void blt_coherency(int i915)
 	igt_assert_f(compare_ok, "Problem with coherency, flush is too late\n");
 }
 
+static void partial_mmap(int i915, struct gem_memory_region *r)
+{
+	uint32_t handle;
+
+	handle = gem_create_in_memory_region_list(i915, SZ_2M, 0, &r->ci, 1);
+	make_resident(i915, 0, handle);
+
+	for_each_mmap_offset_type(i915, t) {
+		struct drm_i915_gem_mmap_offset arg = {
+			.handle = handle,
+			.flags = t->type,
+		};
+		uint32_t *ptr;
+
+		if (mmap_offset_ioctl(i915, &arg))
+			continue;
+
+		ptr = mmap(0, SZ_4K, PROT_WRITE, MAP_SHARED, i915, arg.offset);
+		if (ptr == MAP_FAILED)
+			continue;
+
+		memset(ptr, 0xcc, SZ_4K);
+		munmap(ptr, SZ_4K);
+
+		ptr = mmap(0, SZ_4K, PROT_READ, MAP_SHARED, i915, arg.offset + SZ_2M - SZ_4K);
+		igt_assert(ptr != MAP_FAILED);
+
+		for (uint32_t i = 0; i < SZ_4K / sizeof(uint32_t); i++)
+			igt_assert_eq_u32(ptr[i], 0);
+
+		munmap(ptr, SZ_4K);
+	}
+
+	gem_close(i915, handle);
+}
+
+static void partial_unmap(int i915, struct gem_memory_region *r)
+{
+	uint32_t handle;
+
+	handle = gem_create_in_memory_region_list(i915, SZ_2M, 0, &r->ci, 1);
+	make_resident(i915, 0, handle);
+
+	for_each_mmap_offset_type(i915, t) {
+		uint8_t *ptr_a, *ptr_b;
+
+		/* mmap the same GEM BO twice */
+		ptr_a = __mmap_offset(i915, handle, 0, SZ_2M,
+				PROT_READ | PROT_WRITE,
+				t->type);
+		if (!ptr_a)
+			continue;
+
+		ptr_b = __mmap_offset(i915, handle, 0, SZ_2M,
+				PROT_READ | PROT_WRITE,
+				t->type);
+		if (!ptr_b)
+			continue;
+
+		/* unmap the first mapping but the last 4k */
+		munmap(ptr_a, SZ_2M - SZ_4K);
+
+		/* memset that remaining 4k with 0xcc */
+		memset(ptr_a + SZ_2M - SZ_4K, 0xcc, SZ_4K);
+
+		/* memset the first page of the 2Mb with 0xdd */
+		memset(ptr_b, 0xdd, SZ_4K);
+
+		for (uint32_t i = 0; i < SZ_4K; i++)
+			igt_assert_eq_u32(ptr_a[SZ_2M - SZ_4K + i], 0xcc);
+
+		munmap(ptr_a + SZ_2M - SZ_4K, SZ_4K);
+		memset(ptr_b, 0, SZ_2M);
+		munmap(ptr_b, SZ_2M);
+	}
+
+	gem_close(i915, handle);
+}
+
+static void partial_remap(int i915, struct gem_memory_region *r)
+{
+	uint32_t handle;
+
+	handle = gem_create_in_memory_region_list(i915, SZ_2M, 0, &r->ci, 1);
+	make_resident(i915, 0, handle);
+
+	for_each_mmap_offset_type(i915, t) {
+		long tail = SZ_2M - SZ_4K;
+		uint8_t *ptr;
+
+		ptr = __mmap_offset(i915, handle, 0, SZ_2M,
+				PROT_READ | PROT_WRITE,
+				t->type);
+		if (!ptr)
+			continue;
+
+		igt_assert_eq_u32(ptr[0], 0);
+		igt_assert(munmap(ptr, tail) == 0);
+
+		ptr = mremap(ptr + tail, SZ_4K, SZ_4K, MREMAP_MAYMOVE | MREMAP_FIXED, SZ_4K);
+		igt_info("Testing remap(%s), tail of 2M object at ptr=%p\n",
+			 t->name, ptr);
+		igt_assert(ptr == (uint8_t *)SZ_4K);
+
+		igt_assert_eq_u32(ptr[0], 0);
+		munmap(ptr, SZ_4K);
+	}
+
+	gem_close(i915, handle);
+}
+
 static int mmap_gtt_version(int i915)
 {
 	int gtt_version = -1;
@@ -932,6 +1046,25 @@ igt_main
 	igt_subtest_f("open-flood")
 		open_flood(i915, 20);
 
+	igt_subtest_with_dynamic("partial-mmap") {
+		for_each_memory_region(r, i915) {
+			igt_dynamic_f("%s", r->name)
+				partial_mmap(i915, r);
+		}
+	}
+	igt_subtest_with_dynamic("partial-unmap") {
+		for_each_memory_region(r, i915) {
+			igt_dynamic_f("%s", r->name)
+				partial_unmap(i915, r);
+		}
+	}
+	igt_subtest_with_dynamic("partial-remap") {
+		for_each_memory_region(r, i915) {
+			igt_dynamic_f("%s", r->name)
+				partial_remap(i915, r);
+		}
+	}
+
 	igt_subtest_with_dynamic("clear") {
 		for_each_memory_region(r, i915) {
 			igt_dynamic_f("%s", r->name)
-- 
2.45.2

