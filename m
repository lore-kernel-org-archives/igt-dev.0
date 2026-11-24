Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8545D606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JszIPXgR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E21210F2FE;
	Tue, 24 Nov 2026 08:38:45 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084A310F2F3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmz030GiOUzDxMPxwku3vDviGMfk4re4J37vuIuEtWUl+q3lvLx3+X4vIVvlwWvUtEJLqABWwQTEopL3kJBdEj3f0QqiXHwVUhUZbAu47rnBJvNvQo+1VKYNxbVfc02pO5vhcjEHxg87PUWUx8KgMIdQg8YIslcDv/M0r9zN8PXo/E8E5jc4Y9XM4co1kgWKfrAYq8K48BakYfrXpEE8+OUD2P7bWrFtAXGJQIHw06b5kLy95fIAcHnfxywGbAlScoE+N5GmiGlI+G8gRizLvz+WR4XNvugfwc7yvll6opZZRM1MOue/Bk8+Ha6nHf7SLIIEzohnai3/iGPSiiu21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcNOJ9SwZDqiX06xT6R86hqDbK9NgN1xDTk+60RJxac=;
 b=hALN15ey5mcV/wlszkL56tDgvwPTZfqq+biKsDvyPMwfbAyObWaMopsHmmS716er7kjMNtPJGMityW76yvJgE+6f8SAFA7v8JvbUKJ1UncVcR0Rd5zi7CzkTZdsqjaftU98aCXL7dMAZDfnWDOquzKOde7WTY8tUnzDXEOtdZ/P3QxVfWLW8sjXIFVaT1b465daNZChgZ+NSKqzpJz9QXBTfRPw8hMoCyngFhEZdxKtTuTT06z4nDGSrntUrgjwuqirojnJYYo3ILvnOnhOOaeffKtCQ1dbPlmFVqygzFF8EcN0pWql5+EDTBd3mY3Y4CWibO5DINovzyAGiWiS54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcNOJ9SwZDqiX06xT6R86hqDbK9NgN1xDTk+60RJxac=;
 b=JszIPXgRZ016kt/3HFkwSP2oklWfUam3RYA6JVfTU1UUFCFJhYze0+fgOCkGNh992li1uT02joPSyfissuOpuF3PTqwsxtDQRW7bvDv9FjKf6JjLm9gq9XITnnyOes4aMB3ChvYmlDa2PKh3GxxeITQD0qo57ujA7riX0sIyguY=
Received: from BLAPR03CA0141.namprd03.prod.outlook.com (2603:10b6:208:32e::26)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:28:45 +0000
Received: from BL4PEPF000003F4.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::a7) by BLAPR03CA0141.outlook.office365.com
 (2603:10b6:208:32e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:28:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL4PEPF000003F4.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:44 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:44 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:42 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 09/12] tests/amdgpu: have the SLTH trap handler copy
 a value from its TMA
