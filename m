Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE2D1266B
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 09:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55D110E53B;
	Tue,  5 Nov 2024 09:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bC4hJ/q3";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695810E53B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 09:06:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUe/fRRShtYRwOR05oKcl/SA/CFlfljawW706sSgObsdOxdwnaygj3y0hgQyy2WA5mmBq2tiow0g/AQFYk+MYa9qO+WTbEhswN8V+q6OkbQb9SYk7PuIfTmBRmisILf2qXlk5PKtsISX2AHeNncf3LQ43uxay5yg++UMVOeDCC3GdJrEJsXnJ12o5wKqPHxzBZo8MZgxJUWtcPHLIX3r31H8RVAc9zIQx4YyO2mttaF5c//HtcZ3LHeUMzeUbt1fPKG+TEY6sgUDa1nWuO2nWobTuyI4geSkvBYWnTIOKu4K0o0yrA9XagV0DHp+TqHq36AMOmS0sPlSLO+PWJauCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4f9xl7JUpe2Yf9hzYizZBAYM4tubM1wfzYP8RUanCPw=;
 b=cdn5MGzj/aamjUyupTIWvApOtR6xYL4sPCW2OZ2s49a8HErjaO8cRxQPpiNQIiGVfth8wV9DavGBQfLxOHlyXMwVZVKiU8AmEc9eicFGhn8k4rDwV6mugbzdXhbNeInWHA2q7zZTBtYa2hIlFtgiEy+4o6YUSx0f8A4UMu0J68WUVtbGy7KoE5Ft0HMwVbooOu/3Xm7PvnwlS8rfDDbJfEWFH49cz58jnM3t4SWSjkkfvnbodZMyhLnxfhDMmzwVKIM5VHWDuztNBrM80b9hptPwf8Ico1Rv/hqkULVsSy5lcwd5aeTNj42k+2licqiYulDfN/pDw4T+Z1gfntJ+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f9xl7JUpe2Yf9hzYizZBAYM4tubM1wfzYP8RUanCPw=;
 b=bC4hJ/q3QV5yxMUsolR5wAW0PwRaW8eA+ToNFNm0KItZyMdQy42MnaCF+frkR30kfwwGg6a66BU3s9sWrV8Awb10B4MfymWrYf7TUmtKJZQMMXQbuGXGTx+nZDhxqhrhvuChzN/icCX0QMt3wysdhSh7yD6462E2+KIfDhgoOFQ=
Received: from PH2PEPF00003854.namprd17.prod.outlook.com (2603:10b6:518:1::74)
 by SJ0PR12MB5663.namprd12.prod.outlook.com (2603:10b6:a03:42a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 09:06:08 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH2PEPF00003854.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 5 Nov 2024 09:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 09:06:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 03:06:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 03:06:05 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 5 Nov 2024 03:05:58 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2] lib/amdgpu: fix ring schedule issue
