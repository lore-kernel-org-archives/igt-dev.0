Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB213C52D71
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 08:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF6910E68C;
	Thu,  8 Aug 2024 08:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="alaGCkmn";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500B510E68C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 08:41:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIuuat0E2DBW1AWYuIv0tFLIigvaJGxJciNyoNz88WN5fEAUgjRa18pbhSAAwVpOv578Nc8zgebOlv9WcaHy9EFkinOzFgEjIK0TZ6X0RaiOpXI5VyYAhCsLX7oP8CPA/XFAiuxRbWn3vbj1ZMt8bhRhm967MT40yGFN8uijbL4gULe/wq+3ropdTGX43JP8FJTOF3b2EcDdN2qwMrj78hIvpJxoPqYcBTVLf8zMxk6V/jbgaj/GPzZKCDd0JEPdglWwxxpY9OVjBCqVKxHXj8xORqSGb94KMRjHgsBL2WywKpi7euFfyA86k3Y4cpAr8u6jd9qtFJ8ZmvYaJowwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGFYgurIu3DY6BTXAjAlP3xi8WPzmMCymE//vEbXOME=;
 b=Nxls+hBQsy3fN5e5CJBWbc3RAjTfLwb1HHrDPmq1Ezn5X45B+qDV9po1MRfXkDqjcXAa8QDUvBTnhxKmKIK14tfL7DOloZFr27Ix4IiVaoEO5f6n8C0OpShS5jsSxciXkpfUCBUdS4xEn/IkulKR7EY1Uhu7Nm+wxunVplNUdGVQaJaPQFMUStEZJa/4j+49WfPMfUlazzEokl6arDGb7CKw4ICV+7v3f7Amrkrm0qwGbmATkH4ymDIC9twAz2lgXOo0G1P6/IuDzBjqegPL7ApTMsvkJ64LtJNXoEMiNaMXd/CwaGTCyEldr0TzsTo2q1B+w0Mcm+fEl0KKoZkgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGFYgurIu3DY6BTXAjAlP3xi8WPzmMCymE//vEbXOME=;
 b=alaGCkmntzlPdHF15nZ8jWJxU1H+wTDspChoRLB30GKdtJhbtdhzc2KcjDXX0VV/p1UoVavoCt7dFExsX2FTFSLgrvZMd/ZFI91hoqlLwrRHKSz/vGcUfSqDshqxZ1pPRneSiSBMrE/TmU9SiAYTuR6udZXEwgqEuMQmWFzimFM=
