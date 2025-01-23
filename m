Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8503C02181
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 01:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33D810E3CA;
	Thu, 23 Jan 2025 01:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tRBB2GBp";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D5A10E14A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 01:25:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NR1La2nqyeSEUXCwqJDdhDfWU4pNULkiqa71H3iEuwLjQRNKy7qzvzr9ryFDjef2LsveZeUWSNMcpdH8xUYiEUm376w3TbaQ/U6GGso2VBHj+rsmVuYrZocqzzreTjm9bTta4v67WthrShvePDUxyEvairoq8KU35OGG2Cu07gAMuP0SvBx95eq1OBah9scaBmyBP5GdHslKIiIPqrqU0H9k7CdeTTNZIoJcaQa1/wksLQLnEDXFPCB+0I86hLyBJkIb0EEaEWopUWoYtHoK6I82kvDR1Yol3VDvS8Pk/uVgK9W6sAb54W9cLwm9tLscxsM8kq0iab21j+3lRKin4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVO69BGEXgGlTKIcHG3XiSO6EwX2SPQfJuvlYf+uGvk=;
 b=uzmL2b8QSA6CNGU7eTGn3XAYAgNdlFpJ8W4wIqbziuPFYdxbqkZc8OyGFKR/EFM4hrqajRqkue1unOdNQywq9h9YPtqpFEZNrQ46+tUjcDF57BFfyOxhpbvDhQGjSzw6ct+KUL2DSvHCkKnJV99J4+57l+681V4O3AQgGZaDjTQnWHuhYAS0/z+GVaNGu6cdWebe2Dkjj7YB2hOP6McNW/XV2mlcGfhVPeudE09/3un7ttiz6UegekUKJ36rTw+v8VN+u50xnmGnvUJT6n6R2j0wZL4yY+3dJUVRk/uyw08bC7wlRrfeopJ3LM00WpiaiBnYs+muoF6TFkm5cEENiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVO69BGEXgGlTKIcHG3XiSO6EwX2SPQfJuvlYf+uGvk=;
 b=tRBB2GBpZSab1YiyxCa9ejNNR2gYwsBi/YZ2Tw8PvJ/fehpzE8M/E1semflxxtnucnN+3nWVTx8RaD1ZzJXD5+V+cvSbAcckx9BgGr8hgLMPB9YkKun0lifaVvXCebXUH87G3eRm13rXiWPaKsMt4NidPBHbiv+BZ94WGXSAtYk=
