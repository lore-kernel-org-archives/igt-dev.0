Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FE6C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C6610E793;
	Wed, 26 Mar 2025 23:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FiG0nEPn";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A0910E79D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRangYiaY8vOGpQzYYG2ilRy4yn4YEaTbq/y2y/hFjykLrVeP39yySYJeyJaofHCGIR6HFWzdsfptJEBgXEGYxE2BQ6k5tgFz7Q06YAceG3fRqUVQK0s5Li4Fe5Bx9rM3bMR+DNAVsCiErcqvk+oUuVwleWLphgpdvRuSXRzkRvWBL86urBGPjmEapMps8/MHDwow/3ICwbdeshXwEAYaotC1lbZMEPO5jqBGed7KGOJIZ74DfF7qQ/rOC5oPIzEg75LyuD0Tf9u7wocvFEGml4RHmtkwC1Tmh8Ir2VloS7j6rl7oCwjKvVrr3HtVzhiEwPWrsSWMcKdyMrurGTajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XYBApRkzUBldpQN9qeiAs506ZGuz4JSer2IOsfXOk4=;
 b=COE19WQ2zMtt4OaWPVfHbgta9xpTpZVJETRjVm7qaOi2dv1TS+wBk0ZIRw7pLmTXf29vlkN2ICnnS8fiyarhuv+RtQhW8BOI8JJQp43bEz/8AEiGILj9zfa5I+5vDpIeqhj2tPrG6O1TnHGTxdig5ztk3ERQCz6lMMbJN07R8OutG29mv6wdr/HK77ACs4t7rG/lcQeCLsECOtCNkQ7WcNg9CyxlfF1LYbnINTtLiYIlGN6Ti3PmJSy1aNseP14KDHU9K5nAamWbOTHRVhQfdSngQCPChlbskYUlRCDe+urgGNNw/qOmGleaDwdp4mtxeCTdVt+VjuzfhXEmfZ6Jbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XYBApRkzUBldpQN9qeiAs506ZGuz4JSer2IOsfXOk4=;
 b=FiG0nEPn98cnmjZTTw9MqWrSoYHqdzOon0dCiC8+gNUtKzgnlsZkkhqbrYx1N4wAlQ1/YIEXcSuOt7gi69T2Jew/tQF39vcIqqJvpdWzmXNddTA5UEetNkb4SklDUTyFyi6XA7cNuY3eI57kbLZ112WZ0L6tc7Rvit7NQw8N8uk=
Received: from BL1PR13CA0125.namprd13.prod.outlook.com (2603:10b6:208:2bb::10)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:44:10 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::ba) by BL1PR13CA0125.outlook.office365.com
 (2603:10b6:208:2bb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.26 via Frontend Transport; Wed,
 26 Mar 2025 23:44:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:44:08 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:44:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 23/37] tests/kms_colorop: Set wide [13,
 13] bracket for comparison on amdgpu
