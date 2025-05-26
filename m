Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9D2C5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 13:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC5210E37C;
	Mon, 26 May 2025 13:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YE6JYzrT";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569F610E22F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 13:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxD+91IKeAMCH5/GaYFnMLi5A2MXkedNAb7CEC46KZFcct2wCthITyTKaBJz5IN06v/8aE38BmBO3Yb6P1qL4T9me6m1rRT58OcBVs/pvSiixbvXS0oUk9k2tTSmaBHJT3xPm5uJZ3I4Pf/5yQz+iR1FJj8ejkkLq3nqksJbFp7un/FmdgjKZfI1Vlr9A8b267I7LZOTakddN1HTbRJIfBQkEUhkcSEg8agiAdVyDD4L5pGif12fgxRvK2Lmk9K3AFvUr9fTR7Sb4y6ykDnNFaCQpGcWT32jX3bQKgz3GmaBRdne7UAZdlVJcjBUQG95QYSBXTKF4+VpJ6Yby/hxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbV5/51T6lg0WovMy5/s6MAUfCc8vx2fqHxCON6G5tY=;
 b=ysP/pdPAOZCymiLuNDKVPp2Vb3KLEsxu9I5B8i7SbrPMsINSettiQmwMEfKGMdBnebrFtRHh1Op26teD7GpZ+v0kNlmmPmJ8G0csDCDOW037PoxZew+mIuZigO4PT5KYYmd++AgDGgrbCJz4bo8rvy522h2AbkrStfqhLFlqZBLGVXbRkqhWUdRx+ADKatz6rrOuFqLr3ITB+Itp1KDT0HQE6ZJ3uQBtaUVro005V2CF/6F+LGtZP7y5QxBaJoHG6rhf/MwKV7G170iYP9EjalRTZ2cgSfwL6Vhb6OSRdvu1X6AtkWFLYj3wxAwwWMVkJxSlnF+2lf8zuQWL0EQI5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbV5/51T6lg0WovMy5/s6MAUfCc8vx2fqHxCON6G5tY=;
 b=YE6JYzrTcnZE9+vXUjW8zdqLijWA1H5wsuMKmbZY457qEgBYY1HnJbuYlCP04ugXjS5mCBH8P25Hw5qyV38iq65nQ2p8Z9Fd1eAzJl3XbvOiF5qd/+Cbq19R4rGixREMT65/+otW+mtiZkSOQ8NLiWTejFXakMvlH0cHgyYDG6I=
Received: from SN6PR01CA0023.prod.exchangelabs.com (2603:10b6:805:b6::36) by
 MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 13:03:30 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::e9) by SN6PR01CA0023.outlook.office365.com
 (2603:10b6:805:b6::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 13:03:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 13:03:29 +0000
Received: from rtg-MAPLE.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 08:03:28 -0500
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v3 2/2] tests/amdgpu: add fwm preemption test case for
 userq
