Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F9606A322
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HZHTSQXb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AA410F304;
	Tue, 24 Nov 2026 08:29:55 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B19010F2FE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbKdqivRMpm754jiYN7SpjQapDxQnvLX4UQVVpJvhRZWQZKAPhcleU6ZqrxVfzXY77lDpOSKEe+Rp+teL12yGVbqCUUcGMCeKAdR/4YweEEP6PDeJJosspNOIhChMRiTKQjeB+jUvW6JWLOWWIT0+xkbPHQu4X0yKPfwZixP9jEH8L6xjnDTIrjD8lJUxPlvtubqRpU0ddPQeCxKg1aQZSe+p6h1xA0NIe+edn7nxhudwa+jAWbUHISZYMAzcmdstirCDuqgCCqqv2eJLdiM2MdkM2ZyJkx3FMXK0KsOaCGfoCK5FDky70Lc1twRnQn0YliSLeiZDn85xtFqUeCgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9R61OOUsf5jaVoK4JHYl6bNA7EuYem0r+RtVADK3SYY=;
 b=nXqKqpZ/uWaKQJguhPOYG1PSBnvJfNnEgaHGZ9stqiZgyE3BvYcyEV7qtNeofKZGY5YOmMwj56SLnW3TOl/1i7X5nkkly6B5fsF7locb+w0oFp//awdTZeItKM+fpDSb6XSYcXeEvUqaGsBZSccAzqCwD2e/ApQchYt0roB7RYbCaxOg+8IzcyDHHD0Ez1Vt7inrh9BIFKoK+O2vmq9oUn8M1LqTFfl5FhiUvyFUfn11Zd/tyENyejSdnwI+O0rLxb4H5Qym2+kI2w27uzfc8ydyWmI85+612sp1jQInGc6zbmfwKeaF5wHSZeMP8UrpwxGV6y/b6HWn5PqM9PtjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9R61OOUsf5jaVoK4JHYl6bNA7EuYem0r+RtVADK3SYY=;
 b=HZHTSQXbTrb2eBgaMZwgNSjKfHeFqfZA6KGdUAq0R08Bsjd/U2LJX4fqGHOrM0mq7rI1tuEEmQ54FOqlspNXCJbDHx5Vr1tYgZAUY7fmV8ByOtitpA9n1ecma6Us6wvWg2xXsoVEr3vE83JqoZeTyDX3YNZTAgOn4uKi/7CS1IM=
