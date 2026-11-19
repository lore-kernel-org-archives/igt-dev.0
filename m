Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715D606A325
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 06:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AQ3eQ55D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6C610EB84;
	Thu, 19 Nov 2026 06:25:11 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C9610EC04
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 06:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFUKuwiuxH9EqmRREH00HcW61GSTWYHUs6JmV4UOaAW/dkM1jObpGGlGsL5ZCFzZ4yuEABgandTIvL4W6KbAfDTPdLURDkv5gmL9ntvfx+uV7SVMqcPNzGhN1jFWfaHy1nsbTv43+Wtjhnzy8saqsoG4agUABHGQ1Yd57wZjTnrlrKjtPuTQXr3XwJ+ddoXByUYQP8ktDW4LGrI5WyzwcKaj8GNQvyheUwbbg3yS3mXFQFSm6X6nxP7VXavrRRJI8AXbJZWyrELnU/UJhKLhnW/sSV9DoOyRcxmQqXw1+8yQxxpRr9aZLGr8pZN/QDloUB1vvkfjT+FJAOLJS8INDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPUmQgQCqOgtW8xSSceEroEUf/ytTz2KC5u06ADPUu0=;
 b=YEIsDtiO29yWDj7ageoaWWV++14vIh0IJZ3skQJEsPB6YAIH4SEHmPDajllpP1miWbDLAW8a+CqYeEAqQKtBGYMcdNgbBTtkUMJYWOO83+8XlrUKLn4CxLFRNL7dcPMmk8hJvKPSUJnyDGPmJY4R4IKHPnkB3quo8Qvz8nbLp7vDB420n4Kp2YMeJKA15mmgMl5d8kari5RJ/oqXlGLbSiqi2LmMYzEEamyl2iwpsDuGd4M1NUpltOvsPqNz88hrL4FhWbFVktKbQsmMMpppinsECfx520o44JXQ97PdIcUFCf84i442SlH8/E8/uriXHjziqUUIuFVtWsF3FPA0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPUmQgQCqOgtW8xSSceEroEUf/ytTz2KC5u06ADPUu0=;
 b=AQ3eQ55Dtd43q6YuV34DItoKgJxfkYXM4ITdU2K365NcXGm2JKhi9tR8KlLj22rBtNjdQb2WbS1pgmRvGY5L1iokhH4M1aSfVo1uvaEjIgyFj6h86LetdgYLW1oblMprVEm68A33CeSsqXM6Z99Q9i+PY4AEkZAPrPVrLz4WYd8=
Received: from DS1P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::19) by
 DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Thu, 19 Nov 2026 06:19:15 +0000
