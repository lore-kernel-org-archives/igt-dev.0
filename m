Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3239FE7718F
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 08:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FB010E42F;
	Fri,  3 Jan 2025 08:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I3FWgo9q";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2051.outbound.protection.outlook.com [40.107.95.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2040A10E42F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 08:17:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOrXGCbVSFQHpbv3OyLiQuwcBC4rpYSTmg0agshpwuxpR7HG9ylm2CEbRqaSKamP9A36tNjChtu35xdh+68ofQNigFoOOxwF32YyLEGBi2pSaoPmF2P7l4bV8gGAS/uU2BGGDjGd/XEa19NhsaEqU/HHHByrOpQ+Ns/5xgMWmuLlFGf2OirpLWYjsOzEYQFkCDWr/8CPAp+6KW+PYsYQh655ugRekqD+eq/+z5UjjbNvtsO3jT4nmNRbHfcSEgfL/eQ3JkyYBMWYsMEBWaPKGtUJgCaakJ6sj7mfXHFqtL4hkDYA9/NMDnp4rmhTf1UwrzFAhu08nhSx+O+82rl44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO0f/3cKofxFH+dSaNMF8q4zBIQfBXHqGOhJVIo0/Tw=;
 b=Y6t1590RFe3gYEi4CHlmoVebVNyylYl9XxyVTVtf0/zCkHUYXjFtqJD+ZH0VqMJRI9Na+MH5N3BnHNE24B6amZ3VNFvEjEoTmYFuPH0+ST/XCZyFOdORvDT2HswZmOqxSVlTofI/AYU9kBc60+7Ahbzdjtn2nXUMmfsGrxiaBdKvOCSlqg9yB5tS1dSHZC0JlqEeYjNRSxEghrR71wbjbMZG7W4M22Jo3mM+cN63ja6tt6aWz3nmNjAPJ+XOZYILrhuUfY4gGGk3xgNOgHitU0sLA7sOJ4rt+2zU+3U6hBkIRkTH2eY5XLI2/AZuPPnHzfqZCAKcVOi0iGYUR3lE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO0f/3cKofxFH+dSaNMF8q4zBIQfBXHqGOhJVIo0/Tw=;
 b=I3FWgo9q5HLDILdtdb7FpyQfzbdFtwGlzyAlWHzKqf+L25XxmZu58aiWAeXJVvE5SHLS+y4BILi8Lc9IhMNBePD3InA/5Ht92mNruEt3+X8TayS4LOhcOQv4+4sOKmM1/cbtdyuSz47FaRaA7NBOUgTY4B83OCH74Ssp4RfGGJo=
Received: from PH3PEPF000040AB.namprd05.prod.outlook.com (2603:10b6:518:1::4d)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 08:17:37 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH3PEPF000040AB.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.5 via Frontend Transport; Fri, 3
 Jan 2025 08:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Fri, 3 Jan 2025 08:17:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 Jan
 2025 02:17:36 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 3 Jan 2025 02:17:34 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 1/3] lib/amdgpu: enhance wait memory helper
