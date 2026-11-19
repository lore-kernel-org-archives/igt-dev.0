Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75669606A325
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 06:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wZl1iHZg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA5010EC67;
	Thu, 19 Nov 2026 06:29:18 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7497E10E7CF
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 06:19:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh7ydSv83WukwmOOOASuidmQDVDhNu4dxBCCKSIcw7xZrSz3d5DZIJrIlQu181NUKTZIDZaF8UczP3BRUG2cm7ux5hXL9dZ47yp8SBmvb+V2Ak1QHMKbVGGjqVcZMIA0e36CLhnhE3LbvifKpncZAJqzZbblfVjaSV1FVKlEn+wEd97693pdkeSSeGPrykRMgMrL7yLUOfIeD982KfB0og6EoOgU4HRxCiAaihffIFrK/38UqMmteYYSDDm2xDHFaVZQ2SK9I+7Q8U534FSEGU+42IPQ3DqHJGi6wNH04XCkm77Ujpd/1c5D14yQ83/3QwTA8ujRr1/Jy9hfdvjjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6dYMS1H5tOcqD+WdyYBbjG6cEdJ7tBlGQVFcRgucpQ=;
 b=LD3OxAW86PM/D2NwmtbpfItwUjPoocAgb/STwXs6/jGEgHuzbIWipqD5LUqh0nCp0s3P+2Xl65rdO/Hy0ZD2zNNWPC35c2uR2ulvs8bl9kN6vKKbhcxBHp9bW7BcQYmHW46iFE1bP2FOI5Z+yj5Cp7IhuuAxJCciqOEPJhdz2W3KSJt1+52i3cYCb2Zbydeg8VbcJzy+V3d7t3a35eGEPQXQ5MdqfG7AgSsHiEWfSwhep2qbQMYE98brqe91GXz/PPzGm43CJOJ+TEuuBkpRup2ek4ABp7nrOiJvN9Po6D4hcgvBr5O/APXuufCxAkZ1o+p1sIqB67OKJyt4EoECpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6dYMS1H5tOcqD+WdyYBbjG6cEdJ7tBlGQVFcRgucpQ=;
 b=wZl1iHZgff65UNAptx8QLOv28t7e+2zBN1Q77bCOkKrOTjiAYOanqOvPRzJbT4KcjEqKn5+KsHWwzBuqTcHi/rXUnkvgxwoXkl/BD9zt+SwxACmmJMjfJDYmekGre3QEfBc0jMf9q1bWFtP70ZOaROXRIpVu+WZY3kZNSd/biac=