Date: Tue, 5 Nov 2024 17:05:53 +0800
Message-ID: <20241105090553.132206-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SJ0PR12MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf97fec-befe-4122-94a6-08dcfd79164f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6+EmZZk+oXO+r2Q3sNXp3niRSy5lfsHpvHQ6R6wuxI1g55Z3/NINBaFebdWG?=
 =?us-ascii?Q?h8HpgEHLso8qVBh0cRCmXPkY90qKY9I+jQ7nOTlcuMmVNNV8xJbIcG4+bybQ?=
 =?us-ascii?Q?E+lsvm0qYY80RFasVVAniih2u4DiHMa+4RjaBt8RpbpCWhNL0gcXmYpN0wbY?=
 =?us-ascii?Q?0B+ObU6/UkjZVIsBt+uI0cNwdoxEIm+d47a1e79UM6vwKJx5hqwqrk9zHL60?=
 =?us-ascii?Q?wW3hF2nJLNnaoTGHLI3Sm2vQ87izwY2zz1+1xCYCQQWaymPxOyFqpBScxo2w?=
 =?us-ascii?Q?wvFy5YSqNsfnOUxhY86pyLmpzeyxnFO0LErHyX3DrqhREUM3xcf7xZCXHgz8?=
 =?us-ascii?Q?+hNwAkvft3AoN988luZ9cozcJg/G/1QgY6jI9WDP7KB9QHjwUnupyPEdcb79?=
 =?us-ascii?Q?XVg+KlaRGfHicP0HamKHwogA+w/sj5nWkzmpd4rqXsHq/HvyKKN312RjMPcJ?=
 =?us-ascii?Q?kJuYweGwXj6EYmRCpZmCDQf3M3ORBzsuScxgLF+7dEkIkJYyFvUOcYYAWDZ0?=
 =?us-ascii?Q?yGTWG7yQHKUCuleEsEO/HIM0LBSS8/By8+ZxqrBNoazyDME7InnKTm4l3ZrO?=
 =?us-ascii?Q?CrumXrwuAcrKnXHeAOWSuoS3eaQyfHtp+h4Hlrsh5Vnfw8Oh3xLA36LeqoPf?=
 =?us-ascii?Q?TdV0FW1QuIP4TuLzE6U42lBW79TZSC0KSi5fQgaZRxZmWWqvHfQXAtHE27NA?=
 =?us-ascii?Q?jBEgvE2hTNv/ZFrP7SpSpMWwZSKhnbqKCf2OdEfXEa1NYGyGg97+sJniqrOW?=
 =?us-ascii?Q?QiMkmtw7LTKaXH9iFOufmVWAI+musqcXkgxsBmPaoXUB9dXLGIF4d4hpuDUY?=
 =?us-ascii?Q?A3XjDbYozkh6AaTZBoPDnMIPUMXWm99nnTQ7dr1i5mI9htHqbKys+/mxrgkW?=
 =?us-ascii?Q?bYzJZOlMM4jSM90E0jGn7oU5fK4ncM88873XMMWxAz4mfF4fEuOXlUojGhxH?=
 =?us-ascii?Q?1ZYQFXE+1gGWWOpKbPO6rHDl58iSYgy3BCASyIK7pNEFs4UeWds2smqB4V8b?=
 =?us-ascii?Q?avF5/rhgYS4oS16pF3boK5ZZ9enPG4l0TF0/e5hz6ZGnj1UOjq1MUzRe9kIz?=
 =?us-ascii?Q?9e2kVksQlrLN5965i8OWUjucpzHdxfgVaocKs9bHPQGP5qDPOh/rwYpwQM8E?=
 =?us-ascii?Q?THATvETIISGlPamMY+AmP07lno/IsyhZFGWoDHeIA3S2bGCcyCYNUVvcTuVu?=
 =?us-ascii?Q?qNDtzHf+aNMtHjD18hdJzSlw9RxxyOCiRQMSOPTkO58+9vVKfglbwYzfCJvC?=
 =?us-ascii?Q?SXZABLT0CxLck5OE8QZeeG4aHwXlgDPlTm9ryAX41aueBmHHGkmtxMxumaJg?=
 =?us-ascii?Q?I4gY6rBkJ4zUVoOi5mpXTajDpV0PAgxWteTMhVaTrv52+MAxSKLwBXpHbrMM?=
 =?us-ascii?Q?Y2qOUsqlQ/eHpGVyfQVmp4RBVjCxUs9TGILvvb+K21i0FB8+Aw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 09:06:08.6014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf97fec-befe-4122-94a6-08dcfd79164f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5663
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

Because drm schedule no longer uses the parameter ring_id for scheduling.
Instead, it selects the ring with less load to schedule the job. See the kernel
function drm_sched_job_arm. Therefore, in order to verify each available ring on
a certain IP, it can use the schedule debugfs interface.