Date: Tue, 24 Nov 2026 16:27:39 +0800
Message-ID: <20261124082819.2089694-9-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PEPF000003F4:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: 30edce2f-495c-43e6-0124-08df4a04f449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|261009223027099003|22082099003|3023799007|261021123027099003|261021121427099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|56012099006|10067099003|261102123227099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: g0WyejpknjqPGNXDoLRu4TNjhChRrwy3xpeI3bu6sFVyakzjWPqFlwE2gAYpGLXDYrIOi2LXnYpbH+ntQkhdU5IoXgqw2OUDyff9X79RyuFeldzRIISJzmtQLFtLj85uJaGzh62cNwWFhwgk3sHB6/pAX/s5OaHLVnB1zmnTsmr5NWr6u62yXDTXKYpiDJeTYN0RQfW4W4FDb64g+WxmdhaS/sYJhXL8p0ssC/Kk5IocaP1gGQdRrETxHywQOmlH7sWEdv1KYgSf3eWgcNj0g/JpVXhiJ1/juqJL57Gt42IVoMv93iLykaEyLk93xkVrT3nTOFW6/6ONbucgokhovdOgl2WiKcPYp6OdRTSxO348Bxna8gGPpSqVOZx+OZkSEbnnZU+Wu0czUxuS3zODmPCXf3Lk342NLkjr78zqDWtah0Mx2Ad7I5WJTCb/9rb6brg6GfDwI5cmwOphRBTb0TycNr/BI8o1Xb52d4h5mN6oJEm1SnGgx0PJ21uZ/UwRW8HlgKtsHisoHFVpo6tDSOIU3FHPacvmvL2QfFw3ePxcPrAR1ahgToPkEeDdcKZ9ovD3vDcVDofMs4rUZpmMKrDFWzSRN6FGFg9fBHNIkdR6m4O0R2nL9z0R1DxJvympT3rOwKucCOGEoTEo8vuuzSjyz+ky9tMeWbs9Yq4VItSpBUojcPbMDgS4sU6heLim
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(261009223027099003)(22082099003)(3023799007)(261021123027099003)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Wix4l5NLafFmc6CBcEoT3OIzUUc0Wc2ddaOsU0g0WfmhyykdFIvPun0qQxi+FjsqA69o/cAA39ok3JNgms8DexrrcDwiwTnDcSxVGWmPVWshsVD3ar8mYGP7E1WLb9jBc56gjU+lgjGzzYW/bEBM0Aa+YM0v1GxZGxTWHg7VKuCeVMVrLgrHn2JZxrXh19eSFQTu7rcB5zYQlFdYokjcVW4biJN2mQNCrkZbLcdzmnxDNRuf/E40MIi3sByQxUaSlW3VifRJ+x4OuWHj4G4123S/6t8sWAH1GgqCi5LDSZXCJ9JD2wGyKTfzhoqNQyqxPb7TxDO7q2kyAftGmj2tqrqHgtymGmnw50X8rNSReudntPESO08p4psi9HpEXCs2tYNj+HFv2xUiwyoolhPfgwd8cwxyJZH3OgWBvD3iVDvEP7pR16tjVJe2BTpHt73o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:44.8196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30edce2f-495c-43e6-0124-08df4a04f449
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL4PEPF000003F4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683
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

The SLTH trap handler sets v2 to a hardcoded 42, so the VGPR proof tests
only check that it runs. Nothing checks the TMA passed to SET_L2_TRAP,
which the kernel stores in the first-level TMA, and which the first-level
trap handler loads into ttmp[14:15] for the second-level handler.

Store a known value in the first dword of the second-level TMA and make
the handler copy it to v2 through ttmp[14:15] instead. The VGPR proof
tests now pass only if the second-level handler runs and can read the
TMA it was given.