Date: Mon, 26 May 2025 18:33:05 +0530
Message-ID: <20250526130305.20878-2-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526130305.20878-1-yogesh.mohanmarimuthu@amd.com>
References: <20250526130305.20878-1-yogesh.mohanmarimuthu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|MN2PR12MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd5709c-6334-43c7-93ee-08dd9c55b631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/04FLPIcC20H0lsitipDlwltwEJoXiiYEY+b9rHF06k7C83D3H82hNtNJyRy?=
 =?us-ascii?Q?xAtnj2gfeABtBzms6YlxSizU/ItNs6UAZgw4VkhPAWnB8xnuzSSY9Hk80nrx?=
 =?us-ascii?Q?pvWos3wfCOXj5L5CFjZ2vFtRm4OYQvWFpoersfEB8/u7flpC5ZQ5vxAGU1tU?=
 =?us-ascii?Q?dY8kpmp0ResHEkGQofoa2i3UcQ2rpbZezgdsdEeBeTd9SImGi7YdUdj7R7ru?=
 =?us-ascii?Q?ti2pcw1MXgGQOfiMfKPkb7tNo0xlKm/uONjHeTVMvHkdRNQJSZlEZ9byCc7W?=
 =?us-ascii?Q?xhL+mEeauYurbgBDqONFDcXCqD99y0D3rlk2/vCC8PNrwwsBgxzV0PxqTIbi?=
 =?us-ascii?Q?Nj8NFQ+vTo5D9ZfkhTq2kF1NwNvmkLd+tiu0ggv318+ren8K29BoCaZYJO9a?=
 =?us-ascii?Q?avZcMMbv8FbmSoXxH7eki3lJ6umTRzOcTeeYklKyJC7QL6yGuoRGcYBKj8wA?=
 =?us-ascii?Q?b3/osVQjWuEcPUeyUblobopY+j3zC71wgzsKi8RflV/pSnmZpDCI4EuxXu5f?=
 =?us-ascii?Q?Coly5Nz96gV2WtnoLAIDQHLBIbVjvbQuGRP4QOOmdu5/ypJQQFG09q5dBhnX?=
 =?us-ascii?Q?AYtP1CoO0xplI1ol7htJvQ7U2jXdj/8P08nL7ozBQZdqVEr/KUTLZllvOAFc?=
 =?us-ascii?Q?fsUgjNOEsm4RXommworKRj0pDo+hC+si+RnJR5gjh/gtW5TCFB+nW3H1lOzl?=
 =?us-ascii?Q?s6eQlzq6JiWFgcf5xYwBg/ms849PyHuixCHP23zTjeoBKlrE+3CQvI++Be5g?=
 =?us-ascii?Q?cfTPw5RQsNZVc2Dx7mXN0fJ0r4Ev0z6YUgQO629CG+7OV5FVbe9opZQaouVy?=
 =?us-ascii?Q?4DyoRLa24KW1C2oRhkhLMyLoQ8jB56Mm35JdP9iv3FVcftWwuoh1ZjzKouQI?=
 =?us-ascii?Q?mbXRjk0Rn31Tq35mysOyXTMWvCevnjYXxkxkYSQoK8m3+Nc8b3ZfbrxDMg2J?=
 =?us-ascii?Q?DyMqF9qSq44hVigRAb3XZnyGPtR/2+O8H9BcY+ZqxwtFXZvZZf10fr/dwe8m?=
 =?us-ascii?Q?TjPpxuOFA75M5kpEDpM7tWgC3nZoy0Kt+JIV5V43qjYyFzgrLzA8IbjS+pqz?=
 =?us-ascii?Q?MfH67XJZBaFM1Lj+LHEqCbJcnJ9Ga/gG8fygsbWJ6sHlZdy3cnS/7J08LdQG?=
 =?us-ascii?Q?koyB+uLGDQOU972m/HJy54vDXp3aQNY4PevMrXuOHSVPtt5afBM3HQKEXoRR?=
 =?us-ascii?Q?7+DMvWHzCnp7hd0/B7KNAUnqGtqXI4w51fkp+k1hUsWsgu+Vi3xZbO85Bqug?=
 =?us-ascii?Q?C0/K1d1/D0y3CCMuS3ZOekHL12cyU8dyKCrlEkOu+OYusnCx90Dcfz0W2Idw?=
 =?us-ascii?Q?DfLr9+6oLjH7X5PKl6JzGbRflcZTnXj4gndwU2IxhG1gj652H4R4pf7o8Xx7?=
 =?us-ascii?Q?QXAVEfA3QstJwlsAV4RT6T+yH1+FxvLp4jIjVmGaUfC8cw/L2Um15B9qTPVE?=
 =?us-ascii?Q?gpAjYkmIcyFPyFme9uCH/BTUJcyLDmM/sdiVnTpPCPiKu0/2xsvQEs1t6iRd?=
 =?us-ascii?Q?k32sd7yS9lol7hWKpNrydkRYTpLL6xvXEvk0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 13:03:29.8604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd5709c-6334-43c7-93ee-08dd9c55b631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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

The fwm premption is tested using below algorithm,
1) create 2 queues
2) submit dma write job with unsatisfied fence on both the queues
3) if the dma write passes then the test has failed