v2: fix the gfx high priority context issue

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 155 +++++++++++++++++++++----
 lib/amdgpu/amd_dispatch.c         | 187 ++++++++++++++++++++++++++----
 lib/amdgpu/amd_dispatch.h         |   1 +
 tests/amdgpu/amd_queue_reset.c    |   2 +-
 4 files changed, 297 insertions(+), 48 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 39641ce23..87078548c 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -170,7 +170,8 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
 }
 
 static void
-bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, unsigned int ring_id)
+bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
+			unsigned int ip_type, uint32_t priority)
 {
 
 	const struct amdgpu_ip_block_version *ip_block = NULL;
@@ -182,7 +183,11 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
 
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
-	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
+
+	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
+		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
+	else
+		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
 	igt_assert_eq(r, 0);
 
 	/* setup parameters */
@@ -190,7 +195,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
-	ring_context->ring_id = ring_id;
+	ring_context->ring_id = 0;
 	igt_assert(ring_context->pm4);
 	ip_block = get_ip_block(device_handle, ip_type);
 	r = amdgpu_bo_alloc_and_map(device_handle,
@@ -216,27 +221,11 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
 	free(ring_context);
 }
 
-void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
-{
-	int r;
-	struct drm_amdgpu_info_hw_ip info;
-	uint32_t ring_id;
-
-	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
-	igt_assert_eq(r, 0);
-	if (!info.available_rings)
-		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
-
-	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
-		bad_access_helper(device_handle, cmd_error, ip_type, ring_id);
-	}
-}
-
 #define MAX_DMABUF_COUNT 0x20000
 #define MAX_DWORD_COUNT 256
 
 static void
-amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type, unsigned int ring_id)
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 {
 	int j, r;
 	uint32_t *ptr, offset;
@@ -256,7 +245,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type, u
 	}
 	ring_context->secure = false;
 	ring_context->res_cnt = 2;
-	ring_context->ring_id = ring_id;
+	ring_context->ring_id = 0;
 	igt_assert(ring_context->pm4);
 
 	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
@@ -327,18 +316,138 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type, u
 	free_cmd_base(base_cmd);
 }
 
+void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
+{
+	int r;
+	FILE *fp;
+	char cmd[1024];
+	char buffer[128];
+	long sched_mask = 0;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id, prio;
+	char sysfs[125];
+
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
+
+	if (ip_type == AMD_IP_GFX)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
+	else if (ip_type == AMD_IP_COMPUTE)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
+	else if (ip_type == AMD_IP_DMA)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+
+	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+	r = access(sysfs, R_OK);
+	if (!r) {
+		fp = popen(cmd, "r");
+		if (fp == NULL)
+			igt_skip("read the sysfs failed: %s \n",sysfs);
+
+		if (fgets(buffer, 128, fp) != NULL)
+			sched_mask = strtol(buffer, NULL, 16);
+
+		pclose(fp);
+	} else {
+		sched_mask = 1;
+		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
+	}
+
+	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+		/* check sched is ready is on the ring. */
+		if (!((1 << ring_id) & sched_mask))
+			continue;
+
+		if (sched_mask > 1 && ring_id == 0 &&
+			ip_type == AMD_IP_COMPUTE) {
+			/* for the compute multiple rings, the first queue
+			 * as high priority compute queue.
+			 * Need to create a high priority ctx.
+			 */
+			prio = AMDGPU_CTX_PRIORITY_HIGH;
+		} else if (sched_mask > 1 && ring_id == 1 &&
+			 ip_type == AMD_IP_GFX) {
+			/* for the gfx multiple rings, pipe1 queue0 as
+			 * high priority graphics queue.
+			 * Need to create a high priority ctx.
+			 */
+			prio = AMDGPU_CTX_PRIORITY_HIGH;
+		} else {
+			prio = AMDGPU_CTX_PRIORITY_NORMAL;
+		}
+
+		if (sched_mask > 1) {
+			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+						0x1 << ring_id, sysfs);
+			r = system(cmd);
+			igt_assert_eq(r, 0);
+		}
+
+		bad_access_helper(device_handle, cmd_error, ip_type, prio);
+	}
+
+	/* recover the sched mask */
+	if (sched_mask > 1) {
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
+		r = system(cmd);
+		igt_assert_eq(r, 0);
+	}
+
+}
+
 void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 {
 	int r;
+	FILE *fp;
+	char cmd[1024];
+	char buffer[128];
+	long sched_mask = 0;
 	struct drm_amdgpu_info_hw_ip info;
 	uint32_t ring_id;
+	char sysfs[125];
 
 	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &info);
 	igt_assert_eq(r, 0);
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for the sdma\n");
 
