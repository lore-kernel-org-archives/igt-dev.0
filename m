Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CCBD116F3
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 02:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D302110E03F;
	Tue,  2 Dec 2025 02:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w4uP6fJG";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012039.outbound.protection.outlook.com
 [40.93.195.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5084310E03F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 02:18:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHGK/oTqzT3Uz9gONLraEGFjUabLOpXFxxDPFOukhi0BuHCME8Iy1WLPPuCU6cH/BWFo9dkOZpPMo0oTnhDcmaFSKLkgIQiRayagxRCKWfEwmLOoi7CSDigHiKIc8RD+6CNOPX+HfhxxXkTE/1ZO5j9pUPS/xA2qecnGaJIVWWNVEcqBhddMmd4Knnznna4tO2IXt8P5SQUygHopIZAZsqVYdP0f4wHDnx3osPfDxFZCJk6bzz+ygXArll7Q0wL72JED4nIFy50bAIWfAupE4KyT7z5JASLW+53qCZyd4yFhmBmkqtRVNBntXBiIBLqKc8emhE5QpDiqlzhMQ9gn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXx4DqYlISD9jPipTWRR8clHUmVUG6hEAhdZqlZdBgg=;
 b=SOdW3llt9CBoddQnJ4/OjH0rZOBgzOfBpr6Nr79vUg2BOH1QBijLRsSMyYER7e3UDU9jxf+/27Ks3KhDefKYM9X081zAmgxBzRHGE7cZMbYlefb3s067BeqSZRq8pZDIBs6NxoQ3I1zDcjhpxaF8hSdOvQ2Dfr7DVQhRjs5JzLd+sV/smXBEEk5eiuT5nka0zAXHEGcmlgy68EonY1u2cxqneummb0gjUCIHLfme+yGICP4rGY+lhM8UA5T8p+hBKtKvcyDTQ/lTJ9fqEzC8rR/SyY8DX/i7Od/ABxFILzm/2DrUJIxSWzz8/EANfWV7peAl0TvvAszWly7/7dOCDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXx4DqYlISD9jPipTWRR8clHUmVUG6hEAhdZqlZdBgg=;
 b=w4uP6fJGuOK9VVod4AerUVTmPjfrnJ6kdW8f1uFD7PFo2OkdLDmjKOpJx09yCxte4avU90WLscB38mH0ayySTUuCoQ4LKNI11B5Ey5or7cg9hqdaqbb5ZLZEZ3yO9rVSDlj/oEVto2bN6p4qHsKub+S6XteXSsYySyPjIyNoMBU=
Received: from BL0PR02CA0050.namprd02.prod.outlook.com (2603:10b6:207:3d::27)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:18:27 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com (2603:10b6:207:3d::4)
 by BL0PR02CA0050.outlook.office365.com (2603:10b6:207:3d::27) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17
 via Frontend Transport; Tue, 2 Dec 2025 02:18:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 02:18:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 20:18:25 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 1 Dec 2025 18:18:18 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v3 4/6] lib/amdgpu: add utility functions and GFX1200
 family macro
