Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9103BE77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 20:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4341210E0C9;
	Mon, 30 Dec 2024 20:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DQd5xGlH";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C81410E0C9
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 20:01:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rl70A3dcwAmp55qNa4RzdJuvb72B39kB2P3FaSdfCS+1Wets+RXWFGUYI1gwFv0A/UKGKskoYyVmDITZvsGSoP8KlTKmDUMlLsjZC2MqFo8t9PkniswbCqIn/TTTvAdLf4TZO0VoIk5q9f3g/4A8xdeqiKmuwii/2i7AL3UyL8MrY7TvAJZQnbk6f1R5k40Y6U0VxwniAfImY9MT1h1CZ3sDZ3ONhpTEpJvWnnMwH+cyX3EdTshMmokF9KoSvrOzeOQBO7gdBUL1zLOsYfJ0p+79mz6SKXk6s8ih9LhOXdZEbsOc/fiYUcnWPktwRUX3w0ER+l4NMPqNYohPia8MsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ls7O59c5Nb8Yx17/P1HULsBfIis9x0OZ2dEmhRycqrM=;
 b=FVeFRmke/2UCA2TJuJ31pRqmjHx0nr1Lmxzd+0g2LOGHigRmImM3HJmhR83CaSZxxICz0w+xInRAE23n2/O/YzDxHm8m8uLo4GHway3eDJmIsAEYor3mNpEGSstFh2W3U4WAzXipuDjr2bffHAtsaYu/tjByWuMd4bzM8Df7ZYybFc/Sy9uvKvtpIafoyOA3KtA1RvBxixNO/G+qCYwfCfZ0Jc3AqHKiP3Rj1PrMeMuXPmmUvw107YjBJDIxiZ8t+RSXrVLdA2gnMQWEuTZptAueDlXXTBw3JfPegjAsFSIVOb7kLkxyj4/dcRw7x/hjNlbuSTJZf/xngpQSUlLn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ls7O59c5Nb8Yx17/P1HULsBfIis9x0OZ2dEmhRycqrM=;
 b=DQd5xGlHBCFhuacDzzEKlTaeLhla/Y0nfBoOyvNGHtZsDTzyTeccGa9gqk5BTezrhr57kS/Ei4bZ3THKHT6G8ZmbehMcM9OLgeIGIpj8Huy5XdWXrEsuwXkFYDfGa5BnAz1p9Zh6Zb/0h0CCbMp37k3qcNKdh0/ghxaPb+KdRKg=
Received: from DS7PR03CA0308.namprd03.prod.outlook.com (2603:10b6:8:2b::31) by
 CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.19; Mon, 30 Dec 2024 20:01:26 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::1d) by DS7PR03CA0308.outlook.office365.com
 (2603:10b6:8:2b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.19 via Frontend Transport; Mon,
 30 Dec 2024 20:01:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Mon, 30 Dec 2024 20:01:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Dec
 2024 14:01:24 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Dec
 2024 14:01:24 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Dec 2024 14:01:23 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Christian Koenig <christian.koenig@amd.com>, Alexander
 Deucher <alexander.deucher@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] lib/amdgpu: enhance readability of packet creation logic