Received: from CH0PR03CA0380.namprd03.prod.outlook.com (2603:10b6:610:119::8)
 by DS8PR12MB899436.namprd12.prod.outlook.com (2603:10b6:8:446::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:28:27 +0000
Received: from CH2PEPF000166BC.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::1c) by CH0PR03CA0380.outlook.office365.com
 (2603:10b6:610:119::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:28:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166BC.mail.protection.outlook.com (10.167.252.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:23 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:20 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Felix Kuehling <felix.kuehling@amd.com>, "Lancelot
 Six" <lancelot.six@amd.com>, James Zhu <james.zhu@amd.com>, Samuel Pitoiset
 <hakzsam@gmail.com>, Natalie Vock <natalie.vock@gmx.de>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 01/12] tests/amdgpu: Add SLTH validation tests for
 trap handling and trap return.
Date: Tue, 24 Nov 2026 16:27:31 +0800
Message-ID: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BC:EE_|DS8PR12MB899436:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9ee692-b402-4aa6-8fa0-08df4a04e9eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|261026121527099003|261021123027099003|10067099003|261026140227099003|11063799006|261021135927099003|261026135527099003|56012099006|261102123227099003|260925021911599003|260925021311599003|260925022911599003|261021121427099003|261022115727099003|261022075727099003|261009223027099003|261021133027099003|261022113327099003|261022105027099003|261026130827099003|261028144727099003|261021130227099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 2mYx9qKVBkGpS9s3XP3ElxcXophk05t+KWFrRE8+vPCz+p/8V0Ufu1cx454TS56v3SUaV4wWf/UsGY5mQPZ9ha6wyG1NM7bKYKfE7Oh1LMqKWxAJ9qZGIE4yuBU93YadXxt6+iDrSzbInZahUZDipW+tVkaQLbs0IbC/6IX//swTOoo9ZLF09dwhI7KX3EcN3k6/yzy2hN+JKMjjfQ/HUrNE1R4mrxZHUo8osB30K5h2mBGaPGtHoaw6bjZQz2Ne8u+2BecrwIQhXk+pOLoYst9uwcUSWDFglfGdBMtRbWb0+KZTTf8A0E/nGI6GA5JM/HzCwMpBFyBy5jbOdLOc6JWL1Qze3A+EQAze+aNXDbrH4aLFauOkwNOtEIphOG1JlXBBpjph5eviVkdVPCCxs72/EpGQxTQ2l9lD4l+UdIegqZHbe4wYh06T1wAxGJRzoFq38DIN3b1hKNDR5iK4Ylfu5kuthHKjWQtePkVDN3bhfqF+Ca3dPOESiRPPZniUtlqdlENWOnlHGwHSpD+aQRc4r2z1RaJ2gNcySJaBLPmM4xyOdINEVcduU8zN2iyv5L1Jp39tPZrYrBEY0HqWxHB7lzVX9ipcDH1CSy4IfQgLJuNrTP6EA56cuGkAgrSOzkG6FMyn70wlbdwXDepWpATi48Pd4y0kLuPriz5bob9NcXWT3dfQ/5++b3DaZhkR9zqcrdC3bgUsIE8CQkQv+Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(261026121527099003)(261021123027099003)(10067099003)(261026140227099003)(11063799006)(261021135927099003)(261026135527099003)(56012099006)(261102123227099003)(260925021911599003)(260925021311599003)(260925022911599003)(261021121427099003)(261022115727099003)(261022075727099003)(261009223027099003)(261021133027099003)(261022113327099003)(261022105027099003)(261026130827099003)(261028144727099003)(261021130227099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W3ncwWrjFLsv5DoUcM0vZ66hwduBAJTSaOmARIFXzuwXPNDJ5MBWqio4xi+dt/uRyhYZc3jahDT1vZGknJgi5a5rWdkDRnIF6dGQpEUnxRE6V32ZoGfGF6bpsdV6bbN6ls81fIoRSDa3NE/ANgmfElGxJdzAA5JaM35UrBZiPcXAzPl9hdNSezzbIoGB/oUOyrTgVp1EFTdszUs2PEqqw4CNzhpwwfd506sW5Nl2nHAzVFl4uw9cVMHCP37oWUqgeIPGrqFD8Tt3B7WkPxTAGDoMfEfR6S2aMlgAzgVS1rVOpUHIKNqm/tmIqcseDpDei+7myIZXTMrHe1JFaBn2H+IWdbM7hPSMe9sUK2NVPnJsrTao7SeXwMTvrfke1zqZlMaJ8t/rFe+vMfe6psv3COO0BgSPgPdQAlN4dMIeI7irPmB1nGRPFgKPLv6hJfap
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:27.4470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9ee692-b402-4aa6-8fa0-08df4a04e9eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166BC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB899436
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

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

SLTH (second-level trap handler) allows a shader to trigger a trap,
execute a trap handler, return from the trap, and continue shader
execution.

This patch adds validation tests to verify that each step
of this flow works correctly.

slth-gfx-kq-vgpr-proof

  Runs a graphics workload using a kernel queue.
  The shader triggers an SLTH trap.
  The trap handler changes a VGPR value from 0 to 42.
  After returning from the trap, the shader stores the
  VGPR value to memory.
  The test verifies that the final value is 42.
  This confirms that the trap handler executed and that
  the updated VGPR value remained visible after trap
  return.

slth-gfx-umq-vgpr-proof

  Runs the same VGPR proof test using a graphics user
  queue.
  The shader triggers a trap and the trap handler updates
  a VGPR value.
  After trap return, the shader stores the value to
  memory.
  The test verifies that the final value is 42.
  This confirms correct SLTH behaviour through the UMQ
  execution path.

slth-comp-kq-vgpr-proof

  Runs the VGPR proof test on a compute kernel queue.
  The shader triggers a trap and the trap handler updates
  a VGPR value.
  The shader then resumes execution and stores the value
  to memory.
  The test verifies that the stored value is 42.
  This confirms successful trap entry, trap handler
  execution and trap return for compute workloads.

slth-comp-kq-returnproof

  Runs a compute workload that initializes a register to
  1 and then triggers a trap.
  After returning from the trap, the next instruction
  changes the register value to 2.
  The shader stores the final value to memory.
  The test verifies that the stored value is 2.
  This confirms that execution resumed at the instruction
  immediately following s_trap after s_rfe_b64.

Together, these tests verify trap entry, trap handler
execution, trap return, VGPR state preservation across
trap return, and correct resumption of shader execution.

v4: Spell out SLTH (Lijo). 
    Put the tests in their own amd_slth test instead
    of amd_basic, skip them without the LLVM assembler (Jesse)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Lancelot Six <lancelot.six@amd.com>
Cc: James Zhu <james.zhu@amd.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Samuel Pitoiset <hakzsam@gmail.com>
Cc: Natalie Vock <natalie.vock@gmx.de>
Cc: Timur Kristóf <timur.kristof@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h         |   18 +-
 lib/amdgpu/shaders/amd_shader_store.h |  190 +++
 tests/amdgpu/amd_slth.c               | 1647 +++++++++++++++++++++++++
 tests/amdgpu/meson.build              |    1 +
 4 files changed, 1854 insertions(+), 2 deletions(-)
 create mode 100644 tests/amdgpu/amd_slth.c

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 29009f6aa..832903e2e 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -603,10 +603,24 @@ struct drm_amdgpu_userq_wait {
 #define AMDGPU_VM_OP_RESERVE_VMID	1
 #define AMDGPU_VM_OP_UNRESERVE_VMID	2
 
+#define AMDGPU_VM_OP_SET_L2_TRAP     3
+#define AMDGPU_VM_OP_CLEAR_L2_TRAP   4
+
 struct drm_amdgpu_vm_in {
 	/** AMDGPU_VM_OP_* */
-	__u32	op;
-	__u32	flags;
+	__u32 op;
+	__u32 flags;
+
+	union {
+		struct {
+			__u64 tba_va;
+			__u64 tma_va;
+			__u32 tba_sz;
+			__u32 tma_sz;
+		} l2trap;
+
+		__u64 reserved[4];
+	};
 };
 
 struct drm_amdgpu_vm_out {
diff --git a/lib/amdgpu/shaders/amd_shader_store.h b/lib/amdgpu/shaders/amd_shader_store.h
index 6d04e79d0..a913237ed 100644
--- a/lib/amdgpu/shaders/amd_shader_store.h
+++ b/lib/amdgpu/shaders/amd_shader_store.h
@@ -1327,4 +1327,194 @@ static const char * const amdgpu_test_shaders[] = {
         NULL
 };
 
+/******************************************************************************
+ * SLTH Validation Shaders
+ *
+ * These shaders are used by SLTH IGT validation tests to verify:
+ *
+ *   - SET_L2_TRAP / CLEAR_L2_TRAP UAPI
+ *   - Trap entry
+ *   - Trap handler execution
+ *   - s_rfe_b64 trap return
+ *   - VGPR state modification
+ *   - Post-trap execution
+ *   - KQ execution path
+ *   - UMQ execution path
+ *
+ * The shaders below are specific to SLTH validation and are
+ * not part of the generic AMD shader test collection above.
+ *
+ *****************************************************************************/
+
+/* Shader: SlthVgprProofIsa
+ * Purpose:
+ *   Trigger an SLTH trap and verify that the trap handler
+ *   modifies VGPR state visible after s_rfe_b64 returns.
+ *
+ * Expected:
+ *   TrapHandlerIsaProof updates v2 to 42.
+ *   Shader stores v2 after trap return.
+ *
+ * Proof:
+ *   output == 42
+ */
+static const char SlthVgprProofIsa[] =
+    SHADER_START
+    R"(
+	v_mov_b32 v0, s0
+	v_mov_b32 v1, s1
+
+	v_mov_b32 v2, 0
+
+	s_trap 1
+
+	flat_store_dword v[0:1], v2
+
+	s_endpgm
+)";
+
+/* Shader: SlthReturnProofIsa
+ * Purpose:
+ *   Verify that execution resumes at the instruction
+ *   immediately following s_trap after trap return.
+ *
+ * Flow:
+ *   v2 = 1
+ *   s_trap 1
+ *   v2 = 2
+ *   store(v2)
+ *
+ * Expected:
+ *   output == 2
+ *
+ * Proof:
+ *   The instruction after s_trap executed successfully.
+ *
+ * Validates:
+ *   - Trap entry
+ *   - Trap handler execution
+ *   - Trap return
+ *   - Program counter restoration
+ *   - Post-return instruction execution
+ */
+static const char SlthReturnProofIsa[] =
+    SHADER_START
+    R"(
+	v_mov_b32 v0, s0
+	v_mov_b32 v1, s1
+
+	v_mov_b32 v2, 1
+
+	s_trap 1
+
+	v_mov_b32 v2, 2
+
+	flat_store_dword v[0:1], v2
+
+	s_endpgm
+)";
+
+/* Shader: TrapHandlerIsaProof
+ * Purpose:
+ *   Validation-oriented SLTH trap handler used by
+ *   SLTH proof subtests.
+ *
+ * Difference from TrapHandlerIsa:
+ *   Updates VGPR v2 with a known value (42)
+ *   before returning via s_rfe_b64.
+ *
+ * Expected usage:
+ *   SlthVgprProofIsa
+ *   GFX UMQ SLTH validation
+ *   Compute SLTH proof tests
+ *
+ * Proof:
+ *   If userspace observes value 42 after shader
+ *   completion, trap entry, handler execution,
+ *   and trap return all succeeded.
+ */
+static const char TrapHandlerIsaProof[] =
+    SHADER_START
+    R"(
+	CHECK_VMFAULT:
+	/*if trap jumped to by vmfault, restore skip m0 signalling*/
+	.if (.amdgcn.gfx_generation_number < 12)
+	    s_getreg_b32 ttmp14, hwreg(HW_REG_TRAPSTS)
+	    s_and_b32 ttmp2, ttmp14, 0x800
+	.else
+	    s_getreg_b32 ttmp14, hwreg(HW_REG_EXCP_FLAG_PRIV)
+	    s_and_b32 ttmp2, ttmp14, 0x10
+	.endif
+	s_cbranch_scc1 RESTORE_AND_EXIT
+
+	.if (.amdgcn.gfx_generation_number < 12)
+	    s_and_b32 ttmp2, ttmp14, 0x7080
+	.else
+	    s_and_b32 ttmp2, ttmp14, 0xf
+	.endif
+
+	s_cbranch_scc0 GET_DOORBELL
+
+	v_mov_b32 v5, v4
+	v_mov_b32 v6, ttmp14
+
+	s_branch RESTORE_AND_EXIT
+
+	GET_DOORBELL:
+
+	.if .amdgcn.gfx_generation_number < 11
+	    s_mov_b32 ttmp2, exec_lo
+	    s_mov_b32 ttmp3, exec_hi
+
+	    s_mov_b32 exec_lo, 0x80000000
+
+	    s_sendmsg 10
+
+	    WAIT_SENDMSG:
+	    s_nop 7
+	    s_bitcmp0_b32 exec_lo, 0x1F
+	    s_cbranch_scc0 WAIT_SENDMSG
+
+	    s_mov_b32 exec_hi, ttmp3
+	    s_and_b32 exec_lo, exec_lo, 0xfff
+	    s_mov_b32 ttmp3, exec_lo
+	    s_mov_b32 exec_lo, ttmp2
+	.else
+	    s_sendmsg_rtn_b32 ttmp3, sendmsg(MSG_RTN_GET_DOORBELL)
+	    s_waitcnt lgkmcnt(0)
+	    s_and_b32 ttmp3, ttmp3, 0x3ff
+	.endif
+
+	s_mov_b32 ttmp2, m0
+	s_or_b32 ttmp3, ttmp3, 0x800
+
+	s_mov_b32 m0, ttmp3
+	s_nop 0x0
+	s_sendmsg sendmsg(MSG_INTERRUPT)
+	s_waitcnt lgkmcnt(0)
+
+	s_mov_b32 m0, ttmp2
+
+	/* proof value */
+	v_mov_b32 v2, 42
+
+	s_add_u32 ttmp0, ttmp0, 4
+	s_addc_u32 ttmp1, ttmp1, 0
+	s_and_b32 ttmp1, ttmp1, 0xffff
+
+	RESTORE_AND_EXIT:
+
+	s_lshr_b32 ttmp2, ttmp11, (26 - 15)
+	s_and_b32 ttmp2, ttmp2, (0x8000 | 0x1F0000)
+
+	s_setreg_b32 hwreg(HW_REG_IB_STS), ttmp2
+
+	s_and_b64 exec, exec, exec
+	s_and_b64 vcc, vcc, vcc
+
+	s_setreg_b32 hwreg(HW_REG_STATUS), ttmp12
+
+	s_rfe_b64 [ttmp0, ttmp1]
+)";
+
 #endif
diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
new file mode 100644
index 000000000..4c70ef055
--- /dev/null
+++ b/tests/amdgpu/amd_slth.c
@@ -0,0 +1,1647 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+/*
+ * Second-level trap handler (SLTH) tests.
+ *
+ * Install a second-level trap handler for the GPUVM, run a shader which
+ * executes s_trap on GFX and compute kernel and user queues, and check that
+ * the handler ran and that the shader resumed after the trap.
+ */
+
+#include "ioctl_wrappers.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h"
+#include "lib/amdgpu/amd_utils.h"
+#include "lib/amdgpu/amd_platform.h"
+#include "lib/amdgpu/shaders/amd_shader_store.h"
+#ifdef AMDGPU_LLVM_ENABLED
+#include "lib/amdgpu/shaders/amd_llvm_asm.h"
+#else
+#include "lib/amdgpu/shaders/amd_llvm_asm_stub.h"
+#endif
+
+#define TBA_SIZE (2 * 4096)
+#define TMA_SIZE (4096)
+
+struct slth_bufs {
+	amdgpu_bo_handle tba_bo;
+	amdgpu_bo_handle tma_bo;
+
+	amdgpu_va_handle tba_va_handle;
+	amdgpu_va_handle tma_va_handle;
+
+	uint64_t tba_mc_addr;
+	uint64_t tma_mc_addr;
+
+	void *tba_cpu;
+	void *tma_cpu;
+};
+
+static void slth_alloc_buffers(amdgpu_device_handle device,
+			       struct slth_bufs *bufs)
+{
+	int r;
+
+	memset(bufs, 0, sizeof(*bufs));
+
+	r = amdgpu_bo_alloc_and_map(
+			device,
+			TBA_SIZE,
+			4096,
+			AMDGPU_GEM_DOMAIN_GTT,
+			AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
+			&bufs->tba_bo,
+			&bufs->tba_cpu,
+			&bufs->tba_mc_addr,
+			&bufs->tba_va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(
+			device,
+			TMA_SIZE,
+			4096,
+			AMDGPU_GEM_DOMAIN_GTT,
+			AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
+			&bufs->tma_bo,
+			&bufs->tma_cpu,
+			&bufs->tma_mc_addr,
+			&bufs->tma_va_handle);
+	igt_assert_eq(r, 0);
+}
+
+static void slth_free_buffers(struct slth_bufs *bufs)
+{
+	if (bufs->tba_bo)
+		amdgpu_bo_unmap_and_free(bufs->tba_bo,
+					 bufs->tba_va_handle,
+				bufs->tba_mc_addr,
+				TBA_SIZE);
+
+	if (bufs->tma_bo)
+		amdgpu_bo_unmap_and_free(bufs->tma_bo,
+					 bufs->tma_va_handle,
+				bufs->tma_mc_addr,
+				TMA_SIZE);
+}
+
+static int vm_set_l2_trap(int fd,
+			  uint64_t tba_va,
+		uint64_t tma_va)
+{
+	union drm_amdgpu_vm args = {0};
+
+	args.in.op = AMDGPU_VM_OP_SET_L2_TRAP;
+
+	args.in.l2trap.tba_va = tba_va;
+	args.in.l2trap.tba_sz = TBA_SIZE;
+
+	args.in.l2trap.tma_va = tma_va;
+	args.in.l2trap.tma_sz = TMA_SIZE;
+
+	return drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &args);
+}
+
+static int vm_clear_l2_trap(int fd)
+{
+	union drm_amdgpu_vm args = {0};
+
+	args.in.op = AMDGPU_VM_OP_CLEAR_L2_TRAP;
+
+	return drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &args);
+}
+
+static void slth_prepare_tba_with_handler(
+		amdgpu_device_handle device,
+		struct slth_bufs *bufs,
+		const char *handler)
+{
+	struct amdgpu_gpu_info info = {0};
+	char mcpu[32] = {};
+	uint8_t isa_bin[8192];
+	size_t isa_sz = 0;
+	int r;
+
+	r = amdgpu_query_gpu_info(device, &info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_family_id_to_mcpu(info.family_id,
+				     mcpu,
+			sizeof(mcpu));
+	igt_assert_eq(r, 0);
+
+	igt_info("family_id=%u mcpu=%s\n",
+		 info.family_id,
+			mcpu);
+
+	r = amdgpu_llvm_assemble(mcpu,
+				 handler,
+			isa_bin,
+			sizeof(isa_bin),
+			&isa_sz);
+
+	if (r)
+		igt_info("amdgpu_llvm_assemble failed r=%d\n", r);
+
+	igt_assert_eq(r, 0);
+	igt_assert(isa_sz > 0);
+
+	memset(bufs->tba_cpu, 0, TBA_SIZE);
+	memcpy(bufs->tba_cpu,
+	       isa_bin,
+			isa_sz);
+
+	memset(bufs->tma_cpu, 0, TMA_SIZE);
+
+	igt_info("Trap handler size=%zu\n", isa_sz);
+}
+
+static void slth_prepare_vgpr_proof_shader(amdgpu_device_handle device,
+					   uint8_t *isa_bin,
+		size_t *isa_sz)
+{
+	struct amdgpu_gpu_info info = {0};
+	char mcpu[32] = {};
+	int r;
+
+	r = amdgpu_query_gpu_info(device, &info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_family_id_to_mcpu(info.family_id,
+				     mcpu,
+			sizeof(mcpu));
+	igt_assert_eq(r, 0);
+
+	igt_info("===== SLTH VGPR PROOF SHADER BEGIN =====\n");
+	igt_info("%s\n", SlthVgprProofIsa);
+	igt_info("SLTH VGPR PROOF ISA DUMP\n");
+
+	r = amdgpu_llvm_assemble(mcpu,
+				 SlthVgprProofIsa,
+			isa_bin,
+			8192,
+			isa_sz);
+
+	igt_info("amdgpu_llvm_assemble returned %d\n", r);
+
+	if (r) {
+		igt_info("===== SHADER SOURCE BEGIN =====\n");
+		igt_info("%s\n", SlthVgprProofIsa);
+		igt_info("===== SHADER SOURCE END =====\n");
+	}
+
+	igt_assert_eq(r, 0);
+	igt_assert(*isa_sz > 0);
+
+	igt_info("SlthVgprProofIsa size=%zu\n", *isa_sz);
+
+	igt_info("SLTH VGPR PROOF ISA DUMP\n");
+
+	for (unsigned int i = 0; i < (*isa_sz / sizeof(uint32_t)); i++) {
+		igt_info("ISA[%u] = 0x%08x\n",
+			 i,
+				((uint32_t *)isa_bin)[i]);
+	}
+}
+
+static uint32_t execute_slth_dispatch(
+		amdgpu_device_handle device,
+		uint32_t ip_type,
+		uint32_t version,
+		const uint32_t *shader,
+		uint32_t shader_size)
+{
+	const struct amdgpu_ip_block_version *gfx_ip =
+		get_ip_block(device, AMD_IP_GFX);
+
+	amdgpu_context_handle context_handle;
+
+	amdgpu_bo_handle bo = NULL;
+	amdgpu_va_handle va = 0;
+
+	void *cpu = NULL;
+	uint32_t *ptr_pm4 = NULL;
+	volatile uint32_t *ptr_output = NULL;
+
+	uint64_t mc = 0;
+	uint64_t shader_mc_addr;
+	uint64_t output_mc_addr;
+
+	struct amdgpu_cmd_base *base_cmd;
+	struct amdgpu_cs_request ib_req = {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
+	struct amdgpu_cs_fence fence = {0};
+
+	amdgpu_bo_list_handle bo_list = NULL;
+
+	amdgpu_bo_handle bos[1];
+
+	uint32_t expired = 0;
+	uint32_t output_value;
+	int r;
+
+	base_cmd = get_cmd_base();
+	igt_assert(base_cmd);
+
+	r = amdgpu_cs_ctx_create(device, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device,
+				    65536,
+			4096,
+			AMDGPU_GEM_DOMAIN_GTT,
+			0,
+			&bo,
+			&cpu,
+			&mc,
+			&va);
+	igt_assert_eq(r, 0);
+
+	memset(cpu, 0, 65536);
+
+	ptr_pm4 = (uint32_t *)cpu;
+
+	memcpy((uint8_t *)cpu + 0x1000,
+	       shader,
+			shader_size);
+
+	ptr_output =
+		(volatile uint32_t *)((uint8_t *)cpu + 0x2000);
+
+	memset((void *)ptr_output, 0, 4096);
+
+	shader_mc_addr = mc + 0x1000;
+	output_mc_addr = mc + 0x2000;
+
+	igt_info("s0 expected address low  = 0x%08x\n",
+		 lower_32_bits(output_mc_addr));
+
+	igt_info("s1 expected address high = 0x%08x\n",
+		 upper_32_bits(output_mc_addr));
+
+	igt_info("========================================\n");
+	igt_info("SLTH DISPATCH START\n");
+	igt_info("========================================\n");
+
+	igt_info("ip_type        = %u\n", ip_type);
+	igt_info("version        = %u\n", version);
+
+	igt_info("base_mc_addr   = 0x%016llx\n",
+		 (unsigned long long)mc);
+
+	igt_info("shader_mc_addr = 0x%016llx\n",
+		 (unsigned long long)shader_mc_addr);
+
+	igt_info("output_mc_addr = 0x%016llx\n",
+		 (unsigned long long)output_mc_addr);
+
+	igt_info("shader_end     = 0x%016llx\n",
+		 (unsigned long long)
+			(shader_mc_addr + shader_size));
+
+	igt_info("output_end     = 0x%016llx\n",
+		 (unsigned long long)
+			(output_mc_addr + 16384));
+
+	base_cmd->attach_buf(base_cmd,
+			ptr_pm4,
+			4096);
+
+	igt_assert(gfx_ip);
+	igt_assert(gfx_ip->funcs);
+	igt_assert(gfx_ip->funcs->gfx_program_compute);
+	igt_assert(gfx_ip->funcs->gfx_dispatch_direct);
+
+	igt_info("========================================\n");
+	igt_info("NATIVE GFX PROGRAMMING\n");
+	igt_info("========================================\n");
+
+	igt_info("user_data[0] = 0x%08x\n",
+		 lower_32_bits(output_mc_addr));
+
+	igt_info("user_data[1] = 0x%08x\n",
+		 upper_32_bits(output_mc_addr));
+
+	gfx_ip->funcs->gfx_program_compute(
+			gfx_ip->funcs,
+			base_cmd,
+			shader_mc_addr,
+			output_mc_addr,
+			0x002c0040,
+			0x00000010,
+			1,
+			1,
+			1);
+
+	igt_info("PM4 dwords after gfx_program_compute = %u\n",
+		 base_cmd->cdw);
+
+	gfx_ip->funcs->gfx_dispatch_direct(
+			gfx_ip->funcs,
+			base_cmd,
+			1,
+			1,
+			1,
+			0);
+
+	base_cmd->emit_aligned(base_cmd,
+			7,
+			GFX_COMPUTE_NOP);
+
+	igt_info("PM4 dwords after dispatch = %u\n",
+		 base_cmd->cdw);
+
+	bos[0] = bo;
+
+	r = amdgpu_bo_list_create(device,
+				  1,
+			bos,
+			NULL,
+			&bo_list);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc;
+	ib_info.size = base_cmd->cdw;
+
+	ib_req.ip_type = ip_type;
+	ib_req.ring = 0;
+	ib_req.resources = bo_list;
+	ib_req.number_of_ibs = 1;
+	ib_req.ibs = &ib_info;
+
+	igt_info("========================================\n");
+	igt_info("PRE-DISPATCH OUTPUT BUFFER\n");
+	igt_info("========================================\n");
+
+	for (int i = 0; i < 16; i++) {
+		igt_info("PRE[%d] = 0x%08x\n",
+			 i,
+				ptr_output[i]);
+	}
+
+	igt_info("========================================\n");
+	igt_info("IB SUBMIT\n");
+	igt_info("========================================\n");
+
+	igt_info("ib_mc_address = 0x%016llx\n",
+		 (unsigned long long)ib_info.ib_mc_address);
+
+	igt_info("ib_size_dw    = %u\n",
+		 ib_info.size);
+
+	r = amdgpu_cs_submit(context_handle,
+			     0,
+			&ib_req,
+			1);
+
+	igt_info("cs_submit ret = %d\n", r);
+
+	igt_assert_eq(r, 0);
+
+	fence.context = context_handle;
+	fence.ip_type = ip_type;
+	fence.ip_instance = 0;
+	fence.ring = 0;
+	fence.fence = ib_req.seq_no;
+
+	r = amdgpu_cs_query_fence_status(&fence,
+					 5000000000ULL,
+			0,
+			&expired);
+
+	igt_info("========================================\n");
+	igt_info("FENCE STATUS\n");
+	igt_info("========================================\n");
+
+	igt_info("query ret = %d\n", r);
+	igt_info("expired   = %u\n", expired);
+
+	igt_assert_eq(r, 0);
+	igt_assert_eq(expired, 1);
+
+	output_value = ptr_output[0];
+
+	igt_info("========================================\n");
+	igt_info("OUTPUT BUFFER DUMP\n");
+	igt_info("========================================\n");
+
+	for (int i = 0; i < 16; i++) {
+		igt_info("OUT[%d] = 0x%08x\n",
+			 i,
+				ptr_output[i]);
+	}
+
+	igt_info("========================================\n");
+	igt_info("RESULT\n");
+	igt_info("========================================\n");
+
+	igt_info("output value = 0x%x (%u)\n",
+		 output_value,
+			output_value);
+
+	if (bo_list)
+		amdgpu_bo_list_destroy(bo_list);
+
+	amdgpu_bo_unmap_and_free(bo,
+				 va,
+			mc,
+			65536);
+
+	amdgpu_cs_ctx_free(context_handle);
+
+	free_cmd_base(base_cmd);
+
+	igt_info("SLTH DISPATCH END\n");
+
+	return output_value;
+}
+
+static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
+					int fd)
+{
+	struct slth_bufs bufs;
+	uint8_t isa_bin[8192];
+	size_t isa_sz = 0;
+
+	struct amdgpu_gpu_info info = {0};
+	uint32_t version = 12;
+	uint32_t value;
+
+	int ret;
+	int r;
+
+	memset(&bufs, 0, sizeof(bufs));
+
+	igt_info("SLTH GFX KQ VGPR PROOF\n");
+
+	slth_alloc_buffers(device, &bufs);
+
+	slth_prepare_tba_with_handler(device,
+				      &bufs,
+			TrapHandlerIsaProof);
+
+	ret = vm_set_l2_trap(fd,
+			     bufs.tba_mc_addr,
+			bufs.tma_mc_addr);
+	igt_assert_eq(ret, 0);
+
+	slth_prepare_vgpr_proof_shader(device,
+				       isa_bin,
+			&isa_sz);
+
+	r = amdgpu_query_gpu_info(device, &info);
+	igt_assert_eq(r, 0);
+
+	if (FAMILY_IS_GFX1200(info.family_id))
+		version = 12;
+	else if (FAMILY_IS_GFX1150(info.family_id) ||
+		 FAMILY_IS_GFX1100(info.family_id) ||
+			FAMILY_IS_GFX1036(info.family_id) ||
+			FAMILY_IS_GFX1037(info.family_id) ||
+			FAMILY_IS_YC(info.family_id) ||
+			info.family_id == FAMILY_GFX1103)
+		version = 11;
+	else
+		version = 10;
+
+	igt_info("Running SLTH VGPR proof shader\n");
+
+	value = execute_slth_dispatch(device,
+				      AMDGPU_HW_IP_GFX,
+			version,
+			(const uint32_t *)isa_bin,
+			(uint32_t)isa_sz);
+
+	igt_info("VGPR proof output value=%u\n", value);
+
+	if (value == 42)
+		igt_info("SLTH trap handler updated VGPR state, shader resumed successfully\n");
+	else
+		igt_info("SLTH GFX KQ VGPR proof failed: expected=42 actual=%u\n",
+			 value);
+
+	igt_assert_eq(value, 42);
+
+	ret = vm_clear_l2_trap(fd);
+	igt_assert_eq(ret, 0);
+
+	slth_free_buffers(&bufs);
+
+	igt_info("SLTH GFX KQ VGPR PROOF COMPLETE\n");
+}
+
+static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
+					 int fd)
+{
+	const struct amdgpu_ip_block_version *gfx_ip =
+		get_ip_block(device, AMD_IP_GFX);
+
+	struct amdgpu_ring_context *ring_context;
+
+	amdgpu_bo_handle bo = NULL;
+	amdgpu_va_handle va = 0;
+
+	void *cpu = NULL;
+	uint32_t *ptr_pm4 = NULL;
+	volatile uint32_t *ptr_output = NULL;
+
+	uint64_t mc = 0;
+	uint64_t shader_mc_addr;
+	uint64_t output_mc_addr;
+
+	struct amdgpu_cmd_base *base_cmd;
+
+	uint8_t isa_bin[8192];
+	size_t isa_sz = 0;
+
+	const uint32_t *shader;
+	uint32_t size_bytes;
+
+	struct slth_bufs bufs;
+
+	int r;
+
+	memset(&bufs, 0, sizeof(bufs));
+
+	igt_assert(gfx_ip);
+	igt_assert(gfx_ip->funcs);
+
+	igt_info("SLTH GFX UMQ VGPR PROOF\n");
+
+	slth_alloc_buffers(device, &bufs);
+
+	igt_info("TBA=0x%016llx\n",
+		 (unsigned long long)bufs.tba_mc_addr);
+
+	igt_info("TMA=0x%016llx\n",
+		 (unsigned long long)bufs.tma_mc_addr);
+
+	slth_prepare_tba_with_handler(device,
+				      &bufs,
+			TrapHandlerIsaProof);
+
+	igt_info("TrapHandlerIsaProof loaded into TBA\n");
+
+	r = vm_set_l2_trap(fd,
+			   bufs.tba_mc_addr,
+			bufs.tma_mc_addr);
+
+	igt_info("SET_L2_TRAP ret=%d\n", r);
+
+	igt_assert_eq(r, 0);
+
+	slth_prepare_vgpr_proof_shader(device,
+				       isa_bin,
+			&isa_sz);
+
+	shader = (const uint32_t *)isa_bin;
+	size_bytes = (uint32_t)isa_sz;
+
+	igt_assert(shader);
+	igt_assert(size_bytes > 0);
+
+	igt_info("SlthVgprProofIsa size=%u\n",
+		 size_bytes);
+
+	igt_info("shader=%p size=%u\n",
+		 shader,
+			size_bytes);
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	gfx_ip->funcs->userq_create(device,
+			ring_context,
+			gfx_ip->type);
+
+	igt_info("UMQ queue created\n");
+
+	igt_info("timeline=%u point=%llu\n",
+		 ring_context->timeline_syncobj_handle,
+			(unsigned long long)ring_context->point);
+
+	base_cmd = get_cmd_base();
+	igt_assert(base_cmd);
+
+	r = amdgpu_bo_alloc_and_map_sync(
+			device,
+			65536,
+			4096,
+			AMDGPU_GEM_DOMAIN_GTT,
+			AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+			AMDGPU_VM_MTYPE_UC,
+			&bo,
+			&cpu,
+			&mc,
+			&va,
+			ring_context->timeline_syncobj_handle,
+			++ring_context->point,
+			true);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_timeline_syncobj_wait(
+			device,
+			ring_context->timeline_syncobj_handle,
+			ring_context->point);
+	igt_assert_eq(r, 0);
+
+	memset(cpu, 0, 65536);
+
+	ptr_pm4 = (uint32_t *)cpu;
+
+	memcpy((uint8_t *)cpu + 0x1000,
+	       shader,
+			size_bytes);
+
+	ptr_output =
+		(volatile uint32_t *)((uint8_t *)cpu + 0x2000);
+
+	memset((void *)ptr_output, 0, 4096);
+
+	shader_mc_addr = mc + 0x1000;
+	output_mc_addr = mc + 0x2000;
+
+	igt_info("shader_mc_addr = 0x%016llx\n",
+		 (unsigned long long)shader_mc_addr);
+
+	igt_info("output_mc_addr = 0x%016llx\n",
+		 (unsigned long long)output_mc_addr);
+
+	base_cmd->attach_buf(base_cmd,
+			ptr_pm4,
+			4096);
+
+	gfx_ip->funcs->gfx_program_compute(
+			gfx_ip->funcs,
+			base_cmd,
+			shader_mc_addr,
+			output_mc_addr,
+			0x002c0040,
+			0x00000010,
+			1,
+			1,
+			1);
+
+	igt_info("PM4 dwords after gfx_program_compute = %u\n",
+		 base_cmd->cdw);
+
+	gfx_ip->funcs->gfx_dispatch_direct(
+			gfx_ip->funcs,
+			base_cmd,
+			1,
+			1,
+			1,
+			0);
+
+	base_cmd->emit_aligned(base_cmd,
+			7,
+			GFX_COMPUTE_NOP);
+
+	igt_info("PM4 dwords after dispatch = %u\n",
+		 base_cmd->cdw);
+
+	ring_context->pm4_dw = base_cmd->cdw;
+
+	igt_info("UMQ pm4_dw=%u\n",
+		 ring_context->pm4_dw);
+
+	igt_info("IB gpu addr=0x%016llx\n",
+		 (unsigned long long)mc);
+
+	igt_info("Submitting REAL UMQ dispatch\n");
+
+	igt_info("=== PM4 DUMP BEGIN ===\n");
+
+	for (int i = 0; i < base_cmd->cdw; i++) {
+		igt_info("PM4[%02d] = 0x%08x\n",
+			 i,
+				ptr_pm4[i]);
+	}
+
+	igt_info("=== PM4 DUMP END ===\n");
+
+	igt_info("before submit point=%llu\n",
+		 (unsigned long long)ring_context->point);
+
+	igt_info("pre-submit wptr=%llu rptr=%llu\n",
+		 (unsigned long long)*ring_context->wptr_cpu,
+			(unsigned long long)*ring_context->rptr_cpu);
+
+	igt_info("IB first 16 DWs:\n");
+
+	for (int i = 0; i < 16 && i < ring_context->pm4_dw; i++)
+		igt_info("IB[%d]=0x%08x\n", i, ptr_pm4[i]);
+
+	gfx_ip->funcs->userq_submit(device,
+			ring_context,
+			gfx_ip->type,
+			mc);
+
+	igt_info("Returned from userq_submit()\n");
+
+	igt_info("post-submit wptr=%llu rptr=%llu\n",
+		 (unsigned long long)*ring_context->wptr_cpu,
+			(unsigned long long)*ring_context->rptr_cpu);
+
+	usleep(100000);
+
+	igt_info("100ms later wptr=%llu rptr=%llu\n",
+		 (unsigned long long)*ring_context->wptr_cpu,
+			(unsigned long long)*ring_context->rptr_cpu);
+
+	igt_info("after submit point=%llu\n",
+		 (unsigned long long)ring_context->point);
+
+	igt_info("timeline=%u point=%llu\n",
+		 ring_context->timeline_syncobj_handle,
+			(unsigned long long)ring_context->point);
+
+	r = amdgpu_timeline_syncobj_wait(
+			device,
+			ring_context->timeline_syncobj_handle,
+			ring_context->point);
+
+	igt_info("timeline wait ret=%d\n", r);
+
+	igt_info("pm4_dw=%u\n",
+		 ring_context->pm4_dw);
+
+	for (int i = 0; i < 1000; i++) {
+		if (ptr_output[0])
+			break;
+
+		usleep(1000);
+	}
+
+	igt_info("final output=0x%x\n",
+		 ptr_output[0]);
+
+	igt_info("Post-dispatch output dump\n");
+
+	for (int i = 0; i < 16; i++) {
+		igt_info("OUT[%d] = 0x%08x\n",
+			 i,
+				ptr_output[i]);
+	}
+
+	igt_info("output_value=%u (0x%x)\n",
+		 ptr_output[0],
+			ptr_output[0]);
+
+	igt_info("VGPR proof output=%u\n",
+		 ptr_output[0]);
+
+	igt_assert_eq(ptr_output[0], 42);
+
+	igt_info("SLTH GFX UMQ VGPR PROOF COMPLETE\n");
+
+	amdgpu_bo_unmap_and_free(bo,
+				 va,
+			mc,
+			65536);
+
+	free_cmd_base(base_cmd);
+
+	gfx_ip->funcs->userq_destroy(device,
+			ring_context,
+			gfx_ip->type);
+
+	r = vm_clear_l2_trap(fd);
+
+	igt_info("CLEAR_L2_TRAP ret=%d\n", r);
+
+	igt_assert_eq(r, 0);
+
+	slth_free_buffers(&bufs);
+
+	free(ring_context);
+
+	igt_info("UMQ queue destroyed\n");
+}
+
+static void
+slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
+			     int fd)
+{
+	struct slth_bufs bufs;
+
+	amdgpu_context_handle context_handle;
+
+	amdgpu_bo_handle bo_dst;
+	amdgpu_bo_handle bo_shader;
+	amdgpu_bo_handle bo_cmd;
+
+	amdgpu_bo_handle resources[3];
+
+	volatile uint32_t *ptr_dst;
+
+	void *ptr_shader;
+	uint32_t *ptr_cmd;
+
+	uint64_t mc_address_dst;
+	uint64_t mc_address_shader;
+	uint64_t mc_address_cmd;
+
+	amdgpu_va_handle va_dst;
+	amdgpu_va_handle va_shader;
+	amdgpu_va_handle va_cmd;
+
+	amdgpu_bo_list_handle bo_list;
+
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
+	struct amdgpu_cs_fence fence_status = {0};
+
+	struct amdgpu_cmd_base *base_cmd =
+		get_cmd_base();
+
+	uint32_t expired = 0;
+	uint32_t version = 12;
+
+	uint8_t isa_bin[8192];
+	size_t isa_sz = 0;
+
+	int bo_dst_size = 16384;
+	int bo_shader_size = 4096;
+	int bo_cmd_size = 4096;
+
+	int i;
+	int r;
+	int ret;
+
+	igt_assert(base_cmd);
+
+	memset(&bufs, 0, sizeof(bufs));
+
+	igt_info("========================================\n");
+	igt_info("COMP KQ VGPR PROOF\n");
+	igt_info("SLTH VGPR PROOF\n");
+	igt_info("========================================\n");
+
+	slth_alloc_buffers(device, &bufs);
+
+	slth_prepare_tba_with_handler(device,
+				      &bufs,
+			TrapHandlerIsaProof);
+
+	ret = vm_set_l2_trap(fd,
+			     bufs.tba_mc_addr,
+			bufs.tma_mc_addr);
+
+	igt_info("SET_L2_TRAP ret=%d\n", ret);
+	igt_assert_eq(ret, 0);
+
+	slth_prepare_vgpr_proof_shader(device,
+				       isa_bin,
+			&isa_sz);
+
+	igt_assert(isa_sz > 0);
+
+	igt_info("SlthVgprProofIsa size=%zu\n",
+		 isa_sz);
+
+	igt_info("===== SLTH VGPR PROOF ISA BEGIN =====\n");
+
+	for (i = 0; i < isa_sz / 4; i++) {
+		igt_info("ISA[%02d] = 0x%08x\n",
+			 i,
+				((uint32_t *)isa_bin)[i]);
+	}
+
+	igt_info("===== SLTH VGPR PROOF ISA END =====\n");
+
+	r = amdgpu_cs_ctx_create(device,
+				 &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device,
+				    bo_cmd_size,
+			4096,
+			AMDGPU_GEM_DOMAIN_GTT,
+			0,
+			&bo_cmd,
+			(void **)&ptr_cmd,
+			&mc_address_cmd,
+			&va_cmd);
+	igt_assert_eq(r, 0);
+
+	memset(ptr_cmd, 0, bo_cmd_size);
+
+	base_cmd->attach_buf(base_cmd,
+			ptr_cmd,
+			bo_cmd_size);
+
+	r = amdgpu_bo_alloc_and_map(device,
+				    bo_shader_size,
+			4096,
+			AMDGPU_GEM_DOMAIN_VRAM,
+			0,
+			&bo_shader,
+			&ptr_shader,
+			&mc_address_shader,
+			&va_shader);
+	igt_assert_eq(r, 0);
+
+	memset(ptr_shader, 0, bo_shader_size);
+
+	memcpy(ptr_shader,
+	       isa_bin,
+			isa_sz);
+
+	igt_info("shader_mc_addr=0x%016llx\n",
+		 (unsigned long long)mc_address_shader);
+
+	r = amdgpu_bo_alloc_and_map(device,
+				    bo_dst_size,
+			4096,
+			AMDGPU_GEM_DOMAIN_VRAM,
+			0,
+			&bo_dst,
+			(void **)&ptr_dst,
+			&mc_address_dst,
+			&va_dst);
+	igt_assert_eq(r, 0);
+
+	memset((void *)ptr_dst,
+	       0,
+			bo_dst_size);
+
+	igt_info("output_mc_addr=0x%016llx\n",
+		 (unsigned long long)mc_address_dst);
+
+	igt_info("output_lo=0x%08x\n",
+		 lower_32_bits(mc_address_dst));
+
+	igt_info("output_hi=0x%08x\n",
+		 upper_32_bits(mc_address_dst));
+
+	amdgpu_dispatch_init(
+			AMDGPU_HW_IP_COMPUTE,
+			base_cmd,
+			version);
+
+	amdgpu_dispatch_write_cumask(
+			base_cmd,
+			version);
+
+	igt_info("shader_mc_addr=0x%016llx\n",
+		 (unsigned long long)mc_address_shader);
+
+	igt_info("output_mc_addr=0x%016llx\n",
+		 (unsigned long long)mc_address_dst);
+
+	amdgpu_dispatch_write2hw(
+			base_cmd,
+			mc_address_shader,
+			version,
+			0);
+
+	igt_info("cdw after write2hw = %u\n",
+		 base_cmd->cdw);
+
+	for (uint32_t j = 0; j < base_cmd->cdw; j++)
+		igt_info("PRE_USERDATA_PM4[%02u] = 0x%08x\n",
+			 j,
+				ptr_cmd[j]);
+
+	igt_info("========================================\n");
+	igt_info("COMPUTE USER DATA PROGRAMMING\n");
+	igt_info("========================================\n");
+
+	igt_info("mc_address_dst      = 0x%016llx\n",
+		 (unsigned long long)mc_address_dst);
+
+	igt_info("dst low dword       = 0x%08x\n",
+		 (uint32_t)mc_address_dst);
+
+	igt_info("dst high dword      = 0x%08x\n",
+		 (uint32_t)(mc_address_dst >> 32));
+
+	igt_info("SET_SH_REG base     = 0x240\n");
+
+	base_cmd->emit(base_cmd,
+			PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+
+	base_cmd->emit(base_cmd, 0x240);
+
+	/*
+	 * s0:s1 = source address
+	 */
+	base_cmd->emit(base_cmd,
+			(uint32_t)mc_address_dst);
+
+	base_cmd->emit(base_cmd,
+			(uint32_t)(mc_address_dst >> 32));
+
+	/*
+	 * s2:s3 = destination address
+	 */
+	base_cmd->emit(base_cmd,
+			(uint32_t)mc_address_dst);
+
+	base_cmd->emit(base_cmd,
+			(uint32_t)(mc_address_dst >> 32));
+	igt_info("USER_DATA[0] (s0 low)  = 0x%08x\n",
+		 (uint32_t)mc_address_dst);
+
+	igt_info("USER_DATA[1] (s1 high) = 0x%08x\n",
+		 (uint32_t)(mc_address_dst >> 32));
+
+	igt_info("USER_DATA[2] (s2 low)  = 0x%08x\n",
+		 (uint32_t)mc_address_dst);
+
+	igt_info("USER_DATA[3] (s3 high) = 0x%08x\n",
+		 (uint32_t)(mc_address_dst >> 32));
+
+	base_cmd->emit(base_cmd,
+			PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+
+	base_cmd->emit(base_cmd, 0x215);
+	base_cmd->emit(base_cmd, 0);
+
+	base_cmd->emit(base_cmd,
+			PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,
+					3));
+
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+
+	base_cmd->emit_aligned(base_cmd,
+			7,
+			GFX_COMPUTE_NOP);
+
+	igt_info("Dispatch PM4 DW=%u\n",
+		 base_cmd->cdw);
+
+	igt_info("========================================\n");
+	igt_info("FINAL PM4 DUMP\n");
+	igt_info("========================================\n");
+
+	for (uint32_t j = 0; j < base_cmd->cdw; j++)
+		igt_info("PM4[%02u] = 0x%08x\n",
+			 j,
+				ptr_cmd[j]);
+
+	resources[0] = bo_dst;
+	resources[1] = bo_shader;
+	resources[2] = bo_cmd;
+
+	r = amdgpu_bo_list_create(device,
+				  3,
+			resources,
+			NULL,
+			&bo_list);
+
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc_address_cmd;
+	ib_info.size = base_cmd->cdw;
+
+	ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
+	ibs_request.ring = 0;
+	ibs_request.resources = bo_list;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+
+	r = amdgpu_cs_submit(context_handle,
+			     0,
+			&ibs_request,
+			1);
+
+	igt_info("cs_submit ret=%d\n", r);
+	igt_assert_eq(r, 0);
+
+	fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
+	fence_status.ip_instance = 0;
+	fence_status.ring = 0;
+	fence_status.context = context_handle;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(
+			&fence_status,
+			AMDGPU_TIMEOUT_INFINITE,
+			0,
+			&expired);
+
+	igt_info("fence ret=%d expired=%u\n",
+		 r,
+			expired);
+
+	igt_assert_eq(r, 0);
+	igt_assert_eq(expired, 1);
+
+	igt_info("===== OUTPUT DUMP =====\n");
+
+	for (i = 0; i < 32; i++) {
+		igt_info("OUT[%02d]=0x%08x\n",
+			 i,
+				ptr_dst[i]);
+	}
+
+	igt_info("output[0]=0x%x (%u)\n",
+		 ptr_dst[0],
+			ptr_dst[0]);
+
+	igt_assert_eq(ptr_dst[0], 42);
+
+	ret = vm_clear_l2_trap(fd);
+
+	igt_info("CLEAR_L2_TRAP ret=%d\n", ret);
+	igt_assert_eq(ret, 0);
+
+	slth_free_buffers(&bufs);
+
+	amdgpu_bo_list_destroy(bo_list);
+
+	amdgpu_bo_unmap_and_free(
+			bo_dst,
+			va_dst,
+			mc_address_dst,
+			bo_dst_size);
+
+	amdgpu_bo_unmap_and_free(
+			bo_shader,
+			va_shader,
+			mc_address_shader,
+			bo_shader_size);
+
+	amdgpu_bo_unmap_and_free(
+			bo_cmd,
+			va_cmd,
+			mc_address_cmd,
+			bo_cmd_size);
+
+	amdgpu_cs_ctx_free(context_handle);
+
+	free_cmd_base(base_cmd);
+
+	igt_info("COMP KQ VGPR PROOF COMPLETE\n");
+}
+
+static void
+slth_prepare_returnproof_shader(amdgpu_device_handle device,
+				uint8_t *isa_bin,
+		size_t *isa_sz)
+{
+	struct amdgpu_gpu_info info = {0};
+	char mcpu[32] = {};
+	int r;
+
+	r = amdgpu_query_gpu_info(device, &info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_family_id_to_mcpu(info.family_id,
+				     mcpu,
+			sizeof(mcpu));
+	igt_assert_eq(r, 0);
+
+	igt_info("===== RETURNPROOF SHADER SOURCE BEGIN =====\n");
+	igt_info("%s\n", SlthReturnProofIsa);
+	igt_info("===== RETURNPROOF SHADER SOURCE END =====\n");
+
+	r = amdgpu_llvm_assemble(mcpu,
+				 SlthReturnProofIsa,
+			isa_bin,
+			8192,
+			isa_sz);
+
+	igt_info("amdgpu_llvm_assemble returned %d\n", r);
+
+	if (r) {
+		igt_info("===== SHADER SOURCE BEGIN =====\n");
+		igt_info("%s\n", SlthReturnProofIsa);
+		igt_info("===== SHADER SOURCE END =====\n");
+	}
+
+	igt_assert_eq(r, 0);
+	igt_assert(*isa_sz > 0);
+
+	igt_info("SlthReturnProofIsa size=%zu\n",
+		 *isa_sz);
+
+	igt_info("RETURNPROOF SHADER ISA DUMP\n");
+
+	for (unsigned int i = 0;
+			i < (*isa_sz / sizeof(uint32_t));
+			i++) {
+		igt_info("ISA[%u] = 0x%08x\n",
+			 i,
+				((uint32_t *)isa_bin)[i]);
+	}
+}
+
+static void
+slth_comp_kq_returnproof_test(amdgpu_device_handle device,
+			      int fd)
+{
+	struct slth_bufs bufs;
+
+	amdgpu_context_handle context_handle;
+
+	amdgpu_bo_handle bo_dst;
+	amdgpu_bo_handle bo_shader;
+	amdgpu_bo_handle bo_cmd;
+
+	amdgpu_bo_handle resources[3];
+
+	volatile uint32_t *ptr_dst;
+
+	void *ptr_shader;
+	uint32_t *ptr_cmd;
+
+	uint64_t mc_address_dst;
+	uint64_t mc_address_shader;
+	uint64_t mc_address_cmd;
+
+	amdgpu_va_handle va_dst;
+	amdgpu_va_handle va_shader;
+	amdgpu_va_handle va_cmd;
+
+	amdgpu_bo_list_handle bo_list;
+
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
+	struct amdgpu_cs_fence fence_status = {0};
+
+	struct amdgpu_cmd_base *base_cmd =
+		get_cmd_base();
+
+	uint32_t expired = 0;
+	uint32_t version = 12;
+
+	uint8_t isa_bin[8192];
+	size_t isa_sz = 0;
+
+	int bo_dst_size = 16384;
+	int bo_shader_size = 4096;
+	int bo_cmd_size = 4096;
+
+	int i;
+	int r;
+	int ret;
+
+	igt_assert(base_cmd);
+
+	memset(&bufs, 0, sizeof(bufs));
+
+	igt_info("========================================\n");
+	igt_info("COMP KQ RETURNPROOF\n");
+	igt_info("SLTH RETURNPROOF\n");
+	igt_info("========================================\n");
+
+	slth_alloc_buffers(device, &bufs);
+
+	slth_prepare_tba_with_handler(device,
+				      &bufs,
+			TrapHandlerIsaProof);
+
+	ret = vm_set_l2_trap(fd,
+			     bufs.tba_mc_addr,
+			bufs.tma_mc_addr);
+
+	igt_info("SET_L2_TRAP ret=%d\n", ret);
+	igt_assert_eq(ret, 0);
+
+	slth_prepare_returnproof_shader(device,
+					isa_bin,
+			&isa_sz);
+	igt_assert(isa_sz > 0);
+
+	igt_info("SlthReturnProofIsa size=%zu\n", isa_sz);
+
+	igt_info("===== RETURNPROOF ISA BEGIN =====\n");
+
+	for (i = 0; i < isa_sz / 4; i++) {
+		igt_info("ISA[%02d] = 0x%08x\n",
+			 i,
+				((uint32_t *)isa_bin)[i]);
+	}
+
+	igt_info("===== RETURNPROOF ISA END =====\n");
+
+	r = amdgpu_cs_ctx_create(device,
+				 &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device,
+				    bo_cmd_size,
+			4096,
+			AMDGPU_GEM_DOMAIN_GTT,
+			0,
+			&bo_cmd,
+			(void **)&ptr_cmd,
+			&mc_address_cmd,
+			&va_cmd);
+	igt_assert_eq(r, 0);
+
+	memset(ptr_cmd, 0, bo_cmd_size);
+
+	base_cmd->attach_buf(base_cmd,
+			ptr_cmd,
+			bo_cmd_size);
+
+	r = amdgpu_bo_alloc_and_map(device,
+				    bo_shader_size,
+			4096,
+			AMDGPU_GEM_DOMAIN_VRAM,
+			0,
+			&bo_shader,
+			&ptr_shader,
+			&mc_address_shader,
+			&va_shader);
+	igt_assert_eq(r, 0);
+
+	memset(ptr_shader, 0, bo_shader_size);
+
+	memcpy(ptr_shader,
+	       isa_bin,
+			isa_sz);
+
+	igt_info("shader_mc_addr=0x%016llx\n",
+		 (unsigned long long)mc_address_shader);
+
+	r = amdgpu_bo_alloc_and_map(device,
+				    bo_dst_size,
+			4096,
+			AMDGPU_GEM_DOMAIN_VRAM,
+			0,
+			&bo_dst,
+			(void **)&ptr_dst,
+			&mc_address_dst,
+			&va_dst);
+	igt_assert_eq(r, 0);
+
+	memset((void *)ptr_dst,
+	       0,
+			bo_dst_size);
+
+	igt_info("output_mc_addr=0x%016llx\n",
+		 (unsigned long long)mc_address_dst);
+
+	igt_info("output_lo=0x%08x\n",
+		 lower_32_bits(mc_address_dst));
+
+	igt_info("output_hi=0x%08x\n",
+		 upper_32_bits(mc_address_dst));
+
+	amdgpu_dispatch_init(
+			AMDGPU_HW_IP_COMPUTE,
+			base_cmd,
+			version);
+
+	amdgpu_dispatch_write_cumask(
+			base_cmd,
+			version);
+
+	igt_info("shader_mc_addr=0x%016llx\n",
+		 (unsigned long long)mc_address_shader);
+
+	igt_info("output_mc_addr=0x%016llx\n",
+		 (unsigned long long)mc_address_dst);
+
+	amdgpu_dispatch_write2hw(
+			base_cmd,
+			mc_address_shader,
+			version,
+			0);
+
+	igt_info("cdw after write2hw = %u\n",
+		 base_cmd->cdw);
+
+	for (uint32_t j = 0; j < base_cmd->cdw; j++)
+		igt_info("PRE_USERDATA_PM4[%02u] = 0x%08x\n",
+			 j,
+				ptr_cmd[j]);
+
+	igt_info("========================================\n");
+	igt_info("COMPUTE USER DATA PROGRAMMING\n");
+	igt_info("========================================\n");
+
+	igt_info("mc_address_dst      = 0x%016llx\n",
+		 (unsigned long long)mc_address_dst);
+
+	igt_info("dst low dword       = 0x%08x\n",
+		 (uint32_t)mc_address_dst);
+
+	igt_info("dst high dword      = 0x%08x\n",
+		 (uint32_t)(mc_address_dst >> 32));
+
+	igt_info("SET_SH_REG base     = 0x240\n");
+
+	base_cmd->emit(base_cmd,
+			PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+
+	base_cmd->emit(base_cmd, 0x240);
+
+	/*
+	 * s0:s1 = source address
+	 */
+	base_cmd->emit(base_cmd,
+			(uint32_t)mc_address_dst);
+
+	base_cmd->emit(base_cmd,
+			(uint32_t)(mc_address_dst >> 32));
+
+	/*
+	 * s2:s3 = destination address
+	 */
+	base_cmd->emit(base_cmd,
+			(uint32_t)mc_address_dst);
+
+	base_cmd->emit(base_cmd,
+			(uint32_t)(mc_address_dst >> 32));
+	igt_info("USER_DATA[0] (s0 low)  = 0x%08x\n",
+		 (uint32_t)mc_address_dst);
+
+	igt_info("USER_DATA[1] (s1 high) = 0x%08x\n",
+		 (uint32_t)(mc_address_dst >> 32));
+
+	igt_info("USER_DATA[2] (s2 low)  = 0x%08x\n",
+		 (uint32_t)mc_address_dst);
+
+	igt_info("USER_DATA[3] (s3 high) = 0x%08x\n",
+		 (uint32_t)(mc_address_dst >> 32));
+
+	base_cmd->emit(base_cmd,
+			PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+
+	base_cmd->emit(base_cmd, 0x215);
+	base_cmd->emit(base_cmd, 0);
+
+	base_cmd->emit(base_cmd,
+			PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,
+					3));
+
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+
+	base_cmd->emit_aligned(base_cmd,
+			7,
+			GFX_COMPUTE_NOP);
+
+	igt_info("Dispatch PM4 DW=%u\n",
+		 base_cmd->cdw);
+
+	igt_info("========================================\n");
+	igt_info("FINAL PM4 DUMP\n");
+	igt_info("========================================\n");
+
+	for (uint32_t j = 0; j < base_cmd->cdw; j++)
+		igt_info("PM4[%02u] = 0x%08x\n",
+			 j,
+				ptr_cmd[j]);
+
+	resources[0] = bo_dst;
+	resources[1] = bo_shader;
+	resources[2] = bo_cmd;
+
+	r = amdgpu_bo_list_create(device,
+				  3,
+			resources,
+			NULL,
+			&bo_list);
+
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = mc_address_cmd;
+	ib_info.size = base_cmd->cdw;
+
+	ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
+	ibs_request.ring = 0;
+	ibs_request.resources = bo_list;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+
+	r = amdgpu_cs_submit(context_handle,
+			     0,
+			&ibs_request,
+			1);
+
+	igt_info("cs_submit ret=%d\n", r);
+	igt_assert_eq(r, 0);
+
+	fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
+	fence_status.ip_instance = 0;
+	fence_status.ring = 0;
+	fence_status.context = context_handle;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(
+			&fence_status,
+			AMDGPU_TIMEOUT_INFINITE,
+			0,
+			&expired);
+
+	igt_info("fence ret=%d expired=%u\n",
+		 r,
+			expired);
+
+	igt_assert_eq(r, 0);
+	igt_assert_eq(expired, 1);
+
+	igt_info("===== OUTPUT DUMP =====\n");
+
+	for (i = 0; i < 32; i++) {
+		igt_info("OUT[%02d]=0x%08x\n",
+			 i,
+				ptr_dst[i]);
+	}
+
+	igt_info("output[0]=0x%x (%u)\n",
+		 ptr_dst[0],
+			ptr_dst[0]);
+
+	igt_assert_eq(ptr_dst[0], 2);
+
+	ret = vm_clear_l2_trap(fd);
+
+	igt_info("CLEAR_L2_TRAP ret=%d\n", ret);
+	igt_assert_eq(ret, 0);
+
+	slth_free_buffers(&bufs);
+
+	amdgpu_bo_list_destroy(bo_list);
+
+	amdgpu_bo_unmap_and_free(
+			bo_dst,
+			va_dst,
+			mc_address_dst,
+			bo_dst_size);
+
+	amdgpu_bo_unmap_and_free(
+			bo_shader,
+			va_shader,
+			mc_address_shader,
+			bo_shader_size);
+
+	amdgpu_bo_unmap_and_free(
+			bo_cmd,
+			va_cmd,
+			mc_address_cmd,
+			bo_cmd_size);
+
+	amdgpu_cs_ctx_free(context_handle);
+
+	free_cmd_base(base_cmd);
+
+	igt_info("COMP KQ RETURNPROOF COMPLETE\n");
+}
+
+int igt_main()
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	int fd = -1;
+	int r;
+
+	igt_fixture() {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(r, 0);
+		asic_userq_readiness(device, userq_arr_cap);
+		amd_platform_filter_init(&gpu_info);
+
+		/* The shaders are assembled at runtime */
+		igt_require_f(amdgpu_llvm_asm_init() == 0,
+			      "LLVM assembler unavailable\n");
+	}
+
+	igt_subtest("slth-gfx-kq-vgpr-proof")
+		slth_gfx_kq_vgpr_proof_test(device, fd);
+
+	igt_subtest("slth-gfx-umq-vgpr-proof")
+		slth_gfx_umq_vgpr_proof_test(device, fd);
+
+	igt_subtest("slth-comp-kq-vgpr-proof")
+		slth_comp_kq_vgpr_proof_test(device, fd);
+
+	igt_subtest("slth-comp-kq-returnproof")
+		slth_comp_kq_returnproof_test(device, fd);
+
+	igt_fixture() {
+		amdgpu_llvm_asm_shutdown();
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 11e5c00da..784879d14 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -57,6 +57,7 @@ if libdrm_amdgpu.found()
 			  'amd_userptr_invalidation',
 			  'amd_close_race',
 			  'amd_mes_reset',
+			  'amd_slth',
 			]
 	if libdrm_amdgpu.version().version_compare('> 2.4.97')
 		amdgpu_progs +=[ 'amd_syncobj', ]
-- 
2.50.1

