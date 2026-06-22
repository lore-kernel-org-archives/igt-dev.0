Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70AFCDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 08:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5810E2C9;
	Mon, 22 Jun 2026 08:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LEkYg0HL";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA4510E43D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 04:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V97nqiAt8KBamlc8NMfm6lZ6Q87vrDSr/vOUMU9a3ufR9uTNpR+aZmtrt96OK9nJZCe67gSuzot7u0AqUtXBfn5FUjwI9VvQoDUMUfx9aBOGHRqVUUC+Pf+t8ULMZ29ukP6OHGolvXG9YsxrsKA5Vl+vStdqWkdEx6yJeiwXW7Cq9I9eqxNxSXS8xB6RMxtJmijML7O5SDnCN+SXsP+Jog4l0T2eLSHvSYA7IYzzsr2kDQJb47NDn3iqUEFEv0/tJ3EO0IE75uqkDzgNs09fA9Z2eIeqtR1LUK3bnbyDjD0z5LtQKgutCUxy8eIUo0JDeODj+i7XxGbTDiKJ3MnjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CBUiN6wA2187rN+pIJUhH0RI9xyCbIXENaBzLzVQpA=;
 b=Ee28zuxA7gLWhE0AW0pWKsafVmRt2rksDvKJJIxY2pLEHu47eDZuc8Balr/6QrSPzDPR0XdmVmrI0fPf+mUfQMZmv5aQzjBkmo9n47x149DL7F1tKKUjytcH186f/dnrxc1CLIsoOmNKxt5Tam0mDpWWQHP1HFYrMD0ULEsQTaPCStlmtny2df+y5GyYQ5iZBH/Hyjo+7uMc3LT6yYd7ZHtQcEchA/phfqmOBAtNPSXs9Nxukj4Az5tgU8s15ej00/ABPtcJY0+R3w2PxngAhdIb7b+wIh6fFE8F4he+yfmtNE7zso61J7iqVJoQFvqBM/VjiIynl4seuKqlkdTZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CBUiN6wA2187rN+pIJUhH0RI9xyCbIXENaBzLzVQpA=;
 b=LEkYg0HLuHa3V45liM3dZKYLitgBz3ZhMsmNPLBmdkE5CB1qjeyvbSl75WzGEXotdvhtchEvmjA++9oR8aseZDm5EatG4JgCQWuBdutJRRehBYuHvWOYj++nKdh3nmRXsQnuHtPcqZcqJyWLoAOlN1I3DJR7+2/LUSbR8HJ46Sk=
