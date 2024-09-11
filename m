Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE0CEE01F3
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 06:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A5B10E186;
	Wed, 11 Sep 2024 06:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JcFaruYM";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C2410E186
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 06:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPmKsv80B5My0bPit6mvVZ3ay1YjfJaMvRe2p3f+6+QEwYc+83ykpPp68XCUL/ryK75+Bvtm9iJF4H8XxRiofxPxL5Y4E+zWUok90i2NBhv1Zz5aCZLJbJWHDW0toZPxbX3UO3QhdEYMdXoZComVL4I1elBXnFwInJBsYKyN/AEIHspK0vlxo42w42YMVIBbTNvNUQONNkMUUP59ljmqAJ9fvYxbMHJjdLjWzUrWEcsgTRiNNCk9QaAawaSLNlydujAwF3qZec9lSdC0j+IRga6z9pMYpLZSR+1oEWOOAubgbG7/cojUyekah16WoXXlu/hwvwK70xslp54UGdkFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDgyEmqKxvkSfeK7KF1HJuO7b6pbNDlETyTPqmorJp8=;
 b=QRBcUNu7nhmlT5yiGm2nCm8iV+d3icGn5YBfu2DURC8d0/fsG6LDvklgOM5v5G5HCCpyo01ZzIKXNIiATznDQZsmIMmrJ0aeypfWBVp1tBt0sOPll2dcZXYwe8r1OGtC7OqAQbkRc17GLEFDRXOFqDKbyQwANmaUJNVeP1obew4EnzDc8+5CeArG+1NtDZ1Xnv/U3An5MrATtqFGDnKN+OPxUf0tN4ZR7oPMgTV3yQRb0VDlqLZDt48WXzrOGLnIS6c948I2DcYS39EsijDHC4LPDlgfEok51nUD9lNkzH2LxhDtvlkB7x7V44Jep+AIAhvPADJMwZ7i1tgDgmD5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDgyEmqKxvkSfeK7KF1HJuO7b6pbNDlETyTPqmorJp8=;
 b=JcFaruYMvKn6ubV0sra5GpgcLwc75fjBt8tvD/B3C8vYoMRpZKsnpTb23+58xBSNXvXikmQxKqozy5z0+3nuNCfzwqYARrdGy+01BgRcglTlLyb4US4+UOVVXkHZRCPDA+jXp7Oe484yPO2/wS+qLw0zw/KHwmXaXKGQN7aP4D4=
Received: from SJ0PR03CA0345.namprd03.prod.outlook.com (2603:10b6:a03:39c::20)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.17; Wed, 11 Sep 2024 06:24:24 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::53) by SJ0PR03CA0345.outlook.office365.com
 (2603:10b6:a03:39c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 06:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 06:24:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 01:24:22 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 11 Sep 2024 01:24:20 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "jesse(jie) zhang"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t ] tests/amdgpu: filter some asic for invalid packet
 length.
