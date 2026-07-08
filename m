Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6927DC43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 02:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0194B10EF67;
	Wed,  8 Jul 2026 02:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OZwrzFmE";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011002.outbound.protection.outlook.com
 [40.93.194.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DFD10EF67
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 02:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1zD20kWADdMsZpSgHtqeyqGsMu+OPOcFi8XG69MmS1F77CQK0Y47NkoAATyF6UucTpI5N3bvVjVyjDXUKqJ5uq6ZbmnGtnQKOitkpfBXvk0vQRUDtKZnX37DinyPmWyulsp+4yV0lnyZEBrdITyzL1gZbbxoDdnbjwhdsRKbLlXMjlD77NZPBHBhFmpBtPRQPDK2K+SkMbhq5L4G2jNqXakYKvcDQaaEUdp3NMkhy8cKh0NksTvP8WvNxy3rKupFX04ODFWvsG8aS8ELmdgkyE+U7jD7/45sYoxKM77gEX/5vPtsQea6/x2us/W/BvCeBZvfB5uBzqn+Ue4oUVAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqfjRwziJrekOEtGndNphhGk6aW67qirfpLQZ2Q7N2Y=;
 b=wTCfpfvOmkYumlAqm+D5FvDQwHMs7ZVOlMFNEreUWo8iLEUChwsf2v4ZTsphlj6uE45NQQT80dyzG0YZ7SIIQisG3hejAwXFUuBUQ5DTMVvZZB0pSYxULm8WJj3Kd/p4Zu2HzXy4hMtrE5ocL4T9+X1KbfPly38bbpXgKCg1AvBnEaYfj+PYSePxwGghaa29Ia73xaSjYuKvJzc5PUxr3GMJ9trLrwwmKcGLGpqoARDdnDQ+nM3XqtOEfWXYLToZTQm+/DUhBhbzXvLvHRnQikKb1oB7sz4WVa73fGy8zk7FyvemHIqv0CpckuRfAxXIz0GjUGsGeMg8syoCLuwrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqfjRwziJrekOEtGndNphhGk6aW67qirfpLQZ2Q7N2Y=;
 b=OZwrzFmE8nA3a8ByFwGiXmvVx9kBYAN0Vbj7ZJxgclumq6+DARV5ngTOHguZBwb8QCh7Upx4sJLkx6MneWq5tYplm739tNWBq+YKlnePVRbMNS4pLtykMl49UCVeKbferNi+nXTDQu+zOm1t8lMNNYMfRlqySNzIjgYHjEXy2To=
Received: from BL1PR13CA0208.namprd13.prod.outlook.com (2603:10b6:208:2be::33)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 8 Jul
 2026 02:11:20 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::6e) by BL1PR13CA0208.outlook.office365.com
 (2603:10b6:208:2be::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 02:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 02:11:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 21:11:18 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 21:11:12 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: add compute scratch memory test
Date: Wed, 8 Jul 2026 10:10:50 +0800
Message-ID: <20260708021111.365779-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="Y"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DM6PR12MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e346d66-133f-4c08-92c7-08dedc963343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|11063799006|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: r5uTRWeX0gXEvktjxmYHp3b8WnFNgEIMmbC4Mjdx6OwNRi1UV+RJI6m7RLgl+KvRNBQFsS2Ow3vymOk89ZQolf1fma+aslaXvoWBAPmF+i9TAR6FJacKMh0pBFXfhqPgy4B6q3Wc7JIH2L8SSa2Xe7aSPcmIzobwyVYRWcQU/FD0bTi0AWN0f8KEwh4pZ2RJXoKjK0OuExYE4hetZRhxfB4P39DEttRvuL90hPMzOJysjQittaBNf9LIxO9/1oHCv8BX0Bf2JtoSxlibNZxkFC6AH8VKlR4iXDolI17tqpvahoTENUhfCu54FxsXwXXQ5h9RFq4PZt7NJrkGocttnz1Ey/1XIDjKxLMa1cQiTcAalnzesCWmKYuTnL4vZ1zKVLEwudzwXPJHzL2zek/2GEgPNwDjgGQ7SeddqcLCS7ISlowosMFprmhLyIUOaT4+KHrPUdrVTeLpBtQWKdvoi+7VsUB3P/WapfBkFdkMNzBdS70FLQdO762wE77ndt3vnljYCb6qvGyIMpqa8SQfGv+qSRdsYXRQrO5NoSb4/eOBctwI4v3ZB+1FLND6Xr7dHvNhLtwi78VgPOrjjHEMel7sIrPjYCAlAcLZmPrxrjjYsqsYxT6uUPEzTyYOn8vhmOAFmX71CEasAANfPBVxN2H+mqZy/D/8EOCuZoA5oFbImgCM5z1nJeWPtL6zD3K2tWSg9NEmPi7RxDorTnbaCA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: phnt7mVQkM6AokaCcfCxzBp/W/a5L28BwImp0zVMoHkfdX70mI40kBRPfPjkESn126tlvznEqFfdAWOeCWz8bMiS/TNaBHXQ9K95Q7rnOu+zDOzN0JKe2YnL6/rcJ53C1C65rOVixkqv/KWuQqtOlZj7mbyS6WSAgsfFIAGDyiNnk7XR+ze/tJjLQNX6JiwGORiGd7kNJTwPmVYC5lx843ljue1IJBzqXVNaEw8HtywyNQobpqcZRcDSYR63SqVVy1waEJyYZ5SQVO9Qkf07fg8ZURf2cqDsBg1gRaFJOO2q9qbZZcmloEUUjaKe9qbhPrG+27lma9l4E7nMHon914KZAoxrIA26kvEJbZa6RZeRQIa8QMvlNn05sXz3vg5WkclTFSxAKghu7wCqKMxe9CzwTFzCkIkO/C/2OeQpNBkAO5rBgxiJ/gXS66yuG4W5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 02:11:19.6025 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e346d66-133f-4c08-92c7-08dedc963343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466
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

Port kfdtest FlatScratchAccess to the amdgpu CS and user-queue paths:
two dispatches route a dword through the scratch aperture
(*src -> scratch -> *dst) via FLAT load/store, dst==src proves the
round-trip. The scratch aperture base is read from
AMDGPU_INFO_DEV_INFO.scratch_base.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h           |   5 +
 lib/amdgpu/amd_registers.h              |  26 ++
 lib/amdgpu/compute_utils/amd_dispatch.c | 317 ++++++++++++++++++++++++
 lib/amdgpu/compute_utils/amd_dispatch.h |   3 +
 tests/amdgpu/amd_dispatch.c             |  29 +++
 5 files changed, 380 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index ca24519c7..2169f1396 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1449,6 +1449,11 @@ struct drm_amdgpu_info_device {
 	/* Userq IP mask (1 << AMDGPU_HW_IP_*) */
 	__u32 userq_ip_mask;
 	__u32 pad;
+	/* Additional fields for memory aperture information */
+	__u64 lds_base;
+	__u64 lds_limit;
+	__u64 scratch_base;
+	__u64 scratch_limit;
 };
 
 struct drm_amdgpu_info_hw_ip {
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
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 5acb26dcc..287d8a905 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -4,13 +4,17 @@
 // Copyright 2023 Advanced Micro Devices, Inc.
 
 #include <amdgpu.h>
+#include <amdgpu_drm.h>
 #include "amdgpu/amd_memory.h"
 #include "amd_dispatch.h"
 #include "amd_shared_dispatch.h"
 #include "amd_dispatch_helpers.h"
 #include "amdgpu/amd_PM4.h"
 #include "amdgpu/amd_ip_blocks.h"
+#include "amdgpu/amd_registers.h"
 #include "amdgpu/shaders/amd_shaders.h"
+#include "amdgpu/shaders/amd_shader_store.h"
+#include "amdgpu/shaders/amd_llvm_asm.h"
 
 /*
  * Static state for sched_mask cleanup on abnormal subtest exit.
@@ -486,6 +490,319 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
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
+amdgpu_emit_scratch_copy(struct amdgpu_cmd_base *base_cmd, uint32_t ip_type,
+			 uint32_t version, uint64_t mc_shader, uint64_t mc_scratch,
+			 uint64_t arg_src, uint64_t arg_dst, uint32_t num_waves)
+{
+	amdgpu_dispatch_init(ip_type, base_cmd, version);
+	amdgpu_dispatch_write_cumask(base_cmd, version);
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
+	if (version == 11) {
+		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base_cmd->emit(base_cmd, SH_REG(mmCOMPUTE_PGM_RSRC3));
+		base_cmd->emit(base_cmd, 0x3f0);
+	}
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
+ * touches must be made resident, so use the sync variant + timeline wait;
+ * the legacy CS path relies on the per-submit bo_list instead.
+ */
+static int
+scratch_alloc_bo(amdgpu_device_handle dev, int size, uint32_t domain,
+		 bool user_queue, struct amdgpu_ring_context *rc,
+		 amdgpu_bo_handle *bo, void **cpu, uint64_t *mc,
+		 amdgpu_va_handle *va)
+{
+	int r;
+
+	if (!user_queue)
+		return amdgpu_bo_alloc_and_map(dev, size, 4096, domain, 0,
+					       bo, cpu, mc, va);
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
+ * cross-dispatch scratch round-trip worked. Runs on either the legacy CS
+ * path or a KGD user queue (user_queue=true).
+ *
+ * Determinism (matching kfdtest) requires:
+ *   1. both dispatches share ONE scratch backing BO so the written slot persists;
+ *   2. WAVES=#SE, waveSize=1, dim 1x1x1 -> exactly one wave, placed by the SPI at
+ *      scratch offset 0 on each dispatch (same physical slot);
+ *   3. a full wait (== kfdtest Sync) between the two submits (the CS fence, or
+ *      the synchronous user-queue submit);
+ *   4. a FRESH IB command BO per submit — reusing one IB BO for a back-to-back
+ *      compute submit makes the 2nd dispatch read ring NOP-fill and fault
+ *      (bad_op / ring reset). This is the crux; kfdtest gets it for free via a
+ *      per-dispatch IndirectBuffer.
+ * gfx11 only.
+ */
+int
+amdgpu_scratch_dispatch_test(amdgpu_device_handle device_handle,
+			   uint32_t ip_type, uint32_t version, bool user_queue)
+{
+#ifndef AMDGPU_LLVM_ENABLED
+	igt_info("SKIP scratch two-hop: built without LLVM MC assembler\n");
+	return 0;
+#else
+	uint64_t aperture;
+	amdgpu_context_handle context_handle = NULL;
+	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_scratch, resources[4];
+	volatile uint32_t *ptr_dst;
+	void *ptr_shader, *ptr_scratch;
+	uint32_t *ptr_src;
+	uint64_t mc_src, mc_dst, mc_shader, mc_scratch;
+	amdgpu_va_handle va_src, va_dst, va_shader, va_scratch;
+	int r, hop;
+	const int bo_size = 4096;
+	const int bo_scratch_size = 0x10000;
+	uint32_t expired;
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
+	if (user_queue) {
+		ring_context = calloc(1, sizeof(*ring_context));
+		igt_assert(ring_context);
+		ip_block = get_ip_block(device_handle, ip_type);
+		ip_block->funcs->userq_create(device_handle, ring_context,
+					      ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+		igt_assert_eq(r, 0);
+	}
+
+	r = scratch_alloc_bo(device_handle, bo_size, AMDGPU_GEM_DOMAIN_VRAM,
+			user_queue, ring_context, &bo_shader, &ptr_shader,
+			&mc_shader, &va_shader);
+	igt_assert_eq(r, 0);
+	memset(ptr_shader, 0, bo_size);
+	memcpy(ptr_shader, isa, isa_size);
+	r = scratch_alloc_bo(device_handle, bo_size, AMDGPU_GEM_DOMAIN_VRAM,
+			user_queue, ring_context, &bo_src, (void **)&ptr_src,
+			&mc_src, &va_src);
+	igt_assert_eq(r, 0);
+	r = scratch_alloc_bo(device_handle, bo_size, AMDGPU_GEM_DOMAIN_VRAM,
+			user_queue, ring_context, &bo_dst, (void **)&ptr_dst,
+			&mc_dst, &va_dst);
+	igt_assert_eq(r, 0);
+	/* One shared scratch backing BO for BOTH hops (kfdtest shares scratchBuffer). */
+	r = scratch_alloc_bo(device_handle, bo_scratch_size, AMDGPU_GEM_DOMAIN_VRAM,
+			user_queue, ring_context, &bo_scratch, &ptr_scratch,
+			&mc_scratch, &va_scratch);
+	igt_assert_eq(r, 0);
+
+	ptr_src[0] = 0x01010101;
+	*ptr_dst = 0;
+
+	resources[0] = bo_shader;
+	resources[1] = bo_src;
+	resources[2] = bo_dst;
+	resources[3] = bo_scratch;
+
+	for (hop = 0; hop < 2; hop++) {
+		struct amdgpu_cs_request ibs_request = {0};
+		struct amdgpu_cs_ib_info ib_info = {0};
+		struct amdgpu_cs_fence fence_status = {0};
+		struct amdgpu_cmd_base *cmd = get_cmd_base();
+		amdgpu_bo_handle bo_cmd, bo_list_res[5];
+		amdgpu_bo_list_handle bo_list = NULL;
+		amdgpu_va_handle va_cmd;
+		uint32_t *ptr_cmd;
+		uint64_t mc_cmd;
+		/* hop0: *src -> aperture; hop1: aperture -> *dst. */
+		uint64_t arg_src = hop == 0 ? mc_src : aperture;
+		uint64_t arg_dst = hop == 0 ? aperture : mc_dst;
+
+		/* Fresh IB per hop; user queues need it mapped+resident (sync). */
+		r = scratch_alloc_bo(device_handle, bo_size, AMDGPU_GEM_DOMAIN_GTT,
+				user_queue, ring_context, &bo_cmd,
+				(void **)&ptr_cmd, &mc_cmd, &va_cmd);
+		igt_assert_eq(r, 0);
+
+		if (!user_queue) {
+			int i;
+
+			for (i = 0; i < 4; i++)
+				bo_list_res[i] = resources[i];
+			bo_list_res[4] = bo_cmd;
+			r = amdgpu_bo_list_create(device_handle, 5, bo_list_res,
+						  NULL, &bo_list);
+			igt_assert_eq(r, 0);
+		}
+
+		cmd->attach_buf(cmd, ptr_cmd, bo_size);
+		amdgpu_emit_scratch_copy(cmd, ip_type, version, mc_shader,
+					 mc_scratch, arg_src, arg_dst, num_waves);
+
+		if (user_queue) {
+			/* user_queue_submit synchronizes, so it doubles as the
+			 * kfdtest Sync between the two hops. */
+			ring_context->pm4_dw = cmd->cdw;
+			ip_block->funcs->userq_submit(device_handle, ring_context,
+						      ip_block->type, mc_cmd);
+		} else {
+			ib_info.ib_mc_address = mc_cmd;
+			ib_info.size = cmd->cdw;
+			ibs_request.ip_type = ip_type;
+			ibs_request.ring = 0;
+			ibs_request.resources = bo_list;
+			ibs_request.number_of_ibs = 1;
+			ibs_request.ibs = &ib_info;
+			ibs_request.fence_info.handle = NULL;
+			r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+			igt_assert_eq(r, 0);
+
+			fence_status.ip_type = ip_type;
+			fence_status.ip_instance = 0;
+			fence_status.ring = 0;
+			fence_status.context = context_handle;
+			fence_status.fence = ibs_request.seq_no;
+			r = amdgpu_cs_query_fence_status(&fence_status,
+					AMDGPU_TIMEOUT_INFINITE, 0, &expired);
+			igt_assert_eq(r, 0);
+			igt_assert_eq(expired, true);
+
+			amdgpu_bo_list_destroy(bo_list);
+		}
+
+		amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, bo_size);
+		free_cmd_base(cmd);
+	}
+
+	igt_info("scratch two-hop (%s, flat->aperture, WAVES=%u): dst=0x%08x\n",
+		 user_queue ? "userq" : "CS", num_waves, *ptr_dst);
+	igt_assert_eq(*ptr_dst, 0x01010101);
+
+	amdgpu_bo_unmap_and_free(bo_scratch, va_scratch, mc_scratch, bo_scratch_size);
+	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_src, bo_size);
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, bo_size);
+	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_shader, bo_size);
+	if (user_queue) {
+		ip_block->funcs->userq_destroy(device_handle, ring_context,
+					       ip_block->type);
+		free(ring_context);
+	} else {
+		amdgpu_cs_ctx_free(context_handle);
+	}
+	return 0;
+#endif
+}
+
 static void
 amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, uint32_t priority,
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.h b/lib/amdgpu/compute_utils/amd_dispatch.h
index 45858ba4b..a5cb5cc03 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch.h
@@ -44,5 +44,8 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, const struct pci_addr *pci, bool userq);
 
