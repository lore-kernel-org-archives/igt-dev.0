Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA67D1266D
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358610E7CA;
	Wed,  3 Dec 2025 09:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Uwy43Awx";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58FF10E7CA
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baAg3Ebm+kAZ66pPilVIDg0KvfQxlBUCfw3QSkjteJmWdap9NVs9o+1KAsZuDIOI+yb33RK7kAL/IC95SEiI8605Wz4FaRpwi96FZxrvV2dy/rFNlTrdO4ReQAaw2O2kaIZNepOCiOMbjmepVN/GKUNFMaLD7IaeRPNI8BDZd4HWiBEdBFhByMfSSVbhMRc8YX8ybEvQqM+EusLLFBD9Jot3fhuezier96Ing0Y2zMrMaRjWAfba2vDpOSzWVnpj60JqUk6KgpGZ4v3Lz1GK4oEGGoBL2CWrtP1oS0S527J9Ml7yor3KPbkcZfWqB0vHI2Q70078VJK5LlZI1zTwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3q2pDUACGh3xWosrNVbvNa6jEmWPlof2aICsGIuTpA=;
 b=iSkMPuZJoKJqPTR72lxd6N+fIEPFcASJJ6IhOmcs59R0TjYCoauuyReoVjDWPq3JivL+ss4HzT7VNFQ/graK4IGHMuhFbCKUVPEFH8BJOqsZawVy1wlvskb3KUn214OQg5P8zjDHclzky75O0z5y3QWBlbbNZb2i4miBWsBVue1OTJW4fIEbGOfmWypNqbBNJKTBy4p6rMUXkYyssgClAa5QUrBJR8Ug85eA9Y0BtpaYGL+GTNGUS7WcGuRVhnXrfyE0SKwLOHisuGc/3T6zaLG4FoC9Zns6WAkMpnE3wJIIRfk3EYb3P3ZWD7Qde5ngBwAf6hvX3VAS9SCWiQLcWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3q2pDUACGh3xWosrNVbvNa6jEmWPlof2aICsGIuTpA=;
 b=Uwy43AwxPFZH+M4JL0DYDhAOryyzJsoDFdhUzTJpfmVtFFLppTR7CNqQKzryyX/i86O8+ROOYqamdLjuoBbATbnNV9EnQFwtAxbuxw5+ThlEYM16T7nrZNACsE4Y5Z3nbMWyp8qvXErUG7OOM0wlOCKSDN9v7AMepAb/R3lo+xI=
Received: from CH0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:610:11a::16)
 by LV8PR12MB9360.namprd12.prod.outlook.com (2603:10b6:408:205::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:03:42 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::a2) by CH0PR03CA0342.outlook.office365.com
 (2603:10b6:610:11a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 09:03:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 09:03:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 03:03:41 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 3 Dec 2025 01:03:34 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v4 4/6] lib/amdgpu: add utility functions and GFX1200
 family macro
