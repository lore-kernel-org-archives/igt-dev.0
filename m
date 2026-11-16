Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C640B606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 00:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z0blBbDg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A6710E38C;
	Mon, 16 Nov 2026 00:42:28 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857AE10E03E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 00:40:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7WaUCFMLezmhfOG7TYyu9ziZ+QsEjNGTzh+rtxZEB1stzmM37VvL5MoM6qI7m9+uOgqpK6AFZybKIewq4IEB3A2sAv7W7/HgWS5KCLxU86Wer4FVXhUCQo4O7bwG94cxUykSl6lukaDvdPdKWDW7OerILyuNg7Y7Lzc2lHG+uR42aX3j6qXGvkQqzxAlPH19fTcuZcRpEN44yn4gW7+qIovRbTlCoSARCPif9TMFxU4tFRQoKfQXT4hz7hXgIpbLQ5xMGWXH1nTRaq4/TBrD04X7MxaDWfjfeM42H+5caMDQ21VEc95AJnUWoVi0oUymGmcSnVJJGZ2s4PMQRdrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gkweCN4bnwXmkNzwxJGiezI9o4wBLhZw+zNfzP4t5A=;
 b=M5DgKaSvB+E3XBGv2usWoLDb+5x9vWC6VZLN1lAC/sCXnfgOADjj709VYNvlF3kOxMy2MbFZbgGDxk1Vi1oAw9HewFyoly6JrddC6/Y1uC8ixgXllcygNEYS9xzlauxv6mfSMzVD3pjwZoMTUevaxVekiSr+TVhD/hpkCRosJmWGxppSMO/0K7vcQF4F7CUZBPDNQ/ujZJhlTMSwJLfzqbNT2eEziJX5kLWGmnYaFbtjxa/np29c7j2+r03cfXVKqc2H/Oabe3X+CxUNZprstP5rvGQqYulLgMhpAijAbCVLE8Te7daQokTMM9OLHdn35y+DzhkBcqCUlF2oh83yMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gkweCN4bnwXmkNzwxJGiezI9o4wBLhZw+zNfzP4t5A=;
 b=z0blBbDgNwJ1mYiRf3QQF68lQ/EZ5goaL+Lb2OIKWgFNR6xTrdDnPyti/VF7HmjhgUBCGm+B+U9tBEdKcu6CYUR5Uf7b8EWk13fig/GuJAVTOYuJ5jw/8Dmj4hqQP5/DnVUvSyppZ8jvKv+ctUPV1PBm8TOdlvUEbbLZpPl7x/4=
Received: from BN0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:408:e4::28)
 by LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 00:40:23 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::a5) by BN0PR02CA0023.outlook.office365.com
 (2603:10b6:408:e4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 00:40:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 00:40:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:23 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:23 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 18:40:22 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Junhua Shen <Junhua.Shen@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 5/8] tests/amdgpu: derive compute dispatch version from
 hw_ip_version_major
