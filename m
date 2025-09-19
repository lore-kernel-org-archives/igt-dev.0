Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB09BCAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 19:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F51710EA8A;
	Fri, 19 Sep 2025 19:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TbAo+3K1";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A3F10EA8A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 19:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5qO87gMS4Yc5sC2wTutBg33Hi8aBFXZm0MP8TdcqzywjAP+8lYov6kURXYkCq/mjAls9pGEU+Cc1zN70cxveHM9JqiRAOgaK35S3TdI2FHzuERncLyVKXPCo2lk1gLK9rK1quPHRt0jEMqCvlDSQ8cZqEeLmu2TpZS27s8UBgUYo6EXp/rKv1p0DUps64EH5NLPUj7Sps84avetdV3NdGodrvXBJTEJ1/qmQgDKXduQfGw3Lv7iyAuXew89DPuM1bIcZ1ueoBxwXiJ0rpkzUPGsT6hfCB/XMS3Urw1Ohl1gF/1n00RQqUr07hnUmrk9Bb9G1dy/3snQ/nqzcRHakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dC5YiI5WdkBeG/u1vrbJbeU+Q6ucwJL6a0uHTlXi1o=;
 b=Ew4uArefJtSptCDKRoAKBBkvo1Z7iZ49EJXnYL18G6tb654jJjbBZM6yWZfdstxz7IL1vuWKGSzbqTP+xTZ1t35EL1OZRkfYpt3xWPlmgvVlke63SH/i3IWU7WcmNS7yTv0HyYb0jqdnLXwrwYHVoU33a7b5k4QEVTXVAN+S1Ubl6fvcrzxUYu/DjiCEDQWjJlVyKoKP2oNGrsMq3taLYDe80C8yK1dZB/JQA7TQq9Bos6xH9HCb1kUwq8JVMCz6+ZytCLRWurKULArmMqIMr8GlEbyNQ0D9IIY9t+DkYATSohvM5Z+CV3ApT1AUmc16MgoD9eWHP9+M1vAt5x+1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dC5YiI5WdkBeG/u1vrbJbeU+Q6ucwJL6a0uHTlXi1o=;
 b=TbAo+3K1U+gLU2VR2OjWn/hBNT90aUd5l+LfNs6K4l5vcWfJ6HA/zaB54YIE+752p8A3v5DzfmsPuYgIbxakxF/MAB00oHUwKfs4qA/Z5jFEGBAz2SiKqz06Ms1OvBRPsPOOfW5utgPFB7WBPklHh/bv6Jn1xRVJjYRejk8X5go=
