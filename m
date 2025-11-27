Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D52CD116E3
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 01:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2E810E6FF;
	Thu, 27 Nov 2025 01:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BYt87N5Q";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCBF10E6FF
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 01:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNhnX9YzRSmitPlSIx516OKul9aMtGc0fi+g1anki3aoPeAJJd3503lZDssmKbhon+TkQvmnVP2HGgbBAszw4bavOEUjBZnKi13hO24vk+PinPrG171zRr48nlTCl7YUPgfuog3NAUOcKVo26GJdxvvFYopAzma7ooBgioQwK/FzMo7OoNoN6jq0y7jI49DVO0iRyvqV6IpionDTKffb2omFMGa4szgr9cGdMUqskd14FEUIR6BkMHIvApoksCm2tPrPZVEFnD975L9noVoZNahWrJz6yB08dknTF77nTU/2KBk4GC8oB8i1Wj2I9+LqlQkcunLA1tVX2s/bwb/mdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBR9sNQ8urVZzDy1lyhfge/2EKTDtLXUYLRBaEOjLxc=;
 b=T7lhDn0Gfrk/oy4yMyuTC7gdFjDg4vY3CsBx2hiEgxha6N2I8zkUJ0DFq/0uVAUVX4gwiAsHkrbu5bTrOzHzHgcOkZhVNtoKlHCUFkv8FdJ0PJwTaEWaQq5SP1B5PvZkrn1o9qVAe86OvQJpVE0oU8uOoLQDCPnyVqiaCYt1i4HlUDzLG8j7zw58M6jwqYqaL1FPZhhNTd7rzaaIcMRAgg8rvpnu0mxO2IuUQsJKfswTfGhMY5+dZJNxHy9+Vd6pYAuS/FyTn9Ze/OplLvNRj/mGqZNL0KQS98DOOlAPcSDhlTH7Szrjpu0/C9dgsPM17zZkY/Lr2IgyPKzctmNKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBR9sNQ8urVZzDy1lyhfge/2EKTDtLXUYLRBaEOjLxc=;
 b=BYt87N5QZ0s0QsEwwIskJi8mFm/RHit5tm4Q9VRXR57Lm0RLxqn1SwUKDuAxtl98hQ3Nk8v2PXlJFgjUnjlIa1+OEuTZbFD/oiS8xmCkrmHwB4vPe0S0igABHBxTtCFxTw4/4iAKeAwU7C77qZMt8g7zxD+U06IyuvYqg5t8CSo=
Received: from BYAPR08CA0064.namprd08.prod.outlook.com (2603:10b6:a03:117::41)
 by CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 01:12:54 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:117:cafe::e4) by BYAPR08CA0064.outlook.office365.com
 (2603:10b6:a03:117::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Thu,
 27 Nov 2025 01:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 01:12:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 19:12:52 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 26 Nov 2025 17:12:46 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 4/6] lib/amdgpu: add utility functions and GFX1200
 family macro