Date: Wed, 3 Dec 2025 17:02:07 +0800
Message-ID: <20251203090307.467031-4-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251203090307.467031-1-Jesse.Zhang@amd.com>
References: <20251203090307.467031-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|LV8PR12MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f52fad-6192-45c0-4e49-08de324adb55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TiK6EKIiaDKzdG5to+VdnKv8Choj4IiIGkZ3uS4QEmkUGZVq5SatljKQIVBN?=
 =?us-ascii?Q?9tQ1BdfquYRwiWT/6qtZlebKIKkEhI80kkHUF3grcY+rpGRfKKSK29FhzwRU?=
 =?us-ascii?Q?TP5fMs724AcGunjVD4mhTzXh0SWH0I/Ub6ngs/OYjqaKFg6SbHsxlnIfxc/J?=
 =?us-ascii?Q?E3KnktYI67pUgtm71UvPJ+W6K5BmRCmE8DJ7CP1Lby69mRpwILyAY50Gf7uI?=
 =?us-ascii?Q?9XOYPLSsZ85WyLnEOKhZo1xkL6cO5eVDDkbaHsgyPYi0ZGBP+KJA7tUqOlFG?=
 =?us-ascii?Q?kC9a3VRBUkJzaE/X/7icoi+nt9jCg/XN7mMUxGkDRCDCFswhVAE6jY8cN9du?=
 =?us-ascii?Q?NcNFWuUUVNEcf1aJ0DakCwh1o0V2iankjuzEgMsUrcBqXm5r4x2AjZoN2N1V?=
 =?us-ascii?Q?NqJ+8d6yaoidTDaygx/T86y6XLGMsSASP/gVNpiJu/rQKCEXJw+KWNfU3H3E?=
 =?us-ascii?Q?kT+uoauW1euUF4mzeJEX56260PcHkKAaGHbnxPMOeHfNpR7VKiOE5ghvNJcD?=
 =?us-ascii?Q?eJ6E0fhA234xmLgkl+tky2dhPLz8eqjb6zLNDb3lDzvZopl6AU3ujU2DnTFY?=
 =?us-ascii?Q?Y5N/61O8Z4UbcFZpdkOKj831sgNMUBrReZsd3PNLJ5HgycjvLFqZbBBOExdG?=
 =?us-ascii?Q?D/kpV7vo3a1pdka6/f4waZI/lc2YQABWZsTNofsejyx9zm79lHwDMqPi7lk+?=
 =?us-ascii?Q?x5xwoZ4ZRBmQj7jPaxMvXeivEsTYxQrUUbB33Op6yX+NC3lcfnoME+roPsln?=
 =?us-ascii?Q?KEJI+HcwRtNHnMlhC9ID0J8dlbdFeaJ/T7erpwzONcjvtBfxVuvd4MKPQavM?=
 =?us-ascii?Q?HKAVSD/M2tKaAe58nxOWo+nuWIufBQ5y9PR0JnGKg3G1wIMgmn3vQ20qBPlW?=
 =?us-ascii?Q?nVwkx1HCGQ1C50YyNq1h1cB6ovP6hl8wrt15qidVk8Q0NqD2CuHjjgJLt/T0?=
 =?us-ascii?Q?9TE7EoKdjtL+33T0qNeVPj/UQU61wvPaD5398heBhHrSj1NLOyhkDC3rh4rL?=
 =?us-ascii?Q?xkjUz6VOMt1Y1vfGL/6HpVpKqrjgCkPUlXVe72uqtWZeq82rSR6rqEXrEpif?=
 =?us-ascii?Q?6etOjJBwSu/XCmfwkmVXXuhw0UT4EMf9iMd6Jk5V20wVK/mqs41QArZ3JRsc?=
 =?us-ascii?Q?XkJdmnb9edMyITbWnzEZ/8FRZk0rD7QUvUZq1rCVbcqilhTnf5YNQZh0Zh+1?=
 =?us-ascii?Q?wogumNXsJYk4cug2tGuuXLoVBLJJCQxLztW7SlKkJv7A1rrnMfNW4CF8oMGK?=
 =?us-ascii?Q?BxYfWOTYlOo24A/fQsQxSVP2DgL22M7s7zLLPd0vEKVT+unkfBuJvnF0/aWc?=
 =?us-ascii?Q?RBGfjt0WhEQY2mOycO+HQZ8pVQnjUI1eBNjZvQXX+d4Ssa1MRdtbVNMO5BjP?=
 =?us-ascii?Q?tAg/AV/5REyFphYbf6myupc29XUQ3d8OiT+uIb5e97PNQJBUmuT+QYp2JHvH?=
 =?us-ascii?Q?J+G6StUok1bCjH8oJvOTA2yTcFeAi4BfDHUn0nuQubjAbGJadSlHhFjqlufJ?=
 =?us-ascii?Q?B0iV+xbT2I2+6HZoy0keJZV/Yknk8DE8XucwGQ3hA4vNkgTGBE0FGo/eq/J2?=
 =?us-ascii?Q?d7Zx6JOpbfT0Tj8DFxo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:03:42.1431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f52fad-6192-45c0-4e49-08de324adb55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9360
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
index b44c29819..6ce207fb2 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1767,3 +1767,67 @@ bool is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr
 	/* Return true if files matching the pattern were found, otherwise return false */
 	return (ret == 0 && glob_result.gl_pathc > 0);
 }
+
+int get_dri_index_from_device(amdgpu_device_handle device)
+{
+	/* For AMDGPU, the DRI index is typically available through the render node */
+	/* We can use the device fd to determine the appropriate debugfs path */
+	char path[64];
+	char target[1024];
+	ssize_t len;
+	int dri_index = 0;
+
+	/* Try to read the symlink from /proc/self/fd */
+	snprintf(path, sizeof(path), "/proc/self/fd/%d", amdgpu_device_get_fd(device));
+
+	len = readlink(path, target, sizeof(target) - 1);
+	if (len != -1) {
+		target[len] = '\0';
+		/* Extract DRI index from path like /dev/dri/renderD128 */
+		if (sscanf(target, "/dev/dri/renderD%d", &dri_index) == 1) {
+			return dri_index;
+		}
+		/* Try card path as well */
+		if (sscanf(target, "/dev/dri/card%d", &dri_index) == 1) {
+			return dri_index;
+		}
+	}
+
+	return 0;
+}
+
+bool is_apu(const struct amdgpu_gpu_info *info)
+{
+	return !!(info && (info->ids_flags & AMDGPU_IDS_FLAGS_FUSION));
+}
+
+/**
+ * Get IP block name string
+ */
+const char *cmd_get_ip_name(enum amd_ip_block_type ip_type)
+{
+	switch (ip_type) {
+	case AMD_IP_GFX:
+		return "GFX";
+	case AMD_IP_COMPUTE:
+		return "Compute";
+	case AMD_IP_DMA:
+		return "DMA";
+	case AMD_IP_UVD:
+		return "UVD";
+	case AMD_IP_VCE:
+		return "VCE";
+	case AMD_IP_UVD_ENC:
+		return "UVD_ENC";
+	case AMD_IP_VCN_DEC:
+		return "VCN_DEC";
+	case AMD_IP_VCN_ENC:
+		return "VCN_ENC";
+	case AMD_IP_VCN_JPEG:
+		return "VCN_JPEG";
+	case AMD_IP_VPE:
+		return "VPE";
+	default:
+		return "Unknown";
+	}
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

