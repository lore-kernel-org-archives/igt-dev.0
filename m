Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7ADC44501
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 08:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D2510E055;
	Thu,  9 Jul 2026 08:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BN1QNH1J";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011022.outbound.protection.outlook.com [52.101.57.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231B410E055
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 08:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hk/gqsBDKwMB+kXGa5Er0UJBl7ZvMEH86GFsuYJZ8TBiUxxFawjmSxicCdBeOJAXlqZhJ5JSMc6mIHQvgtEm+ys3LewN6ruSS5kF/PAe9/Y8zOArFIWIKlSmPx5xZlKwOkBkKy9iBqI97e200ni/k4qEZwhfGMVlE3h5E3NP7FsqgRxTnZSKV6zybWazfWG7h7t03F31sZDTXjoCwTW9uTEylF93uTTVMKx6ElkmGeemnoyiZWXvkqCuLFwyWUoFie39rAXVXxVpxFUUVZqQ4BmdKyCEYFYD1TI7Jvdx7sZ8csxiC5awm5N9rY3Xj578jxJrsigizdwCuFJ4FRmbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FciI5OpkUkIsWSqnHEzfL1O7Z9pcXsA5utAQGnoGDAo=;
 b=txs2D6rh3kCMMUfaRLdLZIIEYkv7eh5m4HS2QivWsSDO9bF7k2lb1vdRJ/4Ogq4BevQiCvw+wAtJqZorD2ukbEqK/U+735L+6UMkQJxrJOjsDY4qYBci1ve7qvzaIJCGq2Kj/ibqrMooDp4eA62tMH51trSgpsVOUy9yIIGfGZg6Fg9djkx5Z2r7amHpWh+wpbkhRh/UCrcioY0TVenU7J4dX/+xk7F/K40jwWEcTFuYZZxojmb/CDwV0hozwOE5TMq5s55ClTRKEwWT8zzjbWYl5gqkYy5aD7wKAiEaC/619JmioL8wWY/iqLZzpf2i8MBKV0/mcO+vIzP5Ow4kWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FciI5OpkUkIsWSqnHEzfL1O7Z9pcXsA5utAQGnoGDAo=;
 b=BN1QNH1JQx5F9chesIBpCMmhweh+Xh/W397WQZDF/tD0jbBp5+Pg4pqgYi467If2IH6CvQJ4CsfhtidR0EDp5B4daGmVKEV6TEsJ1Uh2iIK1HnKOJl1AhVhXjIiqlOMRXWhxXFmEVJVzYUnqgy9UPkGL9BNm6eMljp+iJXjHQ8s=
