Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227F4C3ABDA
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 05:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564C010E2E3;
	Tue, 20 May 2025 05:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nK7DYlae";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C9C10E2E3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 05:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCLFgJstc6IAzKZvU+SHICouTp5HnZUy8H/I6vnVjpAxZacZhA5sKCLgR8A07+4f+5xK05QAU7YpclfLlR7gnkyb1TSiisGALyMeGdMO4a0XollD+5W5YU1oUmUctKddCDGitbJjnGF9qnmEBTrFsIhtooHFZfwOxq2NuIywnawcD4IYajHAAxy5F5CeTpRtSely1OPIGzoLGEgKFmin3lWDR5QW9O0YJmliAvbkpdrIBQLXySJL/g77MhSIAL2O4S7C8svo64fIWD0aRcbQ5WUIU4icjvaBJAptdZ6DLuWy7iSlx/RX3+FzSGTDvF9s/DVM0R9BF9/7N4BoGJo1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY9+X5ITM1MEHX/Rqu+lPYxu3XmQJATcEIPcg2Qq4m4=;
 b=Fa36qGcr3nCYxKNObtZ68YK6rJcR42P7GWdddcWBBdM7JWWmhFlQm+OhkulinXEQNqBXKvggmf8d4dLuWlTLbbWpCciQCbY2PJdjJLmq1fla65Eh35T7OARLN5VZic94pct+YG2MOuVoPcsk29N8qRT3qpUmXlFZ0+qRXUQlJ5/69FTAMLe2wOCvNNZB5h8kGpMXwW+ZSLcXDK8vwEQ5kyES8SNVr1oCv/rpg3UySqt1yBSeZWNPM8IL58Tozot/SPNRBUIvIfGoeahHtkDchiF2KhVItXMK4mIoz+kwvL6Xf5LTfdlAHH2DKK7jkYL3vp4pp9Yc7ES9QdXaHx7txQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY9+X5ITM1MEHX/Rqu+lPYxu3XmQJATcEIPcg2Qq4m4=;
 b=nK7DYlaejEe73N424+Jx7Wxo/v4fpWAvHOIykXAH1VTwjdiDLBjiKw/3+NyrpRay8IQAVCtg5sPtXgA3DoT0UNMjy711Xf+f6nqB34yzSaHFY5F1p1HXAPvGBkqWxQgjkRCNGM4rbTM88uTcP053Iyjj8+V6awi7rjlJv9nMyVU=
