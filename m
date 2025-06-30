Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E30C7EE39
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 09:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6002010E21A;
	Mon, 30 Jun 2025 09:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v0UVmlOa";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC3710E21A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 09:24:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4nylGGTiKpm8483BAwNOPRgXxpT6Ggl4IlNWCn5tlli1CcSshJPRqSSulJTABe/exWLsIwSYiTNftP69MZCkHmA74zTskmCdNJD4+9jFekw1syRq2QIjKlthhyAIetcUlkH1BCvgRZwleCheABa1llDxFSUtjKN1LYZLYPag1NDiNQd9VN3hFG6q7UiaxOavIPQDWlXSrfZPfCY/Lfjr4JmBUMlveUpTJcC+KIASiAveuKfxVPqDwSjZv2Ne6nSMp1bEWjwCmGouwt3ncJ9Cbjjff/50e0Dss/DONDgrNH23jv7J+FdigdOx/7wkUN0WkugNCdUkFIbXwwWCfQTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ8qwCkpc2p+4yE1YHMewZzmi2sOpq4LVjdgU6N5vnw=;
 b=zNs9vDpmA43ImEuT6Sa9sUq717fPtRYAYHUNtwEXhSkItLrXXWK6Zh4ndaF3SHSWKFZEvdyAdnDOxdkDVcz2ix44PsuZUcunH1LQoxmUHiEgNcjGJr6MotQuC0MFfnUa/gK/7Hx4mcVERUbaYS9/q3Eh2zLp4PZJ4kq5wwT2UbCba57ufHH56RRyaCycPZyuCs6CaQVG7vxm6pFJWcw+ypgxZnrug/ZxbgE6jDg0H+UPSQ/Zeu22vi4Qcrmk+dm4rpvXIX99EBK3ge1VZWfWJ/DqnA0XcUMtTNCkhb7lwgQAKN3zADHHcSdRbYTF8B/3cbask89WZScD5W20tavWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ8qwCkpc2p+4yE1YHMewZzmi2sOpq4LVjdgU6N5vnw=;
 b=v0UVmlOaQ4IQb04mvzzCfRIrdF7AzraTDsk3W55ftpZUhPZ/zNTU6/eaf0u+NMg8VqiC4uFwPsFSNrmtOomQStirEkZaeIJ/7ZXZckiuYcxmNfaM0oci71dZe24dTdrU5zvEhihJbXQcm6rFiD4pwIVIB9nGzjQsRebcWjB3AjI=
Received: from MN0PR02CA0021.namprd02.prod.outlook.com (2603:10b6:208:530::23)
 by SJ2PR12MB9189.namprd12.prod.outlook.com (2603:10b6:a03:55b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 30 Jun
 2025 09:23:58 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::da) by MN0PR02CA0021.outlook.office365.com
 (2603:10b6:208:530::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 09:23:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 09:23:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 04:23:56 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 30 Jun 2025 04:23:55 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/2] lib/amdgpu: Fix SDMA user queue submission by using
 hw_ip_info from ring context
