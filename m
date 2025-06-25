Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB17C7EE3A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 04:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A9E10E65D;
	Wed, 25 Jun 2025 04:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DJRQ/AYD";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF1510E65B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 04:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fD5xxwJm9rnuwcQnzg8G48rHxpanwFRA8c1C+oLuTnClPD5CaGGCWse8hmr6OM1ZtcP91/Tt8luumw6eaBBsX5rDa11D/H9EfJpCWiY7J9HhKw5e7cchh1L7ij7mvoVe/vtR+A7uwcZ223SNBSEdDZbWshZpMuDzvgzhsKKSoS6+KwGMhs0mfBJa5L1qcMLIvrE0/5wd1xrYLZw+DH2jiwALMM6kL5jTCojGoJ2bTEUJmGRI2CtekySHm+qgJGx79rETVTBVr7kg9DQfpyiHwmtAeCOerpRBzfvdidsRNU8/nvUcnzf2MsGosU932jlEk2xfaVJrPIh75FXwIIKiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FymMN1Xn6Bzf6+s4ONA30bhK8TiNL3o/WdE+CJAJ08=;
 b=mn7fGKXSXQdtLmxVoYrirPs+1AaINJBzSR+YZrCA4hKazCtsm4NFeXdQUEzEQ5yyAy2gHJASR9sRb6t5aizbAvjqhP8wRpuyNUWQe/MZNjUh5ioG/8smSzKTGeV6tVCkRdsJ/0+FFSwVyoQ+vZkfXreWomBiX2xPt2guVR5ufsdonlr7CvbSzOFeMf2nYkbWGbVewjwLIPiHNxX2KDo3GwnFgsg++qQQjZCb4xuxrS/f//TJZmqIdwTbFSt2IVRkJvbhIARTAtBJJ1MjgTf45AffvpKOEmUj3Wbjg7Wse6rqAa8xznL0fmhxvi1NXKBDGpInfHGGK4QOeMBBKKOFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FymMN1Xn6Bzf6+s4ONA30bhK8TiNL3o/WdE+CJAJ08=;
 b=DJRQ/AYDUwY9T9P4+x9eBOIHkxxkbMjyfL8w6I3JI7tqtvccKzurSCrvKzb4a82bvTxolWxXCiknTw79M+fXNoP7RbkNysAqRfcLTSLLozPYcdi+qVjozSqtl1Y2sZrTEOuAjikWQRPLv5cTtEfb6+D7ANTLGWQMRJ1vi+P8Sqc=
Received: from DS7PR03CA0154.namprd03.prod.outlook.com (2603:10b6:5:3b2::9) by
 CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Wed, 25 Jun 2025 04:21:49 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::7d) by DS7PR03CA0154.outlook.office365.com
 (2603:10b6:5:3b2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 04:21:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 04:21:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 23:21:47 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/2] lib/amdgpu: fix valid error codes for deadlock asserts