v2: reduce timeout to 2ms
v3: engine select is bit 0

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse.Zhang <Jesse.zhang@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_PM4.h     |  17 ++++
 tests/amdgpu/amd_basic.c | 178 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 195 insertions(+)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 8f59b4223..64c6b3d4a 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -195,6 +195,23 @@
 #define PACKET3_INDIRECT_BUFFER                         0x3F
 #define PACKET3_PROTECTED_FENCE_SIGNAL                  0xd0
 
+#define PACKET3_FENCE_WAIT_MULTI                        0xd1
+#define		FENCE_WAIT_MULTI_ENGINE(x)              ((x) << 0)
+		/* 0 - me
+		 * 1 - pfp
+		 */
+#define		FENCE_WAIT_MULTI_PREEMPTABLE(x)         ((x) << 1)
+		/* 0 - no
+		 * 1 - yes
+		 */
+#define		FENCE_WAIT_MULTI_CACHE_POLICY(x)        ((x) << 2)
+		/* 0 - LRU
+		 * 1 - Stream
+		 * 2 - noa
+		 * 3 - Bypass
+		 */
+#define		FENCE_WAIT_MULTI_POLL_INTERVAL(x)       ((x) << 16)
+
 #define	PACKET3_WRITE_DATA				0x37
 #define		WRITE_DATA_DST_SEL(x)                   ((x) << 8)
 		/* 0 - register
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 914d27909..075057960 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -689,6 +689,176 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 	free(ring_context);
 }
 
+static void
+amdgpu_fwm_preempt_test(amdgpu_device_handle device_handle)
+{
+	struct amdgpu_ring_context *ring_context_1;
+	struct amdgpu_ring_context *ring_context_2;
+	struct amdgpu_cmd_base *cmd_base_1 = get_cmd_base();
+	struct amdgpu_cmd_base *cmd_base_2 = get_cmd_base();
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, AMD_IP_GFX);
+	int r;
+
+	ring_context_1 = calloc(1, sizeof(struct amdgpu_ring_context));
+	igt_assert(ring_context_1);
+	amdgpu_user_queue_create(device_handle, ring_context_1, ip_block->type);
+
+	ring_context_2 = calloc(1, sizeof(struct amdgpu_ring_context));
+	igt_assert(ring_context_2);
+	amdgpu_user_queue_create(device_handle, ring_context_2, ip_block->type);
+
+	/* allocate bo1 for dma, bo2 for fence and bo3 for ib for render context 1 */
+	ring_context_1->write_length = 1024;
+	r = amdgpu_bo_alloc_and_map_sync(device_handle , ring_context_1->write_length, 4096,
+					 AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+					 AMDGPU_VM_MTYPE_UC, &ring_context_1->bo,
+					 (void **)&ring_context_1->bo_cpu, &ring_context_1->bo_mc,
+					 &ring_context_1->va_handle,
+					 ring_context_1->timeline_syncobj_handle,
+					 ++ring_context_1->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context_1->bo_cpu, 0, ring_context_1->write_length);
+
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT,
+					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
+					 &ring_context_1->bo2, (void **)&ring_context_1->bo2_cpu,
+					 &ring_context_1->bo_mc2, &ring_context_1->va_handle2,
+					 ring_context_1->timeline_syncobj_handle,
+					 ++ring_context_1->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context_1->bo2_cpu, 0, 4096);
+
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, AMDGPU_GEM_DOMAIN_GTT,
+					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
+					 &ring_context_1->bo3, (void **)&ring_context_1->bo3_cpu,
+					 &ring_context_1->bo_mc3, &ring_context_1->va_handle3,
+					 ring_context_1->timeline_syncobj_handle,
+					 ++ring_context_1->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context_1->bo3_cpu, 0, 4096);
+
+	/* allocate bo1 for dma, bo2 for fence and bo3 for ib for render context 2 */
+	ring_context_2->write_length = 1024;
+	r = amdgpu_bo_alloc_and_map_sync(device_handle , ring_context_2->write_length, 4096,
+					 AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+					 AMDGPU_VM_MTYPE_UC, &ring_context_2->bo,
+					 (void **)&ring_context_2->bo_cpu, &ring_context_2->bo_mc,
+					 &ring_context_2->va_handle,
+					 ring_context_2->timeline_syncobj_handle,
+					 ++ring_context_2->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context_2->bo_cpu, 0, ring_context_2->write_length);
+
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT,
+					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
+					 &ring_context_2->bo2, (void **)&ring_context_2->bo2_cpu,
+					 &ring_context_2->bo_mc2, &ring_context_2->va_handle2,
+					 ring_context_2->timeline_syncobj_handle,
+					 ++ring_context_2->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context_2->bo2_cpu, 0, 4096);
+
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, AMDGPU_GEM_DOMAIN_GTT,
+					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
+					 &ring_context_2->bo3, (void **)&ring_context_2->bo3_cpu,
+					 &ring_context_2->bo_mc3, &ring_context_2->va_handle3,
+					 ring_context_2->timeline_syncobj_handle,
+					 ++ring_context_2->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context_2->bo3_cpu, 0, 4096);
+
+
+	/* wait for gtt mapping to complete */
+	r = amdgpu_timeline_syncobj_wait(device_handle, ring_context_1->timeline_syncobj_handle,
+					 ring_context_1->point);
+	igt_assert_eq(r, 0);
+	r = amdgpu_timeline_syncobj_wait(device_handle, ring_context_2->timeline_syncobj_handle,
+					 ring_context_2->point);
+	igt_assert_eq(r, 0);
+
+	/* assign cmd buffer for ring context 1 */
+	cmd_base_1->attach_buf(cmd_base_1, (void *)ring_context_1->bo3_cpu, 8192);
+
+	/* create the ib for ring context 1 */
+	cmd_base_1->emit(cmd_base_1, PACKET3(PACKET3_FENCE_WAIT_MULTI, 4 * 1));
+	cmd_base_1->emit(cmd_base_1, FENCE_WAIT_MULTI_ENGINE(1) | FENCE_WAIT_MULTI_PREEMPTABLE(1) |
+			    FENCE_WAIT_MULTI_CACHE_POLICY(3) | FENCE_WAIT_MULTI_POLL_INTERVAL(4));
+	cmd_base_1->emit(cmd_base_1, ring_context_1->bo_mc2);
+	cmd_base_1->emit(cmd_base_1, ring_context_1->bo_mc2 >> 32);
+	cmd_base_1->emit(cmd_base_1, 10); // random incorrect fence value
+	cmd_base_1->emit(cmd_base_1, 0);
+
+	cmd_base_1->emit(cmd_base_1, PACKET3(PACKET3_WRITE_DATA, 3));
+	cmd_base_1->emit(cmd_base_1, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
+			    WRITE_DATA_CACHE_POLICY(3));
+	cmd_base_1->emit(cmd_base_1, 0xfffffffc & ring_context_1->bo_mc);
+	cmd_base_1->emit(cmd_base_1, (0xffffffff00000000 & ring_context_1->bo_mc) >> 32);
+	cmd_base_1->emit(cmd_base_1, 0xdead0000);
+
+	ring_context_1->pm4_dw = cmd_base_1->cdw;
+	amdgpu_user_queue_submit(device_handle, ring_context_1, ip_block->type,
+				 ring_context_1->bo_mc3, true);
+
+	/* if fwm packet got skipped by firmware then 0xdead000 will be written */
+	usleep(1000 * 2);
+	igt_assert_eq_u32(*ring_context_1->bo_cpu, 0);
+
+	/* assign cmd buffer for ring context 2 */
+	cmd_base_2->attach_buf(cmd_base_2, (void *)ring_context_2->bo3_cpu, 8192);
+
+	/* create the ib for ring context 2 */
+	cmd_base_2->emit(cmd_base_2, PACKET3(PACKET3_FENCE_WAIT_MULTI, 4 * 1));
+	cmd_base_2->emit(cmd_base_2, FENCE_WAIT_MULTI_ENGINE(1) | FENCE_WAIT_MULTI_PREEMPTABLE(1) |
+			    FENCE_WAIT_MULTI_CACHE_POLICY(3) | FENCE_WAIT_MULTI_POLL_INTERVAL(4));
+	cmd_base_2->emit(cmd_base_2, ring_context_2->bo_mc2);
+	cmd_base_2->emit(cmd_base_2, ring_context_2->bo_mc2 >> 32);
+	cmd_base_2->emit(cmd_base_2, 10); // random incorrect fence value
+	cmd_base_2->emit(cmd_base_2, 0);
+
+	cmd_base_2->emit(cmd_base_2, PACKET3(PACKET3_WRITE_DATA, 3));
+	cmd_base_2->emit(cmd_base_2, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
+			    WRITE_DATA_CACHE_POLICY(3));
+	cmd_base_2->emit(cmd_base_2, 0xfffffffc & ring_context_2->bo_mc);
+	cmd_base_2->emit(cmd_base_2, (0xffffffff00000000 & ring_context_2->bo_mc) >> 32);
+	cmd_base_2->emit(cmd_base_2, 0xdead0000);
+
+	ring_context_2->pm4_dw = cmd_base_2->cdw;
+	amdgpu_user_queue_submit(device_handle, ring_context_2, ip_block->type,
+				 ring_context_2->bo_mc3, true);
+
+	/* if fwm packet got skipped by firmware then 0xdead000 will be written */
+	usleep(1000 * 2);
+	igt_assert_eq_u32(*ring_context_1->bo_cpu, 0);
+	igt_assert_eq_u32(*ring_context_2->bo_cpu, 0);
+
+	/* set the correct fence value to finish executing the ib */
+	*ring_context_1->bo2_cpu = 10;
+	*ring_context_2->bo2_cpu = 10;
+	usleep(1000 * 2);
+	igt_assert_eq_u32(*ring_context_1->bo_cpu, 0xdead0000);
+	igt_assert_eq_u32(*ring_context_2->bo_cpu, 0xdead0000);
+
+	amdgpu_user_queue_destroy(device_handle, ring_context_1, ip_block->type);
+	amdgpu_user_queue_destroy(device_handle, ring_context_2, ip_block->type);
+
+	amdgpu_bo_unmap_and_free(ring_context_1->bo, ring_context_1->va_handle,
+				 ring_context_1->bo_mc, ring_context_1->write_length);
+	amdgpu_bo_unmap_and_free(ring_context_1->bo2, ring_context_1->va_handle2,
+				 ring_context_1->bo_mc2, 4096);
+	amdgpu_bo_unmap_and_free(ring_context_1->bo3, ring_context_1->va_handle3,
+				 ring_context_1->bo_mc3, 8192);
+	amdgpu_bo_unmap_and_free(ring_context_2->bo, ring_context_2->va_handle,
+				 ring_context_2->bo_mc, ring_context_2->write_length);
+	amdgpu_bo_unmap_and_free(ring_context_2->bo2, ring_context_2->va_handle2,
+				 ring_context_2->bo_mc2, 4096);
+	amdgpu_bo_unmap_and_free(ring_context_2->bo3, ring_context_2->va_handle3,
+				 ring_context_2->bo_mc3, 8192);
+	free_cmd_base(cmd_base_1);
+	free_cmd_base(cmd_base_2);
+	free(ring_context_1);
+	free(ring_context_2);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -815,6 +985,14 @@ igt_main
 			amdgpu_sync_dependency_test(device, true);
 		}
 	}
+
+	igt_describe("Check-FWM-preempt-using-GFX-UMQ");
+	igt_subtest_with_dynamic("fwm-prempt-test-with-IP-GFX-UMQ") {
+		if (userq_arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("fwm-preempt-test-with-gfx-umq")
+			amdgpu_fwm_preempt_test(device);
+		}
+	}
 #endif
 
 	igt_fixture {
-- 
2.43.0