Date: Tue, 2 Dec 2025 10:17:27 +0800
Message-ID: <20251202021751.3824352-4-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251202021751.3824352-1-Jesse.Zhang@amd.com>
References: <20251202021751.3824352-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e99acf-a9e8-41f1-d69b-08de31491432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PabCjju9ulDhAd6/ZfD5BrxIojZAHZvxPhdEs/Qv8cdA+VotdKEEa5q/MPVu?=
 =?us-ascii?Q?jw1bD5Nedf2xZzHMaHuiLWscuvc2vYpb3H7pAYlbM/8Z/4FR9kpDoyKuVeJn?=
 =?us-ascii?Q?9DwglUkPan1A5+TLlWhhmEILItjZ+T7QGnFj6k4ZLOYgpOne3AheSPAH16B5?=
 =?us-ascii?Q?FyXOLyzyjhriBzDjua1PPPmScqCOraSTRTRimon3CRwlKaYHZ0EIgytub+LI?=
 =?us-ascii?Q?roqTZfFR5JJRST5NKdUuBD5BdGP/ZkMZEJCjUMz80kjJvOx92gcbBpK8tqOG?=
 =?us-ascii?Q?bSf1schDzRmU2X3AFZqW2BTQOAe3foueSp+qa+S0lC/XQ9LEqrRzs1xTalnG?=
 =?us-ascii?Q?HyCUA8QjHhdR7owJUUEqLcrm28ch/RHqJHsteKmEqLqHNI+U6DXZnP7lL4el?=
 =?us-ascii?Q?8EfurHQ2EoCS6asNHewnyR+MX4DYg5h8JcNmp7gJvj3ul2gz2kAPgLyY7JlJ?=
 =?us-ascii?Q?EjawivT4QRlwxiQiTcNJAC2YyZv3mlTgRKVuFPqspzNSeXwZ6KHBpB3re1ym?=
 =?us-ascii?Q?rhiruhwXF/ZQPmEfKR0sWc9mgZM60xBL7Q1vdH8uWLH6CFlGbnAcqXgjZVuc?=
 =?us-ascii?Q?lSRFinBHBMJMhmpqKQ6A+bSdp9sHHlnxLaHxfoS+lszzQPY040pESWJDBF9i?=
 =?us-ascii?Q?pVnKiwSmRFoEp+WarGY9LOmjj+n25ZT5+YIZeXHim7oZuPbXXEDioQDnHyWa?=
 =?us-ascii?Q?mYNCjZzq9PHMFpR6RXZmupiPDPpSLmfQ3bAIhibraR8uvjf0B5+xl+BAqTMn?=
 =?us-ascii?Q?XjCTj3HSVD1cdD6KE+t2WJzUfJ1EZNST/X0/osSvxNYjodpAPQkNRHuAGT4O?=
 =?us-ascii?Q?VKq9EQZjxkJ0NCSFcFVSyAzO4Bvi22O7yXo+gyD3DxPpK5/7vWopsNVaVF1M?=
 =?us-ascii?Q?A575bHDOg2rsc+ZYngxNNHSnqooltkqHZJ9tkbHVMcXLVWgfmnDbwo+Ew1vw?=
 =?us-ascii?Q?BTl+e3UCPUd04LGZUYnfr84GtuyzhWhjBLakWFrqWZI0ap56Fj9Hl+nij5WA?=
 =?us-ascii?Q?uZDqtRJKiuoIMUd6U4ACRNneDpzs5d4aGDLSMpch5d4LSp5CQu2vDOXHmLYg?=
 =?us-ascii?Q?uW34Dtt/zwEwkMyykaYkTfBqpP2ZgCoK2vWO/PLQ8BU3x9O+Ft8WXK1PTJaP?=
 =?us-ascii?Q?NwIY2h+s/tBGNcS6nK8NLAR4EYEKdqQRSCgHNOwuKIJkajQ8/oBZ1JmTJvTT?=
 =?us-ascii?Q?Pz71oUkiK72G2SUWcnfXJhWsvIcQfj0wcDT+mb8PiqbUmmhswEAdbnWao0Zj?=
 =?us-ascii?Q?cTw5mg8LGWEosUgefhSJTXeCkVQB/6FmhRT2ELEeu3Lc/aC6IUOolnkutAOw?=
 =?us-ascii?Q?e4mg9YB3GP4e4xx21ojLdbiDl5nXGd94z/dwYJBHado+e5bZX+8qZp20RUOF?=
 =?us-ascii?Q?NasyXI7PkYNUDr22t9WVlLDn0ekdRV+JuKniV41CoNP4Hk18ea+/okJEfDKm?=
 =?us-ascii?Q?iRdocHaaeMmgv8mWA4M9mJ3JpoEI8RKnXbFW22jU9ENd+bPa8ae8ayCDj1Oe?=
 =?us-ascii?Q?5NOBNYjprrlIh/KvxKmTpnrFs4YTbCABPVKnM6js7TktAfNWOHEtTvsuh76Z?=
 =?us-ascii?Q?SmZI4jlYst884icwxGw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:18:27.3988 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e99acf-a9e8-41f1-d69b-08de31491432
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874
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

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
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

