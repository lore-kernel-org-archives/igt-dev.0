Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC462C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 12:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A9610E090;
	Thu, 22 Aug 2024 12:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLRORjs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CAA10E094
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724330899; x=1755866899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9z7Rz1t2+iK/85hKXzfIFqjxVz1T8o+5vx8A3BAEcms=;
 b=QLRORjs8kRS8Vrf9wi+r6IKmexKfTTtIF0br3xrhK7n4TRzkjGRUIQfy
 rXzZ8vRJQLoOBu6w3M5eecq4bR94I7Xm8M6X8BdkCPDLLPeuyyAcl3KfB
 CxnOHKWhB07ZmbJHfU0tf1PlNyz01XuIpOflYbOTt+xlYiftYUg1SQ/X0
 zTIzTYAufNUiNiPdP9BhRh5+vHbBdedhy1Y2VIl+DfDEFQlZom/LTAcKT
 xfBe7Uw+TGolzxSFS5x8tEX04nl9FvPyJNuUxn8X4QX3YLyJ0HGOwo1Z6
 vE44M+6pT52AX7XQI0RQ/E11oMbXNFHNz/ZchDlWKaYfU/1RzYLzSOIwu Q==;
X-CSE-ConnectionGUID: T+WvPwwPQR6OpuAJzblD2w==
X-CSE-MsgGUID: svmMSxE4RHqfCoD5ZvG2PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25636521"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="25636521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:48:19 -0700
X-CSE-ConnectionGUID: rsQUOD7hS7qFMJRn1VbQrw==
X-CSE-MsgGUID: JfY5U8TbSbinq/mOVZSKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="92231901"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.123])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:48:15 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/intel/gem_mmap_offset: Introduce
 mmap-unmap test
Date: Thu, 22 Aug 2024 14:47:44 +0200
Message-ID: <20240822124744.13054-4-krzysztof.niemiec@intel.com>
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

Introduce the mmap-unmap test, which creates two adjacent VMAs, and
checks whether a fault in the first one results in a page table UAF if
the second one is being concurrently freed.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_mmap_offset.c | 113 ++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index e95c26e7f..97bc95260 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -56,6 +56,7 @@
  * SUBTEST: close-race
  * SUBTEST: isolation
  * SUBTEST: mmap-boundaries
+ * SUBTEST: mmap-unmap
  * SUBTEST: oob-read
  * SUBTEST: open-flood
  * SUBTEST: partial-mmap
@@ -1016,6 +1017,110 @@ static void test_mmap_boundaries(int i915, struct gem_memory_region *r)
 	gem_close(i915, handle);
 }
 
+static void __test_mmap_unmap(int i915, struct gem_memory_region *r,
+			      int limit, uint64_t obj_size, uint64_t map_addr,
+			      uint64_t map_size, uint64_t poke_addr, int flags,
+			      bool is_main)
+{
+	struct drm_i915_gem_mmap_offset mmap_offset_arg = { };
+	uint32_t handle;
+
+	handle = gem_create_in_memory_region_list(i915, obj_size, 0, &r->ci, 1);
+	make_resident(i915, 0, handle);
+
+	mmap_offset_arg.handle = handle;
+	mmap_offset_arg.flags = flags;
+	mmap_offset_ioctl(i915, &mmap_offset_arg);
+
+	for (int i = 0; i < limit; i++) {
+		void *errp;
+		int err;
+
+		errp = mmap(from_user_pointer(map_addr),
+			    map_size,
+			    PROT_READ | PROT_WRITE,
+			    MAP_SHARED | MAP_FIXED_NOREPLACE,
+			    i915,
+			    mmap_offset_arg.offset);
+
+		if (errp == MAP_FAILED)
+			continue;
+
+		if (is_main)
+			*(volatile char *)from_user_pointer(poke_addr - SZ_1K);
+
+		err = munmap(from_user_pointer(map_addr), map_size);
+		igt_assert_f(err >= 0, "Failed to unmap\n");
+	}
+	gem_close(i915, handle);
+}
+
+struct flipper_thread_args {
+	int i915;
+	struct gem_memory_region *r;
+	int limit;
+	uint64_t map_addr;
+	uint64_t map_size;
+	uint64_t flags;
+};
+
+static void *flipper_thread_fn(void *data)
+{
+	struct flipper_thread_args *args;
+
+	args = data;
+	__test_mmap_unmap(args->i915,
+			  args->r,
+			  args->limit,
+			  args->map_size, /* obj_size == map_size in flipper */
+			  args->map_addr,
+			  args->map_size,
+			  args->map_addr,  /* we ignore the poke in flipper thread */
+			  args->flags,
+			  false);
+	return NULL;
+}
+
+/* This test's failure is detected by checking the dmesg. */
+static void test_mmap_unmap(int i915, int limit, struct gem_memory_region *r)
+{
+	struct flipper_thread_args data;
+	pthread_t flipper_thread;
+
+	uint64_t flipper_map_addr;
+	uint64_t flipper_map_size;
+	uint64_t main_map_size;
+	uint64_t main_map_addr;
+	uint64_t poke_addr;
+	uint64_t obj_size;
+
+	flipper_map_addr = 0x8000000000;
+	flipper_map_size = SZ_2M;
+	main_map_size = SZ_128M - SZ_512K;
+	main_map_addr = flipper_map_addr - main_map_size;
+	poke_addr = flipper_map_addr;
+	obj_size = 1060 * SZ_1M;
+
+	data.i915 = i915;
+	data.r = r;
+	data.limit = limit;
+	data.map_addr = flipper_map_addr;
+	data.map_size = flipper_map_size;
+
+	for_each_mmap_offset_type(i915, t) {
+		int err;
+
+		data.flags = t->type;
+		err = pthread_create(&flipper_thread, NULL, flipper_thread_fn, &data);
+		igt_assert_f(err == 0, "Failed to create flipper\n");
+
+		__test_mmap_unmap(i915, r, limit, obj_size, main_map_addr,
+				  main_map_size, poke_addr, t->type, true);
+
+		pthread_join(flipper_thread, NULL);
+	}
+}
+
 static int mmap_gtt_version(int i915)
 {
 	int gtt_version = -1;
@@ -1117,6 +1222,14 @@ igt_main
 		}
 	}
 
+	igt_describe("Check for UAF if one VMA faults while an adjacent one unmaps");
+	igt_subtest_with_dynamic("mmap-unmap") {
+		for_each_memory_region(r, i915) {
+			igt_dynamic_f("%s", r->name)
+				test_mmap_unmap(i915, 10000, r);
+		}
+	}
+
 	igt_fixture {
 		drm_close_driver(i915);
 	}
-- 
2.45.2

