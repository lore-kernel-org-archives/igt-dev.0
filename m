Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175A2606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5hQNxRUO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF34810EC52;
	Thu, 19 Nov 2026 06:28:19 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B36A10E7CF
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 06:19:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRkhImQw19InGXZtz4+P29uuQ1y7+XRLsAxfIyk3UxTumlx4lDCOGuuqDMVUDCzDSuqoA0ZCcrlJa73Km6XdF8bFVkeGaqgazy6RjXYZf8AfqyAOKppM2OH5pN+f0cTvAIDp9Q5aqbXTbswBSPdOEpLEwDROEl4I8Fh1+qDCzgNVi2y8g1QyJixcqOXTh2XT5QlgeOXp/AIKoaOAfPI+Qu6ftKsL9npR23Bxm6e0bYZgkl3+33XV3Ab+yJufS3xLCjjsdDb4shh/bVtR1YrxuILZHRUiRdDLCCZNCbsORlNQU+Rw55MIBz9SjGkjjrEAYOIDEpGZLpTQI2WA26A7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e+ZpcslnTSIHbwd4biZ8ozGBLn6GiuHd0rnBWS035g=;
 b=r/gfGBonuwpyS6+3SK44/+rtVb4goEDRG7tuBoqR3LwVaLPoNjiPtHKbV50yZRXPSUlHO3zs4tliOlqHgmFZkjf4CM77JxOvYYy2UFJ9UFVqG7CWem0z7r8v5GEOC1cI2jraeSQvp5/tqikxrwySjN+apE9W6hz3jyGM+cuvj8P1MW/euq928ZzXDqZ9bz36BaWn7vrR3Q+FQmQDwzy/HEms9OxJ1n9iRIVuS5k8QTsTB6aRhl3lmYEK0RzdzXwrqlT7RaTLaMvhnMVUlaLO31o9CPYx5b14BiSrDqYUJz5lZ6zW0DXYozz8TsSPzZ+HJ5GUkw0EtC89bX6pqIiwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e+ZpcslnTSIHbwd4biZ8ozGBLn6GiuHd0rnBWS035g=;
 b=5hQNxRUO8dWbWB0loQMu0YHYClzNW4qImXUjf3zVEOJFaiCOjk94wp5RxG7OowO8hVE2+twGugOz8tP6p5Ea33bYJZSIVUq77yRDrL7jiMCLteGC5MQybBJaZG9y0qsm80ax3s6AVH30+kM4A5qBsdg+SjEFM0W6dZXZG7s32G8=
