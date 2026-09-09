Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F78C79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C81F10F0AE;
	Wed,  9 Sep 2026 10:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1zyWhbRq";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7B610E147
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:46:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOTnPRomtB0wnfxwfUHKUqNTrRXFvYfSZGSojThXeRnNAXvlyth1jCGUvleSzpOpV8mmlLPy2R1JJqZeSeTGatYyMwv6t8VeSOddzdj2fvvlaVuD9XgyGZdI6rNFfartO2ACJ7fG/BKPPgcDm9vgQcGCoK95f0856JvihvWYYhe53+oiBuVdJiufXEDCK1jGr1htN19T+C5+MhiMkf+GUP24fzzaXEKM9ZlBNUVfKXD+WcTfF36BwDbF7ZH6/dXuGwVUrAR+MvLCInModxOjLOwHAZbU3rONamaxLWkQVFd9GGKS4qjk9/zI1thCn7vwaV+PsqJ1lpYQ5M0ElBwIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuk39zcziXFydVQzPbru4IcsLWj1sY8j6EPJdVXFU5M=;
 b=Fx6fWXAizylTz8nYQc5Z7CxrbsXVdMWYntb7Zucqo2v2kvK+Zk4PK7aeCg07cUapmrhrtJkPLpcCSZxxj+uHJEvEMDOjsYWCQVInIHGzZtPudC9Vn46JpNR0rSX56BFK97txIs/YfNcTkigcv7pJZ8FtjXQaI/vPuorkUsFpZQYwe03Nvly02t6NG0Y6R0TN3lqhsi0mWAJnrBRHk54HKXnsaH+3vMYQQsu6bldi+yv+jH9uZVw/vbwAyK57gcbVT9qN91U6vDCUz4tNQZx4nK4+tax5lkVy215LsAY4ZQuX0yUph1wZoudamB7/v6hI3bItTQj/KTWRcnw9ARBG/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuk39zcziXFydVQzPbru4IcsLWj1sY8j6EPJdVXFU5M=;
 b=1zyWhbRqCD5h7EpR4NFr/G98sPS/7K9AwE9HsT73PteZS4ZcNWFql5/tygLvUVuEd5Lflm6jzjeQQcS0lOk47iFlVoAU6FTSHTp6iersm0nbijKTkmzYdGMYWmbOmNEGao3DYBSA/GqW69WxMJkEtjTyQfrqXhJEIpRxZ/WuTKI=
Received: from SJ0PR05CA0190.namprd05.prod.outlook.com (2603:10b6:a03:330::15)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:46:25 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::97) by SJ0PR05CA0190.outlook.office365.com
 (2603:10b6:a03:330::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Wed, 9
 Sep 2026 10:46:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 10:46:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:21 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 05:46:19 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 5/6] tests/amdgpu: derive compute dispatch version
 from hw_ip_version_major
Date: Wed, 9 Sep 2026 18:46:01 +0800
Message-ID: <20260909104602.13807-6-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909104602.13807-1-Junhua.Shen@amd.com>
References: <20260909104602.13807-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: c265d27b-b829-4824-1063-08df0e5f97ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DEEG9/eqQoay8Rf4XnPrByBEG/dme9BGOLrQ1Arcpv538cf5s4XS43V5D7b+j/YQp1iHyyzxEisnavXnHJryfIDpKpY1o4W+aAuv6axsxeSd0TSfPsYdzOcEKuSy1SbMY9MVr7h+TgSVlSy5jArjmJVPB1Ebd/58hqQDtqoMSVTrYzJZKJ7P9gIV4FeOKhGjb2HX8xSou/1dc1sE4HllVuq3YPmSoS+nb57lqHMPBZLYggj/QyYnaolUyNZjFMdayyRANdqofrFErsxu4U7l8PiCf1wzcDhJ2cQVArPqYY0Zazvtgv2dlRPoooB8KBr8XS1n/2OV9LxlG5zjLmxwjAtYIFt4Mml8DwS+wyMP4VlJpes523pi4KnhENo1u7WiA5r2Qb0/FfZkyN3cQqFxiIr0NqVB25AosWXdc5VMg0S3W3kpoAEApoqeNZUP4QctoTuesc3UFop3HTYAxCc8jTm8DccXXrmHz5TfwqISg/l/ydBWVScWPyPYCWrGJRbHeTWgvT1rgILjkja9qa6adM52PSAxNAGNCeX2tnudGKPhqcgkv2gLtorbZxlig+ar6Ci4rhWbafPT16Ryd2O5466fpBa8EQc+drPzzMqXaDtiAWAQLwiPCO3srz3ap7bWBml8KxmUbSLrv3q0d/FvNmJUtM6rujiC4Fs1yV0W3CAr3bLJGMuIFH7a1mUOM7+BX7h53EwclNQuyhfreJoVcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8f22zFyC3Kp4pQHuBph9S8+AvOUtX26hPqDjAvCtfTUrhYM89HJ+GQa9C0eJkfJ47MccyhCatHhqPwaVflwXn5XHmUfotcDN2ZbJs8cZtP5uITgVNS4nAC6QJ5KtaXfOsGovGJ2XI6NCh44Mz74GpDZ2bjSvz1SIaOnYKXxmKRYh/1uMlJR46HKzTKwJvD2ZkFG6DA4HGkuMiP1PDne3DVRbJXutUMIxVcdPLQNPYtjVzExIXGdGwdW2XuoSS5+2WVGWXTvhdcPg8kWvMBpcVTqsMMdVVmyQbw+eFUf/fwIq6YzwpEdWwDd0veKh3hmp12Vf1EKouAtUjeSj/ShNpx14ky6rVUwY+S3rX+C0AroKsbkJSU05qzfyMWdvrsIKujKLK2nYSXEExrpx7gT7aq7ik5NX3CMJf1c3dI07/FX6nUJYS3SpZf7xD1Wym4g9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:46:24.2276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c265d27b-b829-4824-1063-08df0e5f97ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200
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

Query the compute HW IP version via amdgpu_query_hw_ip_info() and use
hw_ip_version_major as the GFX generation passed to amdgpu_dispatch_*,
instead of deriving it from family_id. This mirrors the authoritative
pattern in amd_dispatch.c and avoids emitting wrong-generation PM4.

Also gate the cache-invalidate tests to Arcturus (FAMILY_IS_AI plus
ASICREV_IS(chip_external_rev, ARCTURUS)) since RW MTYPE cache behaviour
is Arcturus-specific.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
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
2.34.1