Received: from BYAPR06CA0008.namprd06.prod.outlook.com (2603:10b6:a03:d4::21)
 by DS7PR12MB8275.namprd12.prod.outlook.com (2603:10b6:8:ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 19:33:33 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::76) by BYAPR06CA0008.outlook.office365.com
 (2603:10b6:a03:d4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.16 via Frontend Transport; Fri,
 19 Sep 2025 19:33:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 19:33:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Sep
 2025 12:33:31 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Sep
 2025 12:33:31 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 19 Sep 2025 12:33:31 -0700
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Yinjie Yao <yinjie.yao@amd.com>
Subject: [PATCH] Refine VCN test skip condition to target RX9000 (GFX12)
Date: Fri, 19 Sep 2025 15:33:29 -0400
Message-ID: <20250919193329.92904-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 152cb57c-53c0-4cab-6ea4-08ddf7b36b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nve9nBwbk/YDeVuTIpXzJrwfQPBeP3+eoOFqhqXDHUrYcuGOAtnOfxpOnrO3?=
 =?us-ascii?Q?M1glWzP6pziehepsqPhMQoZdDetMZnSK+b91Cyh2cYQJegLgBFNe7YObwsCa?=
 =?us-ascii?Q?imbWon4Ql6o4B2AVuuZIK/i7dd0g/EcZMMMjgnrwHMTp83gQe0VwfICTwI4y?=
 =?us-ascii?Q?WYI9AVNv0ibqf+hVlpgg9cqV8DplIH6wtRR9MyNlWizxfE6Z8VS17RuLqobh?=
 =?us-ascii?Q?ZjHD4ieRgfMINJMFCYw5zaImwZ4CndyfmlWfW/ADnCMWAqO6ld3H+ohJcGgt?=
 =?us-ascii?Q?n/FaEMp6NbfvXl/u2x6nymUZn5sM66CVTn1olb2cIR7xvUqcZbV7TQA0x2LA?=
 =?us-ascii?Q?rOd7wthO7XkWQ6Pbm8FtSaT7Ew6AwAEVcsXYBsnGAjl6shYk4zFS+F/l8r79?=
 =?us-ascii?Q?VTABpAqA0trTStXLzfxJWuRXcvyj2552TuZDDdXxMSBEuCFGCbHHmpp8rEsj?=
 =?us-ascii?Q?/fG4xhNv9UWxi47gmQs6zzfXorBuiKORGBmXb7s3+Wxta9VliflkfWax5LkX?=
 =?us-ascii?Q?vQZfCz/SGN16iZdsTheCwPu393OeNXtXZ8sxQRzN+Q2p9VFtPcGqlxu9VyqD?=
 =?us-ascii?Q?gyjHCC36esxTg66FyUa/vAGdjBLW4+2Z3IYuF/z9PxjGl3jHSjRCpiGbmGlx?=
 =?us-ascii?Q?scpgyYkm02TKN1Yet0foGTMZpASMdeSccO0Pzdnq9CgIjBy46MGZBk0zIAkt?=
 =?us-ascii?Q?bGOV847DshF1dsyN6VIxS3J6cyUBVdAFIwn33ftr9nDGmkt9kB06VQYixZz7?=
 =?us-ascii?Q?7mJ2yNEG6PmQvzl5k7WTyOs177wlARsia0yNwVj+yQ/HhVIq68vabfNLoES+?=
 =?us-ascii?Q?b1MYxxkjXHcc45Dp6T23ekbM8KXFD8EYbxto12lXFWytEtF7XMok6w4zVT+Q?=
 =?us-ascii?Q?1r4tvkbWKtzEoAuI8d+a2FUds6CEzs/F9kBYTRLG3OIq6Gn3KT5/Ny+nMMRZ?=
 =?us-ascii?Q?Dw79iGfxGe5gx0k1gHlh4AlLo12mjwwSC822BnlOhOvFi9Hyt0phjsWMnmfL?=
 =?us-ascii?Q?xnKqyM6SWIxrkjDkgUKv+mnahgwjSVnxRUA5akFBYIHwArhAR/pXrEmjKL7L?=
 =?us-ascii?Q?DvwT3bm/rgj/nLATUE3ExKtSJ1BX3VK8S4eHfM6hmd53/TPgLLd8UCMEU1QR?=
 =?us-ascii?Q?LyJNMHiua1gQs8FdtcRlLNp6Dh8Xm3yP5SWLdnqE2esKiQL15m4ytkU38Kxq?=
 =?us-ascii?Q?R9ZE19qpxI6NzyMgpB9Q5a/gMSTzwXGXPZLZJ1FsG72vIm+QWEucwvX8q8IY?=
 =?us-ascii?Q?8KSV6tzx1wpaBO4UmxeIBM1oLV7DO0kzqm0l/9a84Bl2v/C+YrbuJKb5ZeiX?=
 =?us-ascii?Q?IGO0tBXqoiBfVdrhjMKXni6xu63Q39CJQzNDiOXH2WS+GNBSYSEl/gdrXPfo?=
 =?us-ascii?Q?BNCTlFU40fUaKDNQHhwlQYgWZN37kqECtgRgQHwnhla9bFTZnmcQ1pmlxc/Z?=
 =?us-ascii?Q?4PhQJqBZ/dlJMfxsvrLQU6wyVeVeEWsqG5obnkUoUX56M99k0cK61L4vcE2h?=
 =?us-ascii?Q?WAyrWPQRdYvxWeyGCsLN7aDq191g5KYCs0KT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 19:33:32.3455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 152cb57c-53c0-4cab-6ea4-08ddf7b36b13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275
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

The previous patch attempted to skip VCN ENC/DEC tests on RX9000
by checking `chip_id == 0x51`, but this was not robust enough across
multiple system configurations or future variants.

This change refines the skip condition using `family_id == AMDGPU_FAMILY_GC_12_0_0`,
which accurately identifies the GFX12 GPU family and allows
for consistent handling of RX9000 devices.

VCN tests are currently failing on RX 7600 and block IGT enablement
on this platform. This patch allows test infrastructure to proceed
until a proper VCN fix is implemented.

v2: Fix RX9000(Yonjie)

Cc: Yinjie Yao <yinjie.yao@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_vcn_shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
index 61075d8db..32766c0b4 100644
--- a/lib/amdgpu/amd_vcn_shared.c
+++ b/lib/amdgpu/amd_vcn_shared.c
@@ -59,9 +59,9 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
 		context->vcn_reg_index = 2;
 	}
 
-	/* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id = 0x51, family_id = 152) asic_id= 7550*/
-	if (context->family_id == 152 && context->chip_id == 0x51 && context->asic_id == 0x7550 ) {
-		igt_info("Skipping VCN tests on RX 7600 (family_id = 152, chip_id = 0x51, asic_id = 0x7550)\n");
+	/* Skip VCN tests on Radeon RX9000  (GFX12, family_id = 152) */
+	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
+		igt_info("Skipping VCN tests on GFX12 RX9000 (family_id = 152)\n");
 		return false;
 	}
 
-- 
2.34.1

