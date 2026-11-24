Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC748606A322
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4mKcx8Wn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC1F10F34D;
	Tue, 24 Nov 2026 08:39:52 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011071.outbound.protection.outlook.com
 [40.93.194.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36DB10F2FE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nE/88/ODMCw5qeDMdSfyCFM8uxppDJe0LDw6EvBqlGmwBaPYol7mnvYFRoHZKD8VBjTF0TU7tn5xWWepxo+Go9a3RyLsXBWhENTMo5d1e2v5pYRAWRH6Xm3R6i066cTZlqfZsff2ZPDN7pDrxmfnolxhUpTGvnbzXEuoX8ChNxEUP2T+D37GVZc9kez9egMvXf6VGpGGI8OpZoNFZG5ffkQ/Uv2ND5fCFg94em+gfk0xwnpfDWkzlkJfuqjMlDV3oyr8oEPElBW62axETTVY1828BDO92hx1pkaXZMY7iIDvnVQbd2ltXf+4B3X2M/EN/fGwrRaOjQ35gg+XwDACbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPUmQgQCqOgtW8xSSceEroEUf/ytTz2KC5u06ADPUu0=;
 b=yOkr3gG54WtX73Jr5ex5Cw9i6pSLuKpOs77TAe46CqWojg9y2gasopxAw9ibs8OgRsiuFZbpXJe2Qt1yRwypsnmQBkWv41qwAWCp1kYmfzwAfX1LORwbMuNyyp6L6wvZPkoWrUc+z4/GPD12GXRY8VWSpm6phuMo/haS55XvjxV6VjiwwAxCzjnBWrfvst6WNRg48Je3YawKDkXVxMS3wXyExoLEJ9tRy8UlL7A+aE5ZsZMuZyDFhc6rCXPgwIeAwuK5HMMypEwfBEYVf/7Sx5yzTeujPUJmWVBrg1ljjavpryefZgaDqjT5/07oZ7DjWTxfgkv+QQUSFSleYxlPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPUmQgQCqOgtW8xSSceEroEUf/ytTz2KC5u06ADPUu0=;
 b=4mKcx8Wni6Yj9zYBuDNdZOMtgkDL9jnafBWUVeCx8R47x2ikGoSQGexxGKz/CFQbLPuQzQnr9I0mHqvG8gFnjO5rNrxKc+rrH1Fq64SIWNih1fc25BleRG4gsKMKlu5WPwW1jT+8zVntDUtk7bpqI5irHJv3X/9y+Q8r0b1tSys=
Received: from DS1PR06CA0001.namprd06.prod.outlook.com (2603:10b6:8:458::11)
 by SJ2PR12MB8009.namprd12.prod.outlook.com (2603:10b6:a03:4c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:28:44 +0000
Received: from DS1PEPF0005344C.namprd04.prod.outlook.com
 (2603:10b6:8:458:cafe::45) by DS1PR06CA0001.outlook.office365.com
 (2603:10b6:8:458::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Tue,
 24 Nov 2026 08:28:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0005344C.mail.protection.outlook.com (10.167.23.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:41 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:41 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:39 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 08/12] tests/amdgpu: reduce the SLTH trap handler to
 what the tests need
Date: Tue, 24 Nov 2026 16:27:38 +0800
Message-ID: <20261124082819.2089694-8-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0005344C:EE_|SJ2PR12MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: fb012da3-d2d4-4181-5315-08df4a04f3b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|6133799003|22082099003|18002099003|3023799007|11063799006|56012099006|261021121427099003|261026121527099003|261102123227099003|261026140227099003|261022105027099003|261021123027099003|261022075727099003|261009223027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: m46VoTArTUTgKHgwiYEtF5dfQ4Ec8+GFbMBtihNbsYy0KgWYkgv6NvTPTJ/fvpzSs+iOW4rU7YklgrgRXBUkEEyEOv+71WUaifcggXBjlzrM76eaENHsMk798/nNX13kIVJzLmUbMWWKrV9lpHjM3Bs6Cq83VBTAqvAaWLhVuJwtF3cctrMyijyMcri8ioSwRkne4tDR87hhQiahQlV+QqhzgQ4uuz9AcqYxLnRm2KMxg4UcbxW4iN6nuhXuedkrsdFBTjGP/TBOSZt5eotPrfCy3gWt1+KvlwKtJvvVqiqWsmIoOrvP2dmS9E8rkV0C0C/FAD2Usdyy0COOz15thbwF7H9OWIHRdpknm9Bmc7AzFym8X8Hi02bva0LO8AR4//DXF9dtNBnDkQZh/ZUbWWKXXEVynahxsS+s/YN4n4lt6fwdd3ycHE5esDo7CJhQsZyylipql2JraZWR/+WPCpZMFGFvdh3fdW2A8QuIRvnqxf15cd9Jp8TiN+UjZFfVRYQ/c0JlaIFlWZsS8NUmGZmWBPKLUFPN1r+hcLr18o0NjDjC/NU9B+vIR8GKyInfitMvw7mxQ0tE26I9TDdN1t0CLIRpU5XaWfq+Dl8dxu0j0BKKPESTkenrRO5cGfCadBDufBwvC6bFmJLcdThneUuQk0+U2VOTZNXRoGakyljqC9dpnzew9JZtCesvsSyZ8pAkSWfh15U/eVsssjRyIg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021123027099003)(261022075727099003)(261009223027099003)(261028144727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tFLmMi0kwgUZpiBRaI838SmhGGJiI3jMUSG/mV9+3Wk5zhEaImfUWlxvwHjRrarmVSQ8QMW1ko02OtTsIXYA2oYs6585JKI7whyVbubXA1+nGrHq+DCrPDrF97YqJE/ihOQ2I4xRa+0Ao4cc6HGFmjdK8fDz8hxYJLyvScSimS3INpLOBT5f/AjMAE4fcDlXowPRWvxguaVLqqqgeu+zlwXDbf95VkipAfA2wfOxZITSXY9i1sHGrkHACuDQNkTQ1QI31+wm3IQI1+UMBNWSJi2/wFZXuSthZ5xfbuPhSvF5ausGf+6wgcbfFBT/DGHgcmJseZimYuC5niZ/mC3vgPq2p80PPamK9k/IvAAwnX39f/7AmG8hefKEh1VzHYnY9Fro1YjE+Ebi5GgXixZj1JDzIs/641RA0fY8mFwTUNdTHfhmWwlCO9OZATRSL9Wx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:43.8275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb012da3-d2d4-4181-5315-08df4a04f3b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0005344C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8009
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

