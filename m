Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BF4C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 17:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E752E10E750;
	Tue, 18 Jun 2024 17:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/2BYWUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7829310E750
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 17:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718732121; x=1750268121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZXxC84AHchQLhStpEwvC432Xh8iKc9JWAvcuVvETTb4=;
 b=A/2BYWUMvk6K+5eaegGa2vXlFD00hWw+tSI8EjHAeGJDCuHsS1IQOBiH
 qgZam/j4MXGZigt85EtsZBeazpiT7zPsKfEgqtewHvXvc5g2nyWh+7z9g
 RhnFI6F6ZHp3uoJBenQkJi5QGgtF0dYfBKwlj+BquRUiGk3DVC9VOOLYB
 V9LBtVmXYr6GijXE4wcyx3KbPSFBp+rlJQFkVDGodX6XQUneSs8NtNKfw
 chaGBfTtlCnI71V7zXMjNB6f5rwdpCzWFgYuetEoo/xdCroKI/ljt3mBH
 FnS1w9lHl+d2OVtyWYm6aTf26I2mYBR20X/5sVlr7neIb0Mlhcrl/PeCw Q==;
X-CSE-ConnectionGUID: QCkh1wwaQvy66VyP6zmCyw==
X-CSE-MsgGUID: +LA1d2K1TYin6TCvtfwoFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26314392"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26314392"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:35:20 -0700
X-CSE-ConnectionGUID: MFWhaUymTZK8K3nXzURlgg==
X-CSE-MsgGUID: yNNDHxM/QGKk1sKhFb0y9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64872690"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:35:18 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_store: Add basic_inst_benchmark
Date: Tue, 18 Jun 2024 19:20:21 +0200
Message-ID: <20240618172021.13007-1-nirmoy.das@intel.com>
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
 tests/intel/xe_exec_store.c | 102 ++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 17 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index c872c22d5..5890faf14 100644
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
@@ -127,12 +121,10 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	sync[1].handle = syncobj;
 
 	vm = xe_vm_create(fd, 0, 0);
-	bo_size = sizeof(*data);
-	bo_size = xe_bb_size(fd, bo_size);
 
-	bo = xe_bo_create(fd, vm, bo_size,
+	bo = xe_bo_create_caching(fd, vm, bo_size,
 			  vram_if_possible(fd, eci->gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, cpu_caching);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
@@ -167,6 +159,66 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
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
+	long seconds, useconds, mtime;
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
+		mtime = ((seconds) * 1000 + useconds / 1000.0) + 0.5;
+
+		igt_info("Time taken for size %s: %ld ms\n", size_name, mtime);
+	}
+}
+
 #define PAGES 1
 #define NCACHELINES (4096/64)
 /**
@@ -342,12 +394,28 @@ igt_main
 
 	igt_subtest("basic-store") {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, STORE, &engine->instance);
+		basic_inst(fd, COND_BATCH, &engine->instance, DRM_XE_GEM_CPU_CACHING_WB);
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
+		basic_inst(fd, COND_BATCH, &engine->instance, DRM_XE_GEM_CPU_CACHING_WB);
 	}
 
 	igt_subtest_with_dynamic("basic-all") {
@@ -356,7 +424,7 @@ igt_main
 				      xe_engine_class_string(hwe->engine_class),
 				      hwe->engine_instance,
 				      hwe->gt_id);
-			basic_inst(fd, STORE, hwe);
+			basic_inst(fd, STORE, hwe, DRM_XE_GEM_CPU_CACHING_WB);
 		}
 	}
 
-- 
2.42.0

