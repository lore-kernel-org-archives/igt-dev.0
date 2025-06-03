Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51717C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013B710E611;
	Tue,  3 Jun 2025 16:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ymXpHJxm";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E2C10E646
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hd1qxTj20jLnkpVAV6oylYPuclcql+muPoM8cFm3AP8gOlOp9DHGojwdK12Zw3ZasfLD6SGnbFhGM0nZuZV64Zrah19Mv0EES/SvjQgBdiicg/rUepl5MklteBEdrHxtrPtru0oR56skf5fLR4dRxWLzbxC3dk34WVwmLXbaZZc1yZtPvvAJgyDpcz1kYRaz1/0nvL5hbR5aAcvzjYSMxZdngS9fveQ0JMoYYDG/QugbP/bEDQYqM8WeFO5h01+j8snvTo7zFdjIazuEGyuY+bYblX7fJOAuWx50C7gYeKS4fwIcnbk6fDn4i8VOY25fd6r7z4zwIhtn8nP1LJIaIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYOY4R1EvnNsrSqqFYDkBmEwvU7PI3HEIs3YtiVOCxI=;
 b=Wv0fJT4BeXegUr1Yze6wN/10WRYoJRwOLEmPn8ElM2tc5GS+FdfrB4DGNpHxm9UEZaaruZ5ATln4WmsklDcJWOSF77qq4W6IxvhApf9mk2GCUmoqz+Z5RsnEbIFZnNp0IgnR78KHG1IxUEjuAlYxXaumbc7eqW1kskvfiVUhrLMQa9WBr7e6brb8vx9C/9ZEmTwx0y1yV13FGrwRcz0rxc0wt0rYDuOx5NX+bIoAqD0SE5NDDt1niSd5UDm9fxyOMwrBM551MYeO/WCLITl0FcydWr7i5AmdfpNZd1MZhwOz+U39oU0IFztBhcMwTnCUGFKl5t9I7MWZAQ0VRv3TTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYOY4R1EvnNsrSqqFYDkBmEwvU7PI3HEIs3YtiVOCxI=;
 b=ymXpHJxm3i8RtaPpoUlTD2pkuEN0qu6RTEepF0Do1qUlu8Yrp2kS6++Z+5JeowjF2SV8pgK+sXaMLiiYz11dxCY1lp/4HX+AVlS1XVWvLwUakxrhTQTkx9cbJ2UJ5CTRqoem30QJm1QtMMUe+HkHfLVDczlIze3zArtbX6ImXSo=
