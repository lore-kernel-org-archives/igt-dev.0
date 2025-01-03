Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B01E7718F
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 08:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B5910E42F;
	Fri,  3 Jan 2025 08:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3+xoj8pP";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96810E258
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 08:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLze0YDpDRwtRRC29kE+ghFITqX+juP1Q0oKOvJHkUJ8iIZURK7F4rwUb93nvhtAV3hef4fqzzKRndgmlO9X4zMCOqn349mQNOJyRUJsvhIVOg4GreiiwvsDmekMT/Ga1K3Wd5t0IzLrZHpSk79B8znMz/hsiwx8HwIu6IKTUcLEGVQ7jc3rw2d/+VwGyJ8b+SE8xRd/qvGVp09DjaXgscDhlHDBuf1zns7t0L/jcHAyx7lfe+le5aLWtPPe8l3TzYBA3T0lp8wZ2s93U7TneIGQFTNZ1+U2JORUA/xJM7zFLj2ZIwRgo2UUq/mjS9yYBsF56y/A5SV3OEKwzaaNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQmY6jMhTwFWM0xna57uIX5v9d3N6ydFK7YuO091vGY=;
 b=yosoUY/ELk1Zj1TYUC7DV6L8mtFdlxhZAUKbYG0DnrAj+hStOkpXqobL506AOsV/qFoZpTDy4q2U5nFHyTMBIjr1nR8YWWzJMKBkwZ4w0JgVtYnERO2zwS6zZEe04j6RBDKgvM5huA2o5IFgYDQkhtuCkDBXtSfCxAGYPdLK8fxrlO/NWKKBdXrtmM8gQOYvzZQuIhImjdFHrNxhEEdfMDxQyMMoDW2g1uEJ1e8wACeLlZqtW+VTJpmAP7U132wx3mnOvQ8p8JMMNLeeSUeu7QvcTMNkvy6wtMRPw8YuBlaNShrr/CNPt1mjQ78FDjMfkZMbqPrO/vKJbd5oMWV6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQmY6jMhTwFWM0xna57uIX5v9d3N6ydFK7YuO091vGY=;
 b=3+xoj8pP9r5f46TjXxFKDuyuuq6zaDNjUvr4cvpQp85H89ehVHYKLmQd9MQLQkaZr0Pd1t6vCmGOZ4KXi3s95rYtO1swIMFG44csvFL0MFSlU8CMPPwJ1ptQc6FSCmsC059l63KLrBy4qD+4MfAI8cQtTivJZcjiaqHEFbO+FWI=
Received: from DM6PR11CA0028.namprd11.prod.outlook.com (2603:10b6:5:190::41)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Fri, 3 Jan
 2025 08:17:51 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::6a) by DM6PR11CA0028.outlook.office365.com
 (2603:10b6:5:190::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.13 via Frontend Transport; Fri,
 3 Jan 2025 08:17:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Fri, 3 Jan 2025 08:17:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 Jan
 2025 02:17:50 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 3 Jan 2025 02:17:43 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 3/3] lib/amdpgu: fix the hard code when shedule ring.
