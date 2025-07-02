Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1CAC83038
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 05:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C577610E308;
	Wed,  2 Jul 2025 05:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TrTRlFtd";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E00010E308
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 05:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QktHVoKdY/F5ttZBZ459glSWU17oeuEJtzoOWTJ5vLsa5zFHv7WKXHH4PYL2+zaoali7liB0pvfuPC/ONCBPuDz3ohvqWIb4ampr2gDieWgwRWi0j2nldHHp2KCmRl2MWcvcqZkceA5VOwv+lJsbq6o2VnCvNBXpM1JxP22B913a0bWvQPw/AJTGWKoErOumiNOGQ85g38Q6jzi8Coi3UNl8piDj4PammMxV85blDGH0153RfayuEcx3j3xEiXWPe2KZ05G+Jngif+tQuwYe64tgTM8nWGtNPr3UFkW5FqLqMShLFnV80Y1OXnul095quAsvA+2IHpkjR43SYq3gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SjHXJOaK9l2rYKavfc9CjSPmPFAh/SnGVuGk5hwTx8=;
 b=wGRVAzZ5SRreCmAlhMWqDhbLbG/CWUKvrdzfw84dwPFAOkheCtUb9LlYHpExREI0cKBzlQ4y/LYpJKIvdU6/JHKrNgw4sxeLZkzmAtYoOv0jTFBXlULKiMzZHlXPPX9ByUHk/1D8Op8Wm55ABzEAtTo53yq21Y7vnaB1SIPdBA4ARm0K+RXwEWu0//gJ93r4oA5RUPCEFnlIabaUMKKIDx1UBWlWgw/mpLP0AE09mMRbTaxGG9XeT8qeIcCs6fyPlNbfiG0HnqVliSs34gAS7T4EC93QWbT/y8OWooRKKoZGigf/7rOfjD5dYiJwP8ZSXPoQURRc9XeIR/G00o1YJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SjHXJOaK9l2rYKavfc9CjSPmPFAh/SnGVuGk5hwTx8=;
 b=TrTRlFtdfoqK3VBqhSp0RU9iAxfUE1nwiNM4Ti+QfeggWZHaBw5vP/GubErOtvdSJ55OBy9wjTOaZQGQ8p4Y1iaEeLgsNKLSaJIrfhQPJJrCQjOYLn5uf1djRoZ4Lk6zgo8HxHz+/nEpRwynVRTNBknHUMzQMNNz7aW7cHu0BXg=
Received: from DM6PR17CA0036.namprd17.prod.outlook.com (2603:10b6:5:1b3::49)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 05:47:38 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::72) by DM6PR17CA0036.outlook.office365.com
 (2603:10b6:5:1b3::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.26 via Frontend Transport; Wed,
 2 Jul 2025 05:47:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 05:47:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:37 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Jul 2025 00:47:35 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 3/5] drm/amdgpu: Add RPTR support and volatile
 qualifiers for user queues
