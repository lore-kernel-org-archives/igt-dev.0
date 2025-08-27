Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB18C8303F
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 07:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCAC10E707;
	Wed, 27 Aug 2025 07:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X5adKdAA";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A795510E707
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 07:03:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkrodBicjaitWfaFlHaZdy/S3Ax6MxBR+IhUKf4EvSFM8MNuqYiBlfhJiaCz5TisNXp/0SkU0IDOzj+cJtEQFlmFjIOsKRLNqYqqpOVZ+kF68HzhrDcDoFJx0Dija8OHW8BScTevVNPF1wYJOSSUMXBuq+yRUktNu/vmJzV3B5yFKvOFNXoR4kOKWKt/cSAvxYAAeZDkVJeAQrbjf86GAiTU/NxnLy3w3TlTehmkgvUVImojrxnYUHPttr7fSmn28zErSaPfMt2OMRqqiwwuLfdHMadnznq4IbjXydWN6UJR5lnbItEXJ85M4OVmsT+HJURxiRMF8wJbgTxAU+6s8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiCSatbaRGx4o1KFF+7kWJZoF63aZAydPr0SudSF5As=;
 b=MzZu0dnDlIy1lifdNTgevoMsUw8398KVAAjsFmC5tk/4+m2+EyCtKcq02/c6t0vwndshCqwuuDvnaOH/w2wBOtQ35H2M4KRgfXQYqlVl2zm1dMoIB4H1TT+wVnl3hNzV2b5VCCydxIbl/mjQPOhgik3C9NF5SA1QBNSE6p5BbqZt3XCVRirL6APOS3lC0sz2H5aN1wCT8FUAe0xd/9m7SZ05ckT/6M+LwU8UYM/13G3Mn9ozyyh4OkmKc59Gzp1+LSLO34IKm+CteubYyd5IQB69Ag3Hst0vKjOoUFj52tbEYIrgwdvV/iMBoAvv6rbFYB3Di91dIUNFkZ0gx6VpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiCSatbaRGx4o1KFF+7kWJZoF63aZAydPr0SudSF5As=;
 b=X5adKdAAGV0F+rue1p/XevxQY2RJ8Y5QadYE81NOPl35W4D+dBp3mT1TWqvc/2gJQtQH76PeDKOlbUIoSdM5/dbanm99NV3s7lGhNYL7XqN4pdhmSkZTxnEe7Ozzki4+dzLLKGlUKz2jZAUnfQLTjsiVeZuqN8u08u7s3/CPlHI=