Date: Sun, 15 Nov 2026 19:40:04 -0500
Message-ID: <20261116004016.121139-6-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116004016.121139-1-vitaly.prosyak@amd.com>
References: <20261116004016.121139-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|LV5PR12MB9804:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f923ce-34a0-4aff-0185-08df437a3378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: ElX7lukEJ2vTdPfjwloQgGW6dIEaSu7gn0pAJB3YbmGhxSJAJJg3pzjBil7mo2vVRp1C+6jJIMjUuMGHvnYckH3B4orw3w/+CSAd2ozJ+Qo6Cjgm73mqj7sbaq/5d4Q4Xp6IUlRt/GjOJ7Xt//7t7uE+gZ51BWq0uO2zXPwktfvttMnWY1wT1zrUXjplsSRxTzTkSgDFiZbllEwCoeHfDwY5bKIzHEHonHnLQD3D12K7URHDy0Yg1IB3lKeEBzQkbnxCgo8MurdTY9sZybBp5uxfs3CJZ+OIChUUt/8eOzCeChVu9oKY2i69QwGb690L3PatcIYl8HDUzG65EGPkxkE01dnu/rZG6O8MLBe2SuzXn2fIaPTIMO9UtTjf24o5huiisr4s9TJrzz9codMO6lVnbY9iSL9TSWcUNa+CQqmTyJOpwFdPzfylWhFVT2qENT6U9tR+5RssXOksdU17a3LjIkvTSfRNFMnKr+3lpjjD54t9o+Ovi3nUrRedsOfNUSYeuYLEc/yLWaQ8yPSu82kZT6FrWoA9dFutQMQkx2JuavvqtKMyITTBlpd4lSSel6Z41c6kFrGNzmumWgoPIb5bA0e9ASP5undLCP8OjVZtXMgy8B38z2g+zDCvBTOVBzzQyEOKo3hgrls49JdgMLwXugpsyxj42nbXlD5GIBIkSMbHtlXcTnoY2QTYoJrRNhcaxWtXSQ8uOVq3pIrjkQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w9ND0LtjHyrjDY4G+2XgeTTcfeWAufjhDBYfDO7BCZSj8Wg6oEq/EmZCqBmfH+7gEKPWEGDnUH1117f+RWSMaAFoTadPYchOcEJcsUcKPkyb4PboeE7TFubDunn9DGwSiwLHO71YIYVjbPeUSpqQUGeUBKtQFWBx6oU5nbtGS+2TyKMe3a3/SBGzU7I5WFJCCN/QYkeqJSFWGBRKBGOVc4PJwCk4ard0ILS58sfZIiFLyJn1yj6f4/x4Hwsx0tLudeui+7EguuSpQ8azyNi3mwyjt9Kq/gbBgwrykdodWF+fggVMR1efLmbKYQJHrkMNGarn0u6MoYU+guRiEvH/jz2TxgnXPKNKsallPfZ55BBE7rsI069w4bKP51UE4vdjgUSNewu0u5MPJBPxOfmCswKMZaEo1IKnEGG7cxtQSQBGyW6FzxoMQWRxxRoS9fKd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 00:40:23.8091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f923ce-34a0-4aff-0185-08df437a3378
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9804
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Junhua Shen <Junhua.Shen@amd.com>

Query the compute HW IP version via amdgpu_query_hw_ip_info() and use
hw_ip_version_major as the GFX generation passed to amdgpu_dispatch_*,
instead of deriving it from family_id. This mirrors the authoritative
pattern in amd_dispatch.c and avoids emitting wrong-generation PM4.

Also gate the cache-invalidate tests to Arcturus (FAMILY_IS_AI plus
ASICREV_IS(chip_external_rev, ARCTURUS)) since RW MTYPE cache behaviour
is Arcturus-specific.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_mem.c        | 112 +++++++++++++---------------------
 tests/amdgpu/amd_remote_mem.c |  20 ++----
 2 files changed, 46 insertions(+), 86 deletions(-)

diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
index 295a3ab94..898364ce0 100644
--- a/tests/amdgpu/amd_mem.c
+++ b/tests/amdgpu/amd_mem.c
@@ -706,7 +706,10 @@ static void memory_register_same_ptr(amdgpu_device_handle device)
  *  6. Verify buffer[dwLocation] == 0x5678.
  *
  * Notes:
- *  - Arcturus does not have a distinct FAMILY_AR constant in IGT; we approximate by requiring a GFX9 AI family (FAMILY_IS_AI) and non-APU.
+ *  - IGT has no FAMILY_AR family-id constant: AMDGPU_FAMILY_AI is shared by
+ *    Vega10/12/20/Arcturus/Aldebaran. Arcturus is identified precisely by chip
+ *    revision via ASICREV_IS(chip_external_rev, ARCTURUS), mirroring how
+ *    setup_amdgpu_ip_blocks() disambiguates the AI family.
  *  - Mapping uses AMDGPU_VM_MTYPE_RW to exercise RW mtype path.
  *  - We keep separate src/dst virtual addresses within the same BO.
  */
