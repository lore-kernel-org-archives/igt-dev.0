Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500BEC52D70
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 21:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B8B10E32A;
	Tue,  6 Aug 2024 21:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q5VhdUcv";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83EE10E32A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 21:40:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VASzo4J46w8WYQHdJnBgVA0Di1pOGz9JSrSXQ7fQzNXFCG/O90+NEfDvyIBqXOYCUg8fWQvxbl6UWAzuqTG7VX5mWVDOyntwTA/rp2chonbZx0/k5c3TPyNnCtdCz7MmiqUZLMK4OAVsqRcGASysyHL5ePIG6iVrLT0OyeivdTv623Nm9Bmey+sy3n+IDDSHnJRD/cR1y6IuU8hBQoebpLkfDh5BRazlbcLsGY/55uXEpyK5jNrJG1pX2pkrKPQF3upYSjW1ssDABiJQz90nwyiFltWxQm5gIrCX/7nyXgSrAccdG32oSNybOU2AOEJjcw4Ca91iiIKcEWxlJwY9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymq5f64NEv60PXOfatZmydNWpVFOolMyYRSJSW/Ljig=;
 b=J74BXmr/5SyTmD5MpfDHa0Nsv0y2uU80ssdjLN2OJjyJbxMocuG2LcZA19x0v5rUELyFKiCVOdw1lKXbnjGV6jzwHtYLNp+JaATtqxbeQzVJIj/mL+2HGgDN7y8U1RDVFtFWaZ8q0KLVzUDQRYZGYZzyTw+zo36pbhqVt6wEPZrskonHG+J8wIEwSrAIeykz5QojVEZ2/y6dUds1Ip0bxSxhux8b4L8utczgaP02yN75Fe+GXBHBU6t9SMUYjTcxfabK4KNZxWZmnZKC+o79fWcLSTuIf31beKto5zuSM0bJSLo9JqdF1SHmir9H3Ii/Rw8fmHYhiESKzqTdIbfyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymq5f64NEv60PXOfatZmydNWpVFOolMyYRSJSW/Ljig=;
 b=Q5VhdUcvhx5r03J6ULi81Fi84+lHxkr0bLx4yS13lEiKRTKhvppFFm9Wa72hgatOxwm353cOfX4G7s2XzbVeMpxzteeEeWZv1Md7Ysa4FCFDQ+rXydST/S11OFFDQ1ueNHIPMzKdKLNW55CJANsl3Yt0xkHPogBx9EfgVKkAmrE=
