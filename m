Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC57C3064D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 13:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C2910E2E7;
	Tue, 25 Jun 2024 13:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5edIfHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A0C10E2E7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719321797; x=1750857797;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VifOWyMBr6FTxqA9s3QsUXEWVr7Q74gtahxDafxNH3E=;
 b=k5edIfHFEtty5qi85GQBCdqiOctHBNbR/MQ3ItIos1omJjqOIKq08EDS
 RTxO/u4wbqPjw0inUpa02MqlFRGlNsfdX71ZMO6DBv/dEw/vauyNC2sgU
 zw2uIY7RlTbcwQzxqf9kWBVihIYGOiUVYa4wlHp/RAs/Bv3wNH05C64po
 SS1L0ZPYoWV3nYb+scixbPImjTNuGgzcgbyBvf//CRBAU7Rlp3NT+5BJj
 xhZNE3Q8WXV4oTVCrtsMoFkTFUR58qOMChphKAg3w1R3u1irnNQ3dlt0F
 HbSblBLU9lXlVWoLdIUYzg0MP1n3VaJcwQ3dbMR/5mIq7AEBIbUpJ0Z3c w==;
X-CSE-ConnectionGUID: prTggg0URPi07q4k0WNH+g==
X-CSE-MsgGUID: IT4rr6rRSHqfovxPvvAgrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20146903"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20146903"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:23:16 -0700
X-CSE-ConnectionGUID: suWNDZV4Ti6jbjlRssEwQw==
X-CSE-MsgGUID: +h6M3UAuRKi6EmLbAKHqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43454208"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:23:15 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/xe_exec_store: Add basic_inst_benchmark
Date: Tue, 25 Jun 2024 15:08:16 +0200
Message-ID: <20240625130816.4338-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add basic_inst_benchmark to benchmark this basic operation
for BO sizes to get basic understanding how long it takes
bind a BO and run simple GPU command on it.

This not a CI test but rather for developer to identify various
bottleneck/regression in  BO binding.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_store.c | 112 ++++++++++++++++++++++++++++++------
 1 file changed, 94 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index c872c22d5..aaabdbec3 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -93,15 +93,10 @@ static void persistance_batch(struct data *data, uint64_t addr)
 	data->addr = batch_addr;
 
 }
-/**
- * SUBTEST: basic-store
- * Description: Basic test to verify store dword.
- * SUBTEST: basic-cond-batch
- * Description: Basic test to verify cond batch end instruction.
- * SUBTEST: basic-all
- * Description: Test to verify store dword on all available engines.
- */
-static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
+
+static void basic_inst_size(int fd, int inst_type,
+			    struct drm_xe_engine_class_instance *eci,
+			    uint16_t cpu_caching, size_t bo_size)
 {
 	struct drm_xe_sync sync[2] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -117,7 +112,6 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	uint32_t exec_queue;
 	uint32_t bind_engine;
 	uint32_t syncobj;
-	size_t bo_size;
 	int value = 0x123456;
 	uint64_t addr = 0x100000;
 	uint32_t bo = 0;
@@ -127,12 +121,16 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	sync[1].handle = syncobj;
 
 	vm = xe_vm_create(fd, 0, 0);
-	bo_size = sizeof(*data);
-	bo_size = xe_bb_size(fd, bo_size);
 
-	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	if (cpu_caching)
+		bo = xe_bo_create_caching(fd, vm, bo_size,
+					  vram_if_possible(fd, eci->gt_id),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					  cpu_caching);
+	else
+		bo = xe_bo_create(fd, vm, bo_size,
+				  vram_if_possible(fd, eci->gt_id),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
@@ -167,6 +165,66 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	xe_vm_destroy(fd, vm);
 }
 
+
+/**
+ * SUBTEST: basic-store
+ * Description: Basic test to verify store dword.
+ * SUBTEST: basic-cond-batch
+ * Description: Basic test to verify cond batch end instruction.
+ * SUBTEST: basic-all
+ * Description: Test to verify store dword on all available engines.
+ */
+static void basic_inst(int fd, int inst_type,
+		       struct drm_xe_engine_class_instance *eci,
+		       uint16_t cpu_caching)
+{
+	size_t bo_size;
+
+	bo_size = sizeof(struct data);
+	bo_size = xe_bb_size(fd, bo_size);
+
+	basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
+}
+
+/**
+ * SUBTEST: basic-store-benchmark
+ * Description: Basic test to verify time taken for doing store dword with various size.
+ */
+static void basic_inst_benchmark(int fd, int inst_type,
+				 struct drm_xe_engine_class_instance *eci,
+				 uint16_t cpu_caching)
+{
+	struct {
+		size_t size;
+		const char *name;
+	} sizes[] = {
+		{SZ_4K, "SZ_4K"},
+		{SZ_2M, "SZ_2M"},
+		{SZ_64M, "SZ_64M"},
+		{SZ_128M, "SZ_128M"},
+		{SZ_256M, "SZ_256M"},
+		{SZ_1G, "SZ_1G"}
+	};
+
+	struct timeval start, end;
+	long seconds, useconds, utime;
+
+	for (size_t i = 0; i < ARRAY_SIZE(sizes); ++i) {
+		size_t bo_size = sizes[i].size;
+		const char *size_name = sizes[i].name;
+
+		gettimeofday(&start, NULL);
+		basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
+		gettimeofday(&end, NULL);
+
+		seconds = end.tv_sec - start.tv_sec;
+		useconds = end.tv_usec - start.tv_usec;
+		utime = (seconds * 1000000) + useconds;
+
+		igt_info("Time taken for size %s: %ld us\n", size_name, utime);
+	}
+}
+
 #define PAGES 1
 #define NCACHELINES (4096/64)
 /**
@@ -342,12 +400,30 @@ igt_main
 
 	igt_subtest("basic-store") {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, STORE, &engine->instance);
+		basic_inst(fd, COND_BATCH, &engine->instance, 0);
+	}
+
+	igt_subtest_with_dynamic("basic-store-benchmark") {
+		struct dyn {
+			const char *name;
+			int cache;
+		} tests[] = {
+			{"WC", DRM_XE_GEM_CPU_CACHING_WC},
+			{"WB", DRM_XE_GEM_CPU_CACHING_WB}
+		};
+		/* Enable for iGFX only for now */
+		igt_require(! xe_has_vram(fd));
+
+		for (int i = 0; i < ARRAY_SIZE(tests); i++) {
+			igt_dynamic_f("%s", tests[i].name);
+			engine = xe_engine(fd, 1);
+			basic_inst_benchmark(fd, STORE, &engine->instance, tests[i].cache);
+		}
 	}
 
 	igt_subtest("basic-cond-batch") {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, COND_BATCH, &engine->instance);
+		basic_inst(fd, COND_BATCH, &engine->instance, 0);
 	}
 
 	igt_subtest_with_dynamic("basic-all") {
@@ -356,7 +432,7 @@ igt_main
 				      xe_engine_class_string(hwe->engine_class),
 				      hwe->engine_instance,
 				      hwe->gt_id);
-			basic_inst(fd, STORE, hwe);
+			basic_inst(fd, STORE, hwe, 0);
 		}
 	}
 
-- 
2.42.0