v3: New patch, copy a known value from the TMA instead of a hardcoded 42 (Lijo)

Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/shaders/amd_shader_store.h | 17 +++++++++++++----
 tests/amdgpu/amd_slth.c               | 22 +++++++++++++---------
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/lib/amdgpu/shaders/amd_shader_store.h b/lib/amdgpu/shaders/amd_shader_store.h
index a86e7bb25..d1e8956a3 100644
--- a/lib/amdgpu/shaders/amd_shader_store.h
+++ b/lib/amdgpu/shaders/amd_shader_store.h
@@ -1355,7 +1355,7 @@ static const char * const amdgpu_test_shaders[] = {
  *   out = s[0:1];	// output address from COMPUTE_USER_DATA_0/1
  *   v2 = 0;
  *   s_trap 1;		// the second-level trap handler sets v2
- *   *out = v2;		// 42 with TrapHandlerIsaProof
+ *   *out = v2;		// TMA[0], copied by TrapHandlerIsaProof
  */
 static const char SlthVgprProofIsa[] =
     SHADER_START
@@ -1497,13 +1497,22 @@ static const char SlthReturnProofIsa[] =
 
 /* Shader: TrapHandlerIsaProof
  * Purpose:
- *   Set v2 to 42 on s_trap, shows that the second-level trap handler ran.
+ *   Copy the first dword of the second-level TMA to v2 on s_trap. Shows that
+ *   the second-level trap handler ran and that the TMA set with SET_L2_TRAP
+ *   reaches it through ttmp[14:15].
  *
  * Pseudo-code (set_v2):
- *   v2 = 42;
+ *   v2 = *(u32 *)ttmp[14:15];	// TMA[0], SLTH_TMA_VALUE from the test
  */
 static const char TrapHandlerIsaProof[] =
-	SLTH_TRAP_HANDLER("	v_mov_b32 v2, 42\n");
+	SLTH_TRAP_HANDLER("	.if .amdgcn.gfx_generation_number >= 12\n"
+	"	s_load_dword ttmp2, ttmp[14:15], 0x0 scope:SCOPE_SYS\n"
+	"	s_wait_kmcnt 0x0\n"
+	"	.else\n"
+	"	s_load_dword ttmp2, ttmp[14:15], 0x0 glc\n"
+	"	s_waitcnt lgkmcnt(0)\n"
+	"	.endif\n"
+	"	v_mov_b32 v2, ttmp2\n");
 
 
 #endif
diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
index 34736b34f..cfae27790 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -28,6 +28,9 @@
 #define TBA_SIZE (2 * 4096)
 #define TMA_SIZE (4096)
 
+/* First dword of the second-level TMA, copied to v2 by the trap handler */
+#define SLTH_TMA_VALUE 0x5ec0de42
+
 struct slth_bufs {
 	amdgpu_bo_handle tba_bo;
 	amdgpu_bo_handle tma_bo;
@@ -156,6 +159,7 @@ static void slth_prepare_tba_with_handler(
 			isa_sz);
 
 	memset(bufs->tma_cpu, 0, TMA_SIZE);
+	*(uint32_t *)bufs->tma_cpu = SLTH_TMA_VALUE;
 
 	igt_info("Trap handler size=%zu\n", isa_sz);
 }
@@ -555,13 +559,13 @@ static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
 
 	igt_info("VGPR proof output value=%u\n", value);
 
-	if (value == 42)
+	if (value == SLTH_TMA_VALUE)
 		igt_info("SLTH trap handler updated VGPR state, shader resumed successfully\n");
 	else
-		igt_info("SLTH GFX KQ VGPR proof failed: expected=42 actual=%u\n",
-			 value);
+		igt_info("SLTH GFX KQ VGPR proof failed: expected=0x%x actual=0x%x\n",
+			 SLTH_TMA_VALUE, value);
 
-	igt_assert_eq(value, 42);
+	igt_assert_eq_u32(value, SLTH_TMA_VALUE);
 
 	ret = vm_clear_l2_trap(fd);
 	igt_assert_eq(ret, 0);
@@ -713,8 +717,8 @@ static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
 	value = slth_umq_run(device, fd, AMD_IP_GFX,
 			     slth_prepare_vgpr_proof_shader);
 
-	/* The trap handler sets v2 to 42 before the shader stores it. */
-	igt_assert_eq(value, 42);
+	/* The trap handler copies TMA[0] to v2 before the shader stores it. */
+	igt_assert_eq_u32(value, SLTH_TMA_VALUE);
 
 	igt_info("SLTH GFX UMQ VGPR PROOF COMPLETE\n");
 }
@@ -1042,7 +1046,7 @@ slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
 		 ptr_dst[0],
 			ptr_dst[0]);
 
-	igt_assert_eq(ptr_dst[0], 42);
+	igt_assert_eq_u32(ptr_dst[0], SLTH_TMA_VALUE);
 
 	ret = vm_clear_l2_trap(fd);
 
@@ -1507,8 +1511,8 @@ slth_comp_umq_vgpr_proof_test(amdgpu_device_handle device, int fd)
 	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
 			     slth_prepare_vgpr_proof_shader);
 
-	/* The trap handler sets v2 to 42 before the shader stores it. */
-	igt_assert_eq(value, 42);
+	/* The trap handler copies TMA[0] to v2 before the shader stores it. */
+	igt_assert_eq_u32(value, SLTH_TMA_VALUE);
 }
 
 static void
-- 
2.50.1