Received: from MN2PR01CA0053.prod.exchangelabs.com (2603:10b6:208:23f::22) by
 PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 8 Aug
 2024 08:41:01 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::b1) by MN2PR01CA0053.outlook.office365.com
 (2603:10b6:208:23f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Thu, 8 Aug 2024 08:41:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7875.2 via Frontend Transport; Thu, 8 Aug 2024 08:41:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 03:41:00 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 Aug 2024 03:40:59 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/amd_dispatch: fix KGQ hang test
Date: Thu, 8 Aug 2024 16:40:58 +0800
Message-ID: <20240808084058.2704009-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|PH7PR12MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: ca392c55-7072-45e8-2c90-08dcb785d4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RouUGHi/ZM5SJ2PrF/u1ccGcxikBP2WnxJTq477aZaR46v6Xs5/KTskZ2/f+?=
 =?us-ascii?Q?y6X9c60nnh8eGFz/N2ozpQ2Vm0n4N7wUmz4TuyaP9KnwE71cbwbsq1/PBhru?=
 =?us-ascii?Q?3qjDFsBLAZOJbQOZld1U6LqF0DV8me+yu5bhQ/OpEua5/QuDagcjJNDWywwx?=
 =?us-ascii?Q?cZf/N1djI/PjZ00GeLGyVPBGhZd4F/kUlVdALyTYdJuWR5KgwHim4N1fMtvF?=
 =?us-ascii?Q?9sOwcj9DEGIITvMShm+/PcRCmvCFew5W9hAa3UG4FGYSHR0hO9ORIZGQKXLE?=
 =?us-ascii?Q?MqjpFjm8rhYAFdhg8sQ5T0VW45Zh/i+rxR9PkBYKI+2UvFQm4S4kYVzJoQfG?=
 =?us-ascii?Q?UGQgthbcYhwsw0b9rP0qMUBFGMEN0ugMKR6JXWu6DA6GKjfFD0meAIt6dSLQ?=
 =?us-ascii?Q?5x642bZN7fqqQ1c03/RdVxAW8YfWJnar7IzJHoLbonH0mPjRs0b8y8XRYmbq?=
 =?us-ascii?Q?t4YPeu3JbyTDM68XtHYqq8QLVnT+Gqz9TT+1qrtRlVMB7i2Vspfd84d0pxYf?=
 =?us-ascii?Q?LFgnDUbNfeYO9mNGjiqT0PgR66/rqcUbjcsncfV+cIhVnostaimWrl8qWZnR?=
 =?us-ascii?Q?ufJdPbPI76Ky5qMZmh3l+W6uzJxjMe77CUHwmztxYNbNM3wz7JpdPMDaTda6?=
 =?us-ascii?Q?tc1st4nLp0zoooJjPO8emC/KuMBskCldeheezsuRx7cpa9wnUhkP4J8pZPuz?=
 =?us-ascii?Q?Nq0D17uumAkcTcZM44MdW/tBptIJdM2h7XoEjQhHfvVQ9zmbOJSPi6LKWyy3?=
 =?us-ascii?Q?EDUUFC8+cFVwno47usgdTl1jBLNYpQWAySQnp7+3v4mBWRdNmKOyV1KtHVn4?=
 =?us-ascii?Q?6RGc9ouBGPZKbg0rUUBuBqoZ05Mn8nov6KMeMplKX+81G2+5Tozj7x5yBrj1?=
 =?us-ascii?Q?BmwzuqwtULRbQhxbN6qKhOilTi5JodvClJb/pQp5oFK7J20ogSFTeTn6+55S?=
 =?us-ascii?Q?k/sxAJ6ORqhXNXAGK1g1S/dtfx/ye4eT5znHtSrrHOqzp80APbKsHvbUMgJp?=
 =?us-ascii?Q?ryqrG2uyrkOlD01+PqFT9ZKabH5zTj1soLgjIGM875aNrw2rhu94IoixMGN4?=
 =?us-ascii?Q?5Km45jlWRoSBhGT+HkmyTbrtFtTG1ZtZcVeYCYMPNRFOHxQOLQbgz1T2KdsW?=
 =?us-ascii?Q?uPTC9kEhLNCOHop46f/1pa45Mp1m4M1OlYUMXKUyibZw0OCgQHhnRnqQ/DXE?=
 =?us-ascii?Q?kc2ciKW8QzeRJh8DmWy4ywCu3uBTEZMwyrRAegkLoqS9QuqGn/F8K0moCr31?=
 =?us-ascii?Q?+lf3iuh9jrLKYuhka8zjkBzj8NDb37JPaqxFh0yMD8HN1b0yDobDcNPhgvkg?=
 =?us-ascii?Q?OZx11DRuefJtuV4yBfT7hAA8Vqz4monwHcx1/NfYsLkRUydMTR29aHRUCsjL?=
 =?us-ascii?Q?5G6AwReGx1OjfuXvUFTbLwTOtA1pHm82FSYbC1aiMTt6eGF7dvGy/jFdoise?=
 =?us-ascii?Q?UflEm0P5C04ijxPLtWJoNUkNWFf0eksa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 08:41:01.0972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca392c55-7072-45e8-2c90-08dcb785d4fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843
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

Set specific error type for KGQ hang test.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_dispatch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 2c17e90ab..76b62128d 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -26,9 +26,9 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
 }
 
 static void
-amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
+amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle, enum cmd_error_type error)
 {
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 1);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error);
 }
 
 static void
@@ -118,7 +118,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
-			amdgpu_dispatch_hang_gfx(device);
+			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
 		}
 	}
 
-- 
2.25.1


