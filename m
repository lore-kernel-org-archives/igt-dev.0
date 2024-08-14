Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D75C52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 13:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1E210E482;
	Wed, 14 Aug 2024 13:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NL/GAJWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096B010E482
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723641908; x=1755177908;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9l6KtcEBPJogdFrQHYganZ281R3XEnuNfcRynIQJ1dc=;
 b=NL/GAJWhUSb5+7I8F6FIrsvDaV5rcif5rgPsd8CCs/WPSW1ql4I/mcnl
 +CFPFnK4mCb8SJVPHWNmdoUJXFQm3qCxTlqiBcG4s/27HR6/95IUdlZdn
 TbO4p7NEYvQC5U9i/UjMgKv0KlbpyGQgq+9St04t7bD+Y0ngCuHHyfVkq
 9vaEdNcKLZ8PlyIV3Wm2l52riOiy99H3pb8PSHXapnqDdZb5hUXWDQk4e
 rVWXRKH8WSI/Ht7sc1E8gYZLK3IYL8+O+DqGWrX8AhBU9mNsxDB+dCeZU
 AosYTQe0lJKdeBG9Cl1ILMRdb5+te8YI/oMkunypy3hewIaLTSMun89ux Q==;
X-CSE-ConnectionGUID: th7aZoXqTN+SCvRxqgcVwg==
X-CSE-MsgGUID: WNzJHW/PQvmjNBZQQBXgsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33243389"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="33243389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:25:08 -0700
X-CSE-ConnectionGUID: MPPPWka9TQa7J5K1dJcgvA==
X-CSE-MsgGUID: 8lPe0eMnRmi73c2PHzsCRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="58981951"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.89])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:25:05 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/gem_mmap_offset: Introduce mmap-unmap
 test
Date: Wed, 14 Aug 2024 15:24:04 +0200
Message-ID: <20240814132404.18392-4-krzysztof.niemiec@intel.com>
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

Introduce the mmap-unmap test, which creates two adjacent VMAs, and
checks whether a fault in the first one results in a page table UAF if
the second one is being concurrently freed.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_mmap_offset.c | 113 ++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index 95e1b2106..eb6732b7c 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -64,6 +64,7 @@
  * SUBTEST: pf-nonblock
  * SUBTEST: ptrace
  * SUBTEST: mmap-boundaries
+ * SUBTEST: mmap-unmap
  *
  */
 
@@ -1014,6 +1015,110 @@ static void test_mmap_boundaries(int i915, struct gem_memory_region *r)
 	}
 }
 
+static void __test_mmap_unmap(int i915, struct gem_memory_region *r,
+			      int limit, uint64_t obj_size, uint64_t map_addr,
+			      uint64_t map_size, uint64_t poke_addr, int flags,
+			      bool is_main)
+{
+	struct drm_i915_gem_mmap_offset mmap_offset_arg = { };
+	uint32_t handle;
+
+	handle = gem_create(i915, obj_size);
+	handle = gem_create_in_memory_region_list(i915, obj_size, 0, &r->ci, 1);
+
+	mmap_offset_arg.handle = handle;
+	mmap_offset_arg.flags = flags;
+	mmap_offset_ioctl(i915, &mmap_offset_arg);
+
+	for (int i = 0; i < limit; i++) {
+		void *errp;
+		int err;
+
+		errp = mmap((void *)map_addr,
+			    map_size,
+			    PROT_READ | PROT_WRITE,
+			    MAP_SHARED | MAP_FIXED_NOREPLACE,
+			    i915,
+			    mmap_offset_arg.offset);
+
+		if (is_main)
+			*(volatile char *)(poke_addr - SZ_1K);
+
+		igt_assert_f(errp != MAP_FAILED, "Failed to map\n");
+
+		err = munmap((void *)map_addr, map_size);
+		igt_assert_f(err >= 0, "Failed to unmap\n");
+	}
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
+			  false
+			  );
+	return NULL;
+}
+
+/* This test's failure is detected by checking the dmesg. */
+
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
@@ -1115,6 +1220,14 @@ igt_main
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