Received: from BYAPR08CA0064.namprd08.prod.outlook.com (2603:10b6:a03:117::41)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Thu, 23 Jan
 2025 01:25:30 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::74) by BYAPR08CA0064.outlook.office365.com
 (2603:10b6:a03:117::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Thu,
 23 Jan 2025 01:25:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 01:25:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 19:25:28 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 22 Jan 2025 19:25:27 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: find PCI bus, device and function and use it
Date: Wed, 22 Jan 2025 20:25:25 -0500
Message-ID: <20250123012525.131685-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|SJ1PR12MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: d67915be-b97e-498d-d0b8-08dd3b4cd325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NS3OxXDAan0PPvbR4UDO8bo4kYmz6FsBjhDzOiqKSRm4V81ViEzZu6tRTi2C?=
 =?us-ascii?Q?JrObb83z6rClT3zYKmz8NCuODaV5O3twN8RgsGfGXh5oYh5t7mT+ALXPOMd5?=
 =?us-ascii?Q?BLiYpxnVTHc0cZpsruKtOlsBjfjLz5QfE2ljpZCCrsU3IIWffIwUpqhnYh5K?=
 =?us-ascii?Q?mys9zHd/scscKKoYqIWCcnO/K1u9ljjbBMZ07du7wjBOjPmJd9KMAbE6aTt+?=
 =?us-ascii?Q?uRN/MEfINx8Rb+pprWaUvX27UObz6VKbmAr4Wjt/iCJ6PoTLiQqMWFk+ikIY?=
 =?us-ascii?Q?8KeRd8FcCcD4VvUUMvtN9SsvYhlYX7aayEJTnzZO9rNMvAMN54lYVrBKy2v9?=
 =?us-ascii?Q?1Iaru/A5cnjf9xFnwduLl5x5deYgetLgM7ZJYnENy6Hu3PjUXn+aGruZTbdd?=
 =?us-ascii?Q?yTNYPDEAyFNIipJiV0zFy5Wv5GeVPmDa5cTkqkZVruqhQcUGbobsXs81IjzX?=
 =?us-ascii?Q?UH7pSu48eomZl28i/xYAB8/iUZY9c1z4qnUkw6heSNEwT/tfNGGpZPtv0LMa?=
 =?us-ascii?Q?xe6Q8fIi4ha+JSQJCVmV3WzMX4F+3zUPjG/Rf1iESOq18mOfmJLSr6mRML4L?=
 =?us-ascii?Q?jc9r3rcD9yaKP67ohOMj/bSWeSOn74M63EuKd3ZxhzdDTMEjoNV+Qokas58E?=
 =?us-ascii?Q?btBabhrMflqH1XtyyW0EK182U6CTt6vmb2vNc9tlpdArWMQS5yITYiEk7mJ6?=
 =?us-ascii?Q?Us7/tVO2FU9XKETSO/ZiJZWiYw+Sk5PkuEedcXxVOxqdwi30pIbXiLRZMu1Q?=
 =?us-ascii?Q?C9mcmOJTlJX6DAe96UZ1hvJ+R6BHlFZtANkmv7b1uVGSI8AAQn09h2Xgruz4?=
 =?us-ascii?Q?aB+v+uO58Zrl0rW1CuhI0bD+LbtTfIlpbvaURV5wLqh1viaAITM+ncFlc5zW?=
 =?us-ascii?Q?GBCtaIqJ4wemwCk2sYxJuuaqepqJ/C9c11lvh0iEvs/tg6WXvREbE03dWK9M?=
 =?us-ascii?Q?6fvfIldX9tmjObOlnpxsC+9MCq72vth6fPtYUOCz0iZYjHdIaP5uBmv5gD6b?=
 =?us-ascii?Q?LU99zIdXNSaatH+IqvnoNxSdgNrXr80Ub0Pv18MYdGmfH0Assxw6KUZ2InT8?=
 =?us-ascii?Q?u5fOsa/FzfRJ5v7YMsHMwoaCML7AdDGWOPiGlhfpn+9W530CrvfVzi/KLi9a?=
 =?us-ascii?Q?RR43Ad0owN56wQtO4x23YMHirZT4vsbgv+Z4wXOb7I7CMxq7Qz1rhTuu2wz1?=
 =?us-ascii?Q?jwKGF9ukjrcTibCUUOQQnyg4uQrXRa0TEF7n0cpVtmhlOhLbWItB7u7tXkc+?=
 =?us-ascii?Q?h3Vqqj9ZTDd4FSAFCZZwYKxO0pTnAQnuLU5fcN1DtOmiEQv9o2QhuHIcOMGt?=
 =?us-ascii?Q?hr7MUFCmOsvLXEUmUkRJ6UW+RV6Yx5z3QKalx+/dwlw8xXOqyWDzV7XYKGsc?=
 =?us-ascii?Q?V4qDdK/kLMqnFsuo6jj7RrRzASS8bYl5H2X2iF1YvjOoBI4M8O8VJpUs6h8+?=
 =?us-ascii?Q?1uOUekSgmOGLiEzi4Z+tfK2FKOvjdNWuuXz80oiwYnE4E+r+DIwaDAWGlM6s?=
 =?us-ascii?Q?FmBqPpHY06Sens4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 01:25:30.0940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d67915be-b97e-498d-d0b8-08dd3b4cd325
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Use the PCI domain, bus, device, and function ID to determine the
required path from the file descriptor. This is utilized to check
whether the GPU reset mask is enabled for GFX, compute, or SDMA rings.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>

v2: Suggested to add igt_info log about ring enablement (Jesse)

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c |  2 ++
 lib/amdgpu/amd_dispatch.c         | 29 ++++++++++------
 lib/amdgpu/amd_dispatch.h         |  5 +--
 lib/amdgpu/amd_ip_blocks.c        |  9 +++--
 lib/amdgpu/amd_ip_blocks.h        |  2 +-
 tests/amdgpu/amd_deadlock.c       | 18 +++++-----
 tests/amdgpu/amd_dispatch.c       | 58 ++++++++++++++++++-------------
 tests/amdgpu/amd_pci_unplug.c     |  1 -
 tests/amdgpu/amd_queue_reset.c    |  6 +++-
 9 files changed, 79 insertions(+), 51 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index f274a6365..d7bf0e111 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -241,6 +241,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 		if (sched_mask > 1) {
 			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x1 << ring_id, sysfs);
+			igt_info("Disable other rings, keep only ring: %d enabled, cmd: %s\n", ring_id, cmd);
 			r = system(cmd);
 			igt_assert_eq(r, 0);
 		}
@@ -472,6 +473,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		if (sched_mask > 1) {
 			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x1 << ring_id, sysfs);
+			igt_info("Disable other rings, keep only ring: %d enabled, cmd: %s\n", ring_id, cmd);
 			r = system(cmd);
 			igt_assert_eq(r, 0);
 		}
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 75fc326da..3153d88a0 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -549,7 +549,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 
 void
 amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
