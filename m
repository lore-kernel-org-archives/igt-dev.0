Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DC8C369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 07:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8177310E7FD;
	Wed,  9 Apr 2025 07:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3m+9AR3l";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E2D10E7FD
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 07:57:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoED2lXQW9n74496PiqgzgrMr1bd+wEbobE6KV6d2P6kNsgVnzbQ6WVL728s0JubDgR4Q9SFgWd+ZB5uK1LxGWOr4TRt71eKWMSnMl5+hmC4ZKlyD8C5DD/fGe5RvBq/KopzxLifdIKzNf7JVReVWGFOuJZvKuS4PFUeTiOzvUssg9DAZNqlR46GLIpA+QOiOKkGdcOzi7EAI44ZFQ2erlm6oO9mH0A+9546/RY0qwgITWLT7H2hkpnluG6a7LEvks0q36XmkOtyTSDPct6uet3IL48foILv52JhUNfpOUEiGHvwq34rYOfb4gRtwO+rkHQ2pBJBqpAgfW8h9BSLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hyPmALCnQQv6WJXVFuwxqEJg6ggjXqD3EYIUStY/KA=;
 b=JbQOCFkmj4ztOdWsn8H6sSMiY9gcywBjQKh8bgb0oeZOhkARfB/nFFUciMLq1jMu2fQHzxKTVTsKxVLW+aGH3P+jr0d+PRIwp2fDW5qXs93Z7E3fW8oFX1qxwo4kiWn6mdfJ6qPGvRbCqZmXnNEBB2PCfNN4pvcsFcK6k1C5tchmHltqqb4D3wnGiMQg9Lx/Lga2RZIpmhD8yl7PJXnKgNeVtbVuojTdvh4YR6WmC8eCVbDBMN0aSY3wlNWpMrcJdBNCP8Kp+/a05+Y9+H/oytNo/EknKhmjUTB9ER789emfnQBKHm9hJRkxZ+bFAYsKnqGgBA0iCmPLP/d+Sz4NNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hyPmALCnQQv6WJXVFuwxqEJg6ggjXqD3EYIUStY/KA=;
 b=3m+9AR3lBWST032+b4/7jxuYZ2flXgYp56txZOGmYt8NxGLrNi2ZYQchj08ADTn9z2eZ6l2fv0jKYAltYGYaNOweq+5enrmDRV4RZj4TJ+J0RHIYEB5xbABSU4zUi7muFenmpiLJ+GMFsvP2ze71iSv+X8IXxBrgPXNWEimMjDs=
Received: from MW4PR04CA0066.namprd04.prod.outlook.com (2603:10b6:303:6b::11)
 by SN7PR12MB7022.namprd12.prod.outlook.com (2603:10b6:806:261::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 07:57:17 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::ef) by MW4PR04CA0066.outlook.office365.com
 (2603:10b6:303:6b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 07:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 07:57:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 02:57:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 02:57:16 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 9 Apr 2025 02:57:09 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, <prike.liang@amd.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>, "Jesse . Zhang" <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 3/3] lib/amdgpu: Add encrypted flag for secure user
 queues
