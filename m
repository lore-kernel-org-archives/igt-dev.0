Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA4EC5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 08:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437D10E0D2;
	Thu, 13 Aug 2026 08:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DITl0iYY";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5690F10E0D2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 08:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ifam34xZrgxIUYRnnY/3/RhE9+PU1nE2QI5LgCN0VRqjCPM9Y1WGjTliBrO4kRiPoG29jeWp4hnecfBzJ+oCufsBnrj5yef7Y5AXcY0f9wdrnipg0yko6BKzuNNLqaRZrUe1pHpsm72pxKwGrHm4j3gp6A0PujTJEd+5WYE6jywKyJPBrinp1E95+JtigJonhOypibfqBV/7H154VeYMKdSQhV3GBKJLJYVl+Nq1wGRTauqba+3U85tJ3LQ6UkExEsAeUhrBgEkNSX15a6ZzBGKLyG2k1Y1Lej9DLtBPPNwA6uGUnwH5RK1nvBlYmXOwpzfzNHH5w/+60wVX/EAmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kQa51z/An9tQ4OC2RV1QJmgUmbgr282DBm2ziE4+Xg=;
 b=F7Znrl034Z8pNsLG08XYMMst8cygWDX8AP/S2HPm4yL1tzrVo8XlKKmK/gogIYWQJAKTOEP+9W13nXY9yArZ/gc1j4EtMB6W0LRmmQ7Ed0eH/79r8EHvbXaU+OK8QYc2p2aJVXrY5GsTsvXpKZR9BC3HBhPuOL1HYEvAf1MxZ7Vh6Ag0vfer39K50BeCOGqakNoKW8YB8OZBuxWBiioAfrUV0JXFRKGICNIfRPDDimHKU4VBvSGKpvdl7Wva4y+g+z/zEFbBm1rE8bn9klzm8EvbpzKreu1b/Xt5Fdf7kylT26AaQxY0c17zDuS+8eAHoC7I4YaSDzWaUQO/kUhWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kQa51z/An9tQ4OC2RV1QJmgUmbgr282DBm2ziE4+Xg=;
 b=DITl0iYYrx9s7RBiCr0Wz08aQoFQXbbkLEI/BbxclTBgDaPiR8SgIRWP5DG3ulWEP7itetfy1fqlmL6j3HGXSVgYhG+jAJMc3ZI8t7Ed00bY4ZN5wgONFk7CeX/SflMIekjegYliMFePtcJ3SmMcNKeuD6C+nKy6o/asMbNm6Z8=
Received: from CY8P220CA0033.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::23)
 by CH8PR12MB999205.namprd12.prod.outlook.com (2603:10b6:610:35a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 08:03:41 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:47:cafe::20) by CY8P220CA0033.outlook.office365.com
 (2603:10b6:930:47::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 08:03:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 08:03:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 03:03:41 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 03:03:39 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/2] lib/amdgpu: add gfx12 shader blob for
 sync_dependency_test
Date: Thu, 13 Aug 2026 16:03:23 +0800
Message-ID: <20260813080337.3327962-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260813080337.3327962-1-Jesse.Zhang@amd.com>
References: <20260813080337.3327962-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CH8PR12MB999205:EE_
X-MS-Office365-Filtering-Correlation-Id: 27aafa60-3c87-4cd8-695f-08def91163b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eu27vGjJvK0AD+f2x40AJLGWroHDgGGlq0Rbe0GcoCEJaeq49VWNJ9/OPZx8d1q+hhJUodbWGCvZvvaQZ5L14oxt63QHz3Eb1VQNQZ0+kPW7nSyDl98T2HM/YqpfcrApIZ3OBZ63s3RmSbSHe5YTr5GuylEefIRcah9isjtJRFEj/Nv2ru6HjrwMD2i8bH6qqlvezb4fN0GlAIxNXopzga8OEMl2ZOBDel7EpGWhXdBWfjaA9K07hbDMmjsrGk4bfjsr4jBJMuuNJvLqzjbqebDESir7r6akP3HDJb1dWsC+rGBWwbQOl/FbyXKR29MImP3HZIkY9hjbcQn6ZqFn4HyTvbFtJ8F4WXFNMGyBPNPSrdXOEmd+5DeH6jLWl/sDlMYOAH+UshFief+sDMB8RGwNRjkUlIVuKsYOj1jE8v0iYyjfuAKwDTR/Z4KGqoynHgCtYekLXJQTCkN+USDn/HMFQa4xGd4yYBr7Z8qRFT8QtLM+jbRgQ4sgzwCeIGRCyWoUayz8cHAh6Zz9mvzdVBf0Mi53/l3rP8jw1jPOI2j9yaoqI1+48wmA+f7S35ZwkpLcA4MoxpY7T0kOkIJOY7+wKesAg48iejs9ewdLYSD47K8cz/GGGU49gFTQohcJ5LtscUL2HVFy6Zq/Nci7tCEEYCVmgLxq22itF74fDezbtZHnBIzpTNVtqhV8Qj1taQLNzww4UjFM6ozDZPeduw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zzEGEOSSb8/wT0KXGMOm9xz8yqqodMW3lpNfnSWERIKOIieTuR1I5kiYmOtIy1RHpgieBvLUd4gm+2mSoyQB4XzM2fAXUdCUxLA85qjMmqcssJRyEpmjZeG9JZNf0qQ9CHrMej/ed2S9rfkas/OV6c4WKoo2Z9b78j3xgBAEO/gHkI1sJyAi++8SiZ3XYIzHfzDbtGYl5S3xV2pXu4ddcBD8fHVncSQ9mkfQNo6UI9frnZrryW3HNt5USacHDJY8hWI0VbaV26CoLXYT/rTTuqQsO1b62R9x2vJiwkCrDqcq7K3Vx/zC3HTVt0k65AfxP15FWkrjItvficfYOXFmkcjIAI2aY1uRVqn3jteU5MyTis5OChYuobGO3agIM0CDQCw8NNYfwMAaCO00evNIwNI5riKn+TgEMFrcbiTSoi5TpDKpiHBdHkLJ+ypDhbNW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:03:41.5080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27aafa60-3c87-4cd8-695f-08def91163b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999205
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

