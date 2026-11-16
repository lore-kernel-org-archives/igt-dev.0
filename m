Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A26606A31F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 00:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5FiX36lv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE5C10E719;
	Mon, 16 Nov 2026 00:47:06 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6991B10E03E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 00:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap0THTPz2O4HasZ3xJjfYPWT1lJDpZSc02FowleNYGkBArljdvT18cDQLGfVU0e0iC/99++fHmpsOt2HEQ2cSrmf0AuqSfM2bz2GbBZPOzv/f/W8C82s1YWR1FkBsNs3lNJ1bU/YeM/tmBli9hPfWzjfnyweY/+UN2SbtMvl/QzEDaGALG+mh833O7xAf6UWyBrzLTL7+Fa2UfroaObJSJkZqGfPh4BeRZV/QEXmIP4Nd6iiCQbNNsbp3CRlKD1sR23C6iPtGMfcaeDUcvSbsIGRTvwS20elcDwYtRC/bM0JBIEMGMtZCkCqtSBtMRpD0zcy7TlDtiWtR5JHy/xspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVntRuqEc6Ps/NQY6623ZAssFaFZQjXcaj4eCfyWjko=;
 b=zFj1rmNZz5U2bi94maKIhAtDDQUBk02d8qwcrbLuPV6fuCbYhiECSAJm5exFKDcw0NE31BwCAXPe0KhzWTwTgdcSr81NobH4aixwJQrmM/8n6qW/3tddxs0C4Kj1E4tRfiO6usalqNkEdBP5Q0hbpmT65eVWeppZ8af08nC+U5Pz8SwTFZHkxWphhsmYEsdRgymTOAliIsDQk7IsVsLoGeqQ43yxqQzBOWEGWJFkHAbcHZTZ3EuO18c4jwlJrsG0aedWtWBmpvQSHfBhacwS46fB4OMzxlFt2IVbD5UEqXvuLk1C7RChct93mKn9q7v1Bc9ZK1JJf6icvoXZTL/xXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVntRuqEc6Ps/NQY6623ZAssFaFZQjXcaj4eCfyWjko=;
 b=5FiX36lvO6cR3jCVqZZzhb7u61OlAfMmCBY1V6FmaCJrL+A4CTCNGvPww6hjqZAThZd3bP8XgIN3imAMlOHO/Di4dejuVHv+DTUCrhcTL+z9jv5rHOuQNbZIBLD5o2l+o4ANV9g32XF8d92pjvaMJdDVDKxgVsCtwSw+1d/cgUA=
Received: from BN9PR03CA0230.namprd03.prod.outlook.com (2603:10b6:408:f8::25)
 by LV1PR12MB392019.namprd12.prod.outlook.com (2603:10b6:408:514::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 00:40:33 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::56) by BN9PR03CA0230.outlook.office365.com
 (2603:10b6:408:f8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 00:40:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 00:40:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:25 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 18:40:24 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Junhua Shen <Junhua.Shen@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 8/8] tests/amdgpu: replace execute_compute_dispatch with
 amdgpu_compute_copy_dword