-				 uint32_t ip_type)
+				 uint32_t ip_type, const struct pci_addr *pci)
 {
 	int r;
 	FILE *fp;
@@ -572,11 +572,14 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	}
 
 	if (ip_type == AMD_IP_GFX)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
+				pci->domain, pci->bus, pci->device, pci->function);
 	else if (ip_type == AMD_IP_COMPUTE)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
+				pci->domain, pci->bus, pci->device, pci->function);
 	else if (ip_type == AMD_IP_DMA)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+				pci->domain, pci->bus, pci->device, pci->function);
 
 	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
 	r = access(sysfs, R_OK);
@@ -618,12 +621,14 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		if (sched_mask > 1) {
 			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x1 << ring_id, sysfs);
+			igt_info("Disable other rings, keep only ring: %d enabled, cmd: %s\n", ring_id, cmd);
 			r = system(cmd);
 			igt_assert_eq(r, 0);
 		}
 
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
-					    ring_id, prio, version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
+					    ring_id, prio, version,
+						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
 						      prio, version, AMDGPU_CTX_UNKNOWN_RESET);
 
@@ -639,7 +644,8 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	}
 }
 
-void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, enum cmd_error_type hang)
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type,
+		enum cmd_error_type hang, const struct pci_addr *pci)
 {
 	int r;
 	FILE *fp;
@@ -664,11 +670,14 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		version = 9;
 
 	if (ip_type == AMD_IP_GFX)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
+				pci->domain, pci->bus, pci->device, pci->function);
 	else if (ip_type == AMD_IP_COMPUTE)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
+				pci->domain, pci->bus, pci->device, pci->function);
 	else if (ip_type == AMD_IP_DMA)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+				pci->domain, pci->bus, pci->device, pci->function);
 
 	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
 	r = access(sysfs, R_OK);
@@ -710,7 +719,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		if (sched_mask > 1) {
 			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x1 << ring_id, sysfs);
-			igt_info("cmd: %s\n", cmd);
+			igt_info("Disable other rings, keep only ring: %d enabled, cmd: %s\n", ring_id, cmd);
 			r = system(cmd);
 			igt_assert_eq(r, 0);
 		}
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index 8dbc4595b..166c6d7a8 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -28,7 +28,8 @@
 #include "amd_dispatch_helpers.h"
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
-			      uint32_t ip_type, enum cmd_error_type hang);
+			      uint32_t ip_type, enum cmd_error_type hang,
+				  const struct pci_addr *pci);
 
 int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					amdgpu_context_handle context_handle,
@@ -40,7 +41,7 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					struct amdgpu_cs_err_codes *err_codes);
 
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
-				      uint32_t ip_type);
+				      uint32_t ip_type, const struct pci_addr *pci);
 
 
 #endif
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 9749e2072..2b1b84414 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1004,7 +1004,7 @@ asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask,
  */
 
 bool
-is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type)
+is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struct pci_addr *pci)
 {
 	char cmd[256];
 	FILE *fp, *fp2;
@@ -1019,7 +1019,12 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type)
 	else
 		snprintf(reset_mask, sizeof(reset_mask) - 1, "sdma_reset_mask");
 
-	snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/name |grep -oP '(?<=dev=)[0-9:.]+'");
+	if( pci)
+		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/%04x:%02x:%02x.%01x/name |grep -oP '(?<=dev=)[0-9:.]+'",
+			pci->domain, pci->bus, pci->device, pci->function);
+	else
+		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/name |grep -oP '(?<=dev=)[0-9:.]+'");
+
 	fp = popen(cmd, "r");
 	if (fp == NULL)
 		return false;
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index dc4d87151..595b2b16b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -233,7 +233,7 @@ void
 asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask, bool arr[AMD_IP_MAX]);
 
 bool
-is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type);
+is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struct pci_addr *pci);
 
 int
 get_pci_addr_from_fd(int fd, struct pci_addr *pci);
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 29b7ae509..472f28e68 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -76,7 +76,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
 		if (arr_cap[AMD_IP_GFX] &&
-			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_GFX, &pci);
@@ -86,7 +86,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-mem-addr");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
 		if (arr_cap[AMD_IP_GFX] &&
-			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_GFX, &pci);
@@ -105,7 +105,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
 	igt_subtest("amdgpu-compute-illegal-mem-access") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 				AMDGPU_HW_IP_COMPUTE, &pci);
 		}
@@ -122,7 +122,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-corrupted-header-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
 			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG, &pci);
 		}
@@ -131,7 +131,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-slow-linear-copy-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
 			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG, &pci);
 		}
@@ -140,7 +140,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
 					AMDGPU_HW_IP_DMA, &pci);
