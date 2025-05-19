Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F2EC2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 13:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C4A10E12A;
	Mon, 19 May 2025 13:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jNYtAbpl";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BC510E12A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 13:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAizEZEhF9taNhVAmw2pPhYRqmF4h/C5rVUO0//1qnBvj/UZmhoxlvm9e6dARNHkRR9MJDYVW0YktVLqo1O8ZNJutFv5pY55JCCYyRaEncF7tIytHq2YozsR3ryQtWpHFUpUJRhi0PeKuqXh6Dig0x6PrsgwPvPNAOJzclM+up0/gOkPUx2HfTuvk5ZgRgbsXlyY384wpvIKGMNHEjvnfyPPZDx51kjiaQOuf14YqG8ueXPtHp3ELAml9pDXx68s0so0Y+s7I2VPNlUIGDs1HJbKCmuXR0fF6HU8m7mZ0uita4QJ6Lqw8FwqAQ9sh9Halscyxl5pn92ASpVsFey2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVJAwESrsy8Il09dzTYBPcwiflJTy+d/W5M5yFnHNkk=;
 b=I3XnMfwKt01gVlFyKSrJmogsx+k7ED0IIlYlPCXqBVBQsvpEWhlxdUkGx35cfpu/tjeHwx2nXrMviU0Pz1JBIg05KgqnYbqbVeO5XWAwq6G47OEwPoE1vjcyaNFkgPqMqEfkER7hxTU9VhVsMSvudOeaMy04ycb9FKBQhoVJ9lAOApgH3nt8d7YdNsIQH6luBrGj+LaOowpmvi5iSv//EdovAHvum3zqBZwMDrpFfs2CjaUnr/x4oNY2sWPwOnhVu5i55hsus/Mg8seBgw+nORE54QwIethKbZfGhisi+R8YIckCJWsWtl7yVdbyg2F6wHBUC7F4KxMh0tcxRRzXFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVJAwESrsy8Il09dzTYBPcwiflJTy+d/W5M5yFnHNkk=;
 b=jNYtAbpl40p5XWcFKktyGUm3sxPUBrfX2ZjVgr/BIaYoUimRe6v25jaCMyIuodTms/BaarSfZ5iLxv2vZyg5kFVTNl6MyQAG63RZ/el2wpkHbmhC5R2zHtVvYxFEdL4eWIjw8JHeAXc7hX9Rxhu4JYvBaGB2JKv9/V0E5wZVGiQ=
