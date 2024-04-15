Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1317DC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 07:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14B111224B;
	Mon, 15 Apr 2024 07:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qHAGoqsR";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8F610FBCC
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 07:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0vRR+CvoKulcJ4wxRzrBqfnf0AECYTC5C2ZH7NwXLmQ4QMIeowshFtQiXwsJILYcFzNmGSkC2K0zp0XFRx6EuqfuRJA4OXUZUHrxVirWDtRJ8xPeeZnMMwQwq6g3rqnR0LJe0Xp1vmRHCkKhpzqov8438ilep4giYbY2MSbGP73LrCgDgyRsqZIixMdxPfJJmJHwrfB3cd039gHm39veb3a1DJ6pMYqQoWOYqBkNiqoV7liWlsO8tC5eGaxzW2jxiZ1ONlm83xbf611XiCiMWOFTpn/3Dk6lXWMPr8F1Edt9F32dIt3n7AM9QMhpYh1Y1QehDjcSTHPpa1oCmNQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxIf7DF3UhZeCZxrwSVSmNNoTKucgp3jE+90kmIlIdw=;
 b=f8zFkyeVL46+2O3lcUQwqep7fUWxnaiDk/R2y4D3hs6qg7hLSXg9ftDzA4TVT0rGMUoVG4RKJ7Dx2V1NcQQ3MG02hxLgCDfeapPaB5yRXXUUszttkQlhG5u688iDAXnwIdy91mY+lEtF9beydg5XwF7L2wJ6vqDyuVXBFICLscKtoPDSoB2TH4ZC6c1E0JbDw5kYWKNlVB/JfLwcL61TDVCgMfCipHxIz8AdxSDBraS6AEnCuP6pC06JB0aPOj31SfjSAuuCDvxvCfTz1ecOTDCgE7WkSMYI/i+0YVGE3KA+F+ewoQ5g97idXqbP9nPykFMNR7tyG+ROzCc0xF9jEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxIf7DF3UhZeCZxrwSVSmNNoTKucgp3jE+90kmIlIdw=;
 b=qHAGoqsRyEA/SvnpkvA6yIhAAAWdR9qEfzWkbGgqLDjg+uDKk8J4JKLunYITg8Yjfe/jwgghQ9ri6DgXq+VMTVZdPIddUHvNhzlmmkP69LAbKncagflqyKdt9EFHLrCX9NIDuU5y5QVWh6JMOsBuhEUakPmM8IkpsgA+hN8E2cw=
Received: from SJ0PR05CA0091.namprd05.prod.outlook.com (2603:10b6:a03:334::6)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 07:21:48 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::6d) by SJ0PR05CA0091.outlook.office365.com
 (2603:10b6:a03:334::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.17 via Frontend
 Transport; Mon, 15 Apr 2024 07:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 15 Apr 2024 07:21:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 15 Apr
 2024 02:21:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 15 Apr
 2024 00:21:46 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 15 Apr 2024 02:21:38 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: add check for deadlock test
Date: Mon, 15 Apr 2024 15:21:38 +0800
Message-ID: <20240415072138.150296-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 01765bcc-420f-4eaf-1210-08dc5d1cb69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRlkf9bpsq9d8paFivE734vaUru+8aEYVr3A2ZKPKkK1Jm1kUNnAKAHKfUnp+ME0mJaWRJtbmjWABiPShKh4wMguVOZ5vsR7q4BITGqWEgaioYJmmkvOeAoz/qprC0+tdkvw3C+fcAiWp98efd/CME6dMD/oNF/JZ/A45yvZ6slGYHuRAT5DZBKLurUh9YeES0kMsfjQjT7H1Z2Lc06Ey59bpGbazIybzbTAh8XS9AI4mzV9V/I2kpbQ166z35LMW8q8Ks6Ln8YAivb1s/+xe0rqDYGcEaY9haGi4ax1c0t4bOki94O6KGW+OBGr84OK9ZU17TuOp6iDVpnqAIznHO0pmRrsi9HQTjbD64bxskHuCQv54m+CJPXt/zBcXRf+TCxFVIv6iUobtbG94HjBoF+80IXJwWXWmPrIY75C6YiYrSqFHyWt6/rKNJXWKuLogsMq5OpXbxg6KSIVpY0JtOqstEZMcgfaULz7E0c57W8mSD5bE+nYj6KFa9TmV57bJgwTgEyDcJ9ZMq+cqhzUUA4MAY1HTRhXsOv3qL4vzSuRWzjl8Psf2fDngrTfno58dRUK8M00Yqv3zUYYzAfbApgJcukn5izrbq9YkL4ejUbeUJf4uNpfatb4JucB3YD8AtVMnIXK6T3zafPQrO5J+W+cgxeMIPSPnq+yTEICfw60qGCeLeWOejwca4TE/yl9D0fn9gvS0bhKw4p9HG8FPy8rr0wHwBBy7j7f8B8ulrVPlLV8qWkNSVesT5YYPM30
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 07:21:48.2576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01765bcc-420f-4eaf-1210-08dc5d1cb69d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920
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

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
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