Received: from SN4PR0501CA0042.namprd05.prod.outlook.com
 (2603:10b6:803:41::19) by DM4PR12MB8449.namprd12.prod.outlook.com
 (2603:10b6:8:17f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 16:24:41 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::1a) by SN4PR0501CA0042.outlook.office365.com
 (2603:10b6:803:41::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Tue,
 3 Jun 2025 16:24:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 16:24:39 +0000
Received: from rtg-MAPLE.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:24:37 -0500
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, "Jesse
 Zhang" <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 2/2] tests/amdgpu: add fwm preemption test case for
 userq
Date: Tue, 3 Jun 2025 21:53:49 +0530
Message-ID: <20250603162349.5229-2-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603162349.5229-1-yogesh.mohanmarimuthu@amd.com>
References: <20250603162349.5229-1-yogesh.mohanmarimuthu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DM4PR12MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: b02e690b-bc96-4f65-36bd-08dda2bb23b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ymVJrl1UUs0XoNCw+ZVFoSaceSATgJLTniIjtsCYYleTtzANVhwcFyiBi0Z5?=
 =?us-ascii?Q?Ym1t+BYEnhNXU1MbK7cVJ16fL1xCdSpHXoqnJzp6VxLAhaFDc0Ufuid3FG41?=
 =?us-ascii?Q?tTIdCcf23lPnXhT3I2HZV0A1K2AgD9l7alLQ7LjnP6jq3OX9y4laij/ppo4k?=
 =?us-ascii?Q?MFH31k9WYzcHhXVforOgDXG3vdXZs5i5SDVj/YZWwNu7CowO8+cWht4QpZZ9?=
 =?us-ascii?Q?N7b1qpAQUaNMnWNxyBbaXJQahRKyxOoUgCOw2hRd5uiRPWHvqwjLiUPOmknE?=
 =?us-ascii?Q?TPhvZM0pQ53qb3IimX+xSxija3W43cloaCgoChKvMd66aHe6aAA1/MLbET5g?=
 =?us-ascii?Q?oUiFxa+Cg9egVB6NQ00/Fk+VU2JJ2rhXZ1jpxuaDyEVGXjYoCQn2Min/Df2F?=
 =?us-ascii?Q?h8wJXMTk9vQyT2+HHLGaO8wmY2yIyujgP5Oo0hhdlifJqRiPgtBnw5bABGq8?=
 =?us-ascii?Q?2OOLIS36lCqx6PuPaRzFyuybpBQvQ42R9+GV7kG+q1iL9YlPwiONdkJUS28v?=
 =?us-ascii?Q?TRxcb8aw3RrSP3b1Edb/47IpYQEnWQG7gplnyBmXCrMIuy1o0KO+6N2G0ErC?=
 =?us-ascii?Q?dbI/1AFBV9kJpX9Rrz49SK3OqujL7o7VDwzQpMd4rxxTNpr4VDkq+S+XWMcc?=
 =?us-ascii?Q?/Nkp6ZlV3CwuYrTpJwmHV5PV3DBq9b2/gfVFz5BB3RQV5sKj7WYIa0cgaYU9?=
 =?us-ascii?Q?Oqcs0vQl7IivJJs8KBqurFoem2EflvZOyBl3SNr2FhmzmAx5cxawfm8ruWjk?=
 =?us-ascii?Q?kmhH5qw1k/jpxA1fe25RoPVuhPZg4BZKIDp9q8Ii6MNJfi0z8KVYme3Ou6jc?=
 =?us-ascii?Q?Vy+mL6rAG+fEsk+ljNwOeVlF0sq6sqY1X7cF8RQ/Dd6Dgmu81zjaKkgHdSqd?=
 =?us-ascii?Q?wz4zRYdduElCIVRM64eDxpIyDGZZqLebNRRZOstIlAP6vBowd+0uImuYzZBn?=
 =?us-ascii?Q?LXfYQ4Q8qripD/IuY79wietlijHE3TaGmmRiWDdZcQs3Xdf4BRp27TEn4a1F?=
 =?us-ascii?Q?Ddm86gcdWi4ufVmFAsWT6MulrzjkgMyVO5PPTyPMUkO3lc/E0poIgGUNDs4F?=
 =?us-ascii?Q?05u4g4hljWSxcZzQ5cbPDZBHoXrfcMzVFcHWA8JtDMCbTNUGW0Uywt+tl/+4?=
 =?us-ascii?Q?Y8q9KTIIbpRGloHahyQbmGwob3WtAsDzqJAMjkR3RrSWIXolC24uG7UcGrct?=
 =?us-ascii?Q?aWXMEy0qgbuY2N5/aJLY6RtERLp4jMOtcjiVSdKGjyHhysFg1+gt5JwQk4bg?=
 =?us-ascii?Q?00W3BL1DMWRzZJIWhLe5rzh38LaxvFWyAROEnAtFGhjsGlkjmEkuP1xLFbbo?=
 =?us-ascii?Q?Wm+zKe2k1ykRgpLlm3U1V1TbXRhJB3tqVcoGlLZ+Q5DAv6m17bC7KLkx/KtV?=
 =?us-ascii?Q?uA2m/z7+0iiBsgX153MqtEjgUF2eUHCxLroiNQcGg/uSoEfLuWZkTedY+tGr?=
 =?us-ascii?Q?zuLgPJZOFmOJssifF6Y5lrKXL1p9Jvc0sQ3XK1hldQ9Y/irnrOYvI9EQdg4y?=
 =?us-ascii?Q?03hUfujBKiThVUEavT59kj2pnqHQZjvABKp/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 16:24:39.7292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02e690b-bc96-4f65-36bd-08dda2bb23b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8449
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