Date: Wed, 25 Jun 2025 00:21:33 -0400
Message-ID: <20250625042133.6609-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625042133.6609-1-alexander.deucher@amd.com>
References: <20250625042133.6609-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc09bc5-54a3-4251-5c54-08ddb39fce29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/oYogoRPwfGF07+/nWBPWpJrmqttCSHphztfb6aIjYmnPrEiFygGyDXj4QB7?=
 =?us-ascii?Q?6s46pJtCCESKifrmMQjde8SW59LhdvKwc8T1UvDv4dYPSb8Tl8n/n0S21fa9?=
 =?us-ascii?Q?7sbPfJUqbcpK9ftRBs51PanGQAw4cjStQBVRmmeICP18hJ9PYnLYlS/Ma7l/?=
 =?us-ascii?Q?sCOnpDSBwheievmdb667v0lTSYBEAMVeOOYmTEpOFPE1XZb+N7+PsnD9R8xq?=
 =?us-ascii?Q?rxMOhw/TmugfyiW9qhcbtmkMBviDoAX2Gk0RVZqd1fJ7GbfeYs3AlrXbh8MF?=
 =?us-ascii?Q?T7mTToZLbre9et2PbPlYiKLE3BtQQlNjAyMInwpcOBdRqor6o4f48e0l3sQk?=
 =?us-ascii?Q?SrWjjPPgS81WJklqu5Bxj8mkxIOQW8tDRDMkHhupCXLc5PDDWqucjOh0A3yl?=
 =?us-ascii?Q?GhRNldKrtW8rVUxS7MZTkC2EP2evOWHqqq3m/3DoJk/E1UuVg/yUXL1plVao?=
 =?us-ascii?Q?AFzPj3Se8DHkoUe9azeBF+iJEnyG6ngudIPH9szQdFPnIhjy5YB7qx8lit1W?=
 =?us-ascii?Q?Igvph+a5lPiZ6dko88JYVKg51vcn9V7G5CO/59m0E+spEV+fZSOKY1zzkxbB?=
 =?us-ascii?Q?/fgNGL0/tobJyT2vXQWQrcXGMRPfvgGQ8bG6wcOCtJTfvrkHejb+niFW8QqF?=
 =?us-ascii?Q?skrHodd+4C67RIrSm/1tqEdbcNll5q9ZhoppQRiNdyxA44oZhkjZgrxVyK1Q?=
 =?us-ascii?Q?2CKezohRedpjwNb2PkZyLjEPz47v/+4h6RD4x5Qcg/p8X6jlAABfRlR080j4?=
 =?us-ascii?Q?f/TnlhmJJmtiK1N7aI64IzEx+/fWBni3RSmUQUeIP8cZRsgJfah8e8CnudmC?=
 =?us-ascii?Q?7bsMatnwypxb82YcFv8w411ZR1hfNSbtbR3h7jYEx5LsqY9T2nrs+YlAjfpm?=
 =?us-ascii?Q?4j+JlZpY+mLSeYBbaFwaqYdxTFuqXVBwpKhWnpjAsQ10RMxeXcELipIQ++Xz?=
 =?us-ascii?Q?9k3Q7V05Ckbk3/Qp8R8Uq1YqW8f+dgk2DUit2Nigq5v7k82+EKXdKfeqK7mT?=
 =?us-ascii?Q?8gNQX4Qkzahkt9tSynq/oafFV0NKgvWk5dT9AQtVRNL/lk46mBz2zneqtREo?=
 =?us-ascii?Q?hOMQwLutFyBvpo6v17f6XyFK4alJ9+veAvSNsH6Achd2MdbnjnPchm1k60P4?=
 =?us-ascii?Q?Gg5DyRLJj1D+qZQ14d8jMpGKHSfA728R+HdVv1YaGgLKMMnJRr2UTDpeXiv/?=
 =?us-ascii?Q?r26iSvJF1TnsMgd80uJ8dd6cOWNUo2Sz37H/Dm+5wqXXufiQ+tfEOTBTEqJU?=
 =?us-ascii?Q?iokCi0YFDxexTdsFcKVatAg4bMZsTnArZpFA6uZtJlFCeh53rs42AJVxWELq?=
 =?us-ascii?Q?lBW+DHXqy/7E1w8LL+9uzFYscXbrbcB9XTgaxavIyHnmUsQ4cxThCiau4OQC?=
 =?us-ascii?Q?s+fXfAxzHlA4TT2zUE+r4DXbegTBKliuQKZ7o4v1QQYmR1VC8w3Llo+BfneF?=
 =?us-ascii?Q?Lg5obnhUf4yKQxlOzIPEG7TAOgis57l+m9kRJZs43fzrWnQYnUREnADKxFhS?=
 =?us-ascii?Q?DRbad06LEQD+sUXxobJwWmVRpn6eBxe3Lhg2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:49.5652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc09bc5-54a3-4251-5c54-08ddb39fce29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431
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

If the job was guilty it will return -ETIME for the fence,
so add that.  This fixes the deadlock tests for per job resets.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 0cd83f061..f7845edb0 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -164,7 +164,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 
 	r = amdgpu_cs_query_fence_status(&fence_status, AMDGPU_TIMEOUT_INFINITE, 0,
 			&expired);
-	if (r != 0 && r != -ECANCELED && r != -ENODATA)
+	if (r != 0 && r != -ECANCELED && r != -ENODATA && r != -ETIME)
 		igt_assert(0);
 
 	/* send signal to modify the memory we wait for */
-- 
2.49.0