Date: Wed, 11 Sep 2024 14:24:01 +0800
Message-ID: <20240911062401.1670741-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f82b9c-a5b4-4221-b8ac-08dcd22a6103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YZgg0NYI+6Ct6GKdH+5NfhoELoTHFlFGwYVSFszmS2TWbnHeA1wWJlU95mrP?=
 =?us-ascii?Q?L/BZGb8GFKXgFZ6dYxj5RC38ClEj6xwWWoB/avFh8Gku47L2Vj0AnYiVpPud?=
 =?us-ascii?Q?eh0kKuGaTJ/gPvG+JsQ9JGwJr2ZbhySpAKJEnA8mVdvV2Rbg92yoggYlxb17?=
 =?us-ascii?Q?h7invV61oaWt4DccVQyYhyaMpurcQ9AAwFPG2GY1oULHInFiJJcGH1vmqwZY?=
 =?us-ascii?Q?5YEs/NN/xNiLI2MwNcb+x48Omx5uf9wv+qUKrL3L5jO01qeNpjg3i+B1PJOU?=
 =?us-ascii?Q?2R0M8lkns4xNf62zMAvZrW6/kqjxs4wLztYYqf9J6bwJL78KTZ2cvXh+Yspo?=
 =?us-ascii?Q?ry26gTiNCIPji+HD91b89Z8vlhcpy5nxw9HRcsRLqYV19UEILCrC8UkUpdJe?=
 =?us-ascii?Q?9hBMuxYbCMtiBDNPF0xHy13dUUF++lpl9dGxSOcxezuMtvnCI0Qq2ULYacB0?=
 =?us-ascii?Q?UhzZjvouKbhemF8tc3a6rcT5ivN3XLP+kb11lLbv3Ks/E9DnkU31n6FoYiLK?=
 =?us-ascii?Q?4F7JrEjJ57pEo1MP4AU34tGItinaOhhqrYMgQr6fkC9g6KrjRNvDdy+2nnhl?=
 =?us-ascii?Q?EbyOtxWq5ESwPszHt675JEM3AKBr2KfoSiIlNbxEveqVmQy5xHitezU5aQl5?=
 =?us-ascii?Q?kbM/iyGwRIXTm5TRWgpvCtxOofHspzg2ouhqwlDScMTMGYvNlTrOpmUXffJX?=
 =?us-ascii?Q?QRk4yiGQWJwUUfAselOWPrAK6RrRpmGq6OIBgGOOaqrVP/g2BVb9Mog4ZzbP?=
 =?us-ascii?Q?kafHzgjnKgpRk3GsCgFcSBOYPa+/8tLMa3x89yaWuJKNnlUCzExiFs3Axhng?=
 =?us-ascii?Q?kCsmnppLJly6ovOCjbZJdbpWjNZmoEGmfRDY9GMOJXaf0xciZpLdcHKHaqN8?=
 =?us-ascii?Q?cEsNyRSFNpA1E/Kd4S6K06GBhA/4ugkUTirrhzJTsaaalIe6dPFWIogoVUXr?=
 =?us-ascii?Q?M8q9pio0fzurWKqFNrZaAE+tScvetzt1gQLHHSRbNJDPneHdWr4Za4Q4UvD5?=
 =?us-ascii?Q?o0JVLJ/x0VnoYo0AyAGqKYv7CQIT9fpkZ7yvsPLFhbt0G69/IkJOSLtBaFqt?=
 =?us-ascii?Q?Qn9mSfdY3hl+5LG8Zh5KEk+2AaHGc4C58eE7cRAI67ipXnq9ZVUvLif0WgZ8?=
 =?us-ascii?Q?VJfRAG0YTtG8TpCWgFd3jaxfyrwC+zzczt949QExU3alqLdMrd8ayBOdeLcX?=
 =?us-ascii?Q?TfSmjjhtpjm/QBboldenlo3PLPTMaCWDOVK6vUy+dgrRMPfpA3ntvh816+7W?=
 =?us-ascii?Q?XvpXqukbVU/ZfolawVQmkDtOCOX/WUXZaeVOZ3lcER6I/2WiqJB2V6yo0ZP5?=
 =?us-ascii?Q?LWgJlmM+3OUPmn3FtVMV4Quw2JgyDs+mYiMBk3mKlUfDnq1NWfiVzD3d5D14?=
 =?us-ascii?Q?6nFysUF9sBYjObod4GqklkB+0BoL88naKb61HDcp2VXz/C5LLcotJEECEpta?=
 =?us-ascii?Q?Q8aTzhJtUcnzMLfsQT24GwmOQ/h5ggzV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:24:23.6142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f82b9c-a5b4-4221-b8ac-08dcd22a6103
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
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

From: "jesse(jie) zhang" <jesse.zhang@amd.com>

Filter some devices because the firmware does not support recovery it.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 8f5c7d4b8..d2d57d3da 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1082,7 +1082,7 @@ igt_main
 	struct dynamic_test arr_err[] = {
 			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
 				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_GFX1100, 0x1, 0xFF } } },
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
 				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } },
-- 
2.25.1