Received: from DS7PR03CA0060.namprd03.prod.outlook.com (2603:10b6:5:3b5::35)
 by BN5PR12MB9540.namprd12.prod.outlook.com (2603:10b6:408:2a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 06:19:11 +0000
Received: from CY4PEPF000392D9.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::99) by DS7PR03CA0060.outlook.office365.com
 (2603:10b6:5:3b5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 06:19:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF000392D9.mail.protection.outlook.com (10.167.247.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 06:19:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:10 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 00:19:08 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 07/11] lib/amdgpu: program the CU mask of every SE in
 dispatches
Date: Thu, 19 Nov 2026 14:18:28 +0800
Message-ID: <20261119061847.3442210-7-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D9:EE_|BN5PR12MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b6b233-4004-4a12-16d9-08df4605069b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|3023799007|10067099003|261028144727099003|11063799006|56012099006|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: J0wYVE3PwQLbvZrenpU/glrxKmjuTvCnpULp6OMISYpi6Hu8ZwiRJneHy0/PrqK8KcucVkN2ROf9seKNKFsG4apnNhs4XQC6nAJsfLe0dDxOKZ1Bm0KqSEbmTVD1bjaNN1pu+KbP5k9ZBghUKD6QjkhdRSr2QbZjbbB1bdvSrKEXl/hjJgyAvKNyrgZeIUUxNLrNxo3HFt72FP1x563JvMimduRrVPYGOPplZTKLd5hJPmfuFFupRubxZryJKwTvG+LtF3LMuHdATWCD3iNi0WPq/Z1vdlNdW7/ugoxZmBDbc5quqFggA9vIhjQOvkLWKuzUVv8Djbq7vi3pZuK3m93w3u9OEsfbm3UdEgADeTyxMW8tpL2lkyIB5LcjdfduNMMsM5JUIShDbN/pOMtbz4YcR2AjOgqA0y2fyjHs7bfxi4WF4BD7Bq2UDREMP86Jpew2RfFvNjnJDRcb4iAAqS3kMzk3lVltrnmZ9VaJAcVcT7jNWPSfLCALEDbNfeflc0X28dng4EREWIFGdb7+B60N9o/2NKe7aBOoBLqk2I4Kyzq3pS6t/JfIm/QFIYxrIbOF6WA6gdb5YSOsMOB0mpwfGV7XkNnUQFBHCUdkMaHniBk4DjOJ75NqMPPJC44g8Fr2Srz2XPWVchkqp4MI3BcA4eMYe8NT1dW50im5ki7+Qjn7IR1DUE89FsD5HAIQhA1XxI+41NNdoR/KFcdJ6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(3023799007)(10067099003)(261028144727099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tD/X3ZmJDVMsgM3XSGK2+FU42LAq6TfYLDpHbgtlMBVw8whzZyzFNBiOwnz7v/LpMh17k5AuUQL85Mnb5LjjEzW+apEnujuN/JXMUu+ZxdN2hOJUR4ExEWhhmZb5GOt5WZ3CxWmfOxOnR9Hn1Cx2hKM/QqZA5RqNQf8Yx7GnTWJ/FKWRxmtVNVopIuIgBqqiLhjgKyEY/iB5Sa07sj0PWR6Hv173NC3iTKpbZX/rMWI4gyVDx6xhsvyudnVvREd5nRKw62ARp++H4Nm1cPbUV6blzLw1EZ0iolTdW+5ybFt8a46HgyDzSIBY/6CnztiOvht3FJ2v87CFxoPXt8U6pi8ZFiXIOoXonUIhLscbKEcNHx0FuuUeQTyeJNyrFzQ/82ixCXx+QN8Jxo8kiRwHjJAPt/pKCoxzngvJPBgxnw2fOia3wliKNB2CGJtLZc64
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:19:10.8651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b6b233-4004-4a12-16d9-08df4605069b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392D9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9540
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

amdgpu_dispatch_write_cumask() is meant to enable all CUs for the
following dispatch, but it only writes COMPUTE_STATIC_THREAD_MGMT_SE0-SE3:
on GFX12 it skips SE0 and SE1 as well, and it never writes the SE4 and
up registers that GFX9, GFX11 and GFX12 have. SE2 and SE3 are also
written with index 0 while SE0 and SE1 use index 3 on GFX10 and GFX11.

Write the register of every SE the generation has, with index 3 on
GFX10 and newer, and add amdgpu_dispatch_write_cumask_mask() for callers
which need another CU mask. amdgpu_dispatch_write_cumask() still enables
all CUs.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 .../compute_utils/amd_dispatch_helpers.c      | 111 +++++++++++++++---
 .../compute_utils/amd_dispatch_helpers.h      |   3 +
 2 files changed, 95 insertions(+), 19 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index c05198d8b..193c02005 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
@@ -71,34 +71,107 @@ amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base *base, uint32_t ve
 	return base->cdw - i;
 }
 
+/*
+ * COMPUTE_STATIC_THREAD_MGMT_SE<n>, one register per SE, as SH register
+ * offsets: the register dword address minus 0x2c00, the SH register space
+ * start used by SET_SH_REG. Bits 15:0 (SA0_CU_EN, SH0_CU_EN on GFX9) enable
+ * the CUs of the first shader array of the SE, bits 31:16 (SA1_CU_EN) those
+ * of the second one.
+ */
+static const uint32_t cumask_se_gfx9[] = {
+	0x216,	/* SE0, 0x2e16 */
+	0x217,	/* SE1, 0x2e17 */
+	0x219,	/* SE2, 0x2e19 */
+	0x21a,	/* SE3, 0x2e1a */
+	0x225,	/* SE4, 0x2e25 */
+	0x226,	/* SE5, 0x2e26 */
+	0x227,	/* SE6, 0x2e27 */
+	0x228,	/* SE7, 0x2e28 */
+};
+
+static const uint32_t cumask_se_gfx10[] = {
+	0x216,	/* SE0, 0x2e16 */
+	0x217,	/* SE1, 0x2e17 */
+	0x219,	/* SE2, 0x2e19 */
+	0x21a,	/* SE3, 0x2e1a */
+};
+
+static const uint32_t cumask_se_gfx11[] = {
+	0x216,	/* SE0, 0x2e16 */
+	0x217,	/* SE1, 0x2e17 */
+	0x219,	/* SE2, 0x2e19 */
+	0x21a,	/* SE3, 0x2e1a */
+	0x22b,	/* SE4, 0x2e2b */
+	0x22c,	/* SE5, 0x2e2c */
+	0x22d,	/* SE6, 0x2e2d */
+	0x22e,	/* SE7, 0x2e2e */
+};
+
+static const uint32_t cumask_se_gfx12[] = {
+	0x216,	/* SE0, 0x2e16 */
+	0x217,	/* SE1, 0x2e17 */
+	0x219,	/* SE2, 0x2e19 */
+	0x21a,	/* SE3, 0x2e1a */
+	0x22b,	/* SE4, 0x2e2b */
+	0x22c,	/* SE5, 0x2e2c */
+	0x22d,	/* SE6, 0x2e2d */
+	0x22e,	/* SE7, 0x2e2e */
+	0x223,	/* SE8, 0x2e23 */
+};
+
+/*
+ * Set the CU mask of the following dispatches: write cu_mask to the
+ * COMPUTE_STATIC_THREAD_MGMT_SE register of every SE the generation has.
+ */
 int
-amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base, uint32_t version)
+amdgpu_dispatch_write_cumask_mask(struct amdgpu_cmd_base *base, uint32_t version,
+				  uint32_t cu_mask)
 {
 	int offset_prev = base->cdw;
+	const uint32_t *se;
+	unsigned int i, num_se;
+
+	switch (version) {
+	case 9:
+		se = cumask_se_gfx9;
+		num_se = ARRAY_SIZE(cumask_se_gfx9);
+		break;
+	case 10:
+		se = cumask_se_gfx10;
+		num_se = ARRAY_SIZE(cumask_se_gfx10);
+		break;
+	case 11:
+		se = cumask_se_gfx11;
+		num_se = ARRAY_SIZE(cumask_se_gfx11);
+		break;
+	default:
+		se = cumask_se_gfx12;
+		num_se = ARRAY_SIZE(cumask_se_gfx12);
+		break;
+	}
 
-	if (version == 9) {
-	/*  Issue commands to set cu mask used in current dispatch */
-	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
-		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
-		base->emit(base, 0x216);
-		base->emit(base, 0xffffffff);
-		base->emit(base, 0xffffffff);
-	} else if ((version == 10) || (version == 11)) {
-		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
-		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
-		base->emit(base, 0x30000216);
-		base->emit(base, 0xffffffff);
-		base->emit(base, 0xffffffff);
+	for (i = 0; i < num_se; i++) {
+		if (version == 9) {
+			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+			base->emit(base, se[i]);
+		} else {
+			/* index 3: the CP ANDs the mask with the queue CU mask */
+			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 1));
+			base->emit(base, (3u << 28) | se[i]);
+		}
+		base->emit(base, cu_mask);
 	}
-	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
-	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
-	base->emit(base, 0x219);
-	base->emit(base, 0xffffffff);
-	base->emit(base, 0xffffffff);
 
 	return base->cdw - offset_prev;
 }
 
+/* Enable all CUs for the following dispatches */
+int
+amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base, uint32_t version)
+{
+	return amdgpu_dispatch_write_cumask_mask(base, version, 0xffffffff);
+}
+
 /*
  * The fence the kernel emits after a job on a kernel queue waits for the
  * dispatched waves and writes the caches back. A user queue only signals its
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
index e1c6e37f4..98466e0c8 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
@@ -33,6 +33,9 @@ int amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base *base_cmd, uin
 
 int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
 
+int amdgpu_dispatch_write_cumask_mask(struct amdgpu_cmd_base *base_cmd, uint32_t version,
+				      uint32_t cu_mask);
+
 int amdgpu_dispatch_write_sync(struct amdgpu_cmd_base *base_cmd, uint32_t version);
 
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
-- 
2.50.1

