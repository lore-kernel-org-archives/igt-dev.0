Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E98D172B9
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 03:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F50E10E217;
	Mon,  2 Feb 2026 03:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L8VKVKjI";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B44710E217
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 03:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQFl/ZPwqeIH6RQVy4Dh5Q8IjREhfYwJ/nMXTTrm4h3SGnLIUFFzFRWcFfeN08NRSDj81z8fnNEBXKLzC22QQn9uGHChDbNzM1NvQpBMzr4Sc8FeZ9AwaETPs7qnAAAqPvuCL01tJX+5nhOJes0XhCYFap6mW1OItx9LVBLAzs+3FkuJCjF+b8TSiUHwJq/PToKCkFgU8SLs9J4MVy9WBDOcBefMVtT4SAox6sk8nY74UhZktmZfn5NscQ5EvfjLc5Dz45erywPlwRKCd7rkZLFat4Sq5zPyA1EuNo/NSsoxBVQNixe0M+ZoXnqyRBFju5RkWjNSG12LkIeU7oxAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcQK/jugBrSV8F6XTGqcnXKPplftLuA5X1nBbWv+IZA=;
 b=mLbZZdvwl5KECstPlnK8pc0tGmjurKcC4E8JdW9kSEGjKXikG4+yQivEaSgO1fl9GfS6d9HqJevZMWaQDLm3ufMSo0ObdHLgOTIw2wA058QdRREfY52itrO4HURyQHAK9OygO+3reqzp/vB6PAqZi1aLeK7Pi4zhFEgljt4V/oYiBVW/nfFoFeipeB81b2NqgOdeL9wM1D1mTVvOOXOqbwHe49qCXUwCCJfG+uYChPBx71HW3sIUa34g3tnqu/mMFvzQ5UBDa/tdNcrvzChi66HKPVjkPTU+GlRMhQp7VDdxR0uenKORlThBnxR1eUTIGkKEnPKnVrU+2Mqp4ZRRHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcQK/jugBrSV8F6XTGqcnXKPplftLuA5X1nBbWv+IZA=;
 b=L8VKVKjIMH8wbh9a9kcTKN5mqnLeLvfBAWqMjgQgQI5kyuaVUIdDSGVa/1f0XU4Og791LZkvzsynPaj8HZPhQY2YcnMCcQ4oEBGqtRqa8Vh7qrVKtv/lhSN0/8SvvVcewEicRP7ljSDcQpBiDmKsON2KLRP8GU/Oh6+fuFQAP7A=
