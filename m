Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12C1E77198
	for <igt-dev@archiver.kernel.org>; Sun,  5 Jan 2025 07:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F9C10E4EA;
	Sun,  5 Jan 2025 07:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0ly1U0y4";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DA810E4EA
 for <igt-dev@lists.freedesktop.org>; Sun,  5 Jan 2025 07:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH83gleMXNdMDwU3NFK8lZs5/nDvmgf4JJGNTZuOVUgfqT03RFTg9FcIWMCG2xo+Sr9vl7WweIrxKm6egn5TxSqkTBbHrnIizI+NaQiPQmCO8tOaRBRGgdx5oK9J8pFK1CzjbzUIFWdfqs28P7Jz4HHD88BuB0YZaLkBQqMkarA5HhKwlBl3J+ZG8fj0Akk78+mCCndaIt2zwn6X9XX2/ffE8IK8SKW3jaur01h6yz3WNru3TmH1XIdSPj/9k/5WOE8nDSEqtxs5pYRTmdZ8KmGFGkBQT4k52F3uM5MipI38Q7ziwkfz+40+rZ9eK/wLIpIZKVwhTKPcEdxfxaptWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXLv6bs+yk4+BqK2BROdhW3mVHXXiHCAjyK5bzeeowI=;
 b=CAjqse9b4eu0c52yxndmZbJsfUKZ11ZUVDcZa3pMvAHh3+hHAF3TnHqfRuW7Uwum2jLuMeAP7ppDz8/s3Dos5V5pg1/YGEuOcIHjyjxc36e4ihV988wztuyXs6rcB3FGVHdmUzRkIOUCNEsYlyJr+sVuoVQu1LHNf2h9600VyN1rrBY1mHSVB0v2Oj3Q98aznCBpKT89/E92pQpTdP11Ikw+ffU7eKqi6DQMJIGiknUporrlurkLWFwiaW3V3at8BXQTtgVC3ADyzQ3HENJquKq8oNyaaVi3QNJZeE42eM5XWzAOXKONp037MN85t7IeBgCn10J9qgqN9MVdTxJmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXLv6bs+yk4+BqK2BROdhW3mVHXXiHCAjyK5bzeeowI=;
 b=0ly1U0y4TDjcMR2amX12bsvfwPiWWeeN+GQrc+ivLXxVnKwWbMnm6HZEYMzPFhJLKDxzDk1kZ/CtOFaOScGS6DGJg4cx0YDLeRZQtIN3tb6xTJkv22BhsEYt6WkciqjLDGdu7DWSgZg+f/Vz0Ia1itKI1GstQIPEFd1nREjevmg=
Received: from CH5P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::6)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.15; Sun, 5 Jan
 2025 07:17:16 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::44) by CH5P223CA0019.outlook.office365.com
 (2603:10b6:610:1f3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.16 via Frontend Transport; Sun,
 5 Jan 2025 07:17:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Sun, 5 Jan 2025 07:17:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 5 Jan
 2025 01:17:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 5 Jan
 2025 01:16:53 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 5 Jan 2025 01:16:48 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH 3/3] lib/amdpgu: fix the hard code when shedule ring.