Received: from BLAPR03CA0121.namprd03.prod.outlook.com (2603:10b6:208:32e::6)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 13:59:33 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::c6) by BLAPR03CA0121.outlook.office365.com
 (2603:10b6:208:32e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Mon,
 19 May 2025 13:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Mon, 19 May 2025 13:59:32 +0000
Received: from rtg-MAPLE.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 08:59:25 -0500
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case for
 userq
Date: Mon, 19 May 2025 19:29:01 +0530
Message-ID: <20250519135901.3032-2-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519135901.3032-1-yogesh.mohanmarimuthu@amd.com>
References: <20250519135901.3032-1-yogesh.mohanmarimuthu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbae533-c6c4-4fe8-efc4-08dd96dd616b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SoNFA1WcCiHN+PWqV/iX5Dzmt+RakZlDNPr67zmeRq5tSjSpBRnn1vYxE1it?=
 =?us-ascii?Q?hMfVEviylYDvF/JLv9HHvNdidSLMof+aahNCueVuAShMLA3096ZyxYqygWpE?=
 =?us-ascii?Q?rLO6YZn5bBKjrvS+owmiWgg44ZS4dDNv9fYk9zuberpfoIZw7SsTQaLCoKWK?=
 =?us-ascii?Q?7tadjxpPgqdxvYqn9gAraVXNmnkxkrNOGRtwbPffxm8IFIqdNbXeelYVpqts?=
 =?us-ascii?Q?AXfKmhPv8k0nDmusw22BHGrRcCpTjKNq4MQX4prRSyPSeGr+8l57I71ydm0q?=
 =?us-ascii?Q?BHv7oemnu3LjsiPZawGAN2kDntAaFuATV2VYufsFBzBr+Aze4FpU6uq5iH/B?=
 =?us-ascii?Q?+4wJV0WuKun/8sKC/yYJcDQee4M5xBaQPYealBn00NbKbOZ/gz82/8347z7B?=
 =?us-ascii?Q?JW5rOLGjwlDOn7bPZaXoAWZheFGdrzQKSXgiisYPjlPZ4F1DCx3JM2IWWXuX?=
 =?us-ascii?Q?cf78kMtETn2jlxW2n5g2DfVA4qb8ANc42YAHlOxd6l53x1pxOBUJQd0SJ5mH?=
 =?us-ascii?Q?ndtIDOsPDEZw/R2uh/0oayVQhIOP8blVgCzwnVWC6/aVWfLf9U2b7k4q89wj?=
 =?us-ascii?Q?SbvapGdhbL81nO/qINKN1FIx1ImAgiBHnroPLSrgcg1I9nwBtRcLtEQpVEFc?=
 =?us-ascii?Q?H8K1Ry4+LM5RNs/vXQT8iLhJbh1XjYi8ALfOSkC6cCGfQuBE/ba3ZX36u/gq?=
 =?us-ascii?Q?ZytuCMxs/7sY5vvNHG3PPNWp96LFxa+1fPcDPU6a3mLzbIAJO7m5R/i1nOZL?=
 =?us-ascii?Q?ZR/0sjBq/fRsSo2BB/+UXfhL9o1a1ZZejZhD6THdRO0WiJCWoU9jCfU+gNF3?=
 =?us-ascii?Q?FkyI2uSrvLRTtCbgEsZdKgin3r/cnZpuvgaKZaQvQRGY5xP9N7tj4Qn7xaAv?=
 =?us-ascii?Q?Fo9nakU99Vgiehyad3X0VjUDdjjSlqSAXUkzKIDD+J0yfr/+BGmsmNP4nxTl?=
 =?us-ascii?Q?jWmbayVGVB2xCVTK1T0vsWIf8Szc917+OtkI8ICvgeWu+M5m6GDsR7sBPguj?=
 =?us-ascii?Q?UJAwp9SR2Yjtp8DOtMsLCWSxzNddk7uE6CMfU04J9V5nHQf5vU5U7IRc1kAe?=
 =?us-ascii?Q?sNgF3J2QQEBZFo1MSMwgr2a9mPeAK5UFfEMgdEFgEI1dIWmLRFLOZmqFTjc4?=
 =?us-ascii?Q?qGfFVtaCDJlzghyCd3GlKFi31OsVVGlJp7wYx2nSJrB/Jt2nOp7bqDfSeISY?=
 =?us-ascii?Q?3E8LLCZJdaFHLPze8plPFiyNtsrw1K9ezib43Cvj08Pm9J0GtdTE+O5zpPAN?=
 =?us-ascii?Q?tdoR5WO6o+LA/xQ9A0snsoJW8GsFqpRXJ8caLgd7Zla3nE4hP93/ftwvpOg7?=
 =?us-ascii?Q?jTfMr8MnW9OYsIIFacAEHLMABgKtkBPZgHJckpH7mRAddzRua2qN0xc6ISln?=
 =?us-ascii?Q?1JQ7FtMxy2bcVA6+RWg4x02DJ8cRlc3L7FeAPwz/Nfp6jBOzzH47NtuAOyh2?=
 =?us-ascii?Q?z6PAIul9of0zeqMy9/jYmosvtvzch+6G+pqrM18rqsQwpVH90izpJPhzDjR7?=
 =?us-ascii?Q?os7hupX7OxMARgsw7vEWr1qgD6tPF+wBURNn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 13:59:32.2453 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbae533-c6c4-4fe8-efc4-08dd96dd616b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
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

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse.Zhang <Jesse.zhang@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_PM4.h     |  17 ++++
 tests/amdgpu/amd_basic.c | 178 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 195 insertions(+)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 8f59b4223..d6a8446f4 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -195,6 +195,23 @@
 #define PACKET3_INDIRECT_BUFFER                         0x3F
 #define PACKET3_PROTECTED_FENCE_SIGNAL                  0xd0
 
+#define PACKET3_FENCE_WAIT_MULTI                        0xd1
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
+#define		FENCE_WAIT_MULTI_ENGINE(x)              ((x) << 8)
+		/* 0 - me
+		 * 1 - pfp
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