Date: Fri, 3 Jan 2025 16:17:34 +0800
Message-ID: <20250103081734.2338675-3-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250103081734.2338675-1-jesse.zhang@amd.com>
References: <20250103081734.2338675-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0d8267-29d6-4d16-3dc7-08dd2bcf1dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CCt/um54n27utVx4qV/Vc9FpVCdweSwJ9Wj7jMCYclZQAUMXL72gjYu/dLkQ?=
 =?us-ascii?Q?ExcdQ4+KwG+PiMpTkmaF+5KLsJyQ1Ftj/h4M7swkWFoCDkDltgBvhiYb0Fwa?=
 =?us-ascii?Q?syIm0V+ckPCS5PZzTBH46crx6fhuyfkQG53P84PBYxw+Vy5uzDAWXVjvaGd9?=
 =?us-ascii?Q?nw2tZ9rgg+SwAkLR5mf1u7K7e4GyEVKDvAc+gD2bEONNo2KpwpiFGOZz+1q+?=
 =?us-ascii?Q?c2SHFfOq/Tyhb+rk01uPDNl4fTJGubPG+EyEiSQGPPgMvYKykD9GyuQY0AZS?=
 =?us-ascii?Q?cIPmsUOTsMo7bPaEq5fON9GP7nQULnkwk/t+rz3RoTsqErpq7ETBNYQ1ZKat?=
 =?us-ascii?Q?WNk95Gbw5/qYIuEIpe43j6Qnpt8ikOtxD7XqKnOV9KhQb/66ngkDbKwmMhMG?=
 =?us-ascii?Q?bfnSM5SSGEhUBW89F5NlWmcxI5d4EUtDxq97g4A+C26WhHi77yMDtaTudJTu?=
 =?us-ascii?Q?CGSXzbMJVdLDX+qrgmow8G/oJ1ewLD8tbcsPW7G/JqIyOU/bQs0JBCQiHk0t?=
 =?us-ascii?Q?lGc1AqdWbyzHCANxunS32djP/S5uEI2vLLr6QGz0JXxQSOuMpphbgrWu+2J/?=
 =?us-ascii?Q?Xq0YpNOGBZJ4DtA5fi8l5RtF7VJ+1te8p468TXywnctmv+XugpW/fFQTa1sz?=
 =?us-ascii?Q?j5uK0GADky6y1esuaZTINGoG1szAdEmtDH0Co+KBYT9lTS90uhPOtu9MDBAm?=
 =?us-ascii?Q?3+DGsoFROpL/Ak55e8odcmCQsWAkYbTUJrAP/onjXWI7Q1gB7UvNQGUEMSpj?=
 =?us-ascii?Q?+Ef91XoXBxxQeDw83NJwHcMXp1Crpcl7ClXOi8YzUtWZXCiKDUXD2T85ocS6?=
 =?us-ascii?Q?U0tnQuIadnUCnBNeErUk5QnZsazV7hggMpZ5j8aCdLghSlYNrnhzHZ0gk9yv?=
 =?us-ascii?Q?S0UMVYHaSGqwmT06PUB6DnN6lTcTvI1G3VHWCYycLKJAyg57HLfEyTETGdgO?=
 =?us-ascii?Q?7qnkXHoh8UbK2eTw36WHIGmnN++8wNVGFptV2IT0uNM73/l3FqOgY6SI4hkd?=
 =?us-ascii?Q?UX7D/mWjKv3MMnQOYA7fzuX9Td0Egr+O/uqG2GjxqfLVT4uZMFwOPkW71ige?=
 =?us-ascii?Q?g9KFNP1xVUoUOVHPKyX4bbg4pfAeg3AjAu3eJzdpjszkQrFHzHZIPI1728c9?=
 =?us-ascii?Q?4DFM7/Vqq1/QTeyuRx60G/9NUePkLVk9UtjYSOiuDpn4XOOEiNTYiJKbUpNt?=
 =?us-ascii?Q?woR0Tz8kucMy4oBqsH7zSJuQM4a03eIiwn+3MkM2gkHYUGGvJhhnBdbFttUT?=
 =?us-ascii?Q?jxjjUqH5Y6aKuGHKtpKBs1z93hmAQwqOGwC9QKJmUlGcf79VOKxy6l/kpdIa?=
 =?us-ascii?Q?rCAYgcXs6ToibbE/rP/5FvSFejS51Jnl9XyEgeOt5WAVuavECI7n+uGZcizm?=
 =?us-ascii?Q?pgDibH2b9gdQ9kAyzYSjmn+AlA3eAfqKEaTc7ZB+rlUIP7f3x7zSqmwr9DKf?=
 =?us-ascii?Q?zrOzQ5otO/31D9x5qITn8Y5Igk9uYLZ2pPEbnMZ51UV7MBKC6WCzJA1SEweX?=
 =?us-ascii?Q?/xPpOk+Gb+r/4Fc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:17:51.2056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0d8267-29d6-4d16-3dc7-08dd2bcf1dbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021
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

Suggest-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang  <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 27 +++++++++++++++++----------
 lib/amdgpu/amd_deadlock_helpers.h |  8 +++++---
 tests/amdgpu/amd_deadlock.c       | 28 ++++++++++++++++------------
 3 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index dabd7ae76..448c6568a 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -173,7 +173,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 	free_cmd_base(base_cmd);
 }
 
-void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type)
+void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci)
 {
 	int r;
 	FILE *fp;
@@ -190,11 +190,14 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
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
@@ -401,7 +404,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	free_cmd_base(base_cmd);
 }
 
-void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
+void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci)
 {
 	int r;
 	FILE *fp;
@@ -418,11 +421,14 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
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
@@ -482,7 +488,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 
 }
 
-void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci)
 {
 	int r;
 	FILE *fp;
@@ -498,7 +504,8 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for the sdma\n");
 
-	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+			pci->domain, pci->bus, pci->device, pci->function);
 	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
 	r = access(sysfs, R_OK);
 	if (!r) {
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
2.25.1