@@ -150,7 +150,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_DMA, &pci);
@@ -160,7 +160,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_DMA, &pci);
@@ -170,7 +170,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 					AMDGPU_HW_IP_DMA, &pci);
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 23d07561c..ceedbccd9 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -14,31 +14,36 @@
 #include "lib/amdgpu/amd_dispatch.h"
 
 static void
-amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle)
+amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle,
+		const struct pci_addr *pci)
 {
-	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX);
+	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX, pci);
 }
 
 static void
-amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
+amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle,
+		const struct pci_addr *pci)
 {
-	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
+	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE, pci);
 }
 
 static void
-amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle, enum cmd_error_type error)
+amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle,
+		enum cmd_error_type error, const struct pci_addr *pci)
 {
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error, pci);
 }
 
 static void
-amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle, enum cmd_error_type error)
+amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle,
+		enum cmd_error_type error, const struct pci_addr *pci)
 {
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error, pci);
 }
 
 static void
-amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
+amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu,
+		const struct pci_addr *pci)
 {
 	amdgpu_context_handle context_handle;
 	char debugfs_path[256], tmp[10];
@@ -67,8 +72,8 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
 	r = amdgpu_cs_ctx_free(context_handle);
 	igt_assert_eq(r, 0);
 
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0);
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0, pci);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0, pci);
 }
 
 igt_main
@@ -78,6 +83,7 @@ igt_main
 	int fd = -1;
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
+	struct pci_addr pci;
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -90,7 +96,9 @@ igt_main
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
-
+		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
+				pci.domain, pci.bus, pci.device, pci.function);
 		r = amdgpu_query_gpu_info(device, &gpu_info);
 		igt_assert_eq(r, 0);
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
@@ -102,7 +110,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-test-compute")
-			amdgpu_dispatch_hang_slow_compute(device);
+			amdgpu_dispatch_hang_slow_compute(device, &pci);
 		}
 	}
 
@@ -110,52 +118,52 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-dispatch-test-gfx")
-			 amdgpu_dispatch_hang_slow_gfx(device);
+			 amdgpu_dispatch_hang_slow_gfx(device, &pci);
 		}
 	}
 
 	igt_describe("Test GPU reset using a binary shader to hang the job on gfx ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
-			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
+			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci);
 		}
 	}
 
 	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
-			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci);
 		}
 	}
 
 	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
-			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci);
 		}
 	}
 
 	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
-			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci);
 		}
 	}
 
 	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
-			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci);
 		}
 	}
 
@@ -163,7 +171,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE") {
 		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-reset-gfx-compute")
-			amdgpu_gpu_reset_test(device, fd);
+			amdgpu_gpu_reset_test(device, fd, &pci);
 		}
 	}
 
diff --git a/tests/amdgpu/amd_pci_unplug.c b/tests/amdgpu/amd_pci_unplug.c
index 4c055b99f..cb88185a0 100644
--- a/tests/amdgpu/amd_pci_unplug.c
+++ b/tests/amdgpu/amd_pci_unplug.c
@@ -47,7 +47,6 @@ igt_main
 	igt_subtest("amdgpu_hotunplug_with_cs")
 		amdgpu_hotunplug_with_cs(&setup, &unplug);
 
-		/*TODO about second GPU*/
 	igt_subtest("amdgpu_hotunplug_with_exported_bo")
 		amdgpu_hotunplug_with_exported_bo(&setup, &unplug);
 
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 87cf665f3..a7aca4171 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1126,6 +1126,7 @@ igt_main
 	unsigned int ring_id_job_good;
 	unsigned int ring_id_job_bad;
 	int expect_error;
+	struct pci_addr pci ;
 
 	enum amd_ip_block_type ip_tests[3] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX, AMD_IP_DMA};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
@@ -1202,6 +1203,9 @@ igt_main
 			igt_require(fd_shm != -1);
 			launch_background_process(argc, argv, path, &pid_background, fd_shm);
 			process = PROCESS_TEST;
+			igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+			igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
+							pci.domain, pci.bus, pci.device, pci.function);
 		} else {
 			process = PROCESS_BACKGROUND;
 		}
@@ -1236,7 +1240,7 @@ igt_main
 				reset = (ip_tests[i] != AMD_IP_DMA) && (it->test == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH) ?
 					AMDGPU_RESET_TYPE_PER_QUEUE : AMDGPU_RESET_TYPE_PER_PIPE;
 
-				if (arr_cap[ip_tests[i]] && is_reset_enable(ip_tests[i], reset) &&
+				if (arr_cap[ip_tests[i]] && is_reset_enable(ip_tests[i], reset, &pci) &&
 						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
-- 
2.34.1

