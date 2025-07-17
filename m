Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E08C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 15:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC12610E84C;
	Thu, 17 Jul 2025 15:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tRPmlxpZ";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4488410E313
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 15:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEIynwIDmkao3J6D8cKOWqgadYTKx5qlK1a69is5MAHh30di1KL2RrN1T7PGNCUkRduBurrB8U37r8aSmpUykUwsbPJot9yh3kL9+hjDhmZjiOBoHvAaNrAGvCh/NSkC8fdQlynUPWxviS8SVcTmD+aYFN2JgUN8gCH0/v44NJh4JQ1kghMNK1VjAp57F6tmPrT63QtkMGPUGSbiaJ4/uDm6JDFkIWWFRxW9Arh33UatUZnqxbfcCQsetdmOD1FMA+1VroWWRhxGQi4o0pIQl92zrABl2nkWuin/EIkpEKuiKK+LpXLJVH5PdqrbxH+lht+xZiuyOlc+Tgw4ngQF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYaibqrRQmdfawEZnNC3HRnLR+hlD+VlfM4dQfSXKy8=;
 b=Xe/36Sq+Xwq2/o7MAnARgixM+RCLSERRlnsUVipoBczvZES0DICRED+JenpEbVqF1jMUmjqLuxqVOA+xZrpTescZfMfRo0aFxjLjKNSy6Cbo18gsToAYQ/lfNMZwJrzy/vkenPRIU5aqCmWiLlX8iJh8zL5OKWeoJ+a22Mh/Pv2+/4y8cNuOyQtY6rN6XpaLoxljpd1epEesig83VmpQ6vBxMxb6sHRn5/qI5qty8A6NRQs1X4IUWgVUSVjaGmsvtURLHH0SwYeQFQLFQjmvy75mToxOK3nOEYwBxGs7kihABSRHNMsAFVAkc52U5p50L4TzIsxCd4EwN987kCHKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYaibqrRQmdfawEZnNC3HRnLR+hlD+VlfM4dQfSXKy8=;
 b=tRPmlxpZmsFJF24jh/PVKrNc2dMJ7Eiy4dZ4k/u8PBFMfWoh1Mr2UL/Om9mJmgekrM5q/NZ4OO24E2WjpuoLCjV2FFZ+Fj6j8leuHfe4mN0I5NJrFCAkELledgNzGNRxCBz2pKHrmbJWpByX3mi7aRPbLBTARi4mKXHdUKNd1kY=
Received: from BN9P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::8)
 by CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.37; Thu, 17 Jul
 2025 15:46:37 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::37) by BN9P220CA0003.outlook.office365.com
 (2603:10b6:408:13e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Thu,
 17 Jul 2025 15:46:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.1 via Frontend Transport; Thu, 17 Jul 2025 15:46:35 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 10:46:35 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] lib/amdgpu: reduce the job count for deadlock helpers