Date: Sun, 15 Nov 2026 19:40:07 -0500
Message-ID: <20261116004016.121139-9-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116004016.121139-1-vitaly.prosyak@amd.com>
References: <20261116004016.121139-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|LV1PR12MB392019:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8b0b30-be62-4599-e1a9-08df437a3909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261021135927099003|261021133027099003|261021130227099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261009223327099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: deEHCWEHm+O2aJtiaJt1QMcmmKDog87CV6zU7rJGloVGog4N6/jVI4XWwl17viOYHN9jyxZQ4E1W2kZrQOEhJCHHVmOE10BpKs59/mx7PySPOlLI2MIjsk600Y9Mtp6RwBtez4ZTLzQ5YmIQWujVT3qbE99jI6Fb5ajgsrfNuWI5Jr8gK8Ksx+NqGlcXNfg2HjOKN+ZHTKzd563Ve7Anf1IsCSsxCZyeHzNlT1DDx+t2ZulRCS0TNdCw4ho74Q1McfSlUoMs7B5GbAr0hKwUjwPYKP8vqQzQRmucL9CmTr8FB6D+Rhcgs+Wj9hoBcQyQzXnYMs86rD9YRFKi642OTLfCEfOqqhsvzOSyl8qiIFt7l6ZeYYElZkA8A4e0YemFtiQOAvlhYN7+SBVGcToeOud26vWLyTdNKrgp2Al/ML/bXfA0DBgr95wQQTOtk659TXfpLKwW0kls0bltrM6fs8QJ1bb71ttOQPquySAXNlfBrdIrIZCOwlBBQmKxh8SIlYGypDuTmlOP9kxaDWVqnFZPtZaChumbgTx7T6MAho6AmWIM5E2kNACGD4l3u9yBVmwz+SqfW8wlnIAKi/El9IumfOMTRGSSzWg9Di6ag7pbJsYnOnoLQ7f182jmSZSEj0u0gkncfUGZlJPFQ5dZHfu/j9G6QP9+koAamSF5IteoOSii+KUTzDXcGPkDDoarpjJ4WrxgUZS3RlCSy13wNg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261021135927099003)(261021133027099003)(261021130227099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223327099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0kaRjPKz8GN4WJoKQIvOSLQ1nv1MS3T0GG2ExM73ENCENyA0Xep3WPsH5H+JNVtdSn+CA++rB3eHFKjRaBBAXbNfeW+ObEYF+vrGZ+IoaKnQ1qmNCNY3hxDl/FPcw/SlbPtglZqnF6Y0iNMGpCVjhiqTszeWdTSXGlzZpWU/y+l0RTv1oURgEf4vjRx7qSzhJQijmEsxMZFxAdmA4gwSzq1hccJATUbL9CHJkeapSoYup5+Wo3U6LF3mlPUgVcvzU3C6Y4VtGQyp6khfD/VdbgLXs5C0QvVkTHjZlUW+bUG8v1SnrCXGRMTcrKvbq0vF4NyuoqEn5jaCjR12+9JgjIpf7jY+uUAfZQlLsvvIkj+QaXQSRwprOSLjuahNJZKTSuELldyRMu26ZtRsMq5+V3qBhqSkos8A2NMKCMegweW9S5arZ6e58ZIX48asEPrx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 00:40:33.1491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8b0b30-be62-4599-e1a9-08df437a3909
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB392019
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

Switch amd_mem's ptrace VRAM verification from execute_compute_dispatch()
to the new amdgpu_compute_copy_dword() helper, and drop the now-unused
execute_compute_dispatch().

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_mem.c | 131 ++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 88 deletions(-)

diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
index 898364ce0..310ddf1a2 100644
--- a/tests/amdgpu/amd_mem.c
+++ b/tests/amdgpu/amd_mem.c
@@ -2802,111 +2802,73 @@ cleanup_vram:
 /**
  * execute_shader_verification - Execute GPU verification of ptrace results
  * @device: AMDGPU device handle
+ * @vram_bo: VRAM buffer BO (source of the copies)
  * @vram_mc_addr: VRAM buffer GPU address
  * @vram_offset: Offset within VRAM buffer to test words
  * @expected_value1: Expected value for first word (word_before)
  * @expected_value2: Expected value for second word (word_after)
  *
- * This function assembles the shader code and executes two independent compute
- * dispatches to verify that the ptrace-modified values are visible to the GPU.
- * Each dispatch uses completely separate resources to ensure clean state.
+ * This function dispatches a CopyDword compute shader twice to read back the
+ * two ptrace-modified words from VRAM into a CPU-visible buffer, and verifies
+ * that each readback matches the expected value. The shared destination buffer
+ * is re-zeroed before each dispatch so a stale value cannot make the second
+ * check pass, keeping the two checks independent.
  *
  * Returns: 0 on success, -1 on failure
  */
 static int execute_shader_verification(amdgpu_device_handle device,
+				       amdgpu_bo_handle vram_bo,
 				       uint64_t vram_mc_addr,
-				      uint64_t vram_offset,
-				      uint32_t expected_value1,
-				      uint32_t expected_value2)
+				       uint64_t vram_offset,
+				       uint32_t expected_value1,
+				       uint32_t expected_value2)
 {
-	struct amdgpu_gpu_info info = {0};
-	char mcpu[32];
-	uint8_t isa_bin[4096];
-	size_t isa_sz = 0;
-	int r_asm;
-	uint32_t version;
-	struct drm_amdgpu_info_hw_ip hw_ip_info;
-
-	amdgpu_bo_handle bo_shader1 = NULL, bo_shader2 = NULL;
-	void *ptr_shader1 = NULL, *ptr_shader2 = NULL;
-	uint64_t mc_shader1 = 0, mc_shader2 = 0;
-	amdgpu_va_handle va_shader1 = 0, va_shader2 = 0;
+	const uint64_t src1 = vram_mc_addr + vram_offset;
+	const uint64_t src2 = vram_mc_addr + vram_offset + sizeof(uint64_t);
+	amdgpu_bo_handle bo_dst = NULL;
+	volatile uint32_t *ptr_dst = NULL;
+	uint64_t mc_dst = 0;
+	amdgpu_va_handle va_dst = 0;
 	int ret = 0;
 
-	/* Query GPU information for architecture-specific setup */
-	if (amdgpu_query_gpu_info(device, &info) != 0) {
-		igt_info("Query GPU info failed\n");
-		return -1;
-	}
-
-	amdgpu_family_id_to_mcpu(info.family_id, mcpu, sizeof(mcpu));
-	igt_info("Assembling shader for architecture: %s\n", mcpu);
-
-	/* Assemble shader code */
-	r_asm = amdgpu_llvm_assemble(mcpu, CopyDwordIsa, isa_bin, sizeof(isa_bin), &isa_sz);
-	if (r_asm != 0 || isa_sz == 0) {
-		igt_info("Shader assembly failed (error=%d, size=%zu)\n", r_asm, isa_sz);
+	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				AMDGPU_GEM_DOMAIN_GTT, 0,
+				&bo_dst, (void **)&ptr_dst, &mc_dst, &va_dst) != 0) {
+		igt_info("Failed to allocate destination buffer\n");
 		return -1;
 	}
 
