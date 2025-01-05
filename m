Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDFFE77197
	for <igt-dev@archiver.kernel.org>; Sun,  5 Jan 2025 07:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DB710E050;
	Sun,  5 Jan 2025 07:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fIORpiiM";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A4710E050
 for <igt-dev@lists.freedesktop.org>; Sun,  5 Jan 2025 07:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQ3KzpcSDnbZBhzsMtN6eDyZY0aWcT04dfW+XeAPu7U+RwjmpD+/euSpdG//zinneX2i/9oyH9UZLR7tWwWK3SLoYwORZEH/RdEUyRPr9TheI0BADs7ORFa0gf4yH4o5LEIYtKcJyWQ55go7VgNIGSJgIQFXo8ooGa1oOcTEiUXWgkt15OUvxlRnAfstoeAeuwsPdBuYkGn9ksrbJQY6coOBbCPegPOeqFNZLsRmZ1VpGpS804sBFP5BPaBMSCP6U+cPABw3Qnj357t5dfCtQ265fpHw50PbkF4+jcF5drGdCD7Bqy9GqRzG+IzS/1Zf3OQDOI3V6xM6+romCtsc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMv+vV6pfU8rn4+yUlohs+bjxaLr15h54EvKtH0ild4=;
 b=JgHrVk65E5kdL4XPMVa60RDgmLgiy488RDVCbIpMF9mTqhjlQqYIQS9Lz37aV+ZJSPN8GUftqoS+NAKwZRuL4sNh66ifz73Xi2DjmP6Ef0E6VzSzBe3LFCDdmqFSim4qcCBm+lOpU/74jvdJEBgJSC3ZbNwKddH1O4ex2muZLiEKBbVE3B0rT3EpM5mATAesFGo0r3Yi8ff+koPoF8FewoyyIeKPkjAOVJNoo2EI5hK3tQN6KcZIN1sGeidP+aMrtP710jPTyeG5F1rUIts5imwPH13mGCDvDnpIAFrywPPkA+XckHU8mcok8XvqMzTX0BEJQ9j2Yqevc9Df3x1dng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMv+vV6pfU8rn4+yUlohs+bjxaLr15h54EvKtH0ild4=;
 b=fIORpiiM3FKmMR46HmHiOOfmjQwN7W6Az+n5KUPO4CwcAVLclUFTo2/CYC0LZ5YcfOjKSutXJhX7bb3xYgAhtF8G7OHYnPWJeoan7uQi9N7frf2xo6Of+QKYRjWVgh8xT1+iMvygYh2Vm4c5yHXaFMxMFixbaCfplAqcUY2FTwI=
Received: from CH2PR20CA0007.namprd20.prod.outlook.com (2603:10b6:610:58::17)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Sun, 5 Jan
 2025 07:17:15 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::cc) by CH2PR20CA0007.outlook.office365.com
 (2603:10b6:610:58::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Sun,
 5 Jan 2025 07:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Sun, 5 Jan 2025 07:17:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 5 Jan
 2025 01:17:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 5 Jan
 2025 01:16:48 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 5 Jan 2025 01:16:28 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH 2/3] lib/amdgpu: enhance wait memory helper