-	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++)
-		amdgpu_hang_sdma_helper(device_handle, hang_type, ring_id);
+	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+	r = access(sysfs, R_OK);
+	if (!r) {
+		fp = popen(cmd, "r");
+		if (fp == NULL)
+			igt_skip("read the sysfs failed: %s \n",sysfs);
+
+		if (fgets(buffer, 128, fp) != NULL)
+			sched_mask = strtol(buffer, NULL, 16);
+
+		pclose(fp);
+	} else
+		sched_mask = 1;
+
+	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+		/* check sched is ready is on the ring. */
+		if (!((1 << ring_id) & sched_mask))
+			continue;
+
+		if (sched_mask > 1) {
+			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+						0x1 << ring_id, sysfs);
+			r = system(cmd);
+			igt_assert_eq(r, 0);
+		}
+
+		amdgpu_hang_sdma_helper(device_handle, hang_type);
+	}
+
+	/* recover the sched mask */
+	if (sched_mask > 1) {
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
+		r = system(cmd);
+		igt_assert_eq(r, 0);
+	}
 }
 
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 5b4698a83..75fc326da 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -14,7 +14,7 @@
 
 static void
 amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
-			    uint32_t ip_type, uint32_t ring,
+			    uint32_t ip_type, uint32_t priority,
 			    uint32_t version)
 {
 	amdgpu_context_handle context_handle;
@@ -37,7 +37,11 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
-	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
+		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
+	else
+		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
@@ -121,7 +125,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	ib_info.ib_mc_address = mc_address_cmd;
 	ib_info.size = base_cmd->cdw;
 	ibs_request.ip_type = ip_type;
-	ibs_request.ring = ring;
+	ibs_request.ring = 0;
 	ibs_request.resources = bo_list;
 	ibs_request.number_of_ibs = 1;
 	ibs_request.ibs = &ib_info;
@@ -136,7 +140,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 
 	fence_status.ip_type = ip_type;
 	fence_status.ip_instance = 0;
-	fence_status.ring = ring;
+	fence_status.ring = 0;
 	fence_status.context = context_handle;
 	fence_status.fence = ibs_request.seq_no;
 
@@ -162,8 +166,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 int
 amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 				amdgpu_context_handle context_handle_param,
-				uint32_t ip_type, uint32_t ring, uint32_t version,
-				enum cmd_error_type hang,
+				uint32_t ip_type, uint32_t ring, uint32_t priority,
+				uint32_t version, enum cmd_error_type hang,
 				struct amdgpu_cs_err_codes *err_codes)
 {
 	amdgpu_context_handle context_handle_free = NULL;
@@ -188,9 +192,15 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
 	if (context_handle_param == NULL) {
-		r = amdgpu_cs_ctx_create(device_handle, &context_handle_in_use);
-		context_handle_free = context_handle_in_use;
-		igt_assert_eq(r, 0);
+		if( priority == AMDGPU_CTX_PRIORITY_HIGH) {
+			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle_in_use);
+			context_handle_free = context_handle_in_use;
+			igt_assert_eq(r, 0);
+		} else {
+			r = amdgpu_cs_ctx_create(device_handle, &context_handle_in_use);
+			context_handle_free = context_handle_in_use;
+			igt_assert_eq(r, 0);
+		}
 	} else {
 		context_handle_in_use = context_handle_param;
 	}