@@ -717,7 +720,7 @@ static void test_cache_invalidate_on_sdma_write_asm(amdgpu_device_handle device,
 	const uint32_t kPattern = 0x5678;
 	const int dwLocation = 100;
 	int r;
-	uint32_t version = 9; /* gfx version for dispatch helper */
+	uint32_t version; /* gfx version for dispatch helper */
 	char mcpu[32];
 	uint8_t isa_bin[4096];
 	size_t isa_sz = 0;
@@ -744,29 +747,23 @@ static void test_cache_invalidate_on_sdma_write_asm(amdgpu_device_handle device,
 	cmd_context_t *dma_ctx = NULL;
 	struct amdgpu_cs_fence fence;
 	uint32_t expired = 0;
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
 
-	/* Gate: Approximate Arcturus requirement */
-	if (is_apu(gpu_info) || !FAMILY_IS_AI(gpu_info->family_id)) {
-		igt_skip("Skipping test: requires Arcturus (gfx9 AI discrete) family\n");
+	/* Gate: Arcturus-only feature (RW MTYPE, cache invalidate on SDMA write).
+	 * family_id (AI) is shared across Vega10/12/20/Arcturus/Aldebaran, so
+	 * disambiguate Arcturus by chip revision.
+	 */
+	if (!FAMILY_IS_AI(gpu_info->family_id) ||
+	    !ASICREV_IS(gpu_info->chip_external_rev, ARCTURUS)) {
+		igt_skip("Skipping test: requires Arcturus series asics (RW MTYPE)\n");
 		return;
 	}
 
 	/* Determine shader version similarly to other tests */
 	amdgpu_family_id_to_mcpu(gpu_info->family_id, mcpu, sizeof(mcpu));
-	if (FAMILY_IS_GFX1200(gpu_info->family_id))
-		version = 12;
-	else if (FAMILY_IS_GFX1150(gpu_info->family_id) ||
-		 FAMILY_IS_GFX1100(gpu_info->family_id) ||
-		 FAMILY_IS_GFX1036(gpu_info->family_id) ||
-		 FAMILY_IS_GFX1037(gpu_info->family_id) ||
-		 FAMILY_IS_YC(gpu_info->family_id) ||
-		 gpu_info->family_id == FAMILY_GFX1103)
-			version = 11;
-	else if (FAMILY_IS_AI(gpu_info->family_id) ||
-		 FAMILY_IS_RV(gpu_info->family_id) ||
-		 FAMILY_IS_NV(gpu_info->family_id) ||
-		gpu_info->family_id == FAMILY_VGH)
-			version = 10;
+	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &hw_ip_info);
+	igt_assert_eq(r, 0);
+	version = hw_ip_info.hw_ip_version_major;
 
 	/* 1. Allocate VRAM BO with RW MTYPE */
 	r = amdgpu_bo_alloc_and_map_sync(device,
@@ -903,7 +900,7 @@ static void test_cache_invalidate_on_cpu_write_asm(amdgpu_device_handle device,
 	const uint32_t kPattern = 0x5678;
 	const int dwLocation = 100;
 	int r;
-	uint32_t version = 9;
+	uint32_t version;
 	char mcpu[32];
 	uint8_t isa_bin[4096];
 	size_t isa_sz = 0;
@@ -930,10 +927,15 @@ static void test_cache_invalidate_on_cpu_write_asm(amdgpu_device_handle device,
 	struct amdgpu_cs_fence fence;
 	uint32_t expired = 0;
 	uint64_t cpu_accessible_vram = 0;
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
 
-	/* Require Arcturus-like discrete (approximate) and large BAR (CPU accessible VRAM). */
-	if (is_apu(gpu_info) || !FAMILY_IS_AI(gpu_info->family_id)) {
-		igt_skip("Skipping test: requires Arcturus (gfx9 AI discrete) family\n");
+	/* Gate: Arcturus-only feature (RW MTYPE) plus large BAR (CPU accessible VRAM).
+	 * family_id (AI) is shared across Vega10/12/20/Arcturus/Aldebaran, so
+	 * disambiguate Arcturus by chip revision.
+	 */
+	if (!FAMILY_IS_AI(gpu_info->family_id) ||
+	    !ASICREV_IS(gpu_info->chip_external_rev, ARCTURUS)) {
+		igt_skip("Skipping test: requires Arcturus series asics (RW MTYPE)\n");
 		return;
 	}
 	/* Query memory info for CPU accessible VRAM */
@@ -944,20 +946,9 @@ static void test_cache_invalidate_on_cpu_write_asm(amdgpu_device_handle device,
 	}
 
 	amdgpu_family_id_to_mcpu(gpu_info->family_id, mcpu, sizeof(mcpu));
-	if (FAMILY_IS_GFX1200(gpu_info->family_id))
-		version = 12;
-	else if (FAMILY_IS_GFX1150(gpu_info->family_id) ||
-		 FAMILY_IS_GFX1100(gpu_info->family_id) ||
-		 FAMILY_IS_GFX1036(gpu_info->family_id) ||
-		 FAMILY_IS_GFX1037(gpu_info->family_id) ||
-		 FAMILY_IS_YC(gpu_info->family_id) ||
-		 gpu_info->family_id == FAMILY_GFX1103)
-			version = 11;
-	else if (FAMILY_IS_AI(gpu_info->family_id) ||
-		 FAMILY_IS_RV(gpu_info->family_id) ||
-		 FAMILY_IS_NV(gpu_info->family_id) ||
-		 gpu_info->family_id == FAMILY_VGH)
-			version = 10;
+	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &hw_ip_info);
+	igt_assert_eq(r, 0);
+	version = hw_ip_info.hw_ip_version_major;
 
 	/* Allocate host-accessible VRAM BO */
 	r = amdgpu_bo_alloc_and_map_sync(device,
@@ -1191,11 +1182,12 @@ static void memory_register(amdgpu_device_handle device)
 	char mcpu[32];
 	uint8_t isa_bin[4096];
 	size_t isa_sz = 0;
-	uint32_t version = 9;
+	uint32_t version;
 	void *ptr_shader = NULL;
 	pid_t pid;
 	int status;
 	bool buffer_busy;
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
 
 	memset(&info, 0, sizeof(info));
 	page_sz = sysconf(_SC_PAGE_SIZE);
@@ -1256,21 +1248,10 @@ static void memory_register(amdgpu_device_handle device)
 	igt_assert_eq(r, 0);
 	amdgpu_family_id_to_mcpu(info.family_id, mcpu, sizeof(mcpu));
 
-    /* Determine GPU version */
-	if (FAMILY_IS_GFX1200(info.family_id))
-		version = 12;
-	else if (FAMILY_IS_GFX1150(info.family_id) ||
-	     FAMILY_IS_GFX1100(info.family_id) ||
-	     FAMILY_IS_GFX1036(info.family_id) ||
-	     FAMILY_IS_GFX1037(info.family_id) ||
-	     FAMILY_IS_YC(info.family_id) ||
-	     info.family_id == FAMILY_GFX1103)
-		version = 11;
-	else if (FAMILY_IS_AI(info.family_id) ||
-	     FAMILY_IS_RV(info.family_id) ||
-	     FAMILY_IS_NV(info.family_id) ||
-	     info.family_id == FAMILY_VGH)
-		version = 10;
+	/* Determine GPU version */
+	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &hw_ip_info);
+	igt_assert_eq(r, 0);
+	version = hw_ip_info.hw_ip_version_major;
 
 	r = amdgpu_llvm_asm_init();
 	if (r != 0) {
@@ -2843,7 +2824,8 @@ static int execute_shader_verification(amdgpu_device_handle device,
 	uint8_t isa_bin[4096];
 	size_t isa_sz = 0;
 	int r_asm;
-	uint32_t version = 9;
+	uint32_t version;
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
 
 	amdgpu_bo_handle bo_shader1 = NULL, bo_shader2 = NULL;
 	void *ptr_shader1 = NULL, *ptr_shader2 = NULL;
@@ -2868,21 +2850,9 @@ static int execute_shader_verification(amdgpu_device_handle device,
 	}
 
 	/* Determine GPU version for register programming */
-	if (FAMILY_IS_GFX1200(info.family_id)) {
-		version = 12;
-	} else if (FAMILY_IS_GFX1150(info.family_id) ||
-	       FAMILY_IS_GFX1100(info.family_id) ||
-	       FAMILY_IS_GFX1036(info.family_id) ||
-	       FAMILY_IS_GFX1037(info.family_id) ||
-	       FAMILY_IS_YC(info.family_id) ||
-	       info.family_id == FAMILY_GFX1103) {
-		version = 11;
-	} else if (FAMILY_IS_AI(info.family_id) ||
-	       FAMILY_IS_RV(info.family_id) ||
-	       FAMILY_IS_NV(info.family_id) ||
-	       info.family_id == FAMILY_VGH) {
-		version = 10;
-	}
+	r_asm = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &hw_ip_info);
+	igt_assert_eq(r_asm, 0);
+	version = hw_ip_info.hw_ip_version_major;
 
 	igt_info("Using GPU version %u for family 0x%x\n", version, info.family_id);
 
@@ -3200,8 +3170,8 @@ static void test_signal_handling(amdgpu_device_handle device)
 		igt_info("Parent process starting memory mapping operations...\n");
 
 		/*
-		 * Create a DMA context; sys_bo is registered in its residency set
-		 * immediately before the submit below (residency is per-submit).
+		 * Create a DMA context and register sys_bo in its residency set;
+		 * the SDMA write target VA is passed per-packet below.
 		 */
 		dma_ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
 		igt_assert_f(dma_ctx, "Failed to create DMA command submission context");
diff --git a/tests/amdgpu/amd_remote_mem.c b/tests/amdgpu/amd_remote_mem.c
index d5020b333..33008f4d0 100644
--- a/tests/amdgpu/amd_remote_mem.c
+++ b/tests/amdgpu/amd_remote_mem.c
@@ -54,23 +54,13 @@ static int build_poll_shader(amdgpu_device_handle dev,
 	size_t isa_sz = 0;
 	char mcpu[32];
 	int r;
-	uint32_t version = 9;
+	uint32_t version;
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
 
 	amdgpu_family_id_to_mcpu(info->family_id, mcpu, sizeof(mcpu));
-	if (FAMILY_IS_GFX1200(info->family_id))
-		version = 12;
-	else if (FAMILY_IS_GFX1150(info->family_id) ||
-		 FAMILY_IS_GFX1100(info->family_id) ||
-			FAMILY_IS_GFX1036(info->family_id) ||
-			FAMILY_IS_GFX1037(info->family_id) ||
-			FAMILY_IS_YC(info->family_id) ||
-			info->family_id == FAMILY_GFX1103)
-		version = 11;
-	else if (FAMILY_IS_AI(info->family_id) ||
-		 FAMILY_IS_RV(info->family_id) ||
-			FAMILY_IS_NV(info->family_id) ||
-			info->family_id == FAMILY_VGH)
-		version = 10;
+	r = amdgpu_query_hw_ip_info(dev, AMDGPU_HW_IP_COMPUTE, 0, &hw_ip_info);
+	igt_assert_eq(r, 0);
+	version = hw_ip_info.hw_ip_version_major;
 
 	r = amdgpu_llvm_asm_init();
 	if (r)
-- 
2.43.0