Date: Sun, 5 Jan 2025 02:15:50 -0500
Message-ID: <20250105071551.113830-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105071551.113830-1-vitaly.prosyak@amd.com>
References: <20250105071551.113830-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|MN2PR12MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4bccf7-4c21-4950-b150-08dd2d58fb5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZJeUq4j3HqiO545jbZWomjhqIKd+EdwGr/gRcVPmZtAMMlWPVL+3DVQWBVQW?=
 =?us-ascii?Q?QWE9+c6nBKZA5kkcMCiMizcCVpGwoM+92gQfljC1tfCIJeZaTgrwNHX36din?=
 =?us-ascii?Q?YcVR21TeGmNKB2h+Jk/9w+uojNgCKrZMqvTiOQggyn1OM7RKQEintwhWXMnK?=
 =?us-ascii?Q?UJMjEmRKAkqE6UTHDU7k2mTrw2MCDlQtScOwJ/EglNbEojZxyTuarSH0cBVC?=
 =?us-ascii?Q?CrENZnzFRt13ars5yBqmBrAJy6J2f6qD3KRbXV6GhK/yPv768vHFtsYeiVjA?=
 =?us-ascii?Q?UUUdHvwuAogZwtpKRcHFDId/1LhQFT601GPwjplMbN+o77iRcD0yUa6vQqXd?=
 =?us-ascii?Q?nX9WmPyJGlQntXjIclfFhR+ukXQWFAyRM3+cRiOWfhQf3FaUpXudQNRdnpik?=
 =?us-ascii?Q?pyGYJodGB9cmagxbXuxqW2AYzeoBhx+V4QzoBzyx2XeHLCCV2gDt3pTWM+AK?=
 =?us-ascii?Q?sNKzL7qnk4Ijawf3BfWZWN3RE2WqT5VVzA8vxQkZ6HoKAQAz6aHY/iWfl2to?=
 =?us-ascii?Q?9arRfgK1SArUyS5wPrUrN6iQ1WOzlkCOuzYb5ygQ64punGY3cRYDbVLhUpk5?=
 =?us-ascii?Q?kYAAvf3CNb4OvsOn1YDnYuolYs+/bJBbDBWYY7J4luMd0LylwV1hPQ9cttz2?=
 =?us-ascii?Q?BlO579OD+n15q/1KO9PdcWoM7t6V5EzFNuTrTu3eYJUci231lOQR7XFd1qVP?=
 =?us-ascii?Q?LJgfKQtoSrq2sZ79lloKTmRcdvN/9gB0Ph/eSshV+MlmV5FLyqtpY3VIb4TD?=
 =?us-ascii?Q?7S3Oidh3MDP9YxRGhVUAlyNCUs4yhR+L6KakBKanjO/lXOKC/tc1pupVnwjK?=
 =?us-ascii?Q?by/NBtlgNIy6IKgQgmpEIxUaQ1zffzTfx9PN1rgYaWNRg8a3l3ff4hF8lqFK?=
 =?us-ascii?Q?YCHkBFuF/OzkvYYH2d5Pz7n8lD6avsN+PxohVXICqPxxhPxmBW57MBulIlDs?=
 =?us-ascii?Q?qGIClaMJKpxASxs17cq8jlcmMK7H9EfMbX6a3DDDDu0dn/pktWw4BH31iEkW?=
 =?us-ascii?Q?yCYfNd9ifTjANuGrK/gYM2h7aotYvYZGR538O9IQ6NO6o4vIO//KudXtT7rl?=
 =?us-ascii?Q?oQRxdKanJnjk6KJiJ6DEo1MwGV1ktmV0Kv1fUbaFBeX1MuhJvRC7geFJJcXq?=
 =?us-ascii?Q?aXvDSgTe2nZid05FvMLtGxW32yotD6q6hk6xKCIY7fnH4D1t4waU5nz25R/m?=
 =?us-ascii?Q?v5zQnAyrEl/gR2YGOUcJMcDxyU+XASth2D48gtv5N+rXqZVBLAXSDnULNdxQ?=
 =?us-ascii?Q?54ujlG6rTSNVGOlWPALGc2isARrZegfvP6ALUB9aUofixC1KtfKTYhuadeig?=
 =?us-ascii?Q?VNKnB5950B18X1BFYCuaVsIDYaqtNPYLNedd1s/3Ct2J6/Po3yY6KNcJ6XnM?=
 =?us-ascii?Q?AaKbPQq2vl1gbjYmA+7+nzyHMYEO+kV+Y5x9cTtfRg/vUziWCPeeyAKPh7di?=
 =?us-ascii?Q?vzPcm7vln6aL8rgZW3Tpa4l3E6IN/ozQ4UiuUX+Lz3mptEjrDbkaw6Jkqx9e?=
 =?us-ascii?Q?g+77wuRo17XWupU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 07:17:15.2781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4bccf7-4c21-4950-b150-08dd2d58fb5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

Test all sdma rings and ensure
that all rings can be recovered.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

v2: correct code formatting style (Vitaly)

Signed-off-by: Jesse Zhang  <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 91 ++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 87078548c..dabd7ae76 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -43,8 +43,8 @@ write_mem_address(void *data)
 	return 0;
 }
 
-void
-amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type)
+static void
+amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uint32_t priority)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle ib_result_handle;
@@ -65,7 +65,11 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
 	int job_count = 0;
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
-	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
+		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
+	else
+		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_alloc_and_map_raw(device_handle, bo_cmd_size, bo_cmd_size,
@@ -169,6 +173,87 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
 	free_cmd_base(base_cmd);
 }
 
+void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type)
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
+		amdgpu_wait_memory(device_handle, ip_type, prio);
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
 static void
 bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 			unsigned int ip_type, uint32_t priority)
-- 
2.34.1