Received: from CY4PEPF000392DD.namprd03.prod.outlook.com
 (2603:10b6:8:44e:cafe::15) by DS1P223CA0015.outlook.office365.com
 (2603:10b6:8:44e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 06:19:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF000392DD.mail.protection.outlook.com (10.167.247.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 06:19:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:14 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 00:19:12 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 09/11] tests/amdgpu: reduce the SLTH trap handler to
 what the tests need
Date: Thu, 19 Nov 2026 14:18:30 +0800
Message-ID: <20261119061847.3442210-9-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392DD:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a20cd8-b3b4-4d70-9b10-08df46050938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|18002099003|22082099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: wopSLFfMaBDMGnrvQkZCFLLuZHpytg7CrsHHOApOi1nW9XfTdtsM1fL+b4dgWjUJvNJeUFqgLizP+NvWBiI3ZUpG1FFgZItrH4yMjZ/EASVy2i/gGziZPwtcWOCmy61AKRcHxBvsMpac1LJ3hiESmaSRRMoDYEkguQAa7niV3VDLY1ow35b9CiL7bLw/bEiW2GyYeCy8/SXTu8cFq8oOPhf62yDkpOc0tgvVDXpXfH6N+e5atFs7qOZPUAP8oA/yiQzkt7L7Q++I2Rh1Q/raMcq2jRCr67U8a64dA3PzqAMrEAfGnwK9ds9Mb1kEsSMHioFaci/OvN27YW6unuz7L7WGwumvh2tam1felBF/Qb0KCQktjiWR8J6YmzT2JRRpdVJKB0UXs0qQ2jgi7Rn3rKhGfwdwPuc4kOG0pyz/UVckU4urKCi62sqSWs3eoWH+czkVdXjcpELhDAAXj4t+bTCR33DtDTU+yGoPVcmSJ3KW8l3CwBVLiNjTuuAQvmu2mbDCmY3iuYZ5kenUyGaZI/LiWsDKZwBFAj6qQ77PXRUEQe0acM9vv8DyJ7ObcAwrGNtnn4YqouT1NxFJ5BimAdUJ68bCcohfQevRRF/MAUD+SW/6nQ66IR/oxRMDzanShPSvOl+8I6jBjcDAvHtA3QmwaIo0R/g8QlCeg2dT1tPOwOC2M6GHZ9I9ShQqYK6Y5X8mL0pCPhCZ1DnkXjh+aQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LzjSptVT3msaD0o6viJvY8pvJK/4kS6R970Ht+zH4Ukr2eZe0VHODog7ZWWOsG32gBLqJ43WdItXJYTGUe7kbePfp/lQhXGYvyDMofYxNo+u8Dm54t/nc6jim8XHU7AMuEvkRB8qRK2oIPPuJvvyb9+YhFP1QHScRaFPgsKFMCiqp31HpkEUzFAf4TAfBTsnDz48QAHeUJCwkkfmgWxMRrXBZAIBjGGqumgqlrZ6raBfDKufkGS8AUp4B4LfOD1OC7sZgxFGQiNlPIzX5fPjz6GB7r2A0jgvjj4jsJrWAiQO7jpsBQy3ABIuKhuRcqR0jO7MTRTTEINUAsvk8iK7ktC7LIZZAM+comhcBfdiJ0gvT4MynPIPe5pFnzc8lR79Qdd8AjMdNQJ0wFqZrneWiyeAqpHjbFRB+CB5Wz3WxbtVnh0GjDJf3YORKQluXnGh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:19:15.2540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a20cd8-b3b4-4d70-9b10-08df46050938
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392DD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522
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

TrapHandlerIsaProof was derived from a ROCm trap handler. Besides
setting v2, it fetches the queue doorbell (polling EXEC_LO for the
reply before GFX11), sends an SQ interrupt meant for KFD, and handles
address watch and illegal instruction traps. None of this is needed for
the SLTH tests, and the exception paths return without halting the
wave, which makes a fault spin in the trap handler. It also restores
IB_STS with the GFX9 layout on every generation.

It also treats every entry as an s_trap and skips the next instruction.
On GFX11, waves on GFX queues also enter the handler at wave start and
at wave end with no trap ID. Moving the PC there skips the first
instruction or s_endpgm, and the wave then runs into the zeros past the
shader.

Replace it with a minimal handler for the controlled SLTH test shaders.
On s_trap (trap ID != 0), it sets v2 and advances the PC. Otherwise, it
returns to the same instruction. It doesn't handle exceptions: a wave
that keeps faulting enters it again.

Before returning, it restores the state the first-level handler saved:
- GFX9: the trap ID is in ttmp1[23:16]. Restore STATUS from ttmp12, and
  restore the IB_STS replay state saved in ttmp11[31:26].
- GFX10.1: same as GFX9, but the IB_STS replay state is in
  ttmp11[31:24], with a different layout.
- GFX10.3 and GFX11: the trap ID is in ttmp1[23:16]. Restore STATUS from
  ttmp12. The first-level handler doesn't touch IB_STS.
- GFX12: the trap ID is in ttmp1[31:28]. Restore STATE_PRIV from ttmp12,
  except BARRIER_COMPLETE, as the ROCm handler does. On GFX12.0, also
  restore SCHED_MODE.DEP_MODE, which the first-level handler moved to
  ttmp1[27:26].

Write it as a macro, so that other handlers can set v2 differently.

While at it, add pseudo-code to the handler and to the SLTH shaders, and
note that the return proof shader also passes when the trap isn't
taken.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/shaders/amd_shader_store.h | 207 ++++++++++++--------------
 1 file changed, 98 insertions(+), 109 deletions(-)

diff --git a/lib/amdgpu/shaders/amd_shader_store.h b/lib/amdgpu/shaders/amd_shader_store.h
index a913237ed..a86e7bb25 100644
--- a/lib/amdgpu/shaders/amd_shader_store.h
+++ b/lib/amdgpu/shaders/amd_shader_store.h
@@ -1351,12 +1351,11 @@ static const char * const amdgpu_test_shaders[] = {
  *   Trigger an SLTH trap and verify that the trap handler
  *   modifies VGPR state visible after s_rfe_b64 returns.
  *
- * Expected:
- *   TrapHandlerIsaProof updates v2 to 42.
- *   Shader stores v2 after trap return.
- *
- * Proof:
- *   output == 42
+ * Pseudo-code:
+ *   out = s[0:1];	// output address from COMPUTE_USER_DATA_0/1
+ *   v2 = 0;
+ *   s_trap 1;		// the second-level trap handler sets v2
+ *   *out = v2;		// 42 with TrapHandlerIsaProof
  */
 static const char SlthVgprProofIsa[] =
     SHADER_START
@@ -1378,14 +1377,15 @@ static const char SlthVgprProofIsa[] =
  *   Verify that execution resumes at the instruction
  *   immediately following s_trap after trap return.
  *
- * Flow:
- *   v2 = 1
- *   s_trap 1
- *   v2 = 2
- *   store(v2)
+ * Pseudo-code:
+ *   out = s[0:1];	// output address from COMPUTE_USER_DATA_0/1
+ *   v2 = 1;
+ *   s_trap 1;
+ *   v2 = 2;		// only runs if the trap returns past s_trap
+ *   *out = v2;		// 2
  *
- * Expected:
- *   output == 2
+ * Note that the output is also 2 if the trap isn't taken at all, the VGPR
+ * proof shows that the handler ran.
  *
  * Proof:
  *   The instruction after s_trap executed successfully.
@@ -1414,107 +1414,96 @@ static const char SlthReturnProofIsa[] =
 	s_endpgm
 )";
 
-/* Shader: TrapHandlerIsaProof
- * Purpose:
- *   Validation-oriented SLTH trap handler used by
- *   SLTH proof subtests.
+/*
+ * SLTH_TRAP_HANDLER - second-level trap handler for the SLTH tests
+ * @set_v2: instructions run on s_trap, they set v2 for the shader to store
  *
- * Difference from TrapHandlerIsa:
- *   Updates VGPR v2 with a known value (42)
- *   before returning via s_rfe_b64.
+ * The kernel's first-level trap handler jumps here with the PC of the
+ * instruction that trapped in ttmp[0:1], the trap ID in the high bits of ttmp1,
+ * the saved STATUS (STATE_PRIV on GFX12) in ttmp12 and the second-level TMA in
+ * ttmp[14:15]. Only ttmp2-5 may be clobbered.
  *
- * Expected usage:
- *   SlthVgprProofIsa
- *   GFX UMQ SLTH validation
- *   Compute SLTH proof tests
+ * On s_trap (trap ID != 0), run @set_v2 and return to the next instruction.
+ * Anything else, e.g. the wave start and end traps seen on GFX11 GFX queues,
+ * returns to the same instruction.
  *
- * Proof:
- *   If userspace observes value 42 after shader
- *   completion, trap entry, handler execution,
- *   and trap return all succeeded.
+ * This is a minimal handler for the controlled SLTH test shaders: it doesn't
+ * handle exceptions, a wave that keeps faulting re-enters it.
+ *
+ * Pseudo-code:
+ *   if (trap ID in ttmp1) {		// s_trap
+ *           set_v2;
+ *           ttmp[0:1] += 4;		// return past s_trap
+ *   }
+ *   if (GFX9 || GFX10.1)
+ *           IB_STS replay state = ttmp11;	// saved by the first level
+ *   restore STATUS.EXECZ and STATUS.VCCZ;
+ *   if (GFX12) {
+ *           if (GFX12.0)
+ *                   SCHED_MODE.DEP_MODE = ttmp1[27:26];
+ *           STATE_PRIV = ttmp12, but BARRIER_COMPLETE;
+ *   } else {
+ *           ttmp1 &= 0xffff;		// drop the trap ID
+ *           STATUS = ttmp12;
+ *   }
+ *   s_rfe_b64 ttmp[0:1];
  */
-static const char TrapHandlerIsaProof[] =
-    SHADER_START
-    R"(
-	CHECK_VMFAULT:
-	/*if trap jumped to by vmfault, restore skip m0 signalling*/
-	.if (.amdgcn.gfx_generation_number < 12)
-	    s_getreg_b32 ttmp14, hwreg(HW_REG_TRAPSTS)
-	    s_and_b32 ttmp2, ttmp14, 0x800
-	.else
-	    s_getreg_b32 ttmp14, hwreg(HW_REG_EXCP_FLAG_PRIV)
-	    s_and_b32 ttmp2, ttmp14, 0x10
-	.endif
-	s_cbranch_scc1 RESTORE_AND_EXIT
-
-	.if (.amdgcn.gfx_generation_number < 12)
-	    s_and_b32 ttmp2, ttmp14, 0x7080
-	.else
-	    s_and_b32 ttmp2, ttmp14, 0xf
-	.endif
-
-	s_cbranch_scc0 GET_DOORBELL
-
-	v_mov_b32 v5, v4
-	v_mov_b32 v6, ttmp14
-
-	s_branch RESTORE_AND_EXIT
-
-	GET_DOORBELL:
+#define SLTH_TRAP_HANDLER(set_v2)					\
+	SHADER_START							\
+	"	.if .amdgcn.gfx_generation_number >= 12\n"			\
+	"	s_and_b32 ttmp2, ttmp1, 0xf0000000\n"				\
+	"	.else\n"							\
+	"	s_and_b32 ttmp2, ttmp1, 0x00ff0000\n"				\
+	"	.endif\n"							\
+	"	s_cbranch_scc0 L_EXIT\n"					\
+	set_v2								\
+	"	s_add_u32 ttmp0, ttmp0, 4\n"					\
+	"	s_addc_u32 ttmp1, ttmp1, 0\n"					\
+	"L_EXIT:\n"								\
+	/* IB_STS replay state saved and cleared by the first-level handler */ \
+	"	.if .amdgcn.gfx_generation_number == 9\n"			\
+	/* GFX9: RCNT and FIRST_REPLAY in ttmp11[31:26] */		\
+	"	s_lshr_b32 ttmp2, ttmp11, 11\n"				\
+	"	s_and_b32 ttmp2, ttmp2, 0x1f8000\n"				\
+	"	s_setreg_b32 hwreg(HW_REG_IB_STS), ttmp2\n"			\
+	"	.elseif .amdgcn.gfx_generation_number == 10 && "		\
+	".amdgcn.gfx_generation_minor == 1\n"				\
+	/* GFX10.1: RCNT and FIRST_REPLAY in [30:24], REPLAY_W64H in [31] */ \
+	"	s_lshr_b32 ttmp2, ttmp11, 9\n"				\
+	"	s_and_b32 ttmp2, ttmp2, 0x3f8000\n"				\
+	"	s_lshr_b32 ttmp3, ttmp11, 6\n"				\
+	"	s_and_b32 ttmp3, ttmp3, 0x2000000\n"				\
+	"	s_or_b32 ttmp2, ttmp2, ttmp3\n"				\
+	"	s_setreg_b32 hwreg(HW_REG_IB_STS), ttmp2\n"			\
+	"	.endif\n"							\
+	/* EXECZ and VCCZ can't be written with s_setreg */		\
+	"	s_and_b64 exec, exec, exec\n"					\
+	"	s_and_b64 vcc, vcc, vcc\n"					\
+	"	.if .amdgcn.gfx_generation_number >= 12\n"			\
+	"	.if .amdgcn.gfx_generation_minor == 0\n"			\
+	/* SCHED_MODE.DEP_MODE, moved to ttmp1[27:26] by the first level */ \
+	"	s_bfe_u32 ttmp2, ttmp1, (26 | (2 << 16))\n"			\
+	"	s_setreg_b32 hwreg(26, 0, 2), ttmp2\n"			\
+	"	.endif\n"							\
+	/* restore STATE_PRIV but BARRIER_COMPLETE (bit 2), like ROCr */	\
+	"	s_setreg_b32 hwreg(HW_REG_STATE_PRIV, 0, 2), ttmp12\n"		\
+	"	s_lshr_b32 ttmp12, ttmp12, 3\n"				\
+	"	s_setreg_b32 hwreg(HW_REG_STATE_PRIV, 3, 29), ttmp12\n"	\
+	"	.else\n"							\
+	"	s_and_b32 ttmp1, ttmp1, 0xffff\n"				\
+	"	s_setreg_b32 hwreg(HW_REG_STATUS), ttmp12\n"			\
+	"	.endif\n"							\
+	"	s_rfe_b64 ttmp[0:1]\n"
 
-	.if .amdgcn.gfx_generation_number < 11
-	    s_mov_b32 ttmp2, exec_lo
-	    s_mov_b32 ttmp3, exec_hi
-
-	    s_mov_b32 exec_lo, 0x80000000
-
-	    s_sendmsg 10
-
-	    WAIT_SENDMSG:
-	    s_nop 7
-	    s_bitcmp0_b32 exec_lo, 0x1F
-	    s_cbranch_scc0 WAIT_SENDMSG
-
-	    s_mov_b32 exec_hi, ttmp3
-	    s_and_b32 exec_lo, exec_lo, 0xfff
-	    s_mov_b32 ttmp3, exec_lo
-	    s_mov_b32 exec_lo, ttmp2
-	.else
-	    s_sendmsg_rtn_b32 ttmp3, sendmsg(MSG_RTN_GET_DOORBELL)
-	    s_waitcnt lgkmcnt(0)
-	    s_and_b32 ttmp3, ttmp3, 0x3ff
-	.endif
-
-	s_mov_b32 ttmp2, m0
-	s_or_b32 ttmp3, ttmp3, 0x800
-
-	s_mov_b32 m0, ttmp3
-	s_nop 0x0
-	s_sendmsg sendmsg(MSG_INTERRUPT)
-	s_waitcnt lgkmcnt(0)
-
-	s_mov_b32 m0, ttmp2
-
-	/* proof value */
-	v_mov_b32 v2, 42
-
-	s_add_u32 ttmp0, ttmp0, 4
-	s_addc_u32 ttmp1, ttmp1, 0
-	s_and_b32 ttmp1, ttmp1, 0xffff
-
-	RESTORE_AND_EXIT:
-
-	s_lshr_b32 ttmp2, ttmp11, (26 - 15)
-	s_and_b32 ttmp2, ttmp2, (0x8000 | 0x1F0000)
-
-	s_setreg_b32 hwreg(HW_REG_IB_STS), ttmp2
-
-	s_and_b64 exec, exec, exec
-	s_and_b64 vcc, vcc, vcc
-
-	s_setreg_b32 hwreg(HW_REG_STATUS), ttmp12
+/* Shader: TrapHandlerIsaProof
+ * Purpose:
+ *   Set v2 to 42 on s_trap, shows that the second-level trap handler ran.
+ *
+ * Pseudo-code (set_v2):
+ *   v2 = 42;
+ */
+static const char TrapHandlerIsaProof[] =
+	SLTH_TRAP_HANDLER("	v_mov_b32 v2, 42\n");
 
-	s_rfe_b64 [ttmp0, ttmp1]
-)";
 
 #endif
-- 
2.50.1

