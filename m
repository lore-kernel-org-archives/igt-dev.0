Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F42C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 01:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936AE10E649;
	Wed, 17 Apr 2024 01:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WYl+H7r8";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE10B10E649
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 01:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip2QjxxH75hs0AMO1lG+5r99PQ+ozYgPOqlt8IG++x+axWAsdmfcnU3H6AwB1KrSc+45Hv9mct9gEbiaLSeGi4/wCuII299QYdVX6jzP59gdPhOKO+cNIQ+IwZAy/RK1ZneyzpfhllxIUewgRnaRxr2wc4WVqCBBpi7BBB5e0ae1U5ONqfy+ah5At6IGFEw8+egVM0k9j/96jftSG4V7VC9DIoWEnShL7yyJJZHuaMu1hhQhEveGQx/Ntx7iKM8OKEHBNRgDEnIUB3/XixsYcIiNTvG5ZTcVxXERPI3WuQbTv5udM/JwzuHgllPk86V1QlOKtijj5bzY00KvhBDi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLDQT7fzHitozRJW6M367YvklYRbsSF1uCPV/2akUz4=;
 b=fSZeA/kXzlNkNgjDsHDNQUu9A8Yj1CKb2r4jIwBR9p9rAfeGlPMztqWjwLOqjz3HYrpZaUNTOP7m9GY81ouR7/yzHK+biUlHknYbXpfG+Tpkd/S/afGjgZCbIZNadXV8pACsDF9Bt7Pk0lD3xFla0qZnH6/XYrvi1ell/XXCOyeW12h9iTWg302KdqKJm+wf9XpVOQb3lUvBRWM5D4/HQQc5IEGfmXB/8OyDSlfuh3atlyd875hIJJBmgVHb1D4FmAFTh6xSm8M6tz2dYGX7KzkRAMCz41+5r4mYoOOzUBGSJb5stoVDk1mBGsNqx08X+WGEko9qeJChG/aQkMPFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLDQT7fzHitozRJW6M367YvklYRbsSF1uCPV/2akUz4=;
 b=WYl+H7r8VKFG+jyhau2/IoFmzObRmvp1nufcstO7EBuHLUVasrnQJo6pugO+ghkRyDqNaIfv2ZKGuasc9xehwo/qSmkhkumkMBPiUrID7EkmrxpWC1hzC0jCxZ/Dn6o5El24pIIdUUkhQLb0XvJHpTj79od27m+mRbrfl5y4DBc=
Received: from SJ0PR13CA0233.namprd13.prod.outlook.com (2603:10b6:a03:2c1::28)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 01:17:43 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::1b) by SJ0PR13CA0233.outlook.office365.com
 (2603:10b6:a03:2c1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Wed, 17 Apr 2024 01:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 01:17:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 20:17:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 20:17:09 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Apr 2024 20:17:02 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: add check for deadlock test
Date: Wed, 17 Apr 2024 09:17:01 +0800
Message-ID: <20240417011701.321744-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8c030e-8ab4-4752-5178-08dc5e7c2e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHRxbXOL6SDRkPChk9n863RC7Ltg6RW8zIBczrEyHXLVWaI7/YJuC/J2mw2Ixse0wbyrPeWizo+DhLbTHczd8D1iJ+ElvoXFZGuJpqyaEXpDCLABvlbsab8K5GRPfDT2nemadUsskMUfDx+lvpwupDFKdLJngp38JtFQ+rOp5OV02LFlZZX+MCpNSe4pQyugR18tb/VwElHkJNIlF6Ugr/Wxa6bbmoufoP8w3jsElju9A8DNVYV52X7hxeaedlwWVdi8c3OUltzr3bjtWrWIHk27itwF8Hubq46xQioyVPJv10lvVMpxXLNGgpuFLupGVd7FPnJxh5qN7hEkMCYJ8KljrX/xR9d5wL2JoIdnNVqiEbS1IDMHYdGHBWNjPy3OAmXejrWud129R3CPkiSfiZRIRjvArHrv2fTGWSfpbVqcg5GPV1549oLtnvK5UzBl/O5Qn+D2yN5A+moCKb9JXI1NcYq/0Kf7o3zsk4h2HZt8/1LwjzalMtCstBJ1gu7IN2FYJ6id7InQ7yuF2vdtsPgY96Aqv+D3aeWf4Dy2w9vwW3crgtLmVTz8ta068QhLGMmOp9MH9miNZdip0UPveW7PAfZLjDVL5nDl/9FI/CaBffBEgY8BAXUo7zDs1Fdr+LZm71nT3H3kY/4gRS0XRs4YvtiBMSNw1YlschiFo/W3sbxqgtfOKahSJJyKe4LZ7xWQKi919XxagMFk0mclrG170CmqMpmXDY9r31nPZuCXYnpS+f0Sj5869pELI9LW
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 01:17:42.8239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8c030e-8ab4-4752-5178-08dc5e7c2e8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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

Only enable deadlock test  for ASICs supporting GPU reset.
The issue report by:GMP, Vikram <vikram.gmp@amd.com>

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed by:  Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index dc7ec4366..7a27fae51 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -9,6 +9,28 @@
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 
+#define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
+#define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
+#define AMDGPU_FAMILY_CZ                        135 /* Carrizo, Stoney */
+#define AMDGPU_FAMILY_RV                        142 /* Raven */
+
+static bool
+is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
+{
+	bool enable = true;
+	/*
+	 * skip for the ASICs that don't support GPU reset.
+	 */
+	if (gpu_info->family_id == AMDGPU_FAMILY_SI ||
+	    gpu_info->family_id == AMDGPU_FAMILY_KV ||
+	    gpu_info->family_id == AMDGPU_FAMILY_CZ ||
+	    gpu_info->family_id == AMDGPU_FAMILY_RV) {
+		igt_info("\n\nGPU reset is not enabled for the ASIC, deadlock test skip\n");
+		enable = false;
+	}
+	return enable;
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -34,6 +56,7 @@ igt_main
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
+		igt_skip_on(!is_deadlock_tests_enable(&gpu_info));
 
 	}
 	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
-- 
2.25.1

