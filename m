Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F08CCFD373
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 02:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4018E10E33E;
	Tue, 25 Nov 2025 02:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iFmUHM0U";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013064.outbound.protection.outlook.com
 [40.93.196.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAA710E33E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 02:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fr2stcIoi27F514bnKvL3tUnfN3j4qSNBUdT1+2kuPcEJpR9GDRq4Qepf2bN2qG8+ppRV9GPZmq5neMENmO/UVSGf/qDo0BEEnbv7cPN2Kcy2g9Tl/91q5d4U6MJLPByjXBiUfwXjbhBY+MuuEhRy07WuiOoOcvVoO2VmgNfzPiJ0yj6TQp/c9zFTgR7K6n85N4VQTatWnY7X1ps8wJByYYilABsozpNKJQjIhxvS/meOjQb5UvEds2BNBwRfG2VIPqnu0H66FLHMcQqV60G43ZOlmx3SVSrB2vAkimkz7ksJx3XX+kdCTz1Y7Wy/epQkGfCUdhlIuv0Rqs0y3YHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBR9sNQ8urVZzDy1lyhfge/2EKTDtLXUYLRBaEOjLxc=;
 b=fAMogmxwusVRmiHFisbGZlPXyBvhgG1VtCh8ijBIMby0sTq+cE4FOB21hXQ9/ZUG8/MQy9H4d1hOhMOCCCvwXDEgf6KlMjnmFd6Mdyoa+KkOoJ1pw12cNvwTdXVsGHtqUAtBTHjFLK4lbx6c5SGIFqW2ozFb/9q+OaPG+Crxz3W9ucB2J2LQgO2mAxAeHuLHCTNgcXHE+ZCM8UoQajIwCDtK2OcD81ULSWechx1Ze2eSut4L59x58OClr2R00vG+shXQaNH8WVkQSxgAkFVAvLWIBQMjqJXTlV3Jgq9HPIzrjI5QBatw9crrBv+xFSZFlY5K9LjDrYE3xHjLIJpRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBR9sNQ8urVZzDy1lyhfge/2EKTDtLXUYLRBaEOjLxc=;
 b=iFmUHM0U/X20qYcEnkzhAriM6lTegH/J3cec2P75Wan6/EBSRXMgYRY2yX/BMN5u00Rx9Ew19NIM6P9A0jkFG2aXhThNSCB1jBumSRp5tUuzPZJ3qQ40cvTcFRsLlynE3Tmxz7g6GNiNizITIonfcR70L64uEtaPFbWqFH74tCw=
Received: from BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19) by
 SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Tue, 25 Nov 2025 02:03:29 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::3e) by BYAPR01CA0042.outlook.office365.com
 (2603:10b6:a03:94::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 02:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 02:03:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 20:03:28 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 24 Nov 2025 18:03:21 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 4/6] lib/amdgpu: add utility functions and GFX1200
 family macro