Received: from BN9PR03CA0973.namprd03.prod.outlook.com (2603:10b6:408:109::18)
 by IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 21:40:32 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:109:cafe::e) by BN9PR03CA0973.outlook.office365.com
 (2603:10b6:408:109::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Tue, 6 Aug 2024 21:40:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7875.2 via Frontend Transport; Tue, 6 Aug 2024 21:40:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 16:40:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 16:40:31 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 16:40:30 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse Zhang <jesse.zhang@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>
Subject: [PATCH 2/2] tests/amd_deadlock: add bad memory test for compute
Date: Tue, 6 Aug 2024 17:40:27 -0400
Message-ID: <20240806214027.280549-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806214027.280549-1-vitaly.prosyak@amd.com>
References: <20240806214027.280549-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|IA1PR12MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b008811-95b4-44e1-9ee2-08dcb66065d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+WtSEi3k082qGNCZkVVVujnk0BFJbKMJx9hSoO35X4VghPXRr+N6KSNSkEr7?=
 =?us-ascii?Q?/J46pqfyy8YIUWftje1aIQUSof4UZdF1G6/X6m37hRc6KhWRQ6hltKUHO3Nn?=
 =?us-ascii?Q?V+MKK/QVrxz9SLQK6ZIFvslgbSwwwO2vChJVjufFYiPb0kaWXYrHdV1njxen?=
 =?us-ascii?Q?5kzhFdPZJzEMPipMWhqBwcCBCMqs4HOsruKv8OcExj1wWRt3GCiccOAvYvp5?=
 =?us-ascii?Q?5poErQjS0TOhR4V5tGNc1/EBColxzWG9y5bEjoi0gW/GuasEoptIDo4whxEy?=
 =?us-ascii?Q?zyMb9wKINDe2wPpaiwrRP6vINSHGLehJeWqq/L+HBQlm88wiTK8LLteijRmh?=
 =?us-ascii?Q?ZqIikLxkY5MdkxrLhJy2H9jEfK+j46OJ+4E51AjNinKYlS/EvYtAzxzaGSR7?=
 =?us-ascii?Q?UXMCmZEhkf5ghmnzkHxNflHpHRxY9DUs0UHmKO76ShgQk3xTSYmN+OMaEmtu?=
 =?us-ascii?Q?QZuCdt20V9bcl8IL4qCDzr+68iwGi+Khm7k3SRbSqjRZzSEcMmsB/bfY0JZI?=
 =?us-ascii?Q?qQk2I09baZHsKLwUUhji6aojUNABuqzTS+jRSGvkEoy6/SV1LuefLLRbwiKL?=
 =?us-ascii?Q?mgs4x0dMMScJ2iiAPsxmvmWtTrRNjaEj3vw+so4WoMjzzOIGEstyNLRADh7g?=
 =?us-ascii?Q?K7P0rWiqm0R63U4aBvYi/Y21EfNa6/ZURrgOlG3RhBo/eQ7CBgNPMkP/Lg2G?=
 =?us-ascii?Q?GldS+O54lurHUgHhWureeVmhk+8XdoATqnMxBi1TuOisqEEnwLjbX5qnlPB6?=
 =?us-ascii?Q?6tXua9FjwPuJ9Jp4jQGcjkspFZNecBCAhkfKVY9i9tM0Idr4jBCD9oq/SaVO?=
 =?us-ascii?Q?4D4CqQzjr7+PxE/R1NxQk/+Jqes8NqWQ6Get2hsCLw+GMpTbMFjmQJy31chf?=
 =?us-ascii?Q?krNWZrO6oxooudKhEkeqtDdvqndkca6tnHCVAOu1UaLdPeKaGmAOVfBgPMqn?=
 =?us-ascii?Q?lo3tZeaDmipEsXQTPOi2WxGzEHsQD55Q1OtuXSArJmryrC6hpENSTHKJvhJ3?=
 =?us-ascii?Q?8/y1gwvuydYET1zSGX9PHQtPTxA27z7ftGSOOxZk9JItaD7X6KCOyCaafCvJ?=
 =?us-ascii?Q?VpRx+KgxgKcw22SwwDIVakUgIuSrMKGhVTlK5v6pH0AJCG8k0quxXYQClhQg?=
 =?us-ascii?Q?duRs1lF5OtImb1tews6EJ6Hd/GQrEzJV5eRZpqgfXyY4rNt9YvMETYX7g809?=
 =?us-ascii?Q?Mql2gxyFATf2UNuWtjj7gLf6QqVaoCSj/fpGUvRumMjYzNlKCfHCGFrt/Ixs?=
 =?us-ascii?Q?rKmm9/0OIel/HHewoeRYgpeCitQ0/xaIEv8moh29YOTYG0JNUZdqokAou+CN?=
 =?us-ascii?Q?X9304vZUo7EuluXsV5KceeAFf/uThmP/z/yBxoC7RLN1Fnz80wWgtEn6o7im?=
 =?us-ascii?Q?g0m7VKPgFkxrHOvo/1j25iHcUar+WFBV08H8ww0x32gvmShw87fBiXPS9Tw9?=
 =?us-ascii?Q?szXZymMjeegLfJsAEIFuO1d0nMaZA0Tr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 21:40:32.0273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b008811-95b4-44e1-9ee2-08dcb66065d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8466
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

From: Jesse Zhang <jesse.zhang@amd.com>

To enhance the test, add bad memory test for compute ring.

v2: Replace dynamic subtests with igt_subtest (Kamil).

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 01185bfd3..52ba08494 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -94,6 +94,13 @@ igt_main
 		}
 	}
 
+	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
+	igt_subtest("amdgpu-compute-illegal-mem-access") {
+		igt_skip_on_f(!arr_cap[AMD_IP_COMPUTE], "SKIP, compute ring don't support\n");
+		bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+				AMDGPU_HW_IP_COMPUTE);
+	}
+
 	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
-- 
2.25.1

