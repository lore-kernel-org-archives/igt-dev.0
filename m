Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4077C606A68E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2+wbSC0W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A7310F30C;
	Tue, 24 Nov 2026 08:33:16 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010051.outbound.protection.outlook.com
 [40.93.198.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7575E10F2F3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS0CVn9N3180xzzk0DNMorcZwU+XkcHHqHft+jdfmoFEtQ+fYqxn5VATuzJz026Z14RlHGPmlU8Tb/LN2GQSmZJsQp2EXEvzqvOHQDKMfZAl3QFJHvYJPQUQBEWRj0TTasydDlYMD+pp5KJtubZ2cAc7ML0RXW1BN6mS0cGlv7ccdCdIahFrrhSi+XppOBmKU6WnDOl3VOIAOGyJAmMM77m3X3UFhgqEyXnyMKXY7fFGBptHvI95d66GzoeTfU8tIk94sQPYJtkl8bQBp2gArSIO+HgaDpXptP+Idjhuqy71j+4dUJsSghHBRfixvNuDNcgcSJbLsgUHv0++on43aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e+ZpcslnTSIHbwd4biZ8ozGBLn6GiuHd0rnBWS035g=;
 b=mS7k9tH63YVgjx8Lrl0XLtROjGYfYCDFte077i7OxgGtwCuFS1xPmj/IFIe2sxsIm5ALevw7NxfUoKxI03GILXMiHdOda10KmkpvBIWUHIaLbmTl7xY5lUyeuV8ATQk2qwvGj2FfQZFlXJAT0o5isAsfHBVV/ixISdDrnEVk/8IBy+S9n5O4p8X2yin3JBIDEmjlqZ8fNCEo4Xz1jmwdueB4dN/ux3JmQlrlh/VxQM4re0gQS8G1/j2O1Sj3Ml4U4lOjkGWD1EBcvDOBh+hoiPlS/ocCgY/b85BdqJNeNggkI/EeCs27EvxXP88a/SdM/wEQBc2EHnzr9I+DmhVrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e+ZpcslnTSIHbwd4biZ8ozGBLn6GiuHd0rnBWS035g=;
 b=2+wbSC0W4nJa9/mbq+BLnGAIOtl71OQvtIdCsKLy62DW/A+BI1niQypviVf2g7/WdfmtnwF7KwU1bTJ5z5xuk4AxYqU/hUI+KCmk0cUZzY31fneRUu+uhwbvjaV7H0MwVJ/WVP6jsQ1becoIbybQSUCTLn0+t4BTBSGeOkCyoEc=
Received: from CY8PR22CA0013.namprd22.prod.outlook.com (2603:10b6:930:45::21)
 by CH2PR12MB4072.namprd12.prod.outlook.com (2603:10b6:610:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 24 Nov
 2026 08:28:39 +0000
Received: from PH2PEPF00048917.namprd05.prod.outlook.com
 (2603:10b6:930:45:cafe::67) by CY8PR22CA0013.outlook.office365.com
 (2603:10b6:930:45::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:28:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH2PEPF00048917.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:36 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:36 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:34 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 06/12] lib/amdgpu: program the CU mask of every SE in
 dispatches
Date: Tue, 24 Nov 2026 16:27:36 +0800
Message-ID: <20261124082819.2089694-6-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048917:EE_|CH2PR12MB4072:EE_
X-MS-Office365-Filtering-Correlation-Id: c9336d06-a973-4991-9e1c-08df4a04f0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|6133799003|22082099003|3023799007|261026140227099003|56012099006|261021121427099003|11063799006|261009223027099003|10067099003|261102123227099003|261021123027099003|261028144727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: ZA43b71qbScVY8OnUMArRRTQhVkcquLkq25101OGu8kh4mS9oHNvGdnnfsULe/OJv7QvONdLvNYi+OBR7m5dFXP5rRsxoTe/RS1ynCC3JgkPU8Z+rxPT62jXMuKPYCuX+lhORyaA/RC+CxaSbPMTOlEJohqworsGo7fzw7tB9JU/u47jeYlNvvPPLGD0pfU3o2hPcdmXm+nerJ70dhUJcCxbQxtRCmTuP7EhzRzj+JoeDPfYzXhaCTojayhDe8qQgkpie0ha+tZP2nl8GvhqErW4gqgPd3/m2UqQQ8kphaAUd8ieOr9sDn1N9PXvAb8nQjQ6edFq4rxhllmOAoFzdWzc+7kmxllJ/po8kV243HFoisq7JTlhhUapvK3PffO8rA5BULzLKloBkbJUm3FoIvmp/vHezjOGdyTHTHw4blSXdWxMgo3EdG2k1DzFayFho9C5mSfFm7Y3m1D8bomA6fgx1z1wAHhFFkOx/ulcayLSpn3U0dtiZzXZSx+xxgLKOvBdbLklZ/NVBzQS9JSM64IaDiRMVlXvbZXQstJ41ECeK8C1BwPafY1Y8gdTXjztGzm1d+bFONLIb1mddvHNcORvUEUwHwlgYHDvKgPOYAesL6ACw9j8TBw0I4p+fNt22ydq3zItPoGpgjszvwrKRoMc9c4YiqyzNS6UxyHtwdt3JpNt3HNjLrCqdIr1hoaXZIkDfOzobCp+AtFa/88b8Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(6133799003)(22082099003)(3023799007)(261026140227099003)(56012099006)(261021121427099003)(11063799006)(261009223027099003)(10067099003)(261102123227099003)(261021123027099003)(261028144727099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zXcq6VWc6+TmQkQAQYhfEy3YzGs8Kstzqq3rfcWoVnoI2vvjRpWe5hO7OgKAWzzq5WH/W3HrWho145Q3JisTz8S26lFOj6GFhM8yp5h8vhQO3MpuA0I+BahSiD3swgHODtSrvN0JP2Y3xeqNFRmROG0Ky6dfEzNNtu6FfaxeLD3K8tY2AM/jWnTLhwbDbgNPSL5Bz+ZgAlcX+fqtEym5bQpxpL7Tp2MELmVC5WmcYoJuFiFRQKUzglxefcEfQ7UWTTlhJNc/2xUwsQiCDXTUiFyoaciWj5hg+JAMU708gkpZ22mQUNCs27Lz9YCdRPVEvuEQR3aKJTiPAG8rw80WEgGs1ivOfvQ3rZ0fF3afAsMZNxhhRNa150DTbQ0eE67ewshtDNVsxvijLbchRQ1jdmk89ZtTstiI8bOln/7wZjQXS6VLciLqpnZ3hgDTp6iL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:39.2142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9336d06-a973-4991-9e1c-08df4a04f0f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH2PEPF00048917.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4072
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