@@ -303,7 +313,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	ib_info.ib_mc_address = mc_address_cmd;
 	ib_info.size = base_cmd->cdw;
 	ibs_request.ip_type = ip_type;
-	ibs_request.ring = ring;
+	ibs_request.ring = 0;
 	ibs_request.resources = bo_list;
 	ibs_request.number_of_ibs = 1;
 	ibs_request.ibs = &ib_info;
@@ -314,7 +324,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 
 	fence_status.ip_type = ip_type;
 	fence_status.ip_instance = 0;
-	fence_status.ring = ring;
+	fence_status.ring = 0;
 	fence_status.context = context_handle_in_use;
 	fence_status.fence = ibs_request.seq_no;
 
@@ -357,7 +367,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 
 static void
 amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
-				      uint32_t ip_type, uint32_t ring,
+				      uint32_t ip_type, uint32_t priority,
 				      int version, uint32_t gpu_reset_status_equel)
 {
 	amdgpu_context_handle context_handle;
@@ -386,7 +396,11 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
+		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
+	else
+		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
@@ -487,7 +501,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	ib_info.ib_mc_address = mc_address_cmd;
 	ib_info.size = base_cmd->cdw;
 	ibs_request.ip_type = ip_type;
-	ibs_request.ring = ring;
+	ibs_request.ring = 0;
 	ibs_request.resources = bo_list;
 	ibs_request.number_of_ibs = 1;
 	ibs_request.ibs = &ib_info;
@@ -497,7 +511,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 
 	fence_status.ip_type = ip_type;
 	fence_status.ip_instance = 0;
-	fence_status.ring = ring;
+	fence_status.ring = 0;
 	fence_status.context = context_handle;
 	fence_status.fence = ibs_request.seq_no;
 
@@ -538,8 +552,13 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				 uint32_t ip_type)
 {
 	int r;
+	FILE *fp;
+	char cmd[1024];
+	char buffer[128];
+	long sched_mask = 0;
 	struct drm_amdgpu_info_hw_ip info;
-	uint32_t ring_id, version;
+	uint32_t ring_id, version, prio;
+	char sysfs[125];
 
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
@@ -551,22 +570,85 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		igt_info("SKIP ... unsupported gfx version %d\n", version);
 		return;
 	}
-	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
+
+	if (ip_type == AMD_IP_GFX)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
+	else if (ip_type == AMD_IP_COMPUTE)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
+	else if (ip_type == AMD_IP_DMA)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+
+	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+	r = access(sysfs, R_OK);
+	if (!r) {
+		fp = popen(cmd, "r");
+		if (fp == NULL)
+			igt_skip("read the sysfs failed: %s \n",sysfs);
+
+		if (fgets(buffer, 128, fp) != NULL)
+			sched_mask = strtol(buffer, NULL, 16);
+
+		pclose(fp);
+	} else
+		sched_mask = 1;
+
+	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+		/* check sched is ready is on the ring. */
+		if (!((1 << ring_id) & sched_mask))
+			continue;
+
+		if (sched_mask > 1 && ring_id == 0 &&
+			ip_type == AMD_IP_COMPUTE) {
+			/* for the compute multiple rings, the first queue
+			 * as high priority compute queue.
+			 * Need to create a high priority ctx.
+			 */
+			prio = AMDGPU_CTX_PRIORITY_HIGH;
+		} else if (sched_mask > 1 && ring_id == 1 &&
+			 ip_type == AMD_IP_GFX) {
+			/* for the gfx multiple rings, pipe1 queue0 as
+			 * high priority graphics queue.
+			 * Need to create a high priority ctx.
+			 */
+			prio = AMDGPU_CTX_PRIORITY_HIGH;
+		} else {
+			prio = AMDGPU_CTX_PRIORITY_NORMAL;
+		}
+
+		if (sched_mask > 1) {
+			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+						0x1 << ring_id, sysfs);
+			r = system(cmd);
+			igt_assert_eq(r, 0);
+		}
+
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
-					    ring_id,  version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
+					    ring_id, prio, version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
-						      ring_id, version, AMDGPU_CTX_UNKNOWN_RESET);
+						      prio, version, AMDGPU_CTX_UNKNOWN_RESET);
 