Received: from BN8PR04CA0045.namprd04.prod.outlook.com (2603:10b6:408:d4::19)
 by IA1PR12MB9029.namprd12.prod.outlook.com (2603:10b6:208:3f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 03:01:31 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::69) by BN8PR04CA0045.outlook.office365.com
 (2603:10b6:408:d4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 03:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 03:01:30 +0000
Received: from rtg-jaguar-KRK2e.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Feb
 2026 21:01:29 -0600
From: Tessita Thomas <Tessita.Thomas@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, <Tessita.Thomas@amd.com>
Subject: [PATCH] lib/amdgpu/amd_mmd_shared: Fix VCN JPEG submission
Date: Mon, 2 Feb 2026 08:31:00 +0530
Message-ID: <20260202030100.453795-1-Tessita.Thomas@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|IA1PR12MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: c36f9f25-5a63-4d12-fa16-08de62075d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4x19bmesjFH8aKLTh3zryOLAWzND13EfunpTrGo6pvKeST4ILUmoMtxVK79j?=
 =?us-ascii?Q?viqporLHx/G8aVBCvUmnmDQC59u6LzYvraF4In0BzKMarR4Sl0C+rWZkcmoT?=
 =?us-ascii?Q?VJCUILDOQw+ujTy1PlHNIZLanBYyC8qfj3/+8sByyyKOoxKzLStRyyexZWgy?=
 =?us-ascii?Q?nzgxfJMrURQSSzWdHIK3pk1cCUefFXE0YHq9228LgCfl26qDvBGNMaibWNCE?=
 =?us-ascii?Q?x1LE/vszwpbG3GGv6jD/i9da2XvIpGUiTcJnsi4NVB4Kuj1IYB4NKdRfODgC?=
 =?us-ascii?Q?wK3LhPR8wczh3ekqHRyVPVvRgFHd355028u4Az9vCj4cyYrNxpTH0H5bwq3Y?=
 =?us-ascii?Q?d6qeI0GwkwRIxLhGdodgrsxgz7hO9dPEP5DSrOr0BMwaIp3no3IQThp6A0+U?=
 =?us-ascii?Q?Bl5TUBB8Iwdr4mNjcQxQZB1+dloy9swsuG7ZGGaGbh2JDL6PLY9+moGXHtgQ?=
 =?us-ascii?Q?dvbyi+WSzhdy3nvGtYNFr+4hGz94lJa1Pz0lJ5YeK4GA/vnCZCGurd5sm2MH?=
 =?us-ascii?Q?LkKJj8g56xeSqWSvxGY9g/fvormHKEHyOdSBmVUJ1v+AGv1CTLCXiSY0W0cq?=
 =?us-ascii?Q?Cs5WrpZrO7dwb0wXM7qYH95ysdmbmQa3FtotN/Slz7HPNKytfqq7xsOQsuJ/?=
 =?us-ascii?Q?6ri2J0kuhIc5o7PqsRMTY0mo/A2Tx/YzhESUcCpJj8yHz7Ohhpxp6jspBjC5?=
 =?us-ascii?Q?AurtVG4ZjT0lur41kMRdGaqJjg+cTkH2MQQcIdyNZBi90mAgTLTcBCn9FDA/?=
 =?us-ascii?Q?1tfeIr1IR3jUXL2B/kFEriBye+yWrjAZoiDFC066L16tWjwz9mCK26bBgjVL?=
 =?us-ascii?Q?n/dt7e0fM1eaQ0il50PwrY5Muxp6ZZa9iwQVXj/bIqtNtg20HHy2eXK9LeNF?=
 =?us-ascii?Q?C4OHWEEHrYeNtobRi38TxesrsIqjYiWZLAkOuMCLJS1pRMGPIlTpxrK9GscL?=
 =?us-ascii?Q?A1pLEVsQFAkRZz07LukITaGWi+gFtZNH86OiI4FroYES5tYfiI7i83PH5a1/?=
 =?us-ascii?Q?FW8wBBRhjfC6kV0klD86duZqzw+PEnp0jCjmaxYd2pOiJVFBmdl7kfPePNYM?=
 =?us-ascii?Q?vGKb6s99GTDz8nptYD3fGGp8C68u1n/AEsOZk82ttiH3gVpUwFsJSueJyUOW?=
 =?us-ascii?Q?l9IIJ9d6TED2s6NoSf9WIfKEra77yS/PzFLIE/NNQCLHpDk+UqyY+iNDncxn?=
 =?us-ascii?Q?Xc3PnTdSq5KMJNQ6LzijnWLiGkip2BjkAEXQK4ga3tcDiKly8i0W69IMbglv?=
 =?us-ascii?Q?GYbJdgb8niq1vLMwX17O/7imYcpxnXXzs6LafjhbI2AwRldibsTQ/OYI01q6?=
 =?us-ascii?Q?AaRIZMxh1X4jbBs8wpPdwQ6Zv2iCpYkd3l3lwU/4agcMYq0F2Eyetd7uuhif?=
 =?us-ascii?Q?06u3jWbmI3PMhyqkC/2vHiwwjSgp0h1gNPBpu64dnjTUE1fHz4dIafk5lblh?=
 =?us-ascii?Q?NG79fCDM/fN3+xvwh7Fuo0CnFEFuJju5zl5u4m7Yv1DgBVC0t4sS35dZDeSi?=
 =?us-ascii?Q?9willDuyMtABoQ5bEoRfKH0LFDnV2xDpt6+yFo1DfvjdXUkhHFgNke8kRE9x?=
 =?us-ascii?Q?cs+UxmcS+jzRmK99OngpizT39pLvRRt0iqEMVByk4GiCQMypL9sAIn9VOWzq?=
 =?us-ascii?Q?HfNMtn1E2eaD8aRiHPmGx0Vtx/jJG5cEvK5S3UnedgI9VPGAdYY3afJ5RdBI?=
 =?us-ascii?Q?u4BVeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0v2I/AgMq/OS7WrdwigEPQBUyXhZiDfcJSIJMEkqD51EuHvED4i9zaEDuw80kxIjcOCvarHw2RPdclm/F+G11RCHZ3Ea5zb1lQn5U3rH9OoavXTBq7e3YtjBWPqe5DpgFnT5twsYpv9hPSByBw3ORP4860/EQLPJa+slBEuqalYQaYYq2izNe6+CsmuFYV4qiDzwyIwHjifD3Q6+nndoUsZ+/a4H3X8HsD8HV6Ipd3JO1HYzFUtv/mTIKKKu4NUuDamrRvqqiBzFCZtNA4PqjmVK3lYZLaIJ92t0MxphZxki+HWY2xRa46IsR3eAaXnB7Y5GH/7LWPCe/qP2Pe5q+XCA199jKHyuQcZXhknGieSXCtrED6YyEALT1oJUrZ3kX89jPnvzn3tKNnzc41ILxnF/z918gNXVoIvW4ePvaGygL00K/SZTLe5W9JYaeRw/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 03:01:30.4639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c36f9f25-5a63-4d12-fa16-08de62075d6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9029
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

VCN 4.0.5 requires the IB buffer to be aligned according to the
hardware specification. The current IGT implementation does not add
padding for AMDGPU_HW_IP_VCN_JPEG, which causes submission failures.

Add padding logic to ensure the IB buffer is properly aligned for
VCN JPEG workloads.

Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>
---
 lib/amdgpu/amd_mmd_shared.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index f504db596..b9eff16f9 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -161,9 +161,22 @@ submit(amdgpu_device_handle device_handle, struct mmd_context *context,
 	struct amdgpu_cs_fence fence_status = {0};
 	uint32_t expired;
 	int r;
+	
+	unsigned int padded_ndw = ndw;
+
+	/* Pad IB to 16 DW alignment for VCN JPEG (ib_pad_dw_mask = 0xF)*/
+	if (ip == AMDGPU_HW_IP_VCN_JPEG) {
+		if (padded_ndw & 1)
+			return -1;
+
+		while (padded_ndw & 0xF) {
+			context->ib_cpu[padded_ndw++] = 0x60000000; /* NOP packet */
+			context->ib_cpu[padded_ndw++] = 0x00000000;
+		}
+	}
 
 	ib_info.ib_mc_address = context->ib_mc_address;
-	ib_info.size = ndw;
+	ib_info.size = padded_ndw;
 
 	ibs_request.ip_type = ip;
 
-- 
2.43.0