+int amdgpu_scratch_dispatch_test(amdgpu_device_handle device_handle,
+			       uint32_t ip_type, uint32_t version, bool user_queue);
+
 
 #endif
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 44aa2d128..82dfa05db 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -42,6 +42,19 @@ amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle,
 	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error, pci, userq);
 }
 
+static void
+amdgpu_dispatch_scratch_compute(amdgpu_device_handle device_handle, bool userq)
+{
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t version;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_COMPUTE, 0, &info);
+	igt_assert_eq(r, 0);
+	version = info.hw_ip_version_major;
+	amdgpu_scratch_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, version, userq);
+}
+
 static void
 amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu,
 		const struct pci_addr *pci)
@@ -216,6 +229,22 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Compute scratch(private) memory round-trip via aperture, kfdtest FlatScratchAccess port (legacy CS path)");
+	igt_subtest_with_dynamic("amdgpu-scratch-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-scratch-test-compute")
+			amdgpu_dispatch_scratch_compute(device, false);
+		}
+	}
+
+	igt_describe("Compute scratch(private) memory round-trip via aperture, kfdtest FlatScratchAccess port (user queue path)");
+	igt_subtest_with_dynamic("amdgpu-scratch-test-compute-with-IP-COMPUTE-UQM") {
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-scratch-test-compute-uqm")
+			amdgpu_dispatch_scratch_compute(device, true);
+		}
+	}
+
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.49.0