-		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id,
+		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
 					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
 	}
+
+	/* recover the sched mask */
+	if (sched_mask > 1) {
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
+		r = system(cmd);
+		igt_assert_eq(r, 0);
+	}
 }
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, enum cmd_error_type hang)
 {
 	int r;
+	FILE *fp;
+	char cmd[1024];
+	char buffer[128];
+	long sched_mask = 0;
 	struct drm_amdgpu_info_hw_ip info;
-	uint32_t ring_id, version;
+	uint32_t ring_id, version, prio;
+	char sysfs[125];
 
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
@@ -581,11 +663,68 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 	if (version < 9)
 		version = 9;
 
-	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
-		amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id,
+	if (ip_type == AMD_IP_GFX)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
+	else if (ip_type == AMD_IP_COMPUTE)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
+	else if (ip_type == AMD_IP_DMA)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+
+	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+	r = access(sysfs, R_OK);
+	if (!r) {
+		fp = popen(cmd, "r");
+		if (fp == NULL)
+			igt_skip("read the sysfs failed: %s \n",sysfs);
+
+		if (fgets(buffer, 128, fp) != NULL)
+			sched_mask = strtol(buffer, NULL, 16);
+
+		pclose(fp);
+	} else
+		sched_mask = 1;
+
+	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+		/* check sched is ready is on the ring. */
+		if (!((1 << ring_id) & sched_mask))
+			continue;
+
+		if (sched_mask > 1 && ring_id == 0 &&
+			ip_type == AMD_IP_COMPUTE) {
+			/* for the compute multiple rings, the first queue
+			 * as high priority compute queue.
+			 * Need to create a high priority ctx.
+			 */
+			prio = AMDGPU_CTX_PRIORITY_HIGH;
+		} else if (sched_mask > 1 && ring_id == 1 &&
+			 ip_type == AMD_IP_GFX) {
+			/* for the gfx multiple rings, pipe1 queue0 as
+			 * high priority graphics queue.
+			 * Need to create a high priority ctx.
+			 */
+			prio = AMDGPU_CTX_PRIORITY_HIGH;
+		} else {
+			prio = AMDGPU_CTX_PRIORITY_NORMAL;
+		}
+
+		if (sched_mask > 1) {
+			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+						0x1 << ring_id, sysfs);
+			igt_info("cmd: %s\n", cmd);
+			r = system(cmd);
+			igt_assert_eq(r, 0);
+		}
+		amdgpu_memset_dispatch_test(device_handle, ip_type, prio,
 					    version);
-		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id,
+		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
 					    version, hang, NULL);
 	}
+
+	/* recover the sched mask */
+	if (sched_mask > 1) {
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
+		r = system(cmd);
+		igt_assert_eq(r, 0);
+	}
 }
 
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index 89c448a1f..8dbc4595b 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -34,6 +34,7 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					amdgpu_context_handle context_handle,
 					uint32_t ip_type,
 					uint32_t ring,
+					uint32_t priority,
 					uint32_t version,
 					enum cmd_error_type hang,
 					struct amdgpu_cs_err_codes *err_codes);
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index de1550d3c..67570251d 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -752,7 +752,7 @@ run_test_child(amdgpu_device_handle device, struct shmbuf *sh_mem,
 		pthread_mutex_unlock(&param->local_mem.mutex);
 
 		if (is_dispatch) {
-			ret = amdgpu_memcpy_dispatch_test(device, local_context, job.ip, job.ring_id, version,
+			ret = amdgpu_memcpy_dispatch_test(device, local_context, job.ip, job.ring_id, 0,version,
 					job.error, &err_codes);
 		} else {
 			ret = amdgpu_write_linear(device, local_context,
-- 
2.25.1