The shader blob used by amdgpu_sync_dependency_test() is a GFX11 (RDNA3)
assembly. GFX12 (RDNA4) re-encoded several of the SOP/FLAT opcodes it uses
(s_endpgm, s_cbranch_scc0 and the store), so on gfx1200 the GFX11 blob decodes
into different instructions: the shader neither terminates nor stores its
result, and the test hangs/fails.

Add a gfx1200 re-assembled copy of the same kernel and select it in
get_shader_bin() by family_id, falling back to the existing GFX11 blob for
everything else.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/shaders/amd_shaders.c | 35 ++++++++++++++++++++++++++++++--
 lib/amdgpu/shaders/amd_shaders.h |  3 ++-
 tests/amdgpu/amd_basic.c         |  3 ++-
 3 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/shaders/amd_shaders.c b/lib/amdgpu/shaders/amd_shaders.c
index adc4fc051..07489706e 100644
--- a/lib/amdgpu/shaders/amd_shaders.c
+++ b/lib/amdgpu/shaders/amd_shaders.c
@@ -109,12 +109,43 @@ uint32_t shader_bin[] = {
 	SWAP_32(0x000070e0), SWAP_32(0x00000080), SWAP_32(0x000081bf)
 };
 
+/*
+ * GFX12 (RDNA4) re-encoded several of the SOP/FLAT opcodes used above
+ * (s_endpgm, s_cbranch_scc0, the store), so the GFX11 blob decodes into
+ * different instructions and the shader neither terminates nor stores its
+ * result. This is the same kernel re-assembled for gfx1200:
+ *
+ *	s_mov_b32 s2, 0
+ * .Lloop:
+ *	s_add_co_i32 s2, s2, 1
+ *	s_cmp_gt_u32 s2, 0x0098967f
+ *	s_cbranch_scc0 .Lloop
+ *	v_mov_b32_e32 v0, 42
+ *	v_mov_b32_e32 v1, s0
+ *	v_mov_b32_e32 v2, s1
+ *	flat_store_b32 v[1:2], v0
+ *	s_endpgm
+ */
+static  const
+uint32_t shader_bin_gfx12[] = {
+	SWAP_32(0x800082be), SWAP_32(0x02810281), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800),
+	SWAP_32(0xfcffa1bf), SWAP_32(0xaa02007e), SWAP_32(0x0002027e), SWAP_32(0x0102047e),
+	SWAP_32(0x7c8006ec), SWAP_32(0x00000000), SWAP_32(0x01000000), SWAP_32(0x0000b0bf)
+};
+
 const uint32_t *
-get_shader_bin(uint32_t *size_bytes, uint32_t *code_offset, uint32_t *data_offset)
+get_shader_bin(uint32_t *size_bytes, uint32_t *code_offset, uint32_t *data_offset,
+	       uint32_t family_id)
 {
-	*size_bytes = sizeof(shader_bin);
 	*code_offset =  CODE_OFFSET;
 	*data_offset = DATA_OFFSET;
+
+	if (family_id == AMDGPU_FAMILY_GC_12_0_0) {
+		*size_bytes = sizeof(shader_bin_gfx12);
+		return shader_bin_gfx12;
+	}
+
+	*size_bytes = sizeof(shader_bin);
 	return shader_bin;
 }
 
diff --git a/lib/amdgpu/shaders/amd_shaders.h b/lib/amdgpu/shaders/amd_shaders.h
index f7d4cab07..284c1b2f8 100644
--- a/lib/amdgpu/shaders/amd_shaders.h
+++ b/lib/amdgpu/shaders/amd_shaders.h
@@ -30,7 +30,8 @@
 #include "amdgpu/compute_utils/amd_shared_dispatch.h"
 
 const uint32_t *
-get_shader_bin(uint32_t *size_bytes, uint32_t *code_offset, uint32_t *data_offset);
+get_shader_bin(uint32_t *size_bytes, uint32_t *code_offset, uint32_t *data_offset,
+	       uint32_t family_id);
 
 int
 amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t family_id);
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 3ad023472..84a6d8618 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -553,7 +553,8 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 		igt_assert_eq(r, 0);
 	}
 
-	shader = get_shader_bin(&size_bytes, &code_offset, &data_offset);
+	shader = get_shader_bin(&size_bytes, &code_offset, &data_offset,
+				ip_block->funcs->family_id);
 
 	/* assign cmd buffer */
 	base->attach_buf(base, ib_result_cpu, const_size);
-- 
2.49.0