Date: Tue, 25 Nov 2025 09:59:49 +0800
Message-ID: <20251125020304.2898626-4-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125020304.2898626-1-Jesse.Zhang@amd.com>
References: <20251125020304.2898626-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a13620-f8d4-4562-d8ec-08de2bc6d3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DwOU4yUTsbngqmsJf33oN3i/35f3Tmmea63J9nZpbzdQ9cUL3msPDfs3UV+K?=
 =?us-ascii?Q?JT8CmMfbGBJTpSXykcU5yVZg+VgQsUnSpKg37JfX/scn59zJjpcjVf/HaBOt?=
 =?us-ascii?Q?hjwo/bO1HTE9P2jGmKbWHNhvU4szsrZhGEwsj4ihVSmPzVGrHINWPE73Q/8N?=
 =?us-ascii?Q?zuD+tVpuaCPkTTZXnHbIqdhiDDN9eTKHNRQ53rDJo+uiH2do4x7IyedZMRXd?=
 =?us-ascii?Q?NWulpCqJYcoXWVW5ESOaIqu8PRBVkkn68g7jyBtI7e2okgg2lzUGm3AaKbUh?=
 =?us-ascii?Q?9g7xW9jzEtCRNri7TfHvP5lyy/dTk5hq2dEcIAw2sBboEYDb00lGp3LoiAjX?=
 =?us-ascii?Q?S9QpvdQhWXQe0OUHueITERKaFJ+7LTEvGA2mtfCIbE72kr75WDbqPVrPaLOl?=
 =?us-ascii?Q?LV35QglHrTqzd2Z21sZ8/GZ2J4Pxm3p3BviMppJG/6CUERZL4JPjTRQUYdt2?=
 =?us-ascii?Q?uavpWgUHZouylu6Ui7pviKVZA40MiRJNhzpq0q2yASSqZTP4uy/bn2A2J1tg?=
 =?us-ascii?Q?dwPR4upcdLRMmotjnO+KBRTMajxGbJMsJ3+ST5aEkB1aQQxxg+E6K92R6fsp?=
 =?us-ascii?Q?FgzPTlodwg1hx6QqLNDYfBO5uLW4diAWb+Gi76aPnCK4EngFp+shIJQsVvXk?=
 =?us-ascii?Q?GSjnbvczdnZdyhFd0/kNHzYX3t5fefCSVIsW0KH3t7wTABcrJ99KV6Ey1zGw?=
 =?us-ascii?Q?5W46Wmko2qH5Dfq1M4rq0XrnBLeJY8rHg3Sbz2AX55Z90ilpBMhQLqFQmfkh?=
 =?us-ascii?Q?HHcwfwfjIVxnathTg74J9zNCgJh49y0FxtTbblqcCsyZFqvl6s1LeTf+1nJK?=
 =?us-ascii?Q?7ib+fNL3oQKvO1JiC+KxY/xXVRMc+M54rdLQRFZY+EL4WCod20eevflRA6et?=
 =?us-ascii?Q?hz72Uv52zbU/gWMC9CaaUvYlVJ6nR9gzdZIL6yprtU4tA69qiNMwbkJ3G5Mh?=
 =?us-ascii?Q?sky8wWUAhdbGSSuc44ySDVPH6DBE7KsL3OPjIA9cgWESqp5nAv9bAhKu3MvF?=
 =?us-ascii?Q?xksjxvFAVC718fYwk64IAj26blcSqBdsBzkx1HH099vOIke81TkSp7H2h1qj?=
 =?us-ascii?Q?2Tkf+55W0sWUGc1JxnX6A3uiTpsXAojb6gz6TXF5I9PIMYXMiLKlL5kMlFRk?=
 =?us-ascii?Q?ImtzKoZk3fn2serFo3rhjr7DPSHAhvhnJkf4H7F3UdANF4O6cNGs37NHW8gu?=
 =?us-ascii?Q?q1nnavVlDW/ClM8Fz5utpDUb+Uk9+dfnjZlZXIVR6sShle/Y8J0o25s5U/WO?=
 =?us-ascii?Q?rVZl7cRoYHXfsAv34dWDjV4Ee68A+D9UBYOGrK1VSSeG0ZYQ+OmfHExmd5Wi?=
 =?us-ascii?Q?Ae0QzGBHO5E1/Oids4lzo+nOKekv3mG7qbKTQWFuswHy/EpOklnXpRFCFnAo?=
 =?us-ascii?Q?sVAfjMVYWiy7nq3cpbfN5kDdWx1jvr+EjuV7BlamYV+Rkj44tMZWagIQLsSE?=
 =?us-ascii?Q?ZLrgqUv30a+hK1U1XQib4weTE9q5JK850/3SxCacswxog/0h4v1WBq3zLUAX?=
 =?us-ascii?Q?hMHT6FkX5CDNhqwE029XpTffCCD76NNwxArn5ClFpggRSZh8huXvy51LrVQm?=
 =?us-ascii?Q?ufdl92zj9fBq2ML5rrI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:03:28.9045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a13620-f8d4-4562-d8ec-08de2bc6d3d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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

1. amd_ip_blocks.c additions:
   - get_dri_index_from_device(): Extract DRI index from device FD symlink (supports renderD/card paths)
     for debugfs access in tests.
   - is_apu(): Check if GPU is an APU using AMDGPU_IDS_FLAGS_FUSION flag.
   - cmd_get_ip_name(): Return human-readable IP block name (GFX/Compute/DMA/etc.) for logging.