Received: from DS1PR03CA0025.namprd03.prod.outlook.com (2603:10b6:8:233::18)
 by DS4PR12MB634945.namprd12.prod.outlook.com (2603:10b6:8:514::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.17; Thu, 19 Nov
 2026 06:19:17 +0000
Received: from CY4PEPF000392D6.namprd03.prod.outlook.com
 (2603:10b6:8:233:cafe::51) by DS1PR03CA0025.outlook.office365.com
 (2603:10b6:8:233::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 06:19:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF000392D6.mail.protection.outlook.com (10.167.247.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 06:19:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:16 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 00:19:14 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 10/11] tests/amdgpu: add SLTH tests reading the
 second-level TMA
Date: Thu, 19 Nov 2026 14:18:31 +0800
Message-ID: <20261119061847.3442210-10-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D6:EE_|DS4PR12MB634945:EE_
X-MS-Office365-Filtering-Correlation-Id: dabdf933-2631-4d22-855d-08df46050a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|6133799003|261009223027099003|3023799007|56012099006|5023799004|11063799006|261102123227099003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|261022115727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: lQg1A1MGNe770WWYSnuIB+PIl8vV8tPT/3IlJ9JOZTL5mLSa2GT1Kq94V+Dk9UWma6V1HZv9PE37qFyU0xBgnC9s/XAv6PxKdMkrNzyaLx9p5SgS50ASjQAq/5STJ6G9VqZbxYkzRs+iC4jZspUE36zlbWkWoRndB2kNRlB4fKoHYnNBqpaF5W6ClJUJUBaYEttdMhaiWulSJEPX1QEPkLZak3Hh9eipclZYHyTi2z+wCfEg2yVn/odytfGafnM0AUTcm+GvY3IpCyOTrPDSJLiLmcxlYcSxFUXt8T9oj8Ztqc6oECwVXH6mxp2XKe5optzZyp0EY7dADJdC8LIqf7NjWcSXBgKrOAnZFm+WZsnimVSpnibWaarva55+LXoMyG+4KqN7kr/X1tbKXsBRq9K8o7TvQ7NnjV4sqe7UwbJ6Usb3SrNWnxtqhnpykU2K3dh/qIEPUC0TyGJu/rzLrkt/ORbeA4KsDYk7lgt46n8O/roupBFSfc5VjJUGTUnUXieEU1u0a3ZRhHQO0Y31Zjdax2pr47lg0ryi7FSx/cMldQw3SbwG/QBMOYmvHPaobMofO+HDgQ6HvHazyhvOmVlGTG9YeZsIwP2+abbxPVe4dMe6UajYtUNrQmjjBsF9F3RybpiP3lzKA+YjCsfpznLZIt5AO4Ascj2TBW3Nqe1qM5j3BYwHz4rddE9gm/k9aRsKQkw2iZqZwmLsKAjnvA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(56012099006)(5023799004)(11063799006)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8pELAiLORTtGQUbEjt5V3GFpvakn+OU0dS2F+pz+xD4lKGf8KARSClrivg2hLl50tlzOtojlmJRK9qAMGqBgNojPd33/y7KeSqa1iwoU/CcGjdpLVAlOFEbvJvUbRqrgP2++mZhj0Wyh2hi+B7ZazkMKlDnilGeaBbb9wN+8lCdWnBae4QpSN0pS6plhzlHLhAChfj7/l97aHZhm4nNGYR8ZG3wvQcFaThP+S6gDDyxkzOniPZXxy8nKOwtdoN4ngbEhpECQIfTJEufQi4I4Q3VfFOBsqbXo3BewOEzvdClN2VQJIW5vmk/DwXLaMzGg/BtbjjLq9pi9+iBHl9P9ARvwBVEa46PfyO3hMi2POfoBuHGMN9jXtg4aD6vbT+z0Hw9WTOrkfZvkH1CwXhMOCvFa+kS6gh7E7QDwcYASqs+JKAI5m8banwLqjy//92gE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:19:17.3758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dabdf933-2631-4d22-855d-08df46050a7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392D6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB634945
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

The SLTH tests only check that the second-level trap handler runs,
so nothing checks the TMA passed to SET_L2_TRAP. The kernel stores
it in the first-level TMA, and the first-level trap handler loads
it into ttmp[14:15] for the second-level handler, using the
first-level TMA address from SQ_SHADER_TMA (or MSG_RTN_GET_TMA).

Store a known value in the first dword of the second-level TMA and
add TrapHandlerIsaTmaProof, which loads it through ttmp[14:15] into
v2. Add the slth-{gfx,comp}-{kq,umq}-tma-proof subtests to run it
with the VGPR proof shader, which stores v2 after the trap returns.
They pass only if the TMA address reaches the second-level handler.

To share the code, the GFX and compute KQ VGPR proof tests and the
user queue helper now take the trap handler and the expected value.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/shaders/amd_shader_store.h | 20 ++++++-
 tests/amdgpu/amd_slth.c               | 79 +++++++++++++++++++++------
 2 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/lib/amdgpu/shaders/amd_shader_store.h b/lib/amdgpu/shaders/amd_shader_store.h
index a86e7bb25..045f09972 100644
--- a/lib/amdgpu/shaders/amd_shader_store.h
+++ b/lib/amdgpu/shaders/amd_shader_store.h
@@ -1355,7 +1355,8 @@ static const char * const amdgpu_test_shaders[] = {
  *   out = s[0:1];	// output address from COMPUTE_USER_DATA_0/1
  *   v2 = 0;
  *   s_trap 1;		// the second-level trap handler sets v2
- *   *out = v2;		// 42 with TrapHandlerIsaProof
+ *   *out = v2;		// 42 with TrapHandlerIsaProof,
+ *			// TMA[0] with TrapHandlerIsaTmaProof
  */
 static const char SlthVgprProofIsa[] =
     SHADER_START
@@ -1505,5 +1506,22 @@ static const char SlthReturnProofIsa[] =
 static const char TrapHandlerIsaProof[] =
 	SLTH_TRAP_HANDLER("	v_mov_b32 v2, 42\n");
 
+/* Shader: TrapHandlerIsaTmaProof
+ * Purpose:
+ *   Set v2 to the first dword of the second-level TMA on s_trap, shows that
+ *   the TMA set with SET_L2_TRAP reaches the second-level trap handler.
+ *
+ * Pseudo-code (set_v2):
+ *   v2 = *(u32 *)ttmp[14:15];	// TMA[0], SLTH_TMA_MAGIC from the test
+ */
+static const char TrapHandlerIsaTmaProof[] =
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
index 34736b34f..585726205 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -28,6 +28,9 @@
 #define TBA_SIZE (2 * 4096)
 #define TMA_SIZE (4096)
 
+/* First dword of the second-level TMA, read by TrapHandlerIsaTmaProof */
+#define SLTH_TMA_MAGIC 0x5ec0de42
+
 struct slth_bufs {
 	amdgpu_bo_handle tba_bo;
 	amdgpu_bo_handle tma_bo;
@@ -156,6 +159,7 @@ static void slth_prepare_tba_with_handler(
 			isa_sz);
 
 	memset(bufs->tma_cpu, 0, TMA_SIZE);
+	*(uint32_t *)bufs->tma_cpu = SLTH_TMA_MAGIC;
 
 	igt_info("Trap handler size=%zu\n", isa_sz);
 }
@@ -498,7 +502,8 @@ static uint32_t execute_slth_dispatch(
 }
 
 static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
-					int fd)
+					int fd, const char *handler,
+					uint32_t expected)
 {
 	struct slth_bufs bufs;
 	uint8_t isa_bin[8192];
@@ -519,7 +524,7 @@ static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
 
 	slth_prepare_tba_with_handler(device,
 				      &bufs,
-			TrapHandlerIsaProof);
+			handler);
 
 	ret = vm_set_l2_trap(fd,
 			     bufs.tba_mc_addr,
@@ -555,13 +560,13 @@ static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
 
 	igt_info("VGPR proof output value=%u\n", value);
 
-	if (value == 42)
+	if (value == expected)
 		igt_info("SLTH trap handler updated VGPR state, shader resumed successfully\n");
 	else
-		igt_info("SLTH GFX KQ VGPR proof failed: expected=42 actual=%u\n",
-			 value);
+		igt_info("SLTH GFX KQ VGPR proof failed: expected=%u actual=%u\n",
+			 expected, value);
 
-	igt_assert_eq(value, 42);
+	igt_assert_eq(value, expected);
 
 	ret = vm_clear_l2_trap(fd);
 	igt_assert_eq(ret, 0);
@@ -578,6 +583,7 @@ static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
  */
 static uint32_t
 slth_umq_run(amdgpu_device_handle device, int fd, unsigned int ip_type,
+	     const char *handler,
 	     void (*prepare_shader)(amdgpu_device_handle device,
 				    uint8_t *isa_bin, size_t *isa_sz))
 {
@@ -600,7 +606,7 @@ slth_umq_run(amdgpu_device_handle device, int fd, unsigned int ip_type,
 
 	memset(&bufs, 0, sizeof(bufs));
 	slth_alloc_buffers(device, &bufs);
-	slth_prepare_tba_with_handler(device, &bufs, TrapHandlerIsaProof);
+	slth_prepare_tba_with_handler(device, &bufs, handler);
 
 	r = vm_set_l2_trap(fd, bufs.tba_mc_addr, bufs.tma_mc_addr);
 	igt_info("SET_L2_TRAP ret=%d\n", r);
@@ -710,7 +716,7 @@ static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
 
 	igt_info("SLTH GFX UMQ VGPR PROOF\n");
 
-	value = slth_umq_run(device, fd, AMD_IP_GFX,
+	value = slth_umq_run(device, fd, AMD_IP_GFX, TrapHandlerIsaProof,
 			     slth_prepare_vgpr_proof_shader);
 
 	/* The trap handler sets v2 to 42 before the shader stores it. */
@@ -721,7 +727,8 @@ static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
 
 static void
 slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
-			     int fd)
+			     int fd, const char *handler,
+			     uint32_t expected)
 {
 	struct slth_bufs bufs;
 
@@ -782,7 +789,7 @@ slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
 
 	slth_prepare_tba_with_handler(device,
 				      &bufs,
-			TrapHandlerIsaProof);
+			handler);
 
 	ret = vm_set_l2_trap(fd,
 			     bufs.tba_mc_addr,
@@ -1042,7 +1049,7 @@ slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
 		 ptr_dst[0],
 			ptr_dst[0]);
 
-	igt_assert_eq(ptr_dst[0], 42);
+	igt_assert_eq(ptr_dst[0], expected);
 
 	ret = vm_clear_l2_trap(fd);
 
@@ -1492,7 +1499,7 @@ slth_gfx_umq_returnproof_test(amdgpu_device_handle device, int fd)
 {
 	uint32_t value;
 
-	value = slth_umq_run(device, fd, AMD_IP_GFX,
+	value = slth_umq_run(device, fd, AMD_IP_GFX, TrapHandlerIsaProof,
 			     slth_prepare_returnproof_shader);
 
 	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
@@ -1504,7 +1511,7 @@ slth_comp_umq_vgpr_proof_test(amdgpu_device_handle device, int fd)
 {
 	uint32_t value;
 
-	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
+	value = slth_umq_run(device, fd, AMD_IP_COMPUTE, TrapHandlerIsaProof,
 			     slth_prepare_vgpr_proof_shader);
 
 	/* The trap handler sets v2 to 42 before the shader stores it. */
@@ -1516,13 +1523,29 @@ slth_comp_umq_returnproof_test(amdgpu_device_handle device, int fd)
 {
 	uint32_t value;
 
-	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
+	value = slth_umq_run(device, fd, AMD_IP_COMPUTE, TrapHandlerIsaProof,
 			     slth_prepare_returnproof_shader);
 
 	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
 	igt_assert_eq(value, 2);
 }
 
+/*
+ * The second-level trap handler sets v2 to the first dword of its TMA, which
+ * only works if the kernel stored the TMA address where the first-level trap
+ * handler gets it from.
+ */
+static void
+slth_umq_tma_proof_test(amdgpu_device_handle device, int fd,
+			unsigned int ip_type)
+{
+	uint32_t value;
+
+	value = slth_umq_run(device, fd, ip_type, TrapHandlerIsaTmaProof,
+			     slth_prepare_vgpr_proof_shader);
+	igt_assert_eq_u32(value, SLTH_TMA_MAGIC);
+}
+
 int igt_main()
 {
 	amdgpu_device_handle device;
@@ -1565,13 +1588,15 @@ int igt_main()
 	}
 
 	igt_subtest("slth-gfx-kq-vgpr-proof")
-		slth_gfx_kq_vgpr_proof_test(device, fd);
+		slth_gfx_kq_vgpr_proof_test(device, fd, TrapHandlerIsaProof,
+					    42);
 
 	igt_subtest("slth-gfx-umq-vgpr-proof")
 		slth_gfx_umq_vgpr_proof_test(device, fd);
 
 	igt_subtest("slth-comp-kq-vgpr-proof")
-		slth_comp_kq_vgpr_proof_test(device, fd);
+		slth_comp_kq_vgpr_proof_test(device, fd, TrapHandlerIsaProof,
+					     42);
 
 	igt_subtest("slth-comp-kq-returnproof")
 		slth_comp_kq_returnproof_test(device, fd);
@@ -1594,6 +1619,28 @@ int igt_main()
 		slth_comp_umq_returnproof_test(device, fd);
 	}
 
+	igt_describe("Check-SLTH-trap-handler-reads-its-TMA-on-GFX-kernel-queue");
+	igt_subtest("slth-gfx-kq-tma-proof")
+		slth_gfx_kq_vgpr_proof_test(device, fd, TrapHandlerIsaTmaProof,
+					    SLTH_TMA_MAGIC);
+
+	igt_describe("Check-SLTH-trap-handler-reads-its-TMA-on-compute-kernel-queue");
+	igt_subtest("slth-comp-kq-tma-proof")
+		slth_comp_kq_vgpr_proof_test(device, fd, TrapHandlerIsaTmaProof,
+					     SLTH_TMA_MAGIC);
+
+	igt_describe("Check-SLTH-trap-handler-reads-its-TMA-on-GFX-user-queue");
+	igt_subtest("slth-gfx-umq-tma-proof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_GFX]);
+		slth_umq_tma_proof_test(device, fd, AMD_IP_GFX);
+	}
+
+	igt_describe("Check-SLTH-trap-handler-reads-its-TMA-on-compute-user-queue");
+	igt_subtest("slth-comp-umq-tma-proof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
+		slth_umq_tma_proof_test(device, fd, AMD_IP_COMPUTE);
+	}
+
 	igt_fixture() {
 		amdgpu_llvm_asm_shutdown();
 		amdgpu_device_deinitialize(device);
-- 
2.50.1

