Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E7CD29FAC
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 18:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AA310E9A5;
	Thu,  4 Dec 2025 18:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s3rnrJex";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013056.outbound.protection.outlook.com
 [40.93.196.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C4910E9A5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 18:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMIz8M+kRM0WwAOKlM7o2bUp18nc/y//CC8fRypPMhuMHU9rp81skVCXrkvMovx2gOSspIV46jb/af4EYsJQ1XLNsuHd0+1EfKvVnhg+jlXz7Fn/GicyiY3ZOsaJqVjc/KZGpkFdfEw3+yeS1yYI3fFsO5cPGiAqqHYSKL4qkuz+VvZSvfEQMldU+hs0+DoZPeh6BOCA4+IYO9LAOxM/d7SwSO7UG8YRGeAkzzmTXOMuo5Aq32Nl+8umkUBK7D9hTyHb15Ve9sXRqz8762RG4ZMmY2TVIZndd6ySPGSofHTEt9LufEMCPBSQi2wC0dG1CrpVSwbMw4B3vMTRleAWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKQ2V2ycO0c5xeSBq0OIpzf7lSglLA53Jn4EqzcxF2E=;
 b=wHLE8rtT9xPJCNMV3i+gEhU8mUSPDn/ttxzALxprscCSP3fH2zgT+n+ppkmNpdcX1y639cLeRw0sFPA7JHUVMuDzo9iXJIh/3UbjuyCATowmnch+qACZ+QFz8Jmb3qTap1EDzrGFHozTjRHhLg15RseMx+uq+o3SnZL9nT/KLjZmI9cspv3kbia++FFKoEB5IlXFLOMjaC6kqEj6xgCGNCj1c9PNbsPvdGOX2jVO4phe5UCm5Nz2bOeIU1+x6rxTQs0xu8t5gbma/UJ28hXcNIsx20ceazfXd10JFFc30ExIE8IwoyXs4CnM039QLwqTbuu8eE046J4UZEFVmxj8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKQ2V2ycO0c5xeSBq0OIpzf7lSglLA53Jn4EqzcxF2E=;
 b=s3rnrJexqW9GKk/90/dm77tTaQ2Z9Kp4cHJHzE0t//H+CjPbf0dB3CLI9j4MEybYpSy47kXvn18eQtRkm2Txj4a2tWdRgyin9fbggOT4wo9Gd6aNeAtOuM8wTeBPmMHM8fNbHe1B0PnzOENYtbu3QaXbSs6rwIE3gV95bt3rxzg=
Received: from BYAPR06CA0010.namprd06.prod.outlook.com (2603:10b6:a03:d4::23)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 18:20:55 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::51) by BYAPR06CA0010.outlook.office365.com
 (2603:10b6:a03:d4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 18:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 18:20:55 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 12:20:53 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <aurabindo.pillai@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/kms_bw: Correct skip message for mx pipe count
Date: Thu, 4 Dec 2025 11:20:34 -0700
Message-ID: <20251204182034.307117-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|MW4PR12MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 18dd3ffa-56f7-468f-5613-08de3361dd78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8A26GVs5TAuBfQUI9VCPX0nI6UHq1bfaoFWtcXAq0NntKwLbZQAYaoXQOtoX?=
 =?us-ascii?Q?CTPUvI4LvujEBdV6633zehNN5KKOKYT+bH2ExjqKpYov0iwOHGyd/nWeBhLf?=
 =?us-ascii?Q?1M1KrUhK00FuATsP9XmxBgh0LcNWO31P6lGL0UQzl4fq0h/htz7epQLDzFjX?=
 =?us-ascii?Q?AIHZwaj86z9SuoaE+o47Gkj7wtrHvpwxWEpra+waiA10rnJXfGagrf3+BfEj?=
 =?us-ascii?Q?swK7HjE9ilZe65FAfJJKCAmXOUgP0JqRQgTByQ5cWwDKsZN/VM/tk2+fOFFb?=
 =?us-ascii?Q?SaHQ04cCDkAPLC+px6LUxnR6iR1O56kFiP7O3h9E/NbtEz1OXu6G9S+GQ07t?=
 =?us-ascii?Q?K0OpLt5w3dfUPWZKkfFusranFSZVmOBZwgl82UwQeP3IIwvW7zGLP+TYhNrU?=
 =?us-ascii?Q?NB74CMUG1IrYa4wGvDkbNgbuRSDXEA6nNW2zrR35V7vD+ZdI6+8ftkGUPad2?=
 =?us-ascii?Q?V25RCCDRoIRvCB4zNaSblbj92c47BE7JClGHuEfjukmQ/F/hilF5EQnOWFbl?=
 =?us-ascii?Q?IjVmWcrbbzRifcfHr5dT+It74NdN2fvGXI6TUh1L0xiWoU+MDqLAq0xe88+x?=
 =?us-ascii?Q?uUmLjMPf/DLsd7XwZ3ushNEjFF7sfRQtIbcS6Psxo7vGmajL7coYduSye/Pi?=
 =?us-ascii?Q?BE5cg59O79U2xfRPJJ3NpVzu/1VWdOnTg5KiOxmIxtYL0oNuiat6L+SIIdra?=
 =?us-ascii?Q?F2Hs5KTZcGyZqixcj3yLMOrlrLpRAGnJVORgJNF8nNjo1x5IKx4RLxvXe3PB?=
 =?us-ascii?Q?Cr2RO8K7xqMgWw8LZ8TKIcZTFY7xAd1k31oXePbz72LpabNw2Jfs/pOCNhHw?=
 =?us-ascii?Q?DDWPhBiMfIYO6Qf8w/g2rvU3JpvjsgTxXW2v00WjGsZzwTjaMkSpy8HCiRVx?=
 =?us-ascii?Q?5aPvrRaEbS3E8IELZpz4w2RV8aF0jsNuAM/ynXD27/n+pQH0BEd9O53REmqU?=
 =?us-ascii?Q?d4z39YndPSpyWDSPPDLLt/IoTEtDVHtW52eN5/bAQIwG/LMilqQs7+MNOfru?=
 =?us-ascii?Q?yxoSLB33iupqsUfi6R4mlntTYEoO26vwFGuSuzEwUiku/8XhHfYfC82xzRfj?=
 =?us-ascii?Q?nrYk/hRvci6a/MJ1ajjk4HjXusEzp6fB5VwKGCv4ESEK5jlvOBivKXZni9Ei?=
 =?us-ascii?Q?fOhDOTsdY20kVdcrVW+HQNAfAQuNAQRUseJqNJYK8lRBbSrfgMmmZSPKv/pC?=
 =?us-ascii?Q?fDmcTIGZemyZEAc2g3zYBrzBuwW5ancvLmgoQWvbIYwWeklChsLRxurDmiAs?=
 =?us-ascii?Q?+hH9/VO0PzH2LB/8Axi++g/u0JDy9p4WpWP+ZzmhW+FXPsbHH6SaItLYPyuT?=
 =?us-ascii?Q?qk1U6YwxJcqDNnkTn60iuSAz4EUufZU5CEMX3NF7lh0L6yNmwAI2t4DIT67t?=
 =?us-ascii?Q?dQvAJiiwJcMJefcV3T6IhRM/Tc14q84aGyzfVv6y7vvBcvd6/2D5JVPw5EFS?=
 =?us-ascii?Q?MKtG5hMjlE26cIvEI77z4chxW1vp6Kzy/zSE+0BMRz/zRKhBQkj0wPTEIgN9?=
 =?us-ascii?Q?1xUsohEOm8CDuIr9fklXoGssThAW/zCMOy7cs1dPFv5poktx02SVDHcnThbI?=
 =?us-ascii?Q?CB6ivyeRVIdiYMEtln8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:20:55.2317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dd3ffa-56f7-468f-5613-08de3361dd78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
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

"pipe" is zero-based so adding 1 to fix errors like:

Starting subtest: connected-linear-tiling-5-displays-1920x1080p
...
Test requirement: !(pipe >= num_pipes)
ASIC does not have 4 pipes
Subtest connected-linear-tiling-5-displays-1920x1080p: SKIP (0.000s)

Fix spaceing errors in igt_skip_on_f too.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_bw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index ca05695d3..4ee5b0931 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -201,12 +201,12 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	for_each_pipe(display, p) num_pipes++;
 
 	igt_skip_on_f(pipe >= num_pipes,
-                      "ASIC does not have %d pipes\n", pipe);
+                      "ASIC does not have %d pipes\n", pipe + 1);
 
 	test_init(data, physical);
 
 	igt_skip_on_f(physical && pipe >= data->connected_outputs,
-		      "Only %d connected need %d connected\n",data->connected_outputs, pipe+1);
+		      "Only %d connected need %d connected\n", data->connected_outputs, pipe + 1);
 
 	/* create buffers */
 	for (i = 0; i <= pipe; i++) {
-- 
2.43.0

