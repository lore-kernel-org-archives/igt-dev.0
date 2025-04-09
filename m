Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28A8C369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 07:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F78110E7FB;
	Wed,  9 Apr 2025 07:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QyI8BS0b";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76A810E7FB
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 07:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMmf9SXviWsTdQaDBOeUFxAY6UpkLTKSn+VdqruTbnFaOU9kArexbbqwwYVmI5rpD/fhPoU1rToebJPgOSZ/H3v0YnSElmwR1KXYVhyKtKvz6VuqeMH3kqrzq/W32kTwFFKW9oFvqMR0NdUELrw4Eb17DKH3mjxqLXf6rftHG6q06n9wLjNXtao/stZWisstjQKDGhkkc3X2bjfdpLvQloPjrmKPmMygas7ME2q7f482IQWSAsMpNuDHBis+zBu3WdXQzdu0sSMvBdy5lVo/9TxqgjNim3yhjKMImomKn8J500MKtS7+oqAF+y35L+2Fbr7ZomKC6VdvB4200Mn0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOkeMVWSgRJD4HlPLSq/Kwo0JpcKecDwfEd7YTDLkUw=;
 b=JNf4IOwisNt6DCKEgtVq4iif716wzCrLEoaJ0tM/dcugwnhew4YXRy+3RJj59NepUoMfJeuLN8IaTQIq4TYzlwopMvM4MmX/0wy2quGLH99TY4OXBtnjErsq1jmQ7o+40l14a2gP1gwr0msjJqdHHOLI3+VfWPpgw8CZAKR/tXZSZpxr9QWEH67hdWRW3/7BArsJ1zk6xIH894/Dj089wLXOIDuCj3b62oTA4I9PSIUID+5ViQO697NPXsxx70S2Z1yjSs+x5fMIvOAjp4DF8utm9L8LF1SRdhJWSM8nRZTRKJnimJY5tjx6jb+EfTDa8h1U4ZsMGGd5OrVeX2onMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOkeMVWSgRJD4HlPLSq/Kwo0JpcKecDwfEd7YTDLkUw=;
 b=QyI8BS0bWeTi5MiD+5D8gmn5lqqwzVe9IYvDNThQ9ntBcUe5Tds9XYfnOrWZNnlItjiXuo5b/vM5Q4hePNyySuiOq46oNL2pr56PkX6yrEB8h9rJLcK0IUc+rn1EaXGiJAaEshrEKfXWRCk9PGZRwty7VLwNInbYXQzYuZosGAM=
Received: from MW4PR04CA0065.namprd04.prod.outlook.com (2603:10b6:303:6b::10)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Wed, 9 Apr
 2025 07:57:14 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::43) by MW4PR04CA0065.outlook.office365.com
 (2603:10b6:303:6b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 07:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 07:57:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 02:57:08 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 9 Apr 2025 02:57:01 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, <prike.liang@amd.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>, "Jesse . Zhang" <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 2/3] tests/amdgpu: Add secure UMQ tests for GFX and
 compute