Date: Fri, 3 Jan 2025 16:17:32 +0800
Message-ID: <20250103081734.2338675-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 123c6dc9-568b-4e0a-cb4f-08dd2bcf1558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dei0Xiy2cZFoq/lxrXzVUJY+At+xBcHix2s3H5/McvK8ynJpbXCuE11eeZl/?=
 =?us-ascii?Q?ydtRNAXZAy7KWKEzD6AYKNFF9xUZtY8QoR6A2zDrcLVR+tyaGPBhjfuphEFO?=
 =?us-ascii?Q?F3vW8R7xw5V7xZK9agPnJAIdfjXDqMIWSAG+/8eZEcK6QJK3B5NxVA7EsSnT?=
 =?us-ascii?Q?Ys3bAJBoiiV1aPMbtxb9Dhhsr+t0Qdbi/gIv29XvUEWP4ZLewYYAIFwJuu3c?=
 =?us-ascii?Q?/rqROHaRUyJnkSyPSLw+SPZmUNrm5yoPr927bAcqbFAgoBOb3vS6Jl8r3kg9?=
 =?us-ascii?Q?5Qu0YyqlWI6z8D3EfdN8KPOzVI84R75qHN8M/iOYwtWwCcHbr4UNLvR1K+Yv?=
 =?us-ascii?Q?wBwOAndcR2vq0s1YCK3F5+0fe0m2F6eAGfXZF2Ed5cEK/fi1KZSI1kXHUZmF?=
 =?us-ascii?Q?C+SLEWDp62US897d06I6BPGD8MEJyMGyOEM6q4t5DEjU0HoZ2I/qBOEcv5Rc?=
 =?us-ascii?Q?cOLA80yWPBcQd90gsCXMrYfkQjllWdCrslPAaV0SEUqPyA/fS3cuJsDtlscg?=
 =?us-ascii?Q?/A0uwoEfalh8IZDEqgEes4m+0DQm3+9M2e4raC4NCIxcgLPtQo80JnLcA6/Z?=
 =?us-ascii?Q?ZyB5mmw+Aihcl/bd59eJjSbDi979DMC+VaNanfOy9RDGMn3stZGL7+2sxmGP?=
 =?us-ascii?Q?RvLeF4g3qZokmndYWRX19Omk02w8lZjDrNUoMoLrZ0cbjVgk8IS8SVmtbvwW?=
 =?us-ascii?Q?MCDAUVVodeYTiXrdWNckd1510pz+gXezOiyo/2uKBbvP7pCu7vtPuzJ9gUjC?=
 =?us-ascii?Q?8L2DTGtj2l6KIYE3f1np7eYcAyEZtfe+dkCv4FZXVZY8tXMcE3ng5ZKn8eLG?=
 =?us-ascii?Q?CloCO0g5Mam9bQxO8p8h/uz/x/aV1u3kFDX1NzF3sUJwUw1LpfZhBEORcSGF?=
 =?us-ascii?Q?IrOw772cCsRyTk72xNfiLl46k0ZxlXg1ViIZFEKd4iNhUOD3LD8O9alo8ZIB?=
 =?us-ascii?Q?HYgbypu3OntTdM3E2SGai7LpD1QNPNHaISPNFOeLYoNP2z1eN6oCFSlGmXjq?=
 =?us-ascii?Q?4JQYCXdo6QUg+yj9nnfiOM+Y+3jBojVvs8gumbQi8W/8LS4smKGV5G8o7urh?=
 =?us-ascii?Q?2J4v+XFyTpEvcuB3xWj9jInkB14osW9r/mG3F2dlFPl7VUmKRwCWqOowTbad?=
 =?us-ascii?Q?lVRVf4+x7Yfd+6/Dn1HfqrZdePf/sn3EtzJgvhx/kQGPgPUU3qabWFZk7efH?=
 =?us-ascii?Q?6y7xPRlJAokqVCcKud5KQ+IManK9JRtFYahTEUQEVTnjOgFiBkxxeOx1vk0V?=
 =?us-ascii?Q?nC6jOZgQRRwr0ADZObXBWTs23ufD7RcB8tz6ff9U8KJByTx5hhl7sDoKNOOC?=
 =?us-ascii?Q?GDFJlN0tRZZhNZKEISXpkRRz9Q1GTbCWcAGWOre+Yh8d+DLF6k7pE9Ub9Izt?=
 =?us-ascii?Q?XvEPbx0rZmse6uNHHHvOZOVdPt+uLr5TZnYzcSHxZjByeC6eLB3DgNh3zo02?=
 =?us-ascii?Q?tCbKfmvirEZcMEhuDcsxM+Zx7q6r/BP7MBVnsRJE436TvEVJcJaU7MVGIq+F?=
 =?us-ascii?Q?Mb+tHGV7VssBz7g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:17:37.0968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 123c6dc9-568b-4e0a-cb4f-08dd2bcf1558
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202
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

Test all sdma rings and ensure
that all rings can be recovered.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Jesse Zhang  <jesse.zhang@amd.com>
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
2.25.1