Received: from BY5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:1e0::25)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 07:03:52 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::f2) by BY5PR03CA0015.outlook.office365.com
 (2603:10b6:a03:1e0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Wed,
 27 Aug 2025 07:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 07:03:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 02:03:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 02:03:50 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 27 Aug 2025 02:03:48 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: unify SDMA protected fence sub-opcode
Date: Wed, 27 Aug 2025 15:03:37 +0800
Message-ID: <20250827070348.1793095-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: f10b5003-400b-4f32-647d-08dde537e13f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TKCKR6xLNi08rhh5zzeB7AUX0TVYzGYTZr+3Y0mkZBzI+knssirhlU4h7hU4?=
 =?us-ascii?Q?cy0kPq50Igwm/E37N/BAXpPyeA8tS+Y/n+BBYfV4H1Ojavde7tLupQVWkesE?=
 =?us-ascii?Q?xQdztdbCQp0ASVnmb2gw7mrndGh6lkztODGG4mWHad1ujAnzDG3PhEkH/Ymu?=
 =?us-ascii?Q?gENkpJyjPuZvnPwFBhMzmPkngro75A7LVc1FG93oWZNxbqckH5xdfN+joM0e?=
 =?us-ascii?Q?/fHXPik7SE3uosO1frgRhRL3mOfYQCUGrMCBzqR7nH/BS06XeBkwEo4XvccM?=
 =?us-ascii?Q?7sYaGKosub83cYbTzK/SE6HNkuzNqZEYTFjt1ZIGbJrFowQsxmfgeV631DwC?=
 =?us-ascii?Q?mhuUxud3DGwBnLxGBgXw/hryB1ShufrNYo0sarPc+UrTNptUMujLc7EIQgX0?=
 =?us-ascii?Q?ZYJOiYn4eJTiUS2lDXmq2sFIQoSu3H5a9m2d0rgh3t2qdOYV/LNA9v7GXew4?=
 =?us-ascii?Q?dj50UEeAdM7yMxm1opb2p4Nmt1I5JLBu2NM8RnJZvV6aGAh0gpwp5djGmoAW?=
 =?us-ascii?Q?rrELVt4WxSymoBinotb4PaerAd+iZB7wqIhgyeEnJko8bYsI77SSsQq8BFbH?=
 =?us-ascii?Q?1VIEgKwFJwRKVHM37VppPq2TYmxuzJAFbgJUQPcwpQZQe+VshhYwLf3nrdoF?=
 =?us-ascii?Q?u4MYlmOnGG0BhXkPzfS952xTHG0ONxrH5N3zgZp9bzsQ8jVoKvJ2pehyMPx4?=
 =?us-ascii?Q?Tfcmwmbf+K7/Ltw1W08HFgPCSuC9x+Id0INGuhb1mLV36uZFfe16DjTFipuC?=
 =?us-ascii?Q?KwNd9cqz8Kge3fYj9hkTyIXZpoB1WnczCQ4fA+aAb6CHdHLcqNevg4WluqYu?=
 =?us-ascii?Q?8UZqrCjDOzrsNsAkoKadI7sc9PQxJIqt5igBO/YEJyyEjD45dT/Jl5BJ0NlW?=
 =?us-ascii?Q?BTrYbH6303NO28rDXlXkT070rldhwmUmwzhYSSOWCP561eo8yvYDBQl5KAAf?=
 =?us-ascii?Q?41iq7FqJVk1bnbeRv2HZirD638Awi1RlxETNxWiOPvKnbFC0QP86Jrb2iLir?=
 =?us-ascii?Q?1U5gurQr8FOGM2gG3YlffOySkz9A1fiQ9oiLM+1f2CkD94WBuvj7n/Oi19u6?=
 =?us-ascii?Q?w+c+4qN10lzikAv5WsbFHVP/BhPYNGqGMORHYhiWkl/47l6Unym2KvJaxL8/?=
 =?us-ascii?Q?/+x1jbeesqlakfrKI/1WNJXkdDmZ51losrOsJWV+q9ZT7kwYlWfuJ4d3u5bU?=
 =?us-ascii?Q?Fn6RGA1f9O3I6AMzUIXIsrhnBk5BLGUIO0CFaUjH/uSPuxIvbRqUaTIIrA6v?=
 =?us-ascii?Q?WZHv5JnvwNQ+5jZElxlCH5YDoajVQTGmdbpmi9jg3vpCVmGaWDLF7DFDRvN5?=
 =?us-ascii?Q?OldWex1UU6X8lLV++yXM5DhCW9vl6Q5OpJirAaCz+peincAnA4lXSi4bkEs+?=
 =?us-ascii?Q?v9JCb8FSifQkIaPWl7H+312kpTHfVkXgHCl2C5ExQu7MIF2A4LFoSN8s+H7V?=
 =?us-ascii?Q?QoEfS/8MmMy1NWRz321dp2shB8TLBcTaYQceLiKcWUt5FwjoplgYQDj15Xm8?=
 =?us-ascii?Q?u5RE/tOeOHo3oRKbEeRiVAu+Uw0u6l6O0oFC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 07:03:52.0121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f10b5003-400b-4f32-647d-08dde537e13f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454
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

Consolidate the SDMA protected fence sub-opcode definitions across
IP versions by removing the version-specific SDMA6_SUB_OP_PROTECTED_FENCE
and SDMA7_SUB_OP_PROTECTED_FENCE values. A single unified value,
SDMA_SUB_OP_PROTECTED_FENCE (0x3), is now used for all SDMA versions.

This change is made possible because the latest SDMA firmware versions
have unified the SDMA_SUBOP_PROTECTED_FENCE_SIGNAL value across both
SDMA6.x and SDMA7.x hardware.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 5 +----
 lib/amdgpu/amd_sdma.h      | 3 +--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 6955ba7dc..296c45de8 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -605,10 +605,7 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 		amdgpu_pkt_add_dw(control); // IB length in DWORDS
 		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
 		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
-		if (ring_context->hw_ip_info.hw_ip_version_major <= 6)
-			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA6_SUB_OP_PROTECTED_FENCE, 0));
-		else
-			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA7_SUB_OP_PROTECTED_FENCE, 0));
+		amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA_SUB_OP_PROTECTED_FENCE, 0));
 	} else {
 		/* Prepare the Indirect IB to submit the IB to user queue */
 		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
diff --git a/lib/amdgpu/amd_sdma.h b/lib/amdgpu/amd_sdma.h
index 2a9339cfb..4a6342bbd 100644
--- a/lib/amdgpu/amd_sdma.h
+++ b/lib/amdgpu/amd_sdma.h
@@ -105,7 +105,6 @@
 #define SDMA_NOP  0x0
 #define SDMA_OP_INDIRECT                                0x4
 #define SDMA_OP_PROTECTED_FENCE             0x5
-#define SDMA6_SUB_OP_PROTECTED_FENCE             0x1
-#define SDMA7_SUB_OP_PROTECTED_FENCE             0x3
+#define SDMA_SUB_OP_PROTECTED_FENCE             0x3
 
 #endif
-- 
2.49.0