Date: Sun, 5 Jan 2025 02:15:51 -0500
Message-ID: <20250105071551.113830-3-vitaly.prosyak@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd9169f-9bea-4c75-17c1-08dd2d58fbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B/LqdyQSotFojC/tJ4xzDgUCfqzDvCEhyY87MuGVE0BYH7yC38jZDL9X7k3V?=
 =?us-ascii?Q?s4YUSwkhGRq2y84mx4tA+A6kczxAdsgTMEtBlWoMKOkGNnTGENf8e2wNuora?=
 =?us-ascii?Q?/en5Vu5tfnytG8tutRa9jyTRCHap5UAHp3BBzVK8gwOSNvJ47zy4aYanMrxw?=
 =?us-ascii?Q?rzBFNgcc0Kr+pHiLDZIgN3nFhcqNUEF1/Eqxl9nXZshOaNz2DwF7KIQJGfIn?=
 =?us-ascii?Q?hxNym8h0O/zxVFxGB4gTAdoC3tranV0LlpmaVWG7TUqI3IPFNZZGXg50oI4e?=
 =?us-ascii?Q?UfQo5gPuCk3qkoIU7X04B7zZgJ6zgyVOMc1xBhObWB9ypyFjLT1Ryi3QbZN0?=
 =?us-ascii?Q?0hA2yYBo5VjxRQydtQqCzB26BcXHcfC/bUUDQfW/n+cPIuuk9xp4GQro95kv?=
 =?us-ascii?Q?FPs7MQbuzq0jrnZDVsMPml/Wqfj6dtvORBSh2Vg+k5A41qL+HQINeKXM5KDp?=
 =?us-ascii?Q?fKjb29HV714pn/+8XEUJCVSEjcI0Jj23o8RytvamjuRBGQRc40rsa4kZekTu?=
 =?us-ascii?Q?H6qheYtok26nIUiBRI8BKXroSHsVEgPeH6Mo37WUuf5XSv4AxnysAI/WmhoK?=
 =?us-ascii?Q?oZ8JQoKkVEFLRfjaI4MxUhzrnxj/cSoF1o3n0HwvR42VSHS0yBr4kbvxbJWU?=
 =?us-ascii?Q?AGBfzKZzjhNaLFinSaZvCIdZWejYyb8m4wVpYAfKWYk2O0FyQ2E+1eSvikJ3?=
 =?us-ascii?Q?bWOVc9ik0w3B9/HFktCJCe0lMwU2WLdWIQlcGHV6Dn2Jid94OvGmxYM8BVXR?=
 =?us-ascii?Q?IjMdVotEEWxRXBE1e968pMR9e+W5uo+vAvMCyY9fgLtSfNBb1obG12xZV1e1?=
 =?us-ascii?Q?j9WAY4D/cdNJj3lWa2cnC0zIIuynibtkJHGSk795lNGDe8ERfvWLOdF9G+kb?=
 =?us-ascii?Q?MraVa26ATb3qml7sqCJf6it0PykABAhTHpJ8AhD941PVJHHUbLl/y0M87Qnu?=
 =?us-ascii?Q?7HxxR/XrKP7OlTF8dmX9roD3GNo+vDq3gppaCx6y4BxL6m5o6X+tIVikW2gz?=
 =?us-ascii?Q?ilW+zA3hMzAMZ1FDxXE28lcbIGw4YB9xu7tyQlAIeR1tuDqMUVoykfc029zj?=
 =?us-ascii?Q?En4N/3dthl+/sVtf86Iyo3ih9OOX/8PCddD7NxXnChFGxb3aqs4krKVLFsCB?=
 =?us-ascii?Q?t71TuF6+fdNJKEjASxpJn60ovWnU+pdir5jDYATJB9XnZ+XILSh4IwcDAdmf?=
 =?us-ascii?Q?zKY8JjSrhcYD+cmKYveS5nCAyOGW7AfDWqUb43GIn0xngSaBueoSmNaVVNJ/?=
 =?us-ascii?Q?peZsV2cK7CeCfCZSXtd3S5sKky3mB0EIDprW51h7YlKFC08ajmYS0wyXxODp?=
 =?us-ascii?Q?hSEsE8j7hv/EahPc9gYz2/Tc7jsQK/Pt0ZbWSvd83tXWoA8XVh9ZgBZW4fnQ?=
 =?us-ascii?Q?ntQQML7BnNmXTK3aoF6gX32oOy0YRUV7BM+772Xz043iF0jxX6DmvnGcVT7k?=
 =?us-ascii?Q?SX4cxIZ01OWTaXUuq2fuR2uoLp9Dpc78pe+9BYeXHzLX97W4KgyPAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 07:17:15.9346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd9169f-9bea-4c75-17c1-08dd2d58fbba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
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

Implementation of dynamically selected scheduling rings.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

v2: fix formatting(Vitaly)

Suggest-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang  <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 43 ++++++++++++++++++-------------
 lib/amdgpu/amd_deadlock_helpers.h |  8 +++---
 tests/amdgpu/amd_deadlock.c       | 28 +++++++++++---------
 3 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index dabd7ae76..8ac6abf8f 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -65,7 +65,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 	int job_count = 0;
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
-	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
+	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
 		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
 	else
 		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
@@ -173,7 +173,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 	free_cmd_base(base_cmd);
 }
 
-void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type)
+void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci)
 {
 	int r;
 	FILE *fp;
@@ -190,18 +190,21 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
 	if (ip_type == AMD_IP_GFX)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
+			pci->domain, pci->bus, pci->device, pci->function);
 	else if (ip_type == AMD_IP_COMPUTE)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
+			pci->domain, pci->bus, pci->device, pci->function);
 	else if (ip_type == AMD_IP_DMA)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+			pci->domain, pci->bus, pci->device, pci->function);
 
 	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
 	r = access(sysfs, R_OK);
 	if (!r) {
 		fp = popen(cmd, "r");
 		if (fp == NULL)
-			igt_skip("read the sysfs failed: %s \n",sysfs);
+			igt_skip("read the sysfs failed: %s\n", sysfs);
 
 		if (fgets(buffer, 128, fp) != NULL)
 			sched_mask = strtol(buffer, NULL, 16);
@@ -247,7 +250,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 
 	/* recover the sched mask */
 	if (sched_mask > 1) {
-		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
 	}
@@ -269,7 +272,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
-	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
+	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
 		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
 	else
 		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
@@ -401,7 +404,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	free_cmd_base(base_cmd);
 }
 