Date: Wed, 9 Apr 2025 15:56:53 +0800
Message-ID: <20250409075653.2502119-3-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409075653.2502119-1-jesse.zhang@amd.com>
References: <20250409075653.2502119-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SN7PR12MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c8b0b9-3fe3-4b8f-ed73-08dd773c2596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xlnaGN8d/T+lq+Zc0L5YMxOn6ahU7K7rYHCFRcMtE9T3aOCI57+zVh/H09V6?=
 =?us-ascii?Q?NmTr+dXFIYaJ32VbqmT3Mdtoa/zu1W8HrFgc8TlYyk7oihZn9wLyz8EQl3Ww?=
 =?us-ascii?Q?jqCfp4QzziohSzmq4sVZ7nXcM/5o+mWR5MrnyVNEq5bAJK1uKnmYsZKkpvUS?=
 =?us-ascii?Q?vMyCtV3sKn7mPAcdMMDXTNWwXVdPExBh5IbDeQGgaHUiKD/xbe9FKThu+QzS?=
 =?us-ascii?Q?D8PRtVCiNDyyjLNeNjzmMUoZPHXHQHwk/LSCBiH8C066t6AZOhf+tlNRpYyL?=
 =?us-ascii?Q?RDN9/BWH1dHWBEInEgfWiuBk/JLa/k/vwK32RUVSS2qSWGNP54dEOg2+wKWj?=
 =?us-ascii?Q?SK6BNCfw2xDoYjx6KJ26hRzT+LqU2vQzijpdxkmFZvpxXwDiZvMkYg75xQ74?=
 =?us-ascii?Q?jJ0twK1+OyzGiXfsen4Xb76rVZGPtsfJxtiFbS3AJATeYfjrVE4g5YEQR6rb?=
 =?us-ascii?Q?3vEYyJVlOQfCygqvlnV/tujrbx+Oh9aU3fckj6YfAIVpJSWgclnX2Ie0yY0L?=
 =?us-ascii?Q?NpoROLTccSijXIUzIQ2133mSqoKwsszd45k0GvwBJRVsg9K6CyELlxUgnu19?=
 =?us-ascii?Q?VEd3NaMNRUaqRVFT3UHSwfn7hR0mbou7HR2lVdWGhHYzF4Fwwk/LwMCpsubt?=
 =?us-ascii?Q?Qi7PedtR0e6R6LbtuKmcjqBjOl4nEasYKAzBB3BMPp9cEYXqBNNbG0Csh6Ya?=
 =?us-ascii?Q?/oHSbA2dFFwA4UJZYktlixET/e2Z3NPP+znh1JfiLf7aieeijz5FSIxi0DBt?=
 =?us-ascii?Q?ufoa6Id0hPV6nydOrrlrd3Q6fbGF5mB9Zl1q06zGBKxhvKiM+nI46NIv9exZ?=
 =?us-ascii?Q?PCcfRidwsR/k7zYONDtIUzM7U3jIZig2KZaj4/niTolSh3tuOZjjjowijP1L?=
 =?us-ascii?Q?7asFYSa5/sQqATsG4RRsV9s7GV35fLfRd9Zp6UkMdnPLMk31HjW9V9V5BzQq?=
 =?us-ascii?Q?FJ09+6l5mcr+eUUh8PULOJFo6dMBC6jOXJJwS866RX8yevP+aTrPxx11Bpke?=
 =?us-ascii?Q?Jhbib2Xp2RVHiShDg4MIuyh6KuaNRNbL3uEXOkDTODhG7bgROuN/XZjRGH1/?=
 =?us-ascii?Q?IEr+0KKxWeuE8eUkbBfsb/zUBcNIIs+Z1VJ6XrOYMWgz7RxMotnbk9+3r9oa?=
 =?us-ascii?Q?mT+Q8dZw3Rvxx5ezjS/soeIrg2P5/m+VKRVViQfvnuKuuBqnmJpDAGnJp7cA?=
 =?us-ascii?Q?u+PLD1tZkVH2l/sDjxB1Z2+wvrwc6tkMNmO/dNQpjnduFnCRXaGq71WsHM5M?=
 =?us-ascii?Q?TZCrPMRsnv0JkSZfOdz57NKcEONz59lE1PUedqlm082h+U3nXavmPqcg9MCV?=
 =?us-ascii?Q?jg3LxESHkOX8Pzyz+Ah83e/zQJGWzirNnQuAZkRb/DQ/jmL6P1l9zPD4zmSu?=
 =?us-ascii?Q?sHddxSFMvk3v6Owitqdmq5sQ2XTj1cCB8XpSoHqctiYscrGXanWp9xKOldUD?=
 =?us-ascii?Q?iDKeuWpHfpgIIAtZ9u1CuCim7diYZ5d5C2Af3pT6an84XEB8mJd2mvbLiZAl?=
 =?us-ascii?Q?vu1X55/qWGVNK9g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:57:16.7463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c8b0b9-3fe3-4b8f-ed73-08dd773c2596
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
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

When creating secure user queues, set the
AMDGPU_GEM_CREATE_ENCRYPTED flag for the GTT allocation if the
queue context is marked as secure. This ensures proper memory
protection for secure command submissions through user queues.

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 lib/amdgpu/amd_user_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
index 361f5acc6..0cdd0c4f9 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -281,6 +281,8 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 		return;
 	}
 
+	if (ctxt->secure)
+		gtt_flags |= AMDGPU_GEM_CREATE_ENCRYPTED;
 	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
 	igt_assert_eq(r, 0);
 
-- 
2.25.1

