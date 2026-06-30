Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA0CC43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 03:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6120810E15B;
	Tue, 30 Jun 2026 03:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K4Lnz16x";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF9810E15B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 03:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZBo7lJhpl8CjdsDkrdyxM4MNh6pCgkjbPAr8dOgLiYHaAoKvRKLQ1SlqSF3LoOazrdSqkLG3WLFaAE0RbUahguqwJZ/0Eih32lnOjUtxb/qsmTeG6ZUEP11pEE0dtJ0r//3L/CIJtDut0blBn6E/kS2IGiTFI33Kp3f1FSxyj+WyJBD6B3DdtwSq2YVvrlJZnBZoC4gs+BqYKFHg6NCJff/q1O5DBlNaZC1eoExG+m2JrYCFYaG1uMPu3xsnldCDQHHiqfB3wcvErAMgJcCmpYdcvyOFnkNjAlFA+XqFHt1van+aAocnJl4N5d1Wgz0IehjnZ3ajMiQq/dbxZEH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc8NC3xTzjumiFMZj/QLBddnpaobL/SQMpr6F7rfrUk=;
 b=XKMyI8wDLDhVNmUGnHpXViBa3Coq4F9GpMsWvHGSjR7yyZ3MPlfViaDKabe0SH4tzXdj5yk5Kf3fOSqVi8T5FWiXJ3NeRPrlc8nTmFYQEL3w+k7seeKy31nwLO8Tq7DjGxjOjzD89TZKJ3f+Ss5N040d4JRS70+B6nTFLLFofdRpSCC59mxyxouOX1jqzUvy37xhJx7GloXgI9Ko6IGpVsB8+1W+NcRnIB2xYlwba6gRLL8et69LQ5FMQ0inUKLVPkXOl+bNkA+caWgk98DO8HCVskoWye8O09jMGVO2HQNYJV22rXja77DF8xBjPwxJRHL9pcWGMJLTNjvvfA0ZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc8NC3xTzjumiFMZj/QLBddnpaobL/SQMpr6F7rfrUk=;
 b=K4Lnz16xq52SYADcwiDIhXzrc+oExBUe12T9FQEFqUAvYq24ZGhicxdEX5GXb5AxABWmpp2bytrS9TCBs29EKTDzo57OJW4b1K4wXqAcxt9VOe2RYN5+8lk7CCx4Real0RLOQLa9Eh89e/Uf51mk91gZIoKsdOKqy6EAVSDw0wI=
Received: from BN9PR03CA0807.namprd03.prod.outlook.com (2603:10b6:408:13f::32)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:24:48 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::9c) by BN9PR03CA0807.outlook.office365.com
 (2603:10b6:408:13f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:24:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:24:47 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:46 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 22:24:46 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 3/7] lib/amdgpu: Add AMD platform filtering backend
Date: Mon, 29 Jun 2026 23:23:22 -0400
Message-ID: <20260630032442.200729-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630032442.200729-1-vitaly.prosyak@amd.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9be461-f1d0-4ac9-7bb4-08ded6572321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: hTnj695fi/BIjHNLX2z/TPEOyyPJknWnMM1VcOLUFO5q4HAvfw9msQmTWrEcLhqdGl5UQh8ugHidZvAiYlWvAsasVlKQ6kL5e5EIiwvllBE7vGnVXobH3ZhCyuYFe3s0hbA9tbPbEce4J8bIGqBhtRMeCQUzwvXMWgIqB5m++zpTpGPlZNwrRB540MhVbvkMQpVg6bUp2siCWyvE4Cpvr/HQmsFdseIsiBtCsPOvCgpxJp0fcG1vA0zZsIt9MDF0N3RCXU7UZ6y/LmJ+dcCzwSuJj1RhnYGKpPvsN1vQ0ww13P6dj1UyKLC7g8e0jOrZT40jsSb0610TLrTkPdR6o5RLpQAKnGW8UfBWpyLpufMFXwYq3Vh3NWFtDTFuMdSENKhoGRjP9h8AzekvEa5JOc50Pc3n5xTEj2BdesqfnJoRBM8YCUnrC/Xf8wGPWEGWYTbnFvoZZckkkV8T+GWIu541EAk1syzKbyNzLU8+caXYHchilT4w9EDNeHFNdAGP54oCHsvh7Vg3vjl+s+Mqv+SNKAkYrvXtHv+JWNUxMjg7vhpOnaqsI1ibTCOrVVbEcT8C65NMCOJR1Exl5EDhmcIEJtunktKnJZu3Be8LNMtz09tJxyKYeGV7BwDX1lMcByYn3GBDoJxIETUL73rHJiDFNz0yWi+C7LSRug2cGeeJC4l/bbvrRTPwNMB4VuApcUk8vYgLrMyQa3b7zFq7hw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(11063799006)(22082099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2D/us2cAWAYYXjiNyEmMHpZrn4271mbYSrTxy2blgSQuaLoT8dv8bvVU/2Y5ThVVJXoYyGC8M4MdxVUPL4bpeQsJI0u9dU6JJpYNuAvrfioFGxuovxHlhAM8mJwg7hKNLhKH+HhmBoZTP2FceU1NHCnHZWdz/l8vDXlgYbGHPw3ivpfhoQfqg/7HG3Dl0HoLbpSMKGJJNsLu26VVOKb+221fk8VzKzfrPwV3NttVMVSXJ7X0TOzcViel8s7BXZqA7t7KvlmQgefbDDffjjeV5W22mYddFTGDCvjhSFmMpCh37zvehHKl6hIfe9eMQz4oZjImxV3akf+U1H2eKZip3T+kKomFztZ6gVkiiK/Gl09WjWBxR1GNfAir8VKWAy999PVRseuuzu2llKohzZK2cHxQvnP6U88JW/ZBjjPVaUtuVdXW15byebVaUdgHVnOJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:24:47.2688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9be461-f1d0-4ac9-7bb4-08ded6572321
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052
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
    igt_platform_require(igt_test_name(), "my-subtest");

Example skip via environment variable:
    export IGT_PLATFORM_SKIP_CONFIG=navi48:amd_basic:*-UMQ:unstable

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_platform.c | 318 ++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_platform.h |  53 +++++++
 lib/meson.build           |   1 +
 3 files changed, 372 insertions(+)
 create mode 100644 lib/amdgpu/amd_platform.c
 create mode 100644 lib/amdgpu/amd_platform.h

diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
new file mode 100644
index 000000000..e52da159f
--- /dev/null
+++ b/lib/amdgpu/amd_platform.c
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2026 Advanced Micro Devices, Inc.
+/*
+ * AMD-specific platform filtering backend
+ *
+ * Implements platform_filter_ops callbacks for AMD GPUs, providing
+ * platform identification and matching logic based on ASIC family/chip.
+ */
+ */
+
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
index ba0683995..1318f9a38 100644
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

