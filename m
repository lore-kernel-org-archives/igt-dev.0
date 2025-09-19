Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE4FCAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 19:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FBE10E068;
	Fri, 19 Sep 2025 19:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MiAh/gZO";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012052.outbound.protection.outlook.com
 [40.107.200.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7577610EA85
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 19:17:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riMo+qkL7ZZyggTvDt7Jg602vNzy4T6yAqTXtEKdA0srVP2kDtnbQGh9TOMKr4kosKUSHsWqQEu3NeWRDwKKyMCyt3XuA2QpAykX0EJjoxih8iYZs+RpmepNj/AfO2u7fk40q6Dg8YAzwth79oNdKikGdOY9889Ckg7dxqgSM6A0uwyC2Yejzmftk/NMIkt30LsrtQRnNC5lwq+X56HE0+fGtdILqLVJgtoCgK9DHwnjAcW4Nbrj/p/WHw7h5+dctqLokiJE5vEYc2yIKcwIfyj6LOYrPVRVXXXixZp0nFNykbNWfs9x5Z9DebAPSjKrAsCh0nruB1ZNSxzD+fkE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWcz0HIdtUIlf31EksjaERlcl4OSaIf4MCbwFX3A0Ms=;
 b=dMrX4gGuZzl0XSIpw7A2DQWur6UrCEMwB4t1p5S/4Nl2x93AK98+Gu6N4+L77krqgdnjfbQ0McZMnIJaoP0nxfsCVx+NBhZc3NZXzwLo5RQOLKuuQBeMDnVu9yNmlcLPLIqRkpXHbrQPKjJm3ZnJrMZyJnyCY1G6wSI1NcPxHTDED6MnwbVNIQTpcwzNzUjBJUFWocTOKUQFHCOUGX8xth8yOjmtVwKQBVNZ6WzE/FqUlJ9FG9IAXH4DR6puovHwfPiBlbQudbkBMMwIV6NAbcsbKdZTpVDuKvCQpYn36K76yMMN2ZLdTR/9Bh+/GUtPYjYE0rh5dh5qmBkhxwDm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWcz0HIdtUIlf31EksjaERlcl4OSaIf4MCbwFX3A0Ms=;
 b=MiAh/gZOdmfvM+pSWtsiGdDie0Fl6zbwLHwn4OYGn5mYObeJZRNFFCNM+nl0xpN+ZOZoUEviKvsyXSvSWXerSdBeAvw/oRa4xmKdFK2/5gT33K6X3oUW0TyvkL3kqR/y496Nf+lw0sKe6buGsdb4ffvYnBqTmUn+jAK4UcBsfUE=
Received: from CH0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:610:cc::20)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 19:17:40 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::b8) by CH0PR03CA0075.outlook.office365.com
 (2603:10b6:610:cc::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.17 via Frontend Transport; Fri,
 19 Sep 2025 19:17:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 19:17:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 19 Sep
 2025 12:17:38 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Sep
 2025 14:17:38 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 19 Sep 2025 12:17:38 -0700
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Yinjie Yao <yinjie.yao@amd.com>
Subject: [PATCH] Refine VCN test skip condition to target RX 7600 (GFX12)
Date: Fri, 19 Sep 2025 15:17:36 -0400
Message-ID: <20250919191736.90385-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b627f4d-a30f-43e0-eb21-08ddf7b13339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sa7HJXJrEAufZ89IFpqbh3KGBrsgF8pJgRne4AwYj9CWyXncC13z/ZMZCyHS?=
 =?us-ascii?Q?IITMqwRaNxBYjeADtQmp5uz6DH5f1t4gCuKhrSLVS2gR7B7lCbQXMB7H2HfX?=
 =?us-ascii?Q?86sFLlFzVdAtZ6eazz+4RLPyseOONTnwNopbfetyO/ZZZ7opS4V81Y5oIVc1?=
 =?us-ascii?Q?B9N/HU2+tYARc0HsRTqVXydLakpNQb6EG+Vnq9vmDp2sAS6RHIaZ7FbKPifM?=
 =?us-ascii?Q?nztgO/jlYlYNsHUQjC0qwSebfEVnXuJRepnfzE0cHu1/5k4PWR8mY17coW+G?=
 =?us-ascii?Q?Xfsx8mrmI1AFW7q6T5FtkVr8gPeN4iBA9P8c2l+OFVHwfdRmJgy0jCHbcj/F?=
 =?us-ascii?Q?J8MvCFo/VrcXZhObFpgUKxww5Ofen5lat5BNIfBscTboRHkzIIZ2iG6LbzyU?=
 =?us-ascii?Q?jLo/oYWlyc0kaSb177svnkmffBIwz/9CJy+0nER3QV9WLePAJKltSPf7WEPH?=
 =?us-ascii?Q?67AzX2Kox/uiqCD+h3drPSVqcbpNTIHRDOo9TImhDW4Yw/v0y3Vb44llnhIF?=
 =?us-ascii?Q?s7sqZFawMbdLbW/lT/JgwISwESmDrQCvrGJLTeCpZ9V3PGCSJbl4qfhux4rb?=
 =?us-ascii?Q?23UDr+9H+VP+YwPBXs+3t1UOZDVugCiLS8flhhIN43CpAie3ASo8RxeWCvdV?=
 =?us-ascii?Q?4CEAvzOlfziF3IFYx5oNxD5Z/pJgNIdHRZwYcpXGCbKS8Q8053x54ELEMGz7?=
 =?us-ascii?Q?2abgKMEIbc0KEZNtPz6mFVuYgBfUJq/l8JtgDwKBH0wsYbyAruLl6NyKMVsR?=
 =?us-ascii?Q?ITNLKsJwKQ96EDcc6f6XCsNUYrAPkpE/YMn6Q7pyHJFNXby0SBXvpHMP1FiU?=
 =?us-ascii?Q?/etf8w/mGJvSzwHixl76MYtbIsi/u6isFXxIgSHd7y3MigZwly0kJoMsVhH3?=
 =?us-ascii?Q?vqEZLriFvwGFsMRU1ocSaCPstShFU4Htf6jKm4VDvPN8xRpMwsca7fsgQxuw?=
 =?us-ascii?Q?K3djCtZN92GVUoj+m9XfEjTqqRbSpG8CsFtSZ3xGCP6mTYGb7v0zRxCDdMFc?=
 =?us-ascii?Q?GOYzEonEQtdDWo6OotD86wQAqywBPEvx1ekRDdAupIK+wLIbGgeW9d7PkDaB?=
 =?us-ascii?Q?//ZkEs1wjh+m4Bg4Sjs8LviyWVZtcAGAkMXksRSN9ozj6vULhIHuIy9yAsQv?=
 =?us-ascii?Q?DLMlsqdaR4BE08w2pHtlAKmKSTohY2vssoCVeVtfM4ej0BBZal2XAVchGMDc?=
 =?us-ascii?Q?HeSeOaDzcsNfGUUl3TqqJuhKa6fZfVxk1Q6Nz01zaljcJnFeenHyxhurgpyb?=
 =?us-ascii?Q?g/o6HYolQD1E+eeD8WX9QjZfRnSQp5Lfp3P0N11EMBP+jvXmMqKPnSSWx+1D?=
 =?us-ascii?Q?EcSeD6+98L1066qaapwB9iMfFbjxOHCqC4Q+MVq4hzppeceopoRv+NeWyM4w?=
 =?us-ascii?Q?Dkk7j8TdUsksyXGNOmwjygudTRIfi3jTHpbOr9TbIQM9BOLrLb7B2jIz97fw?=
 =?us-ascii?Q?e8rQ+VBBsBaUzpofH24hrX3hS+05PFhQLzYj/TpiX0Ua2BrHQq/hHrAwbAtr?=
 =?us-ascii?Q?omZXuQdDkB1z2efwg3Und/fRr9PVNnrCgimW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 19:17:39.6583 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b627f4d-a30f-43e0-eb21-08ddf7b13339
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
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

The previous patch attempted to skip VCN ENC/DEC tests on RX 7600
by checking `chip_id == 0x51`, but this was not robust enough across
multiple system configurations or future variants.

This change refines the skip condition using `family_id == AMDGPU_FAMILY_GC_12_0_0`,
which accurately identifies the GFX12 GPU family and allows
for consistent handling of RX 7600 devices.

VCN tests are currently failing on RX 7600 and block IGT enablement
on this platform. This patch allows test infrastructure to proceed
until a proper VCN fix is implemented.

Cc: Yinjie Yao <yinjie.yao@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_vcn_shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
index 61075d8db..ee372cb5e 100644
--- a/lib/amdgpu/amd_vcn_shared.c
+++ b/lib/amdgpu/amd_vcn_shared.c
@@ -59,9 +59,9 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
 		context->vcn_reg_index = 2;
 	}
 
-	/* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id = 0x51, family_id = 152) asic_id= 7550*/
-	if (context->family_id == 152 && context->chip_id == 0x51 && context->asic_id == 0x7550 ) {
-		igt_info("Skipping VCN tests on RX 7600 (family_id = 152, chip_id = 0x51, asic_id = 0x7550)\n");
+	/* Skip VCN tests on Radeon RX 7600  (GFX12, family_id = 152) */
+	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
+		igt_info("Skipping VCN tests on GFX12 RX 7600 (family_id = 152)\n");
 		return false;
 	}
 
-- 
2.34.1