-	/* Determine GPU version for register programming */
-	r_asm = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &hw_ip_info);
-	igt_assert_eq(r_asm, 0);
-	version = hw_ip_info.hw_ip_version_major;
-
-	igt_info("Using GPU version %u for family 0x%x\n", version, info.family_id);
-
 	/* First dispatch - verify word_before value */
 	igt_info("=== First dispatch: reading word_before ===\n");
-
-	/* Allocate separate shader buffer for first dispatch */
-	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				AMDGPU_GEM_DOMAIN_VRAM, 0,
-				&bo_shader1, &ptr_shader1, &mc_shader1, &va_shader1) != 0) {
-		igt_info("Failed to allocate first shader buffer\n");
-		return -1;
-	}
-	memset(ptr_shader1, 0, 4096);
-	memcpy(ptr_shader1, isa_bin, isa_sz);
-
-	if (execute_compute_dispatch(device, version, mc_shader1,
-				 vram_mc_addr + vram_offset,
-				0, /* dst allocated in helper */
-				expected_value1) != 0) {
+	*ptr_dst = 0;
+	if (amdgpu_compute_copy_dword(device, vram_bo, src1, bo_dst, mc_dst) != 0) {
 		igt_info("First dispatch failed\n");
 		ret = -1;
+		goto out;
 	}
-
-	amdgpu_bo_unmap_and_free(bo_shader1, va_shader1, mc_shader1, 4096);
-
-	/* Only proceed if first dispatch succeeded */
-	if (ret != 0) {
-		return ret;
+	if (*ptr_dst != expected_value1) {
+		igt_info("First result mismatch: got 0x%x, expected 0x%x\n",
+			 *ptr_dst, expected_value1);
+		ret = -1;
+		goto out;
 	}
 
 	/* Second dispatch - verify word_after value */
 	igt_info("=== Second dispatch: reading word_after ===\n");
-
-	/* Allocate separate shader buffer for second dispatch */
-	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				AMDGPU_GEM_DOMAIN_VRAM, 0,
-				&bo_shader2, &ptr_shader2, &mc_shader2, &va_shader2) != 0) {
-		igt_info("Failed to allocate second shader buffer\n");
-		return -1;
-	}
-	memset(ptr_shader2, 0, 4096);
-	memcpy(ptr_shader2, isa_bin, isa_sz);
-
-	if (execute_compute_dispatch(device, version, mc_shader2,
-				 vram_mc_addr + vram_offset + sizeof(uint64_t),
-				0, /* dst allocated in helper */
-				expected_value2) != 0) {
+	*ptr_dst = 0;
+	if (amdgpu_compute_copy_dword(device, vram_bo, src2, bo_dst, mc_dst) != 0) {
 		igt_info("Second dispatch failed\n");
 		ret = -1;
+		goto out;
+	}
+	if (*ptr_dst != expected_value2) {
+		igt_info("Second result mismatch: got 0x%x, expected 0x%x\n",
+			 *ptr_dst, expected_value2);
+		ret = -1;
 	}
 
-	amdgpu_bo_unmap_and_free(bo_shader2, va_shader2, mc_shader2, 4096);
-
+out:
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, 4096);
 	return ret;
 }
 
@@ -3051,19 +3013,12 @@ static void ptrace_access_invisible_vram_test(amdgpu_device_handle device)
 		igt_assert_eq(*word_after,  original0);
 		igt_info("CPU verification passed. Attempting shader readback...\n");
 
-		/* GPU verification using refactored helper functions */
-		if (amdgpu_llvm_asm_init() == 0) {
-			if (execute_shader_verification(device, mc_address_vram, VRAM_OFFSET,
-							(uint32_t)original1, (uint32_t)original0) == 0) {
-				igt_info("GPU shader verification passed\n");
-			} else {
-				igt_info("GPU shader verification failed\n");
-				/* Continue test execution even if GPU verification fails */
-			}
-
-			amdgpu_llvm_asm_shutdown();
+		if (execute_shader_verification(device, vram_bo, mc_address_vram, VRAM_OFFSET,
+						(uint32_t)original1, (uint32_t)original0) == 0) {
+			igt_info("GPU shader verification passed\n");
 		} else {
-		    igt_info("LLVM assembler unavailable; skipping shader verification.\n");
+			igt_info("GPU shader verification failed\n");
+			/* Continue test execution even if GPU verification fails */
 		}
 
 		igt_info("ptrace-access-invisible-vram test: PASSED\n");
-- 
2.43.0

