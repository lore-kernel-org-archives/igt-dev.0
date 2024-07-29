Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE90C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 22:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E28D10E12E;
	Mon, 29 Jul 2024 22:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5UzoLPa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F21A10E12E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722291336; x=1753827336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FOXOVORTJnn/rE68vRbAkOohDBvswAiWBU7gCjBJHDs=;
 b=h5UzoLPa18GXgFRa+SQ5NenqgaOKrGp9cMjP4mXI8rr904nfl/dHqQ4u
 LX3grgUnTkqH+xmC2nI6qg1n9m2lgLzYMYwGdmBQXYImQ0o54fqOBrje2
 GF6oDRQ4SdG5nUFdlsU/KbShKLLwkYEyENDcXXFCSmX4UZgeevBu6pfPn
 rpl8WqUKCF8vsgk30SJmE573wrNVzOlsmr6cwkunw6ill0enBob+98A8b
 LvSP9J1r4xinEDBsUmjKNLdh+B9cOhWzE0fTNcpSn3UngIQ5ObfgM+afJ
 zID1cs4ah9bhwaViyXrfeT9c4iSMT+CNFfcgeAGVDgZW+VcrAH55lcOsw A==;
X-CSE-ConnectionGUID: 1Bjb0DmpSKamb8qsluU3ww==
X-CSE-MsgGUID: upQ2p5wnS7estUTgiaFMTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="42605413"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="42605413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 15:15:35 -0700
X-CSE-ConnectionGUID: 0xZ4z1BrTP2k5oeG4QPLyw==
X-CSE-MsgGUID: iiFs/IETRlOOKUj248HGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="85069276"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2024 15:15:32 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.d.roper@intel.com
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_store: Modify test for Priority Mem
 Read feature
Date: Tue, 30 Jul 2024 03:54:34 +0530
Message-Id: <20240729222434.1643521-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
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

Now that KMD supports Priority Mem Read feature, care needs to
be taken to avoid RAW hazards which may get introduced due to
unordered read and writes. Inorder to prevent this insert
MI_MEM_FENCE which will ensure data coherency in such
scenarios.

KMD patch to enable Priority Mem Read:
https://patchwork.freedesktop.org/series/134038/

v2: Add graphics version check (Matt Roper)

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 include/intel_gpu_commands.h |  2 ++
 tests/intel/xe_exec_store.c  | 20 ++++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
index fe734c4bb..cd281ba89 100644
--- a/include/intel_gpu_commands.h
+++ b/include/intel_gpu_commands.h
@@ -89,6 +89,7 @@
 #define   MI_DISPLAY_FLIP_SKL_PLANE_3_A	(7 << 8)
 #define   MI_DISPLAY_FLIP_SKL_PLANE_3_B	(8 << 8)
 #define   MI_DISPLAY_FLIP_SKL_PLANE_3_C	(9 << 8)
+#define   MI_MEM_FENCE		MI_INSTR(0x09, 0)
 #define MI_SEMAPHORE_MBOX	MI_INSTR(0x16, 1) /* gen6, gen7 */
 #define   MI_SEMAPHORE_GLOBAL_GTT    (1<<22)
 #define   MI_SEMAPHORE_UPDATE	    (1<<21)
@@ -192,6 +193,7 @@
 #define MI_OPCODE(x)		(((x) >> 23) & 0x3f)
 #define IS_MI_LRI_CMD(x)	(MI_OPCODE(x) == MI_OPCODE(MI_INSTR(0x22, 0)))
 #define MI_LRI_LEN(x)		(((x) & 0xff) + 1)
+#define MI_WRITE_FENCE			(3 << 0)
 
 /*
  * 3D instructions used by the kernel
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index c872c22d5..8e6ffee4a 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -51,7 +51,8 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 	data->addr = batch_addr;
 }
 
-static void cond_batch(struct data *data, uint64_t addr, int value)
+static void cond_batch(struct data *data, uint64_t addr, int value,
+		       uint16_t dev_id)
 {
 	int b;
 	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
@@ -63,6 +64,10 @@ static void cond_batch(struct data *data, uint64_t addr, int value)
 	data->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
 	data->batch[b++] = sdi_addr;
 	data->batch[b++] = sdi_addr >> 32;
+
+	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0))
+		data->batch[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
+
 	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
 	data->batch[b++] = value;
 	data->batch[b++] = sdi_addr;
@@ -101,7 +106,8 @@ static void persistance_batch(struct data *data, uint64_t addr)
  * SUBTEST: basic-all
  * Description: Test to verify store dword on all available engines.
  */
-static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
+static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci,
+		       uint16_t dev_id)
 {
 	struct drm_xe_sync sync[2] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -144,7 +150,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	else if (inst_type == COND_BATCH) {
 		/* A random value where it stops at the below value. */
 		value = 20 + random() % 10;
-		cond_batch(data, addr, value);
+		cond_batch(data, addr, value, dev_id);
 	}
 	else
 		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
@@ -333,21 +339,23 @@ igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
+	uint16_t dev_id;
 	struct drm_xe_engine *engine;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
+		dev_id = intel_get_drm_devid(fd);
 	}
 
 	igt_subtest("basic-store") {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, STORE, &engine->instance);
+		basic_inst(fd, STORE, &engine->instance, dev_id);
 	}
 
 	igt_subtest("basic-cond-batch") {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, COND_BATCH, &engine->instance);
+		basic_inst(fd, COND_BATCH, &engine->instance, dev_id);
 	}
 
 	igt_subtest_with_dynamic("basic-all") {
@@ -356,7 +364,7 @@ igt_main
 				      xe_engine_class_string(hwe->engine_class),
 				      hwe->engine_instance,
 				      hwe->gt_id);
-			basic_inst(fd, STORE, hwe);
+			basic_inst(fd, STORE, hwe, dev_id);
 		}
 	}
 
-- 
2.25.1