Received: from SA1PR04CA0005.namprd04.prod.outlook.com (2603:10b6:806:2ce::14)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 20 May
 2025 05:37:47 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::d8) by SA1PR04CA0005.outlook.office365.com
 (2603:10b6:806:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 20 May 2025 05:37:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 05:37:47 +0000
Received: from rtg-MAPLE.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 00:37:45 -0500
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case for
 userq
Date: Tue, 20 May 2025 11:07:28 +0530
Message-ID: <20250520053728.1703-2-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520053728.1703-1-yogesh.mohanmarimuthu@amd.com>
References: <20250520053728.1703-1-yogesh.mohanmarimuthu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SN7PR12MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f537f6-5a3a-41c4-0768-08dd976073e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2n2OptQQtdLTXaY67CN9DwFvNwWrBVMIS/hl0iIU7BEN9zDMJofWcLfxHWus?=
 =?us-ascii?Q?1cI0Avlyv+VKQ5ViZIoR2N3haDvihtCi89vdonPNT9V6tdlDTp8TQnvSVIft?=
 =?us-ascii?Q?nIsOVlP0NGxJCJgZXrT60o5FIaQVxarLLgXYWP/VRLSsQUjc6/49h8NRNSjT?=
 =?us-ascii?Q?ZL9JMj86XK9haycPmv+B0yIJ2IDoAfNtSpEPw2kuHgfMqaaEfKgIoVSjqeda?=
 =?us-ascii?Q?GtcHpzSd3HbYnqhRe+2brsWOX2ppYA94+6UCdwG0zHbBzooQUFqQ2VmiAHex?=
 =?us-ascii?Q?0zixrey0TQ6dS4sU0pvNuNfK9ijA/dNiJJTbIYgPQdI9kGmlgRVgnwmZ/GEk?=
 =?us-ascii?Q?B0RhI30l54hamCBTWsxiQm99+uOEQMhdMY/H6pixny/7bSKS0zjBmHmlIQyB?=
 =?us-ascii?Q?KBE+nEvbBrsUX6LByP3jzIvOQk62CAhHHozhsLUL6fYDNZG1DoUXtBJ8DCWQ?=
 =?us-ascii?Q?o3/use9E13kYC2WT9/FDJLmHU9MqLdj18qGFYgGBOKvlCFmi1yZd00rXcKKN?=
 =?us-ascii?Q?YzcS5mQb9yp9/iJ/c2ea/5a34lexMk4X0hFctUfKXJs/d6Nmc6pv1zFsNdVE?=
 =?us-ascii?Q?o7Uv1bI5eFkYIJJt1AAlwd4kNtZDC+fQJXEK3AzlqoK9vmtS2apz4ZQMNkkO?=
 =?us-ascii?Q?8lzSRIgrKo2kwJWORMtuFLGfwf1bqQSJLk2brMZM52FZ5UXbozuAEejAcxEd?=
 =?us-ascii?Q?wr3pSQqhmFCyAGY8mf02d/fdPmPzNrujfddZtSHRUldAcvwdt+oSZFmHUgXB?=
 =?us-ascii?Q?wQl1q2wAuGzB6/YKGvUXtEkI6xq4THexhDlolWnjYgV2PsNm08Yqx1MaSSG6?=
 =?us-ascii?Q?vi3iIkysV7b4iOPSsOFr1y4RIF7lIZdYKcjEQrgQYPPH9ub1MtEUE7IG7o4P?=
 =?us-ascii?Q?SfcGStTRsn2RWE+644xaNcHc0ltPy8VhDzdDhA+DsXHoxTC5M14+gulEsxDh?=
 =?us-ascii?Q?tO6VEneFUQnqG7Ji5HDC9WubarWSx6/0U4ALlkOblk5QqouIG2sNrb9msjnZ?=
 =?us-ascii?Q?S2UtFJViKTJuUeMxJnIDZk/oMEXc4Axo0HcWPNvx7mOubISX2G9UlfxuwbVg?=
 =?us-ascii?Q?X4sV1ywjZPs/PPsa+1HruX6LNVBmF+32dXK+IWA3qkmmVUt9y4QtPQBxwIQp?=
 =?us-ascii?Q?fDp9Umg+zJZu4wRcH1e8sp0/VR6ZygGd15jEA3BG9t25GfZS4YjROITGJr2j?=
 =?us-ascii?Q?G95FchJBH2A4qarWON13O0TRjv7lp6vNsjAEEjIILcJp5f833UtloMnX2F/q?=
 =?us-ascii?Q?0Bc25WxSiNbjZ4cwgtKP4EzCa8sQMGxmCtXlfJrjQsgFDvEcszvenjjfWPoS?=
 =?us-ascii?Q?VHzjfaxB2caJOLEGtCOR7AeMkwrWpoOPSCnub6DYTwX8nbxVyM3yRjPlyZJH?=
 =?us-ascii?Q?mSRl79jYitgurHcu+JCzx3Zez+JpW+PwjnYIAeacwCSgVp6UX2gnyiiTGOmY?=
 =?us-ascii?Q?MzRK8VBtr9XxahnQI8qG3YaOLoNp2Gbp0FFkUt0cV/zKQy1C4DDLGKa9Erej?=
 =?us-ascii?Q?afoPC5pFb/nDpaWI2FLnknRYfVbtpggru8EH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 05:37:47.2673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f537f6-5a3a-41c4-0768-08dd976073e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766
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
Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>
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