2. amdgpu_asic_addr.h addition:
   - FAMILY_IS_GFX1200 macro: Add GFX1200 architecture support for family checks.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c    | 64 +++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h    | 16 +++++++++
 lib/amdgpu/amdgpu_asic_addr.h |  1 +
 3 files changed, 81 insertions(+)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index b44c29819..221eb6eda 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1767,3 +1767,67 @@ bool is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr
 	/* Return true if files matching the pattern were found, otherwise return false */
 	return (ret == 0 && glob_result.gl_pathc > 0);
 }
+
+int get_dri_index_from_device(amdgpu_device_handle device)
+{
+        /* For AMDGPU, the DRI index is typically available through the render node */
+        /* We can use the device fd to determine the appropriate debugfs path */
+        char path[64];
+        char target[1024];
+        ssize_t len;
+        int dri_index = 0;
+
+        /* Try to read the symlink from /proc/self/fd */
+        snprintf(path, sizeof(path), "/proc/self/fd/%d", amdgpu_device_get_fd(device));
+
+        len = readlink(path, target, sizeof(target) - 1);
+        if (len != -1) {
+                target[len] = '\0';
+                /* Extract DRI index from path like /dev/dri/renderD128 */
+                if (sscanf(target, "/dev/dri/renderD%d", &dri_index) == 1) {
+                        return dri_index;
+                }
+                /* Try card path as well */
+                if (sscanf(target, "/dev/dri/card%d", &dri_index) == 1) {
+                        return dri_index;
+                }
+        }
+
+        return 0; /* Default to 0 */
+}
+
+bool is_apu(const struct amdgpu_gpu_info *info)
+{
+    return !!(info && (info->ids_flags & AMDGPU_IDS_FLAGS_FUSION));
+}
+
+/**
+ * Get IP block name string
+ */
+const char *cmd_get_ip_name(enum amd_ip_block_type ip_type)
+{
+    switch (ip_type) {
+	case AMD_IP_GFX:
+	return "GFX";
+	case AMD_IP_COMPUTE:
+	return "Compute";
+	case AMD_IP_DMA:
+	return "DMA";
+	case AMD_IP_UVD:
+	return "UVD";
+	case AMD_IP_VCE:
+	return "VCE";
+	case AMD_IP_UVD_ENC:
+	return "UVD_ENC";
+	case AMD_IP_VCN_DEC:
+	return "VCN_DEC";
+	case AMD_IP_VCN_ENC:
+	return "VCN_ENC";
+	case AMD_IP_VCN_JPEG:
+	return "VCN_JPEG";
+	case AMD_IP_VPE:
+	return "VPE";
+	default:
+	return "Unknown";
+    }
+}
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index c319ded6e..c591d21c1 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -21,6 +21,10 @@
 #include "amd_registers.h"
 #include "amd_family.h"
 
+#ifndef MIN
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+#endif
+
 #define MAX_CARDS_SUPPORTED 4
 
 /* reset mask */
@@ -431,6 +435,18 @@ is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci
 int
 find_dri_id_by_pci(const struct pci_addr *pci);
 
+int
+get_dri_index_from_device(amdgpu_device_handle device);
+/**
+ * is_apu - Check if the GPU is an APU (accelerated processing unit)
+ * @info: Pointer to amdgpu_gpu_info structure containing device info
+ *
+ * Returns true if the device is an APU, false otherwise.
+ */
+bool is_apu(const struct amdgpu_gpu_info *info);
+
+const char *cmd_get_ip_name(enum amd_ip_block_type ip_type);
+
 int
 amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
 			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index 63cea1a5d..e7326b0f8 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -50,6 +50,7 @@
 #define FAMILY_IS_GFX1037(f) FAMILY_IS(f, GFX1037)
 #define FAMILY_IS_GFX1100(f) FAMILY_IS(f, GFX1100)
 #define FAMILY_IS_GFX1150(f) FAMILY_IS(f, GFX1150)
+#define FAMILY_IS_GFX1200(f) FAMILY_IS(f, GFX1200)
 
 #define AMDGPU_UNKNOWN          0xFF
 
-- 
2.49.0

