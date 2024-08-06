Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F493C3DA64
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 07:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB1E10E2FB;
	Tue,  6 Aug 2024 07:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s9aGUonO";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD9F10E303
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 07:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAd/u35ppz3FV5sood8IMkCRgPrQ9hN6ZhWbWoweHo4/tX5dOeQ7cT0kXxY4ZBSqzv9t8igerNQ/mz2tX2TAKo+LLPPoGc3Q4yUpWXWMjbQZx86IRfgouawaIIBYKWKGrWWheZNwHdl57qtveVNqeJZdLXRepT3ZD1Y+jwtPPaf+6vQcGUtmDK0IcyiNEt3fDQ2wHTKibbFZt95mkzaioAfH6Z9idwR1JbOKazZBsYU5z9GCwS7dR1z6mwj3IcK/0B6027NlXeg2tI08P63X+Esg4wNevZzehRnpMNhR0zliKqUAqKaMoDlPQX6ae749yMlQxT1NtYKOz/PCNzuqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CU3w4NWPJQTY7EJCFf76ruFtgzUulmxE9OU2x9D2F/c=;
 b=yCOMHk0pqnpUkHpwSMX+mTI6SU0wfbVW14L2dkMfF0gTDQK9e/jRrPqt76klxjScD0BW9pB+DNnkmzzHyqdyah0q45q2VUbLQpqdS+HXwZBNDGpUVLOXLwWO4+AZDrpsG4lFPGhxtnIpmpJcTYBJBYgkaP38ExbeYi9skuFIdlHs6k53+1OOrrtci0lKhpPhtnLOGrn4nJ9Lxl/DtQ39rH8/tZ5Je5OAi+eplSizoCsDcykBHdeQtH2wgcLJdubv86sO23bTZNawLsO26T/014f8BSXnMU1pZ0XhQbLULXWHrRGC5hlQo+Q8A0W00LHSFowEXkJLdAg8bq+CfCBDuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CU3w4NWPJQTY7EJCFf76ruFtgzUulmxE9OU2x9D2F/c=;
 b=s9aGUonO2WqnbVmHhmWWerKdKhuWMA/PdAdH3ya30gSv7/y6b4FbT2BNphblXCkzt7nbRrrPRd/XE80Apk2kfGzh6gnvbndSjiWV6Z7McO0FpakW7SwUuYczAoLNKetHJ0CgvKXI3pLialL1qh/onw5ExuJ6GENJE1r1Zoel5ks=
Received: from SA0PR11CA0179.namprd11.prod.outlook.com (2603:10b6:806:1bb::34)
 by IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 07:06:43 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::ce) by SA0PR11CA0179.outlook.office365.com
 (2603:10b6:806:1bb::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Tue, 6 Aug 2024 07:06:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 07:06:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 02:06:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 02:06:41 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 02:06:40 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t V2] tests/amd_deadlock: add bad memory test for compute
Date: Tue, 6 Aug 2024 15:06:34 +0800
Message-ID: <20240806070634.2444558-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|IA0PR12MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a83ae50-9d01-4764-7589-08dcb5e6536a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XXQcQbbklr0DdNNQ2i1RSYDg0Ab8RhH8At0INusXF2DLy0x0382s3GGiH4pl?=
 =?us-ascii?Q?avhhMVRsNykv40IUBpjn3KUEExcOmwDDWM1/6qWTuQMxt3Kwv5WAokWP9rVt?=
 =?us-ascii?Q?9thQbRrfDtH5QkboloQh0JzLqzvl8jcheY0DtDkuDA+zmhfJfkl6NQSJLy+Y?=
 =?us-ascii?Q?afJVSx50WMBuRL7qdxG8EKZa2k6k3yw+d+oOJYQtbmb9CoeJazPRomTyZetJ?=
 =?us-ascii?Q?b0kyn8oOHaaZKJlSuiX7HTtkKW/w5TTiI6aoaIylaT0TZDZfnGzQstcg/Gun?=
 =?us-ascii?Q?eDq6HSoPWbQnTbWmBULINyyYoqEYYTHLkabeYb05aPuVnQOjRLBGvQXotsMa?=
 =?us-ascii?Q?Y934Ea8nf6IDkNykNvdGMDj2q7BmxuEF6konwW8bMOF99+o5gh93I2eG/uKZ?=
 =?us-ascii?Q?Fk3AYufw6PqH/r6kY65SJg/Q+yR80fRjU1y9+vZrzz8G1uoQHxJ9iGSuBufu?=
 =?us-ascii?Q?LPXMphVTRBe+UHMm1bBsvlI0geIY9Xw5ipitnefZdrNlfqWViEwntPMSNqWN?=
 =?us-ascii?Q?1mWhFwB9N9CDg5NiFhvpgqOE2btNNvXzjzrb5jOEKtIcJFbzdP5z8h4+6aFN?=
 =?us-ascii?Q?+XnRNz0RZOqSohbhSJ5Q+WQTgCLoDD8yGV1MIrlcwUvpXFCFlF1jP5nw/qbj?=
 =?us-ascii?Q?h1d6X87in3dMlcr2q2dikbEwWhDQFQsptNHmOKS1mjnTbew9RSSCO69W1RVY?=
 =?us-ascii?Q?7qBlI3v4KJHBl2ainr+x6BxxDMzpfdcHiuf2KC7VnmlGeAti/HsfGGwnn/aA?=
 =?us-ascii?Q?A77CxisPIooPNns/TAVJip7BM+yQSc1KGzIF5nSBesmfSIivMluOASrvo2G4?=
 =?us-ascii?Q?Q4sC07qvzt5ixUIUJiaMXtl7JpjDzDj+GnXpdb40/84GX/dfNfOWFdKM1f2B?=
 =?us-ascii?Q?nyHfDVlaHf178JAswYMe3KPYs8WKmQBZRPmALDVNSxpwX2VofKqNlfwBwB5f?=
 =?us-ascii?Q?xwWL/VjInpKJYvnp2zZF3TGOLHFnnkqozY6ciMfP6VTXx71oTVswJw18cNd9?=
 =?us-ascii?Q?By6fY8O5q4jT14UXoTz0WyCKrpnUAJwe6vAyvhMWV2GMG6Sb7YaUeOX0+I4g?=
 =?us-ascii?Q?JpswtZPfvVvL35wjKBkLDCZDExt5Mm9PIO9npLw5sj9vSNR6j/I4oGAjM3PR?=
 =?us-ascii?Q?X2GLy0VMx04PDrgLQzq1ZgLhVs6idUQprBqbjZ2m3yKCyAuDZ2ftyWfxRPku?=
 =?us-ascii?Q?RdnNlHlZPzKTg0vi3AbjzujXAaQpuoh5PlZV/oprJBk8wJRPU9+WmiYThCSW?=
 =?us-ascii?Q?miIgvjViDOg/OIzB0dodwflgGj4cdSy0B7lwDxp4zogUKrvfkNl25rlsmV0t?=
 =?us-ascii?Q?qCC4vP3SrOb5TCP4galYgm6y9GCGiE4c2cLGVpZ4QW7eoTKzWsmTjSWQhhjP?=
 =?us-ascii?Q?E/w8j68gz4RpzDR8cxvX/xUBTwfbH4nLdDQ7YELKcZoIGbUQD2fhhmA/8RGw?=
 =?us-ascii?Q?AGzvlNGQff8pMhaApbNSpTjtbJftfmgP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:06:42.5577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a83ae50-9d01-4764-7589-08dcb5e6536a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8713
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

To enhance the test, add bad memory test for compute ring.

v2: Replace dynamic subtests with igt_subtest (Kamil).

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
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