Date: Thu, 17 Jul 2025 11:46:17 -0400
Message-ID: <20250717154617.236002-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b09abe-3a65-49fe-1bb6-08ddc5491c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KTO4e2JEntNsimyyC3wdBCnmPC7vHbAaFOPdNthyN7KPK/UnNBnjgbRfthsy?=
 =?us-ascii?Q?qhBsAdT9u57BHrbR+zAS2Oh2wpROkKf5EXXK2U4qKG3TB4WaQTg9xI1793ek?=
 =?us-ascii?Q?aJ1n/hJiL30PuQ7rxeOM0QWScLCNDmU+OgTUJeGWh6+d4cZ6QN+ZI3bEtlHS?=
 =?us-ascii?Q?uaEucDFL1qht9z7EOwxUFzfAcnFKjWDKRrcINmeHRaX8qhSHXwlHOM2ztrTC?=
 =?us-ascii?Q?Lxjq6M7ncDHzIu/kIaVwVboPG7mCJ2Wn/EJ8yY3ff4SGGLbsu8MgqpUc6qeb?=
 =?us-ascii?Q?w3N2vMIX+hn5vu3IFNYl4KzcvRPMkZxak7EfwN/G3TcFNH1OqVEOBx5ubWAq?=
 =?us-ascii?Q?TfnNFLtMwUZjGM3vOIYuOmZU5oO5h41EbDzJRj0hUeqpIlhydtw7LVmcwuna?=
 =?us-ascii?Q?Bx4nNIzCZ5E2e/3ZKKayfMGVxIRrQpW4MHNlvGbBw2/t7SAUGXC0gvK8IYsG?=
 =?us-ascii?Q?p9gR4Nclau9sUlGM9KIehCZM5CPaVl1B6kXc4QS7e5on099iwx6R3eiO5HLh?=
 =?us-ascii?Q?ZvtjjzRg2QjU7I6/2Q24uwTK5mj6PxG9133aJzLybzPxeVmfH9mYX9+YUbuN?=
 =?us-ascii?Q?NRPW8s4giYmzK63qcUVSuQLOg8KEezanCmmxAVAV8pL5G1WPR3ZCsKy1vXek?=
 =?us-ascii?Q?+O9dGeaEL08y6kHe6zS8ga8kADHmG4FzTApeGO7ri0Jy5LxBV/SV2j8a45tg?=
 =?us-ascii?Q?tzrcvpNRJf/Pr/w4rQ0bNI3hSORr3WlMJhZ4o8PBUnrveWh/cIt8MP37lyo1?=
 =?us-ascii?Q?vXm0YHNNlfRyBbtLktxbIK7+EJFC7Wsldc+/UsqR5Pwk0wguzitJ3Fban36T?=
 =?us-ascii?Q?rnqSy6w7ZFESZ1B75El7jVKWAHocb5SsiF95OIJExt3N3bh4VsG2gkG4SXVC?=
 =?us-ascii?Q?BHbg0J+pZmujY6icf/vkJk3t+y9Mod24GnAe/XSDmfVhoCAespwP45qmeJBd?=
 =?us-ascii?Q?CZ+uUeckm/bgfnXTKiG4toiKUv5bB1Y+/peEelaqTQTI53L7fjScsLJLMotv?=
 =?us-ascii?Q?7r/k3kwsugprJoJvF/4EBQCocR034l9/hmQrkoxPDgx+fa3yt8nBGRLKsH+l?=
 =?us-ascii?Q?bZRE8NCtJq2TyI8WQ2cFDdaNjnAur1CUzgiAKDmO2oMTLO0G1p/SPuJ5ocRK?=
 =?us-ascii?Q?QHfOjgVkgNTrv2MaCnha62Oqq1bBy2Xr6pq3OfNgKBq7uJYvGTCsj5F4ToKi?=
 =?us-ascii?Q?og7mfMfHDQsGTXBQIMD5bi2l/HpaLTwg29giykkFnCyOI6TIDC0zWGXaRZ8s?=
 =?us-ascii?Q?UVuElFMNKjrVFmlNUO/rhB/Ap5LiwICrVQjU0tHdu9Cf/qGjBpdxdqynjHnJ?=
 =?us-ascii?Q?t77pLuKNraDQkLzMSO+BVZ7w0p/n63Qz9mRnpbDEjU4zoo94gotkE4uc3oJT?=
 =?us-ascii?Q?JTcWrzRDZaVDUbz8Fuj5eQeG/N2qR6e9AfLhw133mNlf4rnORdtLvhSvGsnV?=
 =?us-ascii?Q?vHlkNR+cGrnM+ca/WCYhxyWzya5/VIuGKxf/FPz3IHQasHdBQa5CXnGIzVzt?=
 =?us-ascii?Q?D8ImNPCptAZzOa+iqEo14k2J4Qad1QGWtCH6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 15:46:35.7878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b09abe-3a65-49fe-1bb6-08ddc5491c86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211
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

The current limit (200), takes significantly longer with
the improved reset code which the new code just kills the
bad job, not all jobs in the queue.  This leads to the
deadlock tests taking longer than expected and getting
killed by the CI systems for taking too long.  Reduce
the limit to 20.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 49582b6c9..84635e043 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -15,7 +15,7 @@
 #include "amd_deadlock_helpers.h"
 #include "lib/amdgpu/amd_command_submission.h"
 
-#define MAX_JOB_COUNT 200
+#define MAX_JOB_COUNT 20
 
 #define MEMORY_OFFSET 256 /* wait for this memory to change */
 struct thread_param {
-- 
2.50.1