Received: from BN9PR03CA0428.namprd03.prod.outlook.com (2603:10b6:408:113::13)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 04:04:47 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::7a) by BN9PR03CA0428.outlook.office365.com
 (2603:10b6:408:113::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 22 Jun 2026 04:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 04:04:47 +0000
Received: from ram-Splinter.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 21 Jun
 2026 23:04:45 -0500
From: "Ramalingeswara Reddy, Kanala" <Kanala.RamalingeswaraReddy@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Vitaly.Prosyak@amd.com>,
 <Christian.Koenig@amd.com>, <Pratik.Vishwakarma@amd.com>
CC: "Ramalingeswara Reddy, Kanala" <Kanala.RamalingeswaraReddy@amd.com>
Subject: [PATCH] tests/amdgpu/amd_security: Skip secure bounce test for APUs
Date: Mon, 22 Jun 2026 09:34:18 +0530
Message-ID: <20260622040418.454076-1-Kanala.RamalingeswaraReddy@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|SA0PR12MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: a7711065-2978-4d98-1b1c-08ded0136646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: dCX3tWKm5QC+sOLH2gOyu/IJRB1mKcdPu9foc2FibBspcmov3GiWiT/RJ43fDG0ScNlkXWdcgCnOEwnqOp5cB+jdUhhMOmmndXnxx+menuClKaFUGnD29Ct/kM9WlkEVB00iiFp17jJBzHerUe8s03zQW+hytcgtHdg1lwOBvBKl76Dev4nGh7la9m5+B8NOHr7s+DL0nFqm1ZOg5enn7BFMN2bUcwEDfJyogerB8JoZ9XhSRIMbON3q7JX93ABeAojQhQpYb4oynfV7PEyTfEOEoU33GbPbLx5KKWgUUJad8kUADpgjoPtiKk4De/jgNng7TS2Q7t6CR3zwFOyG5VORUzUh9Pjv2ij1zAq+JJG9EgCCEmJjrP0SJut5cz5EN3nofImNnFPTlb5dEWEEYvbq04atD1TDfqB3PwZUcW7aAzJhRaKzdmD2+JozhtuaZFY/CWAreQRTVeDLIlGlAf0mfriGDM+q4+1ZkK3Fbpa93CZqO6bTI6qdzw8SZGfQ+Vu8Ou/I+ffFaQDXrI2dgmogdxhWXUeyfnHiD/1ojddyKwPKZSmC4DQJTd/Io9R+1EDJhQlFKUcCdqFS426jIBs9t3sqLyYK5CxXtNO+74dZ9/c3vZKOcvW/rsQQO8lAydlp4tLMlZoEJgo97kUbJoubcbAgX6fq7y/ypaDbjOXgOGrJaIDweq31QnutY3/qiPgOcQcPI8zF+tay9PaIKw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r8/e4pYqxP0H306RVAORcYG4voc7R4i19pC1xaZDjLpZt9VHvGUyzP7soL8k7v4La2SGsqbuo0FXTuH5eVQQQFimwMSfdRQ8/5emYEMJa2UonVneQgto/YZPrQTbNnaXSRJ8lVgQ9//teGLpnH/MRsLe/rICWoQckXWbSm3GwW+rQn/HMsu1FYf5SAMShI2KBYP5rw30UZzBQtDCpgHvKMNRRsDe0pohteWtsHtKvLqo+qntYRT6yVq5xpHCypdTWrijPudiDug9W3z7rNQyna4eODAVA20F9Dvy6IrDkw35S/3AJw5nq0iZTOXqaURTpFMv3b7QoMLNk6vkq4HD7njgylonwrmMhqpHw32UHqPlpS9ILPlkiYXQ89SUANNVlsgC4n88E3uk9c24VLyzWtS/YcuxbsH6LLjX7lsYi4x5MUPBlXF9RKfpwOjU9FO7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 04:04:47.1630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7711065-2978-4d98-1b1c-08ded0136646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493
X-Mailman-Approved-At: Mon, 22 Jun 2026 08:11:05 +0000
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

Secure bounce test is not supported for APUs.

On dGPUs, TMZ works only on VRAM (local memory) but not on
GTT (system memory) due to HW limitations, so this test validates bounce
operation from VRAM to GTT and back to VRAM works on dGPUs.

Since APUs do not support this functionality, skip the test for APUs.

Signed-off-by: Ramalingeswara Reddy, Kanala <Kanala.RamalingeswaraReddy@amd.com>
---
 tests/amdgpu/amd_security.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 9ebb3fa83..2a8ae4a23 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -360,8 +360,12 @@ int igt_main()
 	/* dynamic test based on sdma_info.available rings */
 	igt_describe("amdgpu secure bounce");
 	igt_subtest("amdgpu-secure-bounce")
-	amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
-			AMDGPU_HW_IP_DMA), is_secure);
+	{
+		igt_skip_on_f(is_apu(&gpu_info) == 1,
+				"Secure bounce test is not supported in APU's.\n");
+		amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
+				AMDGPU_HW_IP_DMA), is_secure);
+	}
 
 #ifdef AMDGPU_USERQ_ENABLED
 	igt_describe("amdgpu gfx command submission write linear helper with user queue");
-- 
2.53.0