Date: Wed, 2 Jul 2025 13:47:11 +0800
Message-ID: <20250702054730.366888-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702054730.366888-1-Jesse.Zhang@amd.com>
References: <20250702054730.366888-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|CYXPR12MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6acdc6-9551-4cdb-b1db-08ddb92bf401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x3Uc7OINxF3wAmYgGgSdLNnJT3zzvk+O3MHDOiiUZoYuXVid7X+rVTjgvsng?=
 =?us-ascii?Q?AXXv3Mysdv/P3qogQ7CNJL3FZr/HSB7sDd6XdyVXE3nij5ZCNXtk0t+15xXF?=
 =?us-ascii?Q?sXSpVxlUpaYrU5anlhhFRU27iZjCTrawdPNB5v8UMnX1h+15kfNy0u7jAHD/?=
 =?us-ascii?Q?cZ0pUJRTdxdQH8M4miforGcocQj1ecwYWH+B/9PLbUuw3uSvrm9SS822Br+R?=
 =?us-ascii?Q?9k/YkhImsGlc6iDDkFOWX+m8FFHKvtfY9vuR8WzsdymmmgOT5QjYS9fEavnI?=
 =?us-ascii?Q?KTjA8sKTBszuJoqYhhZHYvEoPEIS+TwjiEpLy6TdgPqZ4GlaQIa+bQuGFieC?=
 =?us-ascii?Q?4zTyIwm/o0tizJxPVW870c3NPmlzoNtSZdxj+aBvZXTPKta/4gW2Rd2GYxv4?=
 =?us-ascii?Q?fgOv2DhHCRcz/qLxcxRZOuOVazU3kECGMCC3bhmH60caknhuuUZuwA7A9vch?=
 =?us-ascii?Q?krftzqALVxEdqyUz3C2RaZF6k2TijVqymFm5zYHoOmriRU6Skk9v5xC3v2LH?=
 =?us-ascii?Q?769WAPru1QG2VnsM1IV3BDEBYIi78J//Wa9GGVu47Jry/CJoS41cfgk37r33?=
 =?us-ascii?Q?0rNjL2ApQ37Gwkkpdo3MdiphTDJBlNv4oSYG4mghHvPFER55OD/9eFaF3yab?=
 =?us-ascii?Q?akYThZXIMmiz5jjtzvU09cs0pwDhgz+KCLpQ9I7qLp5abGsqqWkl0dmS5LiH?=
 =?us-ascii?Q?X+conji0yBSPjT6Uje48Zl7I96whI62zBdursPmzedp+7KH401l450Z2ILrE?=
 =?us-ascii?Q?8yIcDeRtMnucjYfUKuaFhTl/mat2kvgxbCmcaUlI71mNv4iN8d/oAa+BR1fI?=
 =?us-ascii?Q?Su68QoOuL5BCSM3USZOPbiDMH81jvnWtnn9sf0vrCuTeppH6a2Wt4C8XHiK9?=
 =?us-ascii?Q?B0d57upnFA9tYpUG466TkbQFaLD5Xw3CpeGqTrpCrNbYIPJprI3jMmMgz6cU?=
 =?us-ascii?Q?yMOTZeIDFHIkAggkTp08y8e1eT7oTYO20nDOntZoiUrIPCR2SJtc1jYh65yG?=
 =?us-ascii?Q?q2zbc8CKDj+KwWpEGmkZKEY7pNuGX4bSmVGebnKdC46RB0VTKgBaC2GybHCW?=
 =?us-ascii?Q?LJOJM2Bw/HyG4kOvoVPf2E9wcArA43An4l9GvXwVzWCU97Lybb/Q5i3g2Qzy?=
 =?us-ascii?Q?U+XZIrk5ilwPyxH92L/TVeltaE+rYAxkXARl4En4e0ruvhNcVyHJWHS7bJsw?=
 =?us-ascii?Q?zx+bgQi8IztO9fPJuPizCWI8k7nQkohKGeq/aiUsRzWx2HK4807rTDdz6s2X?=
 =?us-ascii?Q?Gb+pPvYmtrFmFXY39jl2lwKag5UfSG+wAHIFCDjiuC+J4i7NfLs34WjhmUyO?=
 =?us-ascii?Q?pywVbzS4kft7nPn0GrdWByfiqMZSQ85FABR99ZF7j3LfZ87GGWGMn77sPgrj?=
 =?us-ascii?Q?+w5zUNBuWyf7MX5VvaOHe7PADLp+hJizhg5rp8QeKAYWNVB0wFWNj9VkHxFz?=
 =?us-ascii?Q?SfwqBCRZSyWvV2eLTZpltTYfccOYuO93JbarOJJX2BmODhsbH17x1DUSDQz6?=
 =?us-ascii?Q?E7wW5X7L4bmg2ngFWtuYIwtMCc4Ug2MxTjPP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 05:47:38.4197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6acdc6-9551-4cdb-b1db-08ddb92bf401
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337
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

This change introduces two improvements to user queue handling:

1. Adds rptr_cpu pointer tracking in amdgpu_user_queue_create()
   to properly handle read pointer management for user queues.

2. Marks both wptr_cpu and new rptr_cpu pointers as volatile in
   amdgpu_ring_context to ensure compiler doesn't optimize away
   accesses to these hardware-mapped registers.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h | 3 ++-
 lib/amdgpu/amd_userq.c     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index a6c35c171..2a4fa1742 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -166,7 +166,8 @@ struct amdgpu_ring_context {
 	struct  amdgpu_userq_bo eop;
 
 	uint32_t *queue_cpu;
-	uint64_t *wptr_cpu;
+	volatile uint64_t *wptr_cpu;
+	volatile uint64_t *rptr_cpu;
 	uint64_t *doorbell_cpu;
 
 	uint32_t db_handle;
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index 10e82a5a4..43a2d10c5 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -416,6 +416,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
 
 	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
+	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
 
 	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
 	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
-- 
2.49.0

