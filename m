Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A09CC43602
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 23:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0886710EB13;
	Mon,  6 Jul 2026 23:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OaXdUF14";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203F510E28C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 23:51:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhDdj0ug63MS0tix/t6greaz6eRskcL4x41950mUM93t+iVN5wRthy624tWUIeU5yBF2pWOmy82CHaAJEK0cxwEmiKU6RO8WuxWRuuED8ZnKPn1Cet4vB5Ue6omnNrojgHHvxnrVXRhNPGbXTdbvgKExCiWD3zIwZusOLDkt7Um7P60nmLkIiumADjV7JzxuRln4x2RFiL5YDvggusBQ+QhA+B7D5G74R+BJPsqsQjN2JIOcuok5sLI5RsdQ0FaeiiHUvxiBlNO8e2VNyEQg5kz9jdwgUutGSQDE7Lv2LQQNRhI8s+YZwsVUvWuL8ju0RbsOKv3urqAzAG/L1wcViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ365BP3EtZR+XYYZ9ZFafuFOg4xJFbcknEhMQnvXVA=;
 b=SYDeHRXV0O7SsfoZ4cnJJvb+ZGs+LosIG09p4PWmVS5EC7av9XPdBwfFagpcfSEESoR65pDuq73maNK6djk/fqiDbdAA/05SZ7PYcW0LRDFI2NyFU9gRrcdssdVVt3TACDoONYUhhZeOjDbUR17xzVpV4BApocfFGECHjuBlJUlVuXMDBIMSuolQzxki/uqARhSjjfQLe+xUtxhfvxwJOb52gMRD92BoxyZUTJ4msKMfUw2it7C1eq7lR21qmI0aPLoqwsxPiJeTrgU98FvwG2c79xYnvCFRyC2LptytlCs6/hDNJA8d4Dg7wAwqN9ajsLReqnZFT7AFBQSlGJCsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ365BP3EtZR+XYYZ9ZFafuFOg4xJFbcknEhMQnvXVA=;
 b=OaXdUF14ZeoY4UptLJypoxnPJYjxFj8bnEGV8hmqoYnKrDPeLYyE0W7EnZDZpm0iy45wfNGbIOT7X9v5X6YQHurPxLffnjGE0hPDvNcXi1dPaCd1t3fCZmiIB2CgfsKRWVvYt+FPUQBj/NQ024ESozuH+91sZ6jPGj6xRZDpwEg=
Received: from BN0PR08CA0009.namprd08.prod.outlook.com (2603:10b6:408:142::13)
 by BN7PPF915F74166.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 23:51:35 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::30) by BN0PR08CA0009.outlook.office365.com
 (2603:10b6:408:142::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 23:51:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 23:51:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:34 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 6 Jul 2026 18:51:33 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/6] lib/amdgpu: Add AMD platform filtering backend
Date: Mon, 6 Jul 2026 19:50:14 -0400
Message-ID: <20260706235130.157557-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706235130.157557-1-vitaly.prosyak@amd.com>
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|BN7PPF915F74166:EE_
X-MS-Office365-Filtering-Correlation-Id: 69159b86-5bf7-4e1c-4efc-08dedbb982de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: dFIKZ1sShRkKIXyNF6AvCegP4IjdhFijtIzlwM/RxY1Ctd3WhlXoH7334s5AhI77YbFvpjOsY8J6BE1va/JFA3M0SlE3QBc/97H2QKAKIxPbgEhfuyLCGOs3whw3Z1Qao1FcwTsLiaFqspVk3kATre8S2gETbjJPlRDAJVMF/vupex/Npjh98UGkcDxSIzBR04GDv0F4qV53LJ/53MdIV2CbB/HNFeZ9YPv4zuJut9jyPf/5/zN2aeXdQzBi8VHkkwtKd6lpZFOOloh1jmYmk3m2mDWwl+XtI3ooVgUv9MJrKEMdUf/a2QCHnFkf4/D3cYfFD0tm62ZkbVnUtlcSyuqTaKsS26fABrj26B3SkApn1+UrLLd45pyOduMmbycpX5c3ffV8lNE5IXhPuscaSCubXv3c7OKiiQ0rDYDvvon3z2j0RCN6C5lMCStTbWBIDwbPTRmEpTthjpselq43W6gf2ucVNAjtS5+pIUAaOlRpc9JYGVTtLq8PgHEvgpRvMj7mfMeoa9GeO1o9XCvCdYyeoP5aeIXazEeNTZdGFozsaD04lhs3P0CbRsLtE7CiH/jrWcRlGq0O0f4mXzE8/lYF6CjyVuZsZE6kH5tAKiFJqxhHDoBPzA3lKkB4SegxjMj11OcVwkGOAoNHEjhmomgBDaXv97SlmQ8kT221H9xVu0KPxmt5CO1Ck1gPJnAJuJ97OBR5E1FI5H6RP5oDwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CGojzjfJcEAQ3hgpO9/YE3hcNK/O5avvQ0I1dpBAODEIHsG0ybDziBfqZxMyCPqKp+Il5CL0KEc8hAV+g/vaLal45/YD+u2y2DpBdSiZX/yKp74zUQgT0Tt18QKZCOM0B+LJe/oW5RlUiWzbTfmlaToejMvwMugaSNZP/DLNMboVrFr+gefxUi8ZcgKYf0VrnU0tydKGDEcfZama9X8Rwxwfgj7AkryM1iVfF9x3HyfZjl6OkeEGe4O6GVE5mwNa8/Yhd3nWBo1DihECv/OhG0jUh0UXWwWCX1gfet/Mc797OjajgjQPjKWFJsWusXO7Uwvtm3SudZBgSl2TlPF57cSDKMJQp7NaCW3c0BXW2f58Mb1l5MFbisUS87PBJRsqXyW9BVDU8Yg1DhUYF14QlnZYK7m+9wSSEk+NDxjJaDC5xSChPOEfaHOnndjE3+Vc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 23:51:34.3817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69159b86-5bf7-4e1c-4efc-08dedbb982de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166
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