Date: Mon, 30 Jun 2025 17:23:42 +0800
Message-ID: <20250630092352.172135-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630092352.172135-1-Jesse.Zhang@amd.com>
References: <20250630092352.172135-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|SJ2PR12MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e0f520-b470-4464-a5d9-08ddb7b7d72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NEkKJab+6kQkL8nyg71+vR6f6fMBGOGe/814BIzo3ol8IYXZT3DDDPOrgwQH?=
 =?us-ascii?Q?ivfRj+SHHM38FsMiSnOZj4OdmzQSfERgsSc42gJn800Oy1zjwAgYdoUTzuPW?=
 =?us-ascii?Q?CQ2IWy81iP5kYrSXSyJib+nxBQEOBUGWe+w+bZcioeSoCraQaE5mq0gKc0IW?=
 =?us-ascii?Q?uD1wBklijhE9HEDHGlzlAyesJfRIMqn9UnTE16zDecR/VExJQmBtPGZQK/iB?=
 =?us-ascii?Q?130iwxaQJ02Rb/t0uhAKKG9CEvNn+axJOJi+Ly5MtxPIJrB5cVG7TbIXRTOz?=
 =?us-ascii?Q?++xnbfXHVnZbcoNiWWhX5qyVKCeQRkiks//KfJTqnZZ/og4XlwI4dUHK3PaD?=
 =?us-ascii?Q?iJrVaJZFw7eHK4KCKF+ZnjdoEGw9f/7ZPXGW8KbTcMaP/Y/SX1OHyXmM6cLS?=
 =?us-ascii?Q?St5gdaA96MmDTx2ZbuFrbtr6D81YuOhDrdCH7rWUY5DfVWnzaBlt1K4j8pqe?=
 =?us-ascii?Q?KVwsLkUCxvV4vcL6DfqnsWAMZCK7N7cNnvosSVViJZp8QLCmj2SyhX8YnA2x?=
 =?us-ascii?Q?+1mxg8rHYM493LQR4Y4E9M2rED46QPcU+ZgquvBc1eMcSbfjtqnRcyWLKrED?=
 =?us-ascii?Q?UgwojBLBJ0AQF52fIG/BGE6KWHe+oSGsQQR8HRrwGHpC2yrJE2m6CYxk8E3r?=
 =?us-ascii?Q?z1JkAnI2ZlW2d66p6xqS1nS4DPgnnJUqH/SZJRFGGG9QDVtetYtv53oz4y6D?=
 =?us-ascii?Q?GfJKTRisdnfyqB4QHgYUDYEwUzVOZDxsONHJwJtPX4cI431j3L8zcI/ZMmQq?=
 =?us-ascii?Q?VZdawAVBECe+yCKukQ416gSgtVwsyyGCB+PqBmKivnetfwsf8jdVFISHt9Sz?=
 =?us-ascii?Q?EFCZKOLYuyvq8pXdESZdQXx9ciEIi81ogdg00hA9iC4u96kfUdMc9bvItxEJ?=
 =?us-ascii?Q?wA15Sx9522uj/rUje8XcYHzq65AaEuqEHkcNej3X/wp8QrwyIUPORAGFciHR?=
 =?us-ascii?Q?k8JFnAtSHI2t1gZEcz/eBPYq+ZzaZo4LcgAh2T+SyxBryawX0UqGFwPAAp8I?=
 =?us-ascii?Q?z1LPlcnRRZIQgmJLrNsbMzrDw0rM2A90zJhU/1zbJYGoBp19Ycs7bTK5E5NP?=
 =?us-ascii?Q?Cce6IWi9cuTanlkfN1nAM0muG7kryO/5QywZX+0CEztQTdnLrMARskB0A7+9?=
 =?us-ascii?Q?rCsXCAywo1jSFtPdR3qTa7nlkq9lXQbdTstfulI3OrEKwHV/eBN9Pkqmd1JX?=
 =?us-ascii?Q?G3bZqdE5kZ59stCmFTLzd21JAHenxIafBr2hSN4VRrT2mztN5GSDGPRrLTrv?=
 =?us-ascii?Q?OyR+5eteM53OWWEDmh7ZhHgZoS/AZCEi59Am0WVwIxQt07qMriyj3WIFDLgH?=
 =?us-ascii?Q?3qON1F9q0WkbKt8GK0Eqs4CXN93pWBw6/7DFbbZgx7rqR7XZsdXX2bmyjawd?=
 =?us-ascii?Q?a5jm8AmBoH1n7wZzh6up88GLkbouAoqoT0wakaModbpDDknvdUTJLogCccdJ?=
 =?us-ascii?Q?p/yyksZw5LJnVLgaXDlDep+Q53la7coPNPiephmRXxzvbFHVFIqK00Qu0Cnn?=
 =?us-ascii?Q?FItXw5UputrnK4Ey8bGDKaTu3ZXXaxV9ipKU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 09:23:57.3158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e0f520-b470-4464-a5d9-08ddb7b7d72f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9189
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

This commit fixes SDMA user queue submission by properly utilizing the
hw_ip_info stored in the ring context structure rather than a local
variable. The changes:

1. Remove the local hw_ip_info variable and use ring_context->hw_ip_info
   consistently throughout the command submission flow
2. Ensure the hardware IP info is queried once and stored in the context
   for later use in user queue submission
3. Maintain the same ring detection logic but now using the context-stored
   hardware info

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_compute.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 87faf8333..d53df241c 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -42,7 +42,6 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	struct amdgpu_cs_request ibs_request;
 	struct amdgpu_cs_ib_info ib_info;
 	struct amdgpu_cs_fence fence_status;
-	struct drm_amdgpu_info_hw_ip info;
 	uint32_t *ptr;
 	uint32_t expired;
 	int r, instance;
@@ -54,7 +53,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
-	r = amdgpu_query_hw_ip_info(device, type, 0, &info);
+	r = amdgpu_query_hw_ip_info(device, type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
 
 	if (user_queue) {
@@ -64,7 +63,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 		igt_assert_eq(r, 0);
 	}
 
-	for (instance = 0; info.available_rings & (1 << instance); instance++) {
+	for (instance = 0; ring_context->hw_ip_info.available_rings & (1 << instance); instance++) {
 		r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
 						 AMDGPU_GEM_DOMAIN_GTT, 0,
 						 AMDGPU_VM_MTYPE_UC,
-- 
2.49.0