Date: Thu, 27 Nov 2025 09:11:25 +0800
Message-ID: <20251127011219.3119242-4-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251127011219.3119242-1-Jesse.Zhang@amd.com>
References: <20251127011219.3119242-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb85bc1-154c-4fdb-7775-08de2d521756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c9bK6v3zKdXri0yAGOPhTUI2Gx3sse//Qls9cSX/kUnxAM634sM+kVb8vcMV?=
 =?us-ascii?Q?IOwUpDDFZjnChcbFfa3jrhpLDjh5T43+eraFWPoKAs9Dm+45f1AapsHLbgxD?=
 =?us-ascii?Q?NQeQ+S5uHPwMLL7OXdoMEQDCaN3X2PJV9PyF+3o3O4SAQkDeuBdAWq6UI23c?=
 =?us-ascii?Q?hf4kKVvUOWkfG8adcN9YihrygZOw76vkxfbkokOqQvatvQEAVkL5+DH2Ipka?=
 =?us-ascii?Q?Y7pVXFKTES1REWvl5EngNgTXPvunFjuk9njCnXn2C+QdpV+ejFtQHZ3WKe7g?=
 =?us-ascii?Q?7ShG2cWlYTSfPACF1lEQ2jmrda8Cws1mHyZgCRThy1wS/uOg+zhEGVfSE3ye?=
 =?us-ascii?Q?7phIbmbzHF+3pBg+cYbM5GhuP7GLi+ulLfSBEGMLwPsjUJjpljeaLFw7RE1H?=
 =?us-ascii?Q?cqmpOJvBmYbFogN/BMZQ341wii2ODD/zN/vs/t4EFMo+ltAZhqrZxf26AUEk?=
 =?us-ascii?Q?w/P7Kir61s+BuyDKR3ujZTsskttqhX0EfmUzbO124oew3MsJtja99JQsD5lc?=
 =?us-ascii?Q?ch0GxwTMYlt7/v2fnL6oscgNP4p+FrKHuvn0MzTISsWVGi8w7/M3PT4hwkPB?=
 =?us-ascii?Q?roPc0DgZuTaOE240cFmh6jsusgrcmMGDMmpChqhql1o1Ms2sF9VcfJsC8SQ7?=
 =?us-ascii?Q?C4EM1XSAXg3IxkI2YGO6UhyslKMsCkU8zNDTU/SjtRl9yHtXQsSKtTcyWAxl?=
 =?us-ascii?Q?PCrVI/ayBJUngQS51PDkI4f6RcsNM4EGZiS6oxJeUO4Ehe0xbH8+fZDdqrUh?=
 =?us-ascii?Q?NQ36ZqPFP9+VcRF5CwBJEur2phZTXKP634ncIv3nqiXY0w/eX2Dx4oYLAvkD?=
 =?us-ascii?Q?1dgviW7LA5QD/k4rnkLw8SeT/4cEsF4FqVhhk6DdYOmPKnOuTL6dfoxWRKBM?=
 =?us-ascii?Q?U5GbSSU8XNCZlEpMLUyVNqzsZJaP8XmBMoP0JRpQWjwdNMYXOI+7S/ts8ezv?=
 =?us-ascii?Q?6eOKNovdj1tO7a15dhWulTw/xRddEjAV/h8N/1w3NVDQzLVsnnGL5sIe3SzH?=
 =?us-ascii?Q?0zPurQZlfih/Ly8DmM9ZK/hY1PFtMkNWUi/W4Esz2bFRz9WU4+U1tUaO7+EV?=
 =?us-ascii?Q?GtWf8c9jK12KKvNP1l+s1m4scivTEWuTqBGWRQ9YSNF2+2jjvLhvchq2DuUh?=
 =?us-ascii?Q?zBStFnj2wpZ4RDxVtBD5GxLwiVznwkEFMq31LCJntXD+CzwSy0I0dyDW4Z3O?=
 =?us-ascii?Q?W/kK+V+sJii1yeFkkMOfz17LSv//XAE+tf+Ckchg425xiGRv9qa6pan4PrXv?=
 =?us-ascii?Q?WrXGKZxmHDBME5jFlUIe8z4Lg9qod3O+VdHOqGnf2/a1Fv98eXa/JuxdqGWV?=
 =?us-ascii?Q?VJUHg+Q3OBTTdE8/ccgxxwUB5XHNY78zajX/bOrWqtWJTS31rdbpu+vuNyTZ?=
 =?us-ascii?Q?T8VNNx/4zEasEVGD3OCtKvgJfcCxD7LE9H5379UgMoRMg51u+1lwnUxbxEQf?=
 =?us-ascii?Q?QVxUsLwm+eWzcvt02UCzchJMR20m1HVwGskBCOLrm4b6vHFlXodgnrBM5pVj?=
 =?us-ascii?Q?3d/+MsX5yy6u69lIvlNO/nvuN5zpFuZV//RxMR7BcFBKFx9xPfAyhU1mq09z?=
 =?us-ascii?Q?OXY4NrkaHpQvlxrWxIE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 01:12:53.4469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb85bc1-154c-4fdb-7775-08de2d521756
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429
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