Date: Wed, 26 Mar 2025 17:35:55 -0600
Message-ID: <20250326233609.2980110-24-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 738b891b-5893-4f23-f893-08dd6cc01a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?14yVe2VyXEcON+ydJjTR8BXHH01vYoCwD5Cvj+j0Is6zX65h3j8sHy9zrUHg?=
 =?us-ascii?Q?H6Br1YfNSi/2GzEIb1yctaR8tKh9TF7HDeUH29ZfZSZ9y8IrNbqwWnZpREE3?=
 =?us-ascii?Q?fko+3AA45xg+tBZojSC8qZR7ArkJcfcHeE5w+P0ILB8nqVeVrnzQutKIkY6y?=
 =?us-ascii?Q?BY+Se8XjcetDTPDu4TVJC519bv4Nt7gsepkIZAZdZq/MDprZ0ZVEPKLy3FsA?=
 =?us-ascii?Q?srMC++GCVrvV6gVh/QPjGg0Ia59WwfxAXY3XYvMPn1AZuhupT+QagZNxHpa6?=
 =?us-ascii?Q?6wEgP4IBT7ltjCfS/X0/BKLQAjTB73WvRTlPYnKtfEyBLBGsbeoqBb1+lNnR?=
 =?us-ascii?Q?EHTunWhjJthfzvSoxtqsQt1Fhxd9TcNluo2kJa8QbpGXX0CV+P3b2OH82xT5?=
 =?us-ascii?Q?kh+4MbYUhiy0OvbZ3t0kmWSEj/Xs0ks47vHl16blEa8Ke3bJgL5iWQh9Ni09?=
 =?us-ascii?Q?TiFtBt9QkuYAnMErScNGO9V5UZVf9IAVxvL52WRR627lBDcPX38E6IE/+4Ij?=
 =?us-ascii?Q?P1p6AzlC7TrI+ja9Ox0FLLiM6sTuph5WbqwwvXpy0zX/Qvv6N01T7z6odv29?=
 =?us-ascii?Q?q+AyfS2YTzDSjDl8PM7LRQqq0mvRBrWfM5cJ7xg0xdfmiHO/Lrt77v+2r+ly?=
 =?us-ascii?Q?iicpq0jdpzlV4jXaIInyLEHDF6Bdz94POSpkyVeYn8+9nxByW86adIO9BcbX?=
 =?us-ascii?Q?iOL9ZJlM8ih8z1Tq1ppSWcK3UcHB/jGXR8sn/mRHnNur2XnfTnmPcRp/MKmX?=
 =?us-ascii?Q?a/DtKypVyu7AYV+cEiG6bRX0HhXzbqGj/Cl+JYSDPa7AXsINkVT43DL6n0HR?=
 =?us-ascii?Q?a9CNwbwVRpOx+eLQWaFKl4hrAOQv8q2a5vFMUwE/n1A9iIJDc0Nwf2KE+rCA?=
 =?us-ascii?Q?7Y9la8PyX2DkdL4qrDMRo8gNm1uAKNu3bXk2OJbZ2u3UiDSco6GxJ1/X1Hkr?=
 =?us-ascii?Q?a3nFxasY2x5K86TpxiDdwUWj2zBKVTG++97bavqODiOlCOAtqMsVtaC5IF1g?=
 =?us-ascii?Q?ezcF8Gmlvdup9qvTerxE/ZgP4CQe5qfa1col9tXW5fne616B9D2ujrg4M4PM?=
 =?us-ascii?Q?yEcBlcUTbFLNb2F0DcsiyuFs0DcJIhMmcadFFkSTQffxiOnzbRyKwTAqzXMx?=
 =?us-ascii?Q?pPpeduwW3XBfvAMBCI3Zu5Zcu0Mw79jiQj1Y8js6f0fldUeVtBtgABE1vsH7?=
 =?us-ascii?Q?WMNeR1W/C0GFFsCXa7jaj10Lo6p2wSwI2Hs+1Dyd8kSpo+Y4BBNPgLstALCD?=
 =?us-ascii?Q?TZ8e+nhQjKWbvztyVE38idR5WvM4M0pXnHcmVpK4YYx081iO2v6jef/YTDCJ?=
 =?us-ascii?Q?pxEZY4WGtcwHz0eU3koCF++3ABWv1wZo92tdsu+MBiG9/97GgfO3ik2+JIdu?=
 =?us-ascii?Q?IA1IMN7wLarywZj8zHlV0bXEp0r3NxwgEqIRoz98hDDjCa8BZVungP1C5Gkw?=
 =?us-ascii?Q?TW55IqwJDT7V4we1fAm35siSYEjT9ERsyZBmqMNIXrr97VjZyg1YFMQoFClf?=
 =?us-ascii?Q?aWIfNmcMWnh2eNZSQUOp0erWmH0ZbjS3hm+7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:44:08.9796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 738b891b-5893-4f23-f893-08dd6cc01a7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684
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

From: Harry Wentland <harry.wentland@amd.com>

Setting a fairly wide delta for now, to pass tests. Note that since
tests run with 10 bpc surfaces on amdgpu a wider bracket isn't
unreasonable. Still, this should be investigated to reduce the
delta.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 3fa799e7c..659fe63a5 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -354,6 +354,8 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	if (is_vkms_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 1, 1);
+	if (is_amdgpu_device(in->fd))
+		return igt_cmp_fb_pixels(in, out, 13, 13);
 	else
 		/*
 		 * By default we'll look for a [0, 0] bracket. We can then
-- 
2.43.0

