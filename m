Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B8606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PwbFTf4R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B23410E2E5;
	Wed, 18 Nov 2026 06:15:52 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010025.outbound.protection.outlook.com [52.101.85.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE0B10E342
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 06:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8EIfsc5aFUn+a/eAkTmJpF6P77JCGlVyKpFkjSoR3ytg/ej4x/AAEXlvRVSKRmGFD0Llx+bh4KyiMzV4Un7SaxWxCx+70PIrDUVKZTSqdn/Y5r6nMy9WIB0oYFHdghYzP+1j+ppjYcMryiaEWYxsUNnOotEgX/NmVxd2FOyxqMHs+XyTAdpr47tGZNs078oL79mG3irG8gwcYpiSziHfSdcf+SKD3W2l51AVLzUhFCQg7J7SCOre2CG3jP4Coz8uWQeJkRwEff464kjkgHTwsXw+LxylCy9IF0GARMAo1sp5pxIFMM0mwKHjnex2+HUZeFaXtk++0Exqjy1TLrRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e+ZpcslnTSIHbwd4biZ8ozGBLn6GiuHd0rnBWS035g=;
 b=lAWmChADU+CL2G1ERnkCiHwkHp3/w400PtY0U+tZ9AbbnT8MuhtgV7vhi1AN52Sdic863HtxT43xcxYWmz58SsvgOGOp22evDR9XGdnfVLZb+GbB648EQVPfEA5+4R++/8NTeJfoPlHQLGM0ZtnftR9grcsohXaiILQ53fBbZfWCdo+bF9vOs+LsmVxYpODdpjqnJTsgoOai3kmak9fQ/X296uL2e17Yccv7afFv1U5R1qzwgYwhbx6buoyfm8uATDQhKIpMIv1ImJbuO1+rmhnoncWTpT8sCLG0ex/B7JkfkdABSqUXm+hoh6oQ5A3nCGlsGOzesDGkx7eikFA/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e+ZpcslnTSIHbwd4biZ8ozGBLn6GiuHd0rnBWS035g=;
 b=PwbFTf4RgNcyjq909rpUTUEZ0VlkWJEccaWZV8W5py6TiKs9XQ5dy5a3769FKt2JpsVEuO+KscAHscjtKZ1O4y8jdso3GK/tjVnu2cTSSSARbHoDmf6YA0wLcCIc8DZ5aCIBV0d26mFva1dK6/3liAh69WdmIOEDfx5tvKBF79o=
Received: from BLAPR03CA0094.namprd03.prod.outlook.com (2603:10b6:208:32a::9)
 by CY8PR12MB7753.namprd12.prod.outlook.com (2603:10b6:930:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 06:11:17 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:208:32a:cafe::6d) by BLAPR03CA0094.outlook.office365.com
 (2603:10b6:208:32a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 06:11:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Wed, 18 Nov 2026 06:11:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:15 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 00:11:13 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V2 7/8] lib/amdgpu: program the CU mask of every SE in
 dispatches
Date: Wed, 18 Nov 2026 14:10:48 +0800
Message-ID: <20261118061059.3012530-7-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
References: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|CY8PR12MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 7256ddc6-9136-44a9-84dc-08df453ac135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|11063799006|261026140227099003|56012099006|261028144727099003|10067099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: tyki+XT+6D1i4hEr1rx4F2gy/QwysPcsUPPhQ+yWVkzkoUYLJSL2++7SymLninvJHuX8z8nGnBw8eAdZ80QZUMk5bo4SHVKWTe5AhWQP6Wx2uahG8MUjOfGP/SICrErmOgu8WOkLZLnpq9VKdj2J1Cb44A4WNvXJFoEvyQ9MBRw7hWsTf+TWi8Ox0BWAZEL59JCVd+zqIRVb3ycIK5TA7/vouBFHGobh8MaMWRBlKMt5ijyb0OPX39Qpi+TiyYF3dIFULk4WbygUWdZG6Ihk663YytgQW56i/baJrKJ8WLNgc2gje2PVqMs1oeuQ+fFp4aNLFGeHlT+kXsLkwkxDMmataDAQDju6tjmiS0VPp9KoWdkpqoiRgORuA8Uge/S6zxg9kBK7yqsibe1d3/860nt0/Q53IJCsA8av9AH8ESnUQfhx3NoC9oltC0e1jMceQ9wjJ6c7Y7HXOvSKlelzNSorYiNli2mI5h7KSp+LOIfbzPNAfLrZdDcC7nKsnE53UiVj/ayBn2T5nTSrKJDyMvpCs8UIE7qXYWafl99i8YfI+cjbTUh6MJxWke4Ch0sDn1vYXts+KXafwgl75nx48kQ2TB9gshOPi1DQCa/dlRdmeoy9nYWGqjmrFS0ELpQXCtixXgfsmi9NC1mCe6u5c6nMx1Fd5tU4PKS55yjC/da5l33ZF53tXh6K6bjbNiEOpjoI60rs3ieVvnwI4o6+cQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(11063799006)(261026140227099003)(56012099006)(261028144727099003)(10067099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(6133799003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MEFwvmCOHwwSbbA3Hhk8jMNZmuVzYS944EtY534O1xgqObovAlaIgF5tt37MnbQ8eoX0hh02sG+UEfFtUi8FdPLmSVciy05+1tooNLcNkEo12OvXsezKbxpy6uyZuGb1/aVVE+HmLwTPCltwwjQXLcvhRGPhF8VqVgbbeAoVkvAi4ANELGqP3ryZwgLcY7ExTboI1ZQ/9M52UDJETXxsy6TiJEzj4YQR/L3Wbmm7TbtbSl9aRxV8Rg7V5VFWJ/sLAUPUFmK0H00g1nM3hz+wS1fNJ8Ylc9plhQIkVk6+sVmX6u7cU0XPEzIs2x/Xliou15BqdtdFJb0zMtG76CZVUbnhT4Hb4gUv3kHK8DvzIRBwVgpXlqnIQ9v1aGGJxr1DX+rbvAAFuq02tRr/7uLHFrmG5MPscCflV0esCLW/cu1GabMnYaXNmg6PHDl8T4cq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:11:16.1409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7256ddc6-9136-44a9-84dc-08df453ac135
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7753
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