Implement the AMD-specific backend for the generic platform filtering
framework, providing:

- ASIC identification via amdgpu family_id and chip_rev ranges
- ASIC name table mapping (navi10, navi48, arcturus, etc.)
- AMD-specific built-in skip rules
- amd_platform_filter_init() convenience function for AMD tests

This is a pluggable backend accessed through platform_filter_ops
callbacks. The core framework has zero AMD-specific knowledge.

To add support for another vendor (e.g., Intel):
1. Create lib/i915/intel_platform.c/h
2. Implement platform_filter_ops callbacks
3. Define Intel platform data (platform_id, stepping ranges)
4. Call intel_platform_filter_init() from Intel tests

Usage in AMD tests:
    amd_platform_filter_init(&gpu_info);
    igt_platform_require(igt_test_name(), my-subtest);

Example skip via environment variable:
    export IGT_PLATFORM_SKIP_CONFIG=navi48:amd_basic:*-UMQ:unstable

v3 changes:
 - This is now patch 2/6 (was 3/7 in v2) due to squashing of patches 1+2
   per Kamil Konieczny's review feedback
 - No code changes from v2

v2: Address review feedback from Kamil Konieczny:
    - Fixed compilation error: removed extra */ on line 9
    - Added missing #include <stddef.h> to fix size_t errors
    - Added kernel-doc to amd_platform_filter_init()
    - Verified bisect-safety

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
Change-Id: I578444cd7b3b4d821cf1f3502cd61ea4cae946e3
---
 lib/amdgpu/amd_platform.c | 328 ++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_platform.h |  53 ++++++
 lib/meson.build           |   1 +
 3 files changed, 382 insertions(+)
 create mode 100644 lib/amdgpu/amd_platform.c
 create mode 100644 lib/amdgpu/amd_platform.h

diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
new file mode 100644
index 000000000..1c6a72a49
--- /dev/null
+++ b/lib/amdgpu/amd_platform.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2026 Advanced Micro Devices, Inc.
+/*
+ * AMD-specific platform filtering backend
+ *
+ * Implements platform_filter_ops callbacks for AMD GPUs, providing
+ * platform identification and matching logic based on ASIC family/chip.
+ */
+
+#include <stddef.h>
+#include <stdlib.h>
+#include <string.h>
+#include <strings.h>
+
+#include "igt.h"
+#include "igt_platform_filter.h"
+#include "amd_platform.h"
+#include "amdgpu_asic_addr.h"
+
+/**
+ * AMD platform data structures
+ *
+ * These structures define how AMD ASICs are matched for filtering.
+ * They use family/chip ranges similar to amd_queue_reset.c
+ */
+
+/* Maximum ASIC family ranges per skip entry */
+#define MAX_ASIC_RANGES 4
+
+/**
+ * struct amd_asic_range - ASIC family range for matching
+ *
+ * Similar to struct used in amd_queue_reset.c for defining ASIC ranges.
+ * Uses definitions from amdgpu_asic_addr.h
+ */
+struct amd_asic_range {
+	int family_id;      /* FAMILY_NV, FAMILY_GFX1200, etc. */
+	int chip_id_min;    /* Min chip revision */
+	int chip_id_max;    /* Max chip revision */
+};
+
+/**
+ * struct amd_platform_data - AMD platform matching data
+ *
+ * This is stored in platform_skip_entry->platform_data field.
+ * Contains array of ASIC ranges to match against.
+ */
+struct amd_platform_data {
+	struct amd_asic_range ranges[MAX_ASIC_RANGES];
+	int num_ranges;
+};
+
+/* ASIC name to family/chip mapping table */
+struct asic_info {
+	const char *name;
+	int family_id;
+	int chip_id_min;
+	int chip_id_max;
+};
+
+static const struct asic_info asic_table[] = {
+	/* GFX12 - using ranges from amdgpu_asic_addr.h */
+	{ "navi48", FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
+	{ "navi44", FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
+
+	/* GFX11.5 */
+	{ "gfx1150", FAMILY_GFX1150, AMDGPU_GFX1150_RANGE },
+	{ "gfx1151", FAMILY_GFX1150, AMDGPU_GFX1151_RANGE },
+	{ "gfx1152", FAMILY_GFX1150, AMDGPU_GFX1152_RANGE },
+	{ "gfx1153", FAMILY_GFX1150, AMDGPU_GFX1153_RANGE },
+
+	/* GFX11 */
+	{ "gfx1100", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
+	{ "gfx1101", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
+	{ "gfx1102", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
+	{ "gfx1103_r1", FAMILY_GFX1103, AMDGPU_GFX1103_R1_RANGE },
+	{ "gfx1103_r2", FAMILY_GFX1103, AMDGPU_GFX1103_R2_RANGE },
+	{ "navi31", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
+	{ "navi32", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
+	{ "navi33", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
+
+	/* GFX10.3 */
+	{ "sienna_cichlid", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
+	{ "navy_flounder", FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
+	{ "dimgrey_cavefish", FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
+	{ "beige_goby", FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
+	{ "yellow_carp", FAMILY_YC, AMDGPU_YELLOW_CARP_RANGE },
+	{ "vangogh", FAMILY_VGH, AMDGPU_VANGOGH_RANGE },
+
+	/* GFX10 */
+	{ "navi10", FAMILY_NV, AMDGPU_NAVI10_RANGE },
+	{ "navi12", FAMILY_NV, AMDGPU_NAVI12_RANGE },
+	{ "navi14", FAMILY_NV, AMDGPU_NAVI14_RANGE },
+	{ "navi21", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
+	{ "navi22", FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
+	{ "navi23", FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
+	{ "navi24", FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
+
+	/* CDNA */
+	{ "arcturus", FAMILY_AI, AMDGPU_ARCTURUS_RANGE },
+	{ "aldebaran", FAMILY_AI, AMDGPU_ALDEBARAN_RANGE },
+
+	/* GFX9 */
+	{ "vega10", FAMILY_AI, AMDGPU_VEGA10_RANGE },
+	{ "vega12", FAMILY_AI, AMDGPU_VEGA12_RANGE },
+	{ "vega20", FAMILY_AI, AMDGPU_VEGA20_RANGE },
+	{ "raven", FAMILY_RV, AMDGPU_RAVEN_RANGE },
+	{ "raven2", FAMILY_RV, AMDGPU_RAVEN2_RANGE },
+	{ "renoir", FAMILY_RV, AMDGPU_RENOIR_RANGE },
+
+	/* GFX8 (VI/Polaris) */
+	{ "polaris10", FAMILY_VI, AMDGPU_POLARIS10_RANGE },
+	{ "polaris11", FAMILY_VI, AMDGPU_POLARIS11_RANGE },
+	{ "polaris12", FAMILY_VI, AMDGPU_POLARIS12_RANGE },
+	{ "fiji", FAMILY_VI, AMDGPU_FIJI_RANGE },
+	{ "tonga", FAMILY_VI, AMDGPU_TONGA_RANGE },
+	{ "iceland", FAMILY_VI, AMDGPU_ICELAND_RANGE },
+	{ "carrizo", FAMILY_CZ, AMDGPU_CARRIZO_RANGE },
+	{ "stoney", FAMILY_CZ, AMDGPU_STONEY_RANGE },
+
+	{ NULL, 0, 0, 0 }
+};
+
+/* Helper: Get ASIC info by name (case-insensitive) */
+static const struct asic_info *get_asic_info(const char *name)
+{
+	const struct asic_info *info;
+
+	if (!name)
+		return NULL;
+
+	for (info = asic_table; info->name; info++) {
+		if (strcasecmp(info->name, name) == 0)
+			return info;
+	}
+	return NULL;
+}
+
+/* Helper: Get ASIC name by family/chip */
+static const char *get_asic_name(int family_id, int chip_rev)
+{
+	const struct asic_info *info;
+
+	for (info = asic_table; info->name; info++) {
+		if (info->family_id == family_id &&
+		    chip_rev >= info->chip_id_min &&
+		    chip_rev < info->chip_id_max)
+			return info->name;
+	}
+	return "unknown";
+}
+
+/* ================================================================
+ * AMD PLATFORM FILTER OPS IMPLEMENTATION
+ * ================================================================ */
+
+static const char *amd_get_platform_name(const void *platform_info)
+{
+	const struct amdgpu_gpu_info *gpu_info = platform_info;
+
+	if (!gpu_info)
+		return "unknown";
+
+	return get_asic_name(gpu_info->family_id, gpu_info->chip_rev);
+}
+
+static bool amd_match_platform(const void *platform_info, const void *platform_data)
+{
+	const struct amdgpu_gpu_info *gpu_info = platform_info;
+	const struct amd_platform_data *amd_data = platform_data;
+	int i;
+
+	if (!gpu_info || !amd_data)
+		return false;
+
+	/* If no ranges specified, match all platforms */
+	if (amd_data->num_ranges == 0)
+		return true;
+
+	/* Check if GPU matches any of the ASIC ranges */
+	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
+		if (amd_data->ranges[i].family_id == gpu_info->family_id) {
+			int chip_rev = gpu_info->chip_rev;
+			if (chip_rev >= amd_data->ranges[i].chip_id_min &&
+			    chip_rev < amd_data->ranges[i].chip_id_max) {
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+static bool amd_parse_platform_config(const char *platform_str, void **platform_data_out)
+{
+	const struct asic_info *info;
+	struct amd_platform_data *amd_data;
+
+	info = get_asic_info(platform_str);
+	if (!info) {
+		igt_warn("Unknown AMD ASIC name: %s\n", platform_str);
+		return false;
+	}
+
+	amd_data = malloc(sizeof(*amd_data));
+	if (!amd_data)
+		return false;
+
+	memset(amd_data, 0, sizeof(*amd_data));
+	amd_data->ranges[0].family_id = info->family_id;
+	amd_data->ranges[0].chip_id_min = info->chip_id_min;
+	amd_data->ranges[0].chip_id_max = info->chip_id_max;
+	amd_data->num_ranges = 1;
+
+	*platform_data_out = amd_data;
+	return true;
+}
+
+static void amd_dump_platform_data(const void *platform_data)
+{
+	const struct amd_platform_data *amd_data = platform_data;
+	int i;
+
+	if (!amd_data) {
+		printf("(all platforms)");
+		return;
+	}
+
+	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
+		if (i > 0)
+			printf(", ");
+		printf("{0x%02X, 0x%02X-0x%02X}",
+		       amd_data->ranges[i].family_id,
+		       amd_data->ranges[i].chip_id_min,
+		       amd_data->ranges[i].chip_id_max);
+	}
+}
+
+/* ================================================================
+ * AMD BUILT-IN SKIP RULES
+ * ================================================================
+ *
+ * These are production skip rules. They are checked FIRST before
+ * config file or environment variable.
+ *
+ * To add a skip rule:
+ * 1. Define platform data with ASIC ranges
+ * 2. Add entry to builtin_skip_table[]
+ * 3. Rebuild IGT
+ *
+ * Example formats (uncomment to use):
+ *
+ * Single ASIC:
+ *   static struct amd_platform_data navi44_data = {
+ *       .ranges = { {FAMILY_GFX1200, AMDGPU_GFX1200_RANGE} },
+ *       .num_ranges = 1
+ *   };
+ *   { "amd_basic", "*-UMQ", "UMQ not supported on Navi44", &navi44_data },
+ *
+ * Multiple ASICs:
+ *   static struct amd_platform_data navi10_12_14_data = {
+ *       .ranges = {
+ *           {FAMILY_NV, AMDGPU_NAVI10_RANGE},
+ *           {FAMILY_NV, AMDGPU_NAVI12_RANGE},
+ *           {FAMILY_NV, AMDGPU_NAVI14_RANGE}
+ *       },
+ *       .num_ranges = 3
+ *   };
+ *   { "amd_userq_abort", "*", "Queue reset unstable", &navi10_12_14_data },
+ *
+ * All platforms (no platform restriction):
+ *   { "test_name", "subtest", "reason", NULL },
+ */
+
+static const struct platform_skip_entry builtin_skip_table[] = {
+	/* Add production skip rules here */
+
+	/* Sentinel */
+	{}
+};
+
+static const struct platform_skip_entry *amd_get_builtin_rules(int *count_out)
+{
+	int count = 0;
+
+	/* Count entries (stop at sentinel) */
+	while (builtin_skip_table[count].test_name ||
+	       builtin_skip_table[count].subtest_glob ||
+	       builtin_skip_table[count].reason)
+		count++;
+
+	*count_out = count;
+	return builtin_skip_table;
+}
+
+/* AMD platform filter operations */
+static const struct platform_filter_ops amd_platform_ops = {
+	.name = "amd",
+	.get_platform_name = amd_get_platform_name,
+	.match_platform = amd_match_platform,
+	.parse_platform_config = amd_parse_platform_config,
+	.get_builtin_rules = amd_get_builtin_rules,
+	.dump_platform_data = amd_dump_platform_data,
+};
+
+/* ================================================================
+ * PUBLIC API
+ * ================================================================ */
+
+const struct platform_filter_ops *amd_platform_get_ops(void)
+{
+	return &amd_platform_ops;
+}
+
+/**
+ * amd_platform_filter_init:
+ * @gpu_info: AMD GPU information from amdgpu query
+ *
+ * Initialize platform filtering for AMD GPUs. This is a convenience
+ * wrapper that sets up the generic filtering framework with AMD-specific
+ * callbacks and GPU identification data.
+ *
+ * Must be called before using igt_platform_require() in AMD tests.
+ */
+void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info)
+{
+	igt_platform_filter_init(&amd_platform_ops, gpu_info);
+}
diff --git a/lib/amdgpu/amd_platform.h b/lib/amdgpu/amd_platform.h
new file mode 100644
index 000000000..fd233a053
--- /dev/null
+++ b/lib/amdgpu/amd_platform.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_PLATFORM_H
+#define AMD_PLATFORM_H
+
+#include "igt_platform_filter.h"
+#include "amd_ip_blocks.h"
+
+/**
+ * SECTION: amd_platform
+ * @short_description: AMD-specific platform filtering backend
+ * @title: AMD Platform
+ * @include: amd_platform.h
+ *
+ * AMD implementation of platform filtering that plugs into the generic
+ * IGT platform filter framework.
+ *
+ * This backend provides:
+ * - ASIC identification and matching based on family/chip ranges
+ * - Built-in skip rules for AMD GPUs
+ * - Integration with amdgpu_asic_addr.h definitions
+ *
+ * Usage in AMD tests:
+ *   igt_fixture() {
+ *       setup_amdgpu_ip_blocks(...);
+ *       amd_platform_filter_init(&gpu_info);
+ *   }
+ *
+ *   igt_subtest("my-test") {
+ *       // Automatic filtering - no manual call needed!
+ *       test_code();
+ *   }
+ */
+
+/**
+ * amd_platform_filter_init - Initialize AMD platform filtering
+ * @gpu_info: AMDGPU GPU information structure
+ *
+ * Convenience wrapper that initializes the generic platform filter
+ * with AMD-specific operations and GPU info.
+ */
+void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info);
+
+/**
+ * amd_platform_get_ops - Get AMD platform filter operations
+ *
+ * Returns: AMD platform_filter_ops structure
+ */
+const struct platform_filter_ops *amd_platform_get_ops(void);
+
+#endif /* AMD_PLATFORM_H */
diff --git a/lib/meson.build b/lib/meson.build
index 898d21cb4..b8e371b55 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -179,6 +179,7 @@ if libdrm_amdgpu.found()
 	lib_deps += libdrm_amdgpu
 	lib_sources += [
 		'amdgpu/amd_memory.c',
+		'amdgpu/amd_platform.c',
 		'amdgpu/amd_command_submission.c',
 		'amdgpu/amd_compute.c',
 		'amdgpu/amd_cs_radv.c',
-- 
2.54.0

