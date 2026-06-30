Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5319C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 03:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818A010E15B;
	Tue, 30 Jun 2026 03:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fQNaeU+F";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011050.outbound.protection.outlook.com
 [40.93.194.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C3A10E15B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 03:24:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aa7QtBtdwTKHiG7EVyQ2a3yvcjAe+P+g6XBShHOPaFU43c68dXev6o3+rAw3914XmJ0meew7tuJOmp2WCPONXP3t0BV6e8nzjGtpj88LgL3/AQgy1bQfc9A1qd6Vo1Mfsc42S/hXuGY2AQ9mkTveHzxz+wbFplI3WqS6FUD6v7h+qNpZFfEjpjT0W2mx8UySVryw2jT+3K86hfJlSYUezs8vJtKYOiR/WYD/FSOU9h3a+q2wHADhxAD07U5DoI1ciBSU3K7wm15GkGjrvQJBXg3B320Ftkf/8NHM+Ue05+xJgr+meaRSq6JcwJktuwbTnRY7B6PCp+g58j+5kfA6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJwrQMSzAFrHV3gsE7e5E8j9FBxdgLsrF0Cs2lb/3Cs=;
 b=SIj4nD9ZIQiSA1jayO71Ua0gGxX/FTkKUn0CzgXkVCuQqV3M/mfotlLmF31DLAQoCoThkJI77bP1Rqm6ihlChGi3hrv8S1olk7WovIYKS92KJMucc0MjXZFc76Lft6fw/ZKp9bwMIZxwA2IeIJh1gkBAG+2NmlDcf3GH9KTda0PoQ+u65Ulz9bW0UJwHuHrY94DieUfrfytsjkrOM8TSRPlkC0T66tuhU34E7Tu/Y0DYJUoOhSD1Ux/4YfEbiLkuEfjJ37BshIEfi6tJr8PfnbwjlGzbcBBrx89ccjEbkWlwv9EGRKTCUuTVQrQMze7bRH9Sy74ZJJwaQMQwNRnurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJwrQMSzAFrHV3gsE7e5E8j9FBxdgLsrF0Cs2lb/3Cs=;
 b=fQNaeU+FdVkRRwB1MJcxEBP2djzWs+ZyyN4y9ebkHIyLTLe11SLH3JE8dwz8IGGSOSdrlPbJI26VPbHGjKdhmXrBL/M5L7fMkQoVVqCLGaA+x5PR3MQiDlRXNjw9Vhal3pAQT29Zz7bDgBGts7ssRF2lOoao3QwZVtsgwMEorsY=
Received: from BN9PR03CA0630.namprd03.prod.outlook.com (2603:10b6:408:106::35)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:24:49 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::19) by BN9PR03CA0630.outlook.office365.com
 (2603:10b6:408:106::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 03:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:24:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:48 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 22:24:48 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 7/7] tests/amdgpu: Integrate platform filtering into amd_basic
Date: Mon, 29 Jun 2026 23:23:26 -0400
Message-ID: <20260630032442.200729-7-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630032442.200729-1-vitaly.prosyak@amd.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 92836607-c0bf-418f-0f40-08ded657245a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|22082099003|11063799006|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: pGoE7y5soq8T8ctJvX6HvzEyK7q3aS6qtF9ON83THrmbrnatcl6jBGpoPVFooMQ0wBDx5f9Q7FOnzFI4xGvH/8DL5GAx7miwMH2rJaj7M7VgF+t8Sef2ihpj+no6YIEYVqZghC25sf/Jhp54D3pICIctzlFUDFAieBCqG7/tAxM+xn0Ujy8++BnQe2InLAIqeiPUPtlU0stVbZhLnc6AeUyNzaxJk9yeca8NOLm1tM4U+wd71WzzL/zC9xvBRA5P/z+Zo4gt7LHP1O0S4osbKcISCevwL89qXas5qa6t9HB1Sa5pGTEFLAMQM6yHEifEB1Zvrv/G2YKTsagaQSBpbj0MtVoK32QwON8qKN1NHLizoE5NanW8lw7+xzdDbXJOC4x4spektQLK26wB1jcEEWiThzpT9L6vNFTanVHYNyMXrMytvgX183Bdk0J8HCFUw9/9IajJOmclTDGQb70dSYSWt9830lZReeAheRMY/YFsvvphV0B+pw5hwtpbKmmGqllj5x8oa6vFLPLDqZJtb6VLmOSI95pswp4cgzvnYenUTrrqWXvL6VedS7JdQDVWWu8kjdXKaqLr9NLe6OrzaG9KKxtF74igT72ZnjB73pTmUvQVk8MFc76it56QIHwDfLf7U3jLfuhs9MvyYjl9I1vAodImmoTvB1f/2Bnmp7isY86CA6rTqeaRA9y43js2FiHcr2edjVvXenFzfIDQDA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(11063799006)(18002099003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gsGQYFlJk5j4xFIbyo5xdoZMG1wfj7tHiLLSMvgkva0xBgb41nuvXFoSk6MaZqGyb9goMaeGEar6nH03U/SYMYp3niINMPwJZ56uR2Mk4Vt7AEoAIUX23MSuU/4guci8UN9DGqu8M2PpcuqwvJnD6YNS+iHfrURvbEo61JAEpNp7bmRtFOmStRZy6daHsYfdu5rqkcmqikBBbDCfexnb8dZg1ED7o0v76muRi8DUAItutLOHNVx8E/rLrEUoAtYbM2gJLLXq1lZe/L59aGAvWQx32sGcWRCVIctFHtZ8tYu3YkNqpNC2ODnPlrJbxnPjl5zBa2Rf555idsqiaXUCn7JkXoZbiOwCsx6u+DHuB6px9SNkz0W40cdgHwtRZeukQdGQ/MxSHXlEtkeTcP4Igr5og7sKAhvjsRHk4Xmb9D7aK+kX3vlpXjtBN8oxzQyl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:24:49.3149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92836607-c0bf-418f-0f40-08ded657245a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add platform filtering initialization to amd_basic test to enable
automatic subtest filtering on the navi48 platform.

Platform filtering is initialized once in igt_fixture after gpu_info
is queried. The IGT framework then automatically checks each subtest
before execution - no manual calls needed in subtests.

This demonstrates the automatic filtering functionality for validation.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Ic80cdc86111976fe6da6513c50e76006c861489a
---
 tests/amdgpu/amd_basic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 3ad023472..ef83a53d6 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -19,6 +19,7 @@
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "lib/amdgpu/amd_utils.h"
+#include "lib/amdgpu/amd_platform.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -883,6 +884,9 @@ int igt_main()
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+
+		/* Initialize platform filtering for automatic subtest filtering */
+		amd_platform_filter_init(&gpu_info);
 	}
 	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
 	igt_subtest("memory-alloc")
-- 
2.54.0