Date: Wed, 9 Apr 2025 15:56:52 +0800
Message-ID: <20250409075653.2502119-2-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409075653.2502119-1-jesse.zhang@amd.com>
References: <20250409075653.2502119-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|IA0PR12MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 5723a6ba-f663-4688-3b52-08dd773c23e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0imemNbMWRd8hpDa29lIlI+uagzwja2QD2m7srsbeHj0LbekaYr0XK0qUotk?=
 =?us-ascii?Q?lDoxsOHJkr5VNNxmDYe8RnjatfrxjVZBuX6/ZL6llc9uLfikwuKnbNwxkEDi?=
 =?us-ascii?Q?uXgiQ9gw/zPmqw5nks1JtwcVucuQ9xJrx6yEdgT3uJD3OAaoIy5dsqYCqRag?=
 =?us-ascii?Q?4wq6ec4hYsY/cebMwyow666+MavvSNPjAXjUsZf2bXQ1peeHeMkotqv8XyCs?=
 =?us-ascii?Q?dpbmX1DOM1avdW9XFGyYyZ0uVQcRgl1AyyKgrepr8o8un1GKoELdouRx2rOM?=
 =?us-ascii?Q?dm+yPieKXHTZw8EtT5XlVahlAbBbOjwv/yq1Ai0m8vu1LtDpfS4hGzzZXgo9?=
 =?us-ascii?Q?q1QQdT8V2OuMAaHZmqTJ8X0k89w/VDKlJnm8QK4bUgjMsOD16NrqzhXmzPmb?=
 =?us-ascii?Q?7OiZIok+Gfy9U+c5gxn+E+CWH7C6lWXXBBYB4mpaaXl9uNFIrUEYaBiUpFPR?=
 =?us-ascii?Q?iKHw2l1KtwJsbig1N0KAfYfytMyLKcH7/xEPhB0mMGc0DnDlPYQbo6JibOgR?=
 =?us-ascii?Q?jZa5ETs5w+V9DmzhEpEE1sduyW+9coaKVSibGtEMLJ/1SKmiGGR3bgJBucXY?=
 =?us-ascii?Q?HqPRF6uipewdvkhIlOTcqcZaz+07Hwt07FbSkChl4hqFU2UKVybcas6KYSUP?=
 =?us-ascii?Q?xIWBmA+565R0yu18vBHB8BIyqObz+/QlyEVxtM2tF1kiDICUwcaoVD6dVMUW?=
 =?us-ascii?Q?mG+TkQ3vwoTtqtEJ21y9p0Al/eQU+p0z5i5Ldfbud468R5/NNkN1hMUWleEd?=
 =?us-ascii?Q?5/b+sCytVFyz4YeZMTbfjDD3uEOrQDJNZilovoXKbFFrpC+T6jgxQF/WS1T7?=
 =?us-ascii?Q?67+RTAZaiTPM+Z1owJrwATMohNML/4N3v1P2HpWsLQ4h6z8Ic57V6RDie1nG?=
 =?us-ascii?Q?lOnFKR8nTxtJ5tWdqQO0vqEporvZsP7ptx9KnAhGRQ8Ul3JyZ7T0yBi1TCPt?=
 =?us-ascii?Q?gUHuQ+dnKwi0JRqupm3iDzIbYLl/bUAljsqXgiypvdeZRDoIVKCiv0NFb7A2?=
 =?us-ascii?Q?tIbuvWOtRaImkdWhIoij0OBL8VOQnsQUI6Ey3rwKeXb5SUrYxptk2PHTV9vX?=
 =?us-ascii?Q?jnZIbBcItNPSVFc2qTqL0JmykXNqrTOMSCwMcFBhrGW0p9Ct62Ptufrzf3gy?=
 =?us-ascii?Q?OUbw/3Iqk0WsUzgREbQvjQYF+7FrrqpICQ4ys88IU+xxW2i4XGDgLVxkPurC?=
 =?us-ascii?Q?rHgUigJCkvIn3tDrbuSKQVwEtOG92KcqIwpv3y5irTN7/ABcmTXYHwPFmQxO?=
 =?us-ascii?Q?KSzhwn66qk5PnmASYHSvWxVd26njd39lrAy2PAN3UWgjzwGSbuT05loazKIa?=
 =?us-ascii?Q?1HFbfupH0lEjJ/Om//+rNRK/XtaTZ133VvcyUCX0VlH9WGXu4Hcjz44ppEwI?=
 =?us-ascii?Q?WUKPJUTMbcuDhchEyYJDgR0pOZ7jLQIFg5WMty24xNkdpsvuFE5KIQfNn7K+?=
 =?us-ascii?Q?YNVwdsQCg+NeWFWJgLjhSsUJyXEBuIFPSD/b5DAwJdE+dTvxuyISF8426jOz?=
 =?us-ascii?Q?8pj4h2eRFElx8uRS5mMCdzo3hB0O0lHFkBub?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:57:13.8713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5723a6ba-f663-4688-3b52-08dd773c23e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906
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

Add new subtests for secure user-mode queue (UMQ) validation:
- gfx-write-linear-helper-secure-umq
- compute-write-linear-helper-secure-umq

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 tests/amdgpu/amd_security.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 19baaaea0..1c880c11f 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -354,6 +354,18 @@ igt_main
 	amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
 			AMDGPU_HW_IP_DMA), is_secure);
 
+#ifdef AMDGPU_USERQ_ENABLED
+	igt_describe("amdgpu gfx command submission write linear helper with user queue");
+	igt_subtest("gfx-write-linear-helper-secure-umq")
+	amdgpu_command_submission_write_linear_helper(device,
+			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
+
+	igt_describe("amdgpu compute command submission write linear helper with user queue");
+	igt_subtest("compute-write-linear-helper-secure-umq")
+	amdgpu_command_submission_write_linear_helper(device,
+			get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
+#endif
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.25.1