Date: Mon, 30 Dec 2024 15:01:15 -0500
Message-ID: <20241230200115.93749-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 98208cee-9b1a-481d-52b7-08dd290cbd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L7WvadfXQfirKCjIQ4RHQrorGRa/u0auY3ac3ZX8+JuLj5arbzsipSqanZov?=
 =?us-ascii?Q?o8BS/kfGqF6qCdegyZZO+epidoP04Vrwq8+mtbXj2oazkQWBzBR4TbCV/4GA?=
 =?us-ascii?Q?fdDhkq4hoxXsHTZPbYucja8Vadb7O8Rs/QglBf8Gj0hEsCqMRgOShEPWadji?=
 =?us-ascii?Q?quuIixxr936uZa5oWGqCnBqDV5pvPmFaGj7S7UYHIs0c9FHjh4jbMIB70iqq?=
 =?us-ascii?Q?PGziQTlXLBx7qN6bhsxTGTbYawNoNfW2Q5olPKHV3lgZAEcPaJxoqcXfFMiD?=
 =?us-ascii?Q?09IQaDfF3ok0ar7EeNQbU6kEuOak1OZMxKkSSrw7F54c4of6siIaIfJ7aKUQ?=
 =?us-ascii?Q?KT2VLCVIx5OskH5fhY9kGkRMe27He/Vs99SlnxoHta9NYfrRRpxs9I/ImOeb?=
 =?us-ascii?Q?YecNv94PL6rgs47vkdU0u43MqRXo9BCRhLOxtsWNfiGKmKX//FffHs7xO6ey?=
 =?us-ascii?Q?UDM8NfPfemMIVTlBvPdq6E1fsOzGK/+ixbskbZ8fprUSkO/VE/L9SUUHX0pB?=
 =?us-ascii?Q?j7QeyyLgJTDA74YMh2iWFnypmS00ncOH1Ebagxu+pj8HcfhmnvNOzKsQI+ZI?=
 =?us-ascii?Q?NTk68FS3Ey5L9GmNvIFFwkgrhwHhRAaihpiLXngVICQynPh/Qsa/WMVqesb0?=
 =?us-ascii?Q?avtDp3IJqvaEiAd82pdUnnKW5O3+G8l6uKIrD0JGIfe2n3bzx88DBfUPaRoZ?=
 =?us-ascii?Q?VxJw5pr8IJKFg6fg7gP7Q1sWKMEdwFzhshegenUVyvsi+CUtvbUGKMvbFJc9?=
 =?us-ascii?Q?RdNdSTaweOK9sqF0mr2g4OTTouLYF2vcBqB0PKry/dUNyRaSraaaGNuqd2bM?=
 =?us-ascii?Q?Vq3jNITv63CSm2zPh/g8ZtFfontKHSa+vJkR5XL2JvO1e32Dz7cii+fJfzGH?=
 =?us-ascii?Q?JVHxW37r4aIpPSW2o5s/oSak/YHiTMLIB6LM5RCniipdbphE7+l06MZTfRXo?=
 =?us-ascii?Q?FWNamwxX4fcplXtEUkMUs3emAzn7QLLC0XwrpCitCSfHTAhD7jx6ILaH6KWa?=
 =?us-ascii?Q?q3QihoJBCU/OPczyypsh4+Bth5UN13HB1CUSrhyV3OhEjjSwl8FlBpuANSdO?=
 =?us-ascii?Q?AYxgk56BIWlrLNqC3ys3H19yNwtyIVi0kTIYwMIK2Yi9L4C26qldkCpKeZMy?=
 =?us-ascii?Q?Aq+u2gwUxXj54BVjhLxFcx9O7yVHIvDZAAXitkVM3SxI08z0Q7H99f8p1kip?=
 =?us-ascii?Q?a21Wdv0N26TFvYgdufEVz6UDWPb+GUrChWhAGlCqWyJ5iJx1LQkd7ys9czm0?=
 =?us-ascii?Q?R8BKbTCEEVa5WvqQ+Ox6pUdHhzhNlUbC7vpvJe482AbC4spDBOtlaClMW3bq?=
 =?us-ascii?Q?ARgXMfkj0PKYj/K4QrOldk1IXMUbnq1OjP+Rc5w7F0Met6guY1VXL58gU2ci?=
 =?us-ascii?Q?U7UlU+qGg36kTEea5+/a8mJYrDHRFSMXsvcoN4A+ZDaHTbbNIwSnVizc9Iee?=
 =?us-ascii?Q?xdYVRroev1vH6zB2NMZyVtNMeU5Yl4cz6UeHCw4NEiIll+uIniKKv8AnNSrN?=
 =?us-ascii?Q?M+/XUVzFQQDhh04=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 20:01:25.3066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98208cee-9b1a-481d-52b7-08dd290cbd9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

No functional changes.
Added PACKET3_SET_CE_DE_COUNTERS, PACKET3_INCREMENT_CE_COUNTER,
and PACKET3_WAIT_ON_CE_COUNTER for PACKET3 operations specific
to GFX6 through GFX10.

Cc: Jesse Zhang  <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_PM4.h    |  5 +++++
 lib/amdgpu/amd_memory.c | 13 ++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index dd483baee..5bc3cb783 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -216,4 +216,9 @@
 #define mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR                   0x54f
 
 #define GFX_COMPUTE_NOP  0xffff1000
+
+#define	PACKET3_SET_CE_DE_COUNTERS		0x89
+#define	PACKET3_INCREMENT_CE_COUNTER		0x84
+#define	PACKET3_WAIT_ON_CE_COUNTER		0x86
+
 #endif
diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index 208e20eb8..92ddc9fe2 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -24,7 +24,7 @@
  */
 
 #include "amd_memory.h"
-
+#include "amd_PM4.h"
 /**
  *
  * @param device_handle
@@ -328,20 +328,19 @@ void amdgpu_command_submission_multi_fence_wait_all(amdgpu_device_handle device,
 
 	memset(ib_info, 0, 2 * sizeof(struct amdgpu_cs_ib_info));
 
-	/* IT_SET_CE_DE_COUNTERS */
+	/* IT_SET_CE_DE_COUNTERS valid for gfx 6-10 */
 	ptr = ib_result_ce_cpu;
-	ptr[0] = 0xc0008900;
+	ptr[0] = PACKET3(PACKET3_SET_CE_DE_COUNTERS, 0);
 	ptr[1] = 0;
-	ptr[2] = 0xc0008400;
+	ptr[2] = PACKET3(PACKET3_INCREMENT_CE_COUNTER, 0);
 	ptr[3] = 1;
 	ib_info[0].ib_mc_address = ib_result_ce_mc_address;
 	ib_info[0].size = 4;
 	ib_info[0].flags = AMDGPU_IB_FLAG_CE;
 
-	/* IT_WAIT_ON_CE_COUNTER */
 	ptr = ib_result_cpu;
-	ptr[0] = 0xc0008600;
-	ptr[1] = 0x00000001;
+	ptr[0] = PACKET3(PACKET3_WAIT_ON_CE_COUNTER, 0);
+	ptr[1] = 1;//Conditional Surface Sync for wrapping CE buffers.
 	ib_info[1].ib_mc_address = ib_result_mc_address;
 	ib_info[1].size = 2;
 
-- 
2.34.1