Received: from SN7PR04CA0020.namprd04.prod.outlook.com (2603:10b6:806:f2::25)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 08:40:50 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::6f) by SN7PR04CA0020.outlook.office365.com
 (2603:10b6:806:f2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 08:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 08:40:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 03:40:39 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 03:40:38 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add compute scratch memory test
Date: Thu, 9 Jul 2026 16:39:06 +0800
Message-ID: <20260709084037.1912218-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|MN2PR12MB4142:EE_
X-MS-Office365-Filtering-Correlation-Id: d39cbc2d-10f2-447c-303f-08dedd95c784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|56012099006|11063799006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: qAhEeiiXyrpRG9te1q7eL1oet4qBCE63uNglECJjhpKNVpqd78Ov55hXUk4XMNcMrmUNhaNcD2oYaM/gG85B9sAT56UV9axjrGmAVZStBRJIFewdzLProVPkvnfuQxmjEysMQ9V7PYXfaFiPaWaAm9rbiH4qVgFOdyuhYTVeyLOrSk9xl3eucyalKquu5BLfwvWeKuq/fcwer6fRtHDMRQigqoqIVzQP26fiz5IMNM4jyrwMKo6qGW7AEBaqqduh9zcya9bob31P/zVd+rABEcd5dpfx1byRwW52cdzbkorg2Vnwt1RD29fm0ZYklS0lXbMYfVa/lcEr/ASnDkSfrKDcYJyv3Qgru5X5ZQE7ifnRPVk7JyAP8gQGd5z4hGM22J3pQ3BZTNmE717WAS6VTmKZudDEAt5BeCDIWiQ8h4oOAVOcdQhLrP4UKSo99Dek9wnDXz4e5ZDfI4p4k3Yyz/b+5cnxZFxk/xcomwLRcfIqEg1IqKWm6FrkfsrnjZw6wqciL+VSllJlw5Ljz0eh7JMLF1QPYfn72r7nOvPCQtsfBOPQvHT4qVEa6K0U0KNAVrsXQMqXePV+27Acu+DQ5OXr783RXzVv+JgM1ojwYAIjwDd19K2yCIpTfi1TLZDuAEPah/mlbJRQ0i89sKd7d1QbtJ+USDCdroOS8LxCCiYX+OfvDl0KGFwgbsEPDJVBrueb4v8MJHue/WaEuFpqxA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MPdYWQupQrmuS6r5z8vDDye9chCozsIqMOZCKuhmK2UCZZKHH5yqdlOApLlXnSGOSlKiuQI6g0LzHLvWzrn0s+W1J5n7pvknS59heKjV+j9SnX8YWYWAXCgKQLLA0Dmj3qGYLkLW5MXB0e6A7FSGpBTFmPriLmyExgSivMwJ1uAlARlG86LbfR1W0FbLqcpQpxTmjeuzML3fLn2b3GMKJ06zJ6nMzOPnwV1glK03IQ11Y4CUqErgbfeEO70h5b61vOwZJUvzW564HU2Mgp64oLgEpnq89pC+zilBLhHLQScvgQR6fGeLSGHpdQ/8GHpRr04Nxx9Rf2ER1yoHsVcRnHPJpkC89EFQdy+o++8tXjaqtE8xdUg5o9/AsDe+rYufB58oj1L4lBOspmbReUfyyekTZWKOj53yzR4mjFd08hvrTUYwwV57RyO5maFOs8zY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 08:40:49.9735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d39cbc2d-10f2-447c-303f-08dedd95c784
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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

Add a gfx11 compute scratch-aperture round-trip test on the KGD
user-mode-queue (UQM) path. It assembles a small ScratchCopyDword shader
and dispatches it in two hops (src -> scratch aperture -> dst); dst ==
src proves the SPI scratch base and per-wave offset are correct. The
aperture base comes from the kernel (dev_info.scratch_base) with a gfx11
constant fallback.

The UQM path exercises the compute CWSR context save/restore area:
lib/amdgpu enables the CWSR path and passes a correctly-sized MQD with a
valid ctx_save_area. The compute MQD uAPI gains ctx_save_area_addr/size,
ordered after cu_mask_* and the priority fields to match the kernel and
libdrm layout.

v2: split per-generation packet emission into
    amdgpu_emit_scratch_dispatch_gfx11() selected via a switch, keeping
    the common dispatch init (and IB bind) shared. (Vitaly)

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h           |  22 +-
 lib/amdgpu/amd_registers.h              |  26 +++
 lib/amdgpu/amd_userq.c                  |   7 +-
 lib/amdgpu/compute_utils/amd_dispatch.c | 266 ++++++++++++++++++++++++
 lib/amdgpu/compute_utils/amd_dispatch.h |   3 +
 tests/amdgpu/amd_dispatch.c             |  21 ++
 6 files changed, 333 insertions(+), 12 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index b2a1688e6..66c37191b 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -456,17 +456,6 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {
 	 * to get the size.
 	 */
 	__u64   eop_va;
-	/**
-	 * @ctx_save_area_addr: Virtual address of the GPU memory for save/restore buffer.
-	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
-	 * to get the size.
-	 */
-	__u64 ctx_save_area_addr;
-	/**
-	 * @ctx_save_area_size:  Total size allocated for save/restore buffer.
-	 * Use AMDGPU_INFO IOCTL to get the size.
-	 */
-	__u32 ctx_save_area_size;
 	/**
 	 * @cu_mask_ptr: User-space pointer to CU (Compute Unit) mask array
 	 * Points to an array of __u32 values that define which CUs are enabled
@@ -494,6 +483,17 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {
 	 * Specifies the target XCC (Cross Compute Complex) for PM4 commands
 	 */
 	__u32 pm4_target_xcc;
+	/**
+	 * @ctx_save_area_addr: Virtual address of the GPU memory for save/restore buffer.
+	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
+	 * to get the size.
+	 */
+	__u64 ctx_save_area_addr;
+	/**
+	 * @ctx_save_area_size:  Total size allocated for save/restore buffer.
+	 * Use AMDGPU_INFO IOCTL to get the size.
+	 */
+	__u32 ctx_save_area_size;
 };
 
 /* userq signal/wait ioctl */
diff --git a/lib/amdgpu/amd_registers.h b/lib/amdgpu/amd_registers.h
index ff62b8931..ef87736a2 100644
--- a/lib/amdgpu/amd_registers.h
+++ b/lib/amdgpu/amd_registers.h
@@ -34,6 +34,32 @@ enum general_reg {
 	COMPUTE_NUM_THREAD_X,
 };
 
+/*
+ * Absolute register offsets (mm*) of the COMPUTE SH registers, from
+ * drivers/gpu/drm/amd/include/asic_reg/gca/gfx_7_2_d.h (gfx9+ regs from
+ * gc_12_0_0_offset.h, converted to the mm scheme). A PM4 SET_SH_REG packet
+ * carries (mm_offset - PACKET3_SET_SH_REG_START); use SH_REG(name) below so
+ * the emit sites read as register names instead of magic numbers.
+ */
+#define PACKET3_SET_SH_REG_START		0x00002c00
+#define mmCOMPUTE_START_X			0x2e04
+#define mmCOMPUTE_NUM_THREAD_X			0x2e07
+#define mmCOMPUTE_PGM_LO			0x2e0c
+#define mmCOMPUTE_DISPATCH_SCRATCH_BASE_LO	0x2e10
+#define mmCOMPUTE_DISPATCH_SCRATCH_BASE_HI	0x2e11
+#define mmCOMPUTE_PGM_RSRC1			0x2e12
+#define mmCOMPUTE_PGM_RSRC2			0x2e13
+#define mmCOMPUTE_RESOURCE_LIMITS		0x2e15
+#define mmCOMPUTE_TMPRING_SIZE			0x2e18
+#define mmCOMPUTE_PGM_RSRC3			0x2e28
+#define mmCOMPUTE_USER_DATA_0			0x2e40
+
+/* PM4 SET_SH_REG register-field offset for a named compute register. */
+#define SH_REG(mmreg)		((mmreg) - PACKET3_SET_SH_REG_START)
+
+/* COMPUTE_PGM_RSRC2.SCRATCH_EN (bit 0). */
+#define COMPUTE_PGM_RSRC2__SCRATCH_EN		0x1
+
 struct amd_reg {
 	enum general_reg reg_name;
 	int 	 reg_offset;
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index 98a53223d..f94991971 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -3,6 +3,11 @@
  * Copyright 2025 Advanced Micro Devices, Inc.
  */
 
+/* libdrm exposes amdgpu_query_cwsr_info + struct drm_amdgpu_info_cwsr; enable
+ * the CWSR path so compute userq passes a valid ctx_save_area to the
+ * (cwsr-enabled) kernel. */
+#define HAVE_AMDGPU_INFO_CWSR 1
+
 #include "amd_userq.h"
 #include "amd_memory.h"
 #include "amd_PM4.h"
@@ -298,7 +303,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 	uint64_t gtt_flags = 0, queue_flags = 0;
 	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
 	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
-	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
+	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd = {0};
 	uint32_t ctl_stack_size_bytes = 0, dbg_mem_size_bytes = 0, min_save_area_size = 0;
 	bool compute_need_cwsr = false;
 	void *mqd;
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 7bb6f4174..926690f13 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -4,6 +4,7 @@
 // Copyright 2023 Advanced Micro Devices, Inc.
 
 #include <amdgpu.h>
+#include <amdgpu_drm.h>
 #include "amdgpu/amd_memory.h"
 #include "amdgpu/amd_userq.h"
 #include "amd_dispatch.h"
@@ -11,7 +12,10 @@
 #include "amd_dispatch_helpers.h"
 #include "amdgpu/amd_PM4.h"
 #include "amdgpu/amd_ip_blocks.h"
+#include "amdgpu/amd_registers.h"
 #include "amdgpu/shaders/amd_shaders.h"
+#include "amdgpu/shaders/amd_shader_store.h"
+#include "amdgpu/shaders/amd_llvm_asm.h"
 
 static void
 amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
@@ -442,6 +446,268 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	return r;
 }
 
+/*
+ * Emit one scratch-enabled compute dispatch that copies a dword from arg_src to
+ * arg_dst (used by the kfdtest-style FlatScratchAccess two-hop below). Register
+ * offsets use the named mmCOMPUTE_* macros in amd_registers.h.
+ *
+ * Scratch base is provided per-gen: <=gfx11 the shader writes FLAT_SCR from
+ * s[4:5]; gfx12 SCRATCH_BASE is read-only and HW-loaded from
+ * COMPUTE_DISPATCH_SCRATCH_BASE. Enable via COMPUTE_PGM_RSRC2.SCRATCH_EN +
+ * COMPUTE_TMPRING_SIZE (WAVES=#SE). Shader assembled at runtime via LLVM MC.
+ */
+#ifdef AMDGPU_LLVM_ENABLED
+static void
+amdgpu_emit_scratch_dispatch_gfx11(struct amdgpu_cmd_base *base_cmd,
+			 uint64_t mc_shader, uint64_t mc_scratch,
+			 uint64_t arg_src, uint64_t arg_dst, uint32_t num_waves)
+{
+
+	/* COMPUTE_PGM_LO/HI */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+	base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_PGM_LO));
+	base_cmd->emit(base_cmd, mc_shader >> 8);
+	base_cmd->emit(base_cmd, mc_shader >> 40);
+
+	/* COMPUTE_PGM_RSRC1 / RSRC2 (enable scratch) */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+	base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_PGM_RSRC1));
+	base_cmd->emit(base_cmd, 0x600C0041 & ~(1u << 29));
+	base_cmd->emit(base_cmd, 0x00000090 | COMPUTE_PGM_RSRC2__SCRATCH_EN);
+
+	/* COMPUTE_DISPATCH_SCRATCH_BASE_LO/HI (256-byte units); gfx12 HW loads
+	 * the read-only SCRATCH_BASE from this. */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+	base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_DISPATCH_SCRATCH_BASE_LO));
+	base_cmd->emit(base_cmd, (mc_scratch >> 8) & 0xffffffff);
+	base_cmd->emit(base_cmd, mc_scratch >> 40);
+
+	/* COMPUTE_NUM_THREAD_X/Y/Z = 1 */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 3));
+	base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_NUM_THREAD_X));
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+
+	/* COMPUTE_PGM_RSRC3 - required on gfx11+ */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_PGM_RSRC3));
+	base_cmd->emit(base_cmd, 0x3f0);
+
+	/* COMPUTE_TMPRING_SIZE = (WAVESIZE<<12)|WAVES; WAVES=#SE (kfdtest sizing) */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_TMPRING_SIZE));
+	base_cmd->emit(base_cmd, (1u << 12) | (num_waves & 0xfff));
+
+	/* User data: s[0:1]=src, s[2:3]=dst, s[4:5]=scratch base (byte; <=gfx11 FLAT_SCR) */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 6));
+	base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_USER_DATA_0));
+	base_cmd->emit(base_cmd, arg_src & 0xffffffff);
+	base_cmd->emit(base_cmd, arg_src >> 32);
+	base_cmd->emit(base_cmd, arg_dst & 0xffffffff);
+	base_cmd->emit(base_cmd, arg_dst >> 32);
+	base_cmd->emit(base_cmd, mc_scratch & 0xffffffff);
+	base_cmd->emit(base_cmd, mc_scratch >> 32);
+
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_RESOURCE_LIMITS));
+	base_cmd->emit(base_cmd, 0);
+
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
+	base_cmd->emit(base_cmd, 0x10);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
+}
+
+/*
+ * Allocate+map a BO for the scratch test. On a user queue every BO the queue
+ * touches must be made resident, so use the sync variant + timeline wait.
+ */
+static int
+scratch_alloc_bo(amdgpu_device_handle dev, int size, uint32_t domain,
+		 struct amdgpu_ring_context *rc,
+		 amdgpu_bo_handle *bo, void **cpu, uint64_t *mc,
+		 amdgpu_va_handle *va)
+{
+	int r;
+
+	r = amdgpu_bo_alloc_and_map_sync(dev, size, 4096, domain, 0,
+					 AMDGPU_VM_MTYPE_UC, bo, cpu, mc, va,
+					 rc->timeline_syncobj_handle,
+					 ++rc->point, true);
+	if (r)
+		return r;
+	return amdgpu_timeline_syncobj_wait(dev, rc->timeline_syncobj_handle,
+					    rc->point);
+}
+#endif
+
+/*
+ * GPU scratch (private) memory round-trip test, a direct port of kfdtest
+ * KFDMemoryTest.FlatScratchAccess to the amdgpu KGD path. Same shader
+ * (ScratchCopyDwordIsa) and same two-hop structure:
+ *   hop0: *src -> scratch aperture VA; hop1: scratch aperture VA -> *dst.
+ * The FLAT load/store is routed to scratch by the private aperture
+ * (private_base<<48 == 0x1000000000000000 on gfx11). dst==src proves the
+ * cross-dispatch scratch round-trip worked. Runs on a KGD user queue.
+ *
+ * Determinism (matching kfdtest) requires:
+ *   1. both dispatches share ONE scratch backing BO so the written slot persists;
+ *   2. WAVES=#SE, waveSize=1, dim 1x1x1 -> exactly one wave, placed by the SPI at
+ *      scratch offset 0 on each dispatch (same physical slot);
+ *   3. a full wait (== kfdtest Sync) between the two submits (the
+ *      synchronous user-queue submit);
+ *   4. a FRESH IB command BO per submit — reusing one IB BO for a back-to-back
+ *      compute submit makes the 2nd dispatch read ring NOP-fill and fault
+ *      (bad_op / ring reset). This is the crux; kfdtest gets it for free via a
+ *      per-dispatch IndirectBuffer.
+ * gfx11 only.
+ */
+int
+amdgpu_scratch_dispatch_test(amdgpu_device_handle device_handle,
+			   uint32_t ip_type, uint32_t version)
+{
+#ifndef AMDGPU_LLVM_ENABLED
+	igt_info("SKIP scratch two-hop: built without LLVM MC assembler\n");
+	return 0;
+#else
+	uint64_t aperture;
+	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_scratch;
+	volatile uint32_t *ptr_dst;
+	void *ptr_shader, *ptr_scratch;
+	uint32_t *ptr_src;
+	uint64_t mc_src, mc_dst, mc_shader, mc_scratch;
+	amdgpu_va_handle va_src, va_dst, va_shader, va_scratch;
+	int r, hop;
+	const int bo_size = 4096;
+	const int bo_scratch_size = 0x10000;
+	struct amdgpu_gpu_info gpu_info = {0};
+	struct drm_amdgpu_info_device dev_info = {0};
+	struct amdgpu_ring_context *ring_context = NULL;
+	const struct amdgpu_ip_block_version *ip_block = NULL;
+	uint32_t num_waves;
+	char mcpu[16];
+	uint8_t isa[4096];
+	size_t isa_size = 0;
+
+	if (version != 11) {
+		igt_info("SKIP scratch two-hop: gfx11 only, got %u\n", version);
+		return 0;
+	}
+
+	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
+	igt_assert_eq(r, 0);
+	/* Prefer the kernel-reported scratch/private aperture; fall back to the
+	 * gfx11 constant (gmc private_aperture_start) on older kernels that don't
+	 * export it. kfdtest gets the same value from KFD topology. */
+	r = amdgpu_query_info(device_handle, AMDGPU_INFO_DEV_INFO,
+			      sizeof(dev_info), &dev_info);
+	igt_assert_eq(r, 0);
+	aperture = dev_info.scratch_base ? dev_info.scratch_base
+					 : 0x1000000000000000ull;
+	igt_info("scratch aperture base: 0x%016lx (%s)\n", aperture,
+		 dev_info.scratch_base ? "kernel" : "fallback constant");
+	/* WAVES = #SE so the SPI deterministically places the single wave at
+	 * scratch offset 0 on every dispatch (kfdtest SetScratch numWaves). */
+	num_waves = gpu_info.num_shader_engines ? gpu_info.num_shader_engines : 1;
+	amdgpu_family_id_to_mcpu(gpu_info.family_id, mcpu, sizeof(mcpu));
+	if (amdgpu_llvm_asm_init() != 0 ||
+	    amdgpu_llvm_assemble(mcpu, ScratchCopyDwordIsa, isa, sizeof(isa),
+				 &isa_size) != 0 || isa_size == 0) {
+		igt_info("SKIP scratch two-hop: LLVM assemble failed for %s\n", mcpu);
+		return 0;
+	}
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+	ip_block = get_ip_block(device_handle, ip_type);
+	ip_block->funcs->userq_create(device_handle, ring_context,
+				      ip_block->type);
+
+	r = scratch_alloc_bo(device_handle, bo_size, AMDGPU_GEM_DOMAIN_VRAM,
+			ring_context, &bo_shader, &ptr_shader,
+			&mc_shader, &va_shader);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader, 0, bo_size);
+	memcpy(ptr_shader, isa, isa_size);
+	r = scratch_alloc_bo(device_handle, bo_size, AMDGPU_GEM_DOMAIN_VRAM,
+			ring_context, &bo_src, (void **)&ptr_src,
+			&mc_src, &va_src);
+	igt_assert_eq(r, 0);
+	r = scratch_alloc_bo(device_handle, bo_size, AMDGPU_GEM_DOMAIN_VRAM,
+			ring_context, &bo_dst, (void **)&ptr_dst,
+			&mc_dst, &va_dst);
+	igt_assert_eq(r, 0);
+	/* One shared scratch backing BO for BOTH hops (kfdtest shares scratchBuffer). */
+	r = scratch_alloc_bo(device_handle, bo_scratch_size, AMDGPU_GEM_DOMAIN_VRAM,
+			ring_context, &bo_scratch, &ptr_scratch,
+			&mc_scratch, &va_scratch);
+	igt_assert_eq(r, 0);
+
+	ptr_src[0] = 0x01010101;
+	*ptr_dst = 0;
+
+	for (hop = 0; hop < 2; hop++) {
+		struct amdgpu_cmd_base *cmd = get_cmd_base();
+		amdgpu_bo_handle bo_cmd;
+		amdgpu_va_handle va_cmd;
+		uint32_t *ptr_cmd;
+		uint64_t mc_cmd;
+		/* hop0: *src -> aperture; hop1: aperture -> *dst. */
+		uint64_t arg_src = hop == 0 ? mc_src : aperture;
+		uint64_t arg_dst = hop == 0 ? aperture : mc_dst;
+
+		/* Fresh IB per hop; user queues need it mapped+resident (sync). */
+		r = scratch_alloc_bo(device_handle, bo_size, AMDGPU_GEM_DOMAIN_GTT,
+				ring_context, &bo_cmd,
+				(void **)&ptr_cmd, &mc_cmd, &va_cmd);
+		igt_assert_eq(r, 0);
+
+		/* Bind the freshly allocated IB as the PM4 command buffer. */
+		memset(ptr_cmd, 0, bo_size);
+		cmd->attach_buf(cmd, ptr_cmd, bo_size);
+
+		/* Common dispatch initialization */
+		amdgpu_dispatch_init(ip_type, cmd, version);
+		amdgpu_dispatch_write_cumask(cmd, version);
+
+		/* Generation-specific scratch dispatch packets */
+		switch (version) {
+		case 11:
+			amdgpu_emit_scratch_dispatch_gfx11(cmd, mc_shader,
+							   mc_scratch, arg_src, arg_dst, num_waves);
+			break;
+		default:
+			igt_assert_f(0, "Unsupported gfx version %u for scratch dispatch\n", version);
+		}
+
+		/* user_queue_submit synchronizes, so it doubles as the
+		 * kfdtest Sync between the two hops. */
+		ring_context->pm4_dw = cmd->cdw;
+		ip_block->funcs->userq_submit(device_handle, ring_context,
+					      ip_block->type, mc_cmd);
+
+		amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, bo_size);
+		free_cmd_base(cmd);
+	}
+
+	igt_info("scratch two-hop (userq, flat->aperture, WAVES=%u): dst=0x%08x\n",
+		 num_waves, *ptr_dst);
+	igt_assert_eq(*ptr_dst, 0x01010101);
+
+	amdgpu_bo_unmap_and_free(bo_scratch, va_scratch, mc_scratch, bo_scratch_size);
+	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_src, bo_size);
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, bo_size);
+	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_shader, bo_size);
+	ip_block->funcs->userq_destroy(device_handle, ring_context,
+				       ip_block->type);
+	free(ring_context);
+	return 0;
+#endif
+}
+
 static void
 amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, uint32_t priority,
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.h b/lib/amdgpu/compute_utils/amd_dispatch.h
index 45858ba4b..6a0612779 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch.h
@@ -44,5 +44,8 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, const struct pci_addr *pci, bool userq);
 
+int amdgpu_scratch_dispatch_test(amdgpu_device_handle device_handle,
+			       uint32_t ip_type, uint32_t version);
+
 
 #endif
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 44aa2d128..0496050b9 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -42,6 +42,19 @@ amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle,
 	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error, pci, userq);
 }
 
+static void
+amdgpu_dispatch_scratch_compute(amdgpu_device_handle device_handle)
+{
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t version;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_COMPUTE, 0, &info);
+	igt_assert_eq(r, 0);
+	version = info.hw_ip_version_major;
+	amdgpu_scratch_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, version);
+}
+
 static void
 amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu,
 		const struct pci_addr *pci)
@@ -216,6 +229,14 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Compute scratch(private) memory round-trip via aperture, kfdtest FlatScratchAccess port (user queue path)");
+	igt_subtest_with_dynamic("amdgpu-scratch-test-compute-with-IP-COMPUTE-UQM") {
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-scratch-test-compute-uqm")
+			amdgpu_dispatch_scratch_compute(device);
+		}
+	}
+
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.49.0