-void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
+void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci)
 {
 	int r;
 	FILE *fp;
@@ -418,18 +421,21 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
 	if (ip_type == AMD_IP_GFX)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
+			pci->domain, pci->bus, pci->device, pci->function);
 	else if (ip_type == AMD_IP_COMPUTE)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
+			pci->domain, pci->bus, pci->device, pci->function);
 	else if (ip_type == AMD_IP_DMA)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+			pci->domain, pci->bus, pci->device, pci->function);
 
 	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
 	r = access(sysfs, R_OK);
 	if (!r) {
 		fp = popen(cmd, "r");
 		if (fp == NULL)
-			igt_skip("read the sysfs failed: %s \n",sysfs);
+			igt_skip("read the sysfs failed: %s\n", sysfs);
 
 		if (fgets(buffer, 128, fp) != NULL)
 			sched_mask = strtol(buffer, NULL, 16);
@@ -475,14 +481,14 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 
 	/* recover the sched mask */
 	if (sched_mask > 1) {
-		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
 	}
 
 }
 
-void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci)
 {
 	int r;
 	FILE *fp;
@@ -498,13 +504,14 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for the sdma\n");
 
-	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+			pci->domain, pci->bus, pci->device, pci->function);
 	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
 	r = access(sysfs, R_OK);
 	if (!r) {
 		fp = popen(cmd, "r");
 		if (fp == NULL)
-			igt_skip("read the sysfs failed: %s \n",sysfs);
+			igt_skip("read the sysfs failed: %s\n", sysfs);
 
 		if (fgets(buffer, 128, fp) != NULL)
 			sched_mask = strtol(buffer, NULL, 16);
@@ -530,7 +537,7 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 
 	/* recover the sched mask */
 	if (sched_mask > 1) {
-		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
 	}
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 7f8419280..1d654c490 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -24,12 +24,14 @@
 #ifndef __AMD_DEADLOCK_HELPERS_H__
 #define __AMD_DEADLOCK_HELPERS_H__
 
+#include "amd_ip_blocks.h"
+
 void
-amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type);
+amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci);
 void
-bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type);
+bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci);
 
 void
-amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
+amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci);
 #endif
 
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index b8bb053ca..29b7ae509 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -40,6 +40,7 @@ igt_main
 	int fd = -1;
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
+	struct pci_addr pci;
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -60,12 +61,15 @@ igt_main
 		asic_rings_readness(device, 1, arr_cap);
 		igt_skip_on(!is_deadlock_tests_enable(&gpu_info));
 
+		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
+				pci.domain, pci.bus, pci.device, pci.function);
 	}
 	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma")
-			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA);
+			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci);
 		}
 	}
 
@@ -75,7 +79,7 @@ igt_main
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
-					AMDGPU_HW_IP_GFX);
+					AMDGPU_HW_IP_GFX, &pci);
 		}
 	}
 
@@ -85,7 +89,7 @@ igt_main
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
-					AMDGPU_HW_IP_GFX);
+					AMDGPU_HW_IP_GFX, &pci);
 		}
 	}
 
@@ -94,7 +98,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-gfx") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-deadlock-gfx")
-			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX);
+			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX, &pci);
 		}
 	}
 
@@ -103,7 +107,7 @@ igt_main
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
-				AMDGPU_HW_IP_COMPUTE);
+				AMDGPU_HW_IP_COMPUTE, &pci);
 		}
 	}
 
@@ -111,7 +115,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-deadlock-compute")
-			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE);
+			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE, &pci);
 		}
 	}
 
@@ -120,7 +124,7 @@ igt_main
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
-			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG);
+			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG, &pci);
 		}
 	}
 
@@ -129,7 +133,7 @@ igt_main
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
-			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG);
+			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG, &pci);
 		}
 	}
 
@@ -139,7 +143,7 @@ igt_main
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
-					AMDGPU_HW_IP_DMA);
+					AMDGPU_HW_IP_DMA, &pci);
 		}
 	}
 
@@ -149,7 +153,7 @@ igt_main
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
-					AMDGPU_HW_IP_DMA);
+					AMDGPU_HW_IP_DMA, &pci);
 		}
 	}
 
@@ -159,7 +163,7 @@ igt_main
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
-					AMDGPU_HW_IP_DMA);
+					AMDGPU_HW_IP_DMA, &pci);
 		}
 	}
 
@@ -169,7 +173,7 @@ igt_main
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
-					AMDGPU_HW_IP_DMA);
+					AMDGPU_HW_IP_DMA, &pci);
 		}
 	}
 
-- 
2.34.1

