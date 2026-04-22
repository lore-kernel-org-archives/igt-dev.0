Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23D2F94CC6
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 04:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874D810E28B;
	Wed, 22 Apr 2026 04:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BTYfsVy4";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010039.outbound.protection.outlook.com
 [52.101.193.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799BF10E261
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 04:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pv4mH6mDQYwVKg/yecaouT5ymiLfHLiu07LZ43ODRSLCDVmT03Ash0ja6W+PenOtnG6UvGmInDtGx076nEdSRDIvYl6DKp6hsgIC1Vsj7UCIUaRdqe8jHUUYYa8dg3Pq8hIRk0BBe+2y3J6Mw7xetvD2S287RRK7pETqztWK/FfC69ltb3GGKzNuzLpH6bpvwwkNM3LAASLD/qtgVHvVXTEhrrvUK4tkjR1s1IAmiDttJ6k4WGD2KSPFo1WjBwOiphFgpOT6Id8cZ4RPHVl0UOyKuEyefYUVjS9/jeiVgT0byC3qN5Vr0oOlGGjH4yf4rTCM6Q2JbaMMBG/aXJ6QYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g51qH6ocF2xFD7c1skzOOATsJiVMGPROBPmZTxAuOMg=;
 b=orHMaHe+TRUXE5t3ytJqTgz+5TzphXWpt0nWtvorMA/DhXc35VrZwMf/7B2wU5i6cAZU6mORoVk/uPwp6c8YlONFtCLeCmM4B8/D6OFgHSSh/gXt8oRDkt4vv7AJpkvWaCdavypSjAnKkPaxj8xJPCurkcUapX1xAlAQjesBT31eNAiPWFbeNTRMfaNPMrc+md/i6YNe1O2wCqmqzmNQrniNrVUIbTDNWaZ8Gh8aaHKkAQdPKtjnNV1pfDtAslCgUD/yWME8XP3a14gzfUaJYS11gheCW7UXDxVElEdI19XNRFy37Y2fNisyMaA6XtlJhPyJqMy2t0lQUeEuiMTfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g51qH6ocF2xFD7c1skzOOATsJiVMGPROBPmZTxAuOMg=;
 b=BTYfsVy4KwAP4mvuWRoBICcdinPxkmpsS+mcEKX82Qg5Kw1nWsLQ5TsSvc/kJ4Tt+89p6jLs5KkDDyf9mlgFQzNYY2UzeCJTjr5P5lV5K/LcOR49FeQ8aEyLPuDVVCb318VFh2Vjsv+/ozo5O18IW7Zfrifh//erirphJjwW328=
Received: from SJ0PR13CA0143.namprd13.prod.outlook.com (2603:10b6:a03:2c6::28)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 04:17:30 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::97) by SJ0PR13CA0143.outlook.office365.com
 (2603:10b6:a03:2c6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Wed,
 22 Apr 2026 04:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 04:17:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Apr
 2026 23:17:29 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Apr
 2026 23:17:28 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 23:17:28 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: Add ASIC filtering system with family ranges
Date: Wed, 22 Apr 2026 00:17:16 -0400
Message-ID: <20260422041725.172582-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b2ad14-3461-43c3-0ad4-08dea026117b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|18096099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: N3rzltODFLS2fGGLw9OyKT/K6coWPP2s6LDNBxq0sEkq/vltwiWZYG97uxFQI3O4MNXO9wnCyS3WE8r8fvANIk4kXAN6wKJlyZkucn2MiZSPYy52HgWtAPVIpFFn7eth5LRSTQjVrYPGgXVeQkUyQ0iCEVaMcdSyo6pDebk7APPRpjv40Bq8/S7jKAMOYAMJSUSWdiLG1vhcL468/0amS08gsiVv6xnx2bN6HaBv+4E6A4KYNY33LeqhKd4KfV3vvsZ+INDxbWcNSB8wkk3KFacaEl6BQthekY/ASYwzFRXQW8JNcWE924zZOOFLpaAAQ7dqHAFROo8icBLbG/aTJhCO43sNCd0++O5lfXAgg8a3+LnlZd4M1CLuFpq/4DirH/iTTQ4p3maAO+EmcGkPxffebFUis4Ix//1aUa7tnYhkHVVPRcUeM4PPWpgKcaxG97s+sEuY2JCdZ6oQVPWPDbAyMFdxXOssCOsn3MoRtflJRkNRO4zWW0qNX9S/sdNIm143j93cZCr0UIK5w9hG6gyeeblZh0CL+/POMAMCetBSUSVKaNPObRY0exMX9cegrM37+0SFyfAErbJ+410jBPtrKxMpFN10gSjJxmkPsOwaoAkGojS2EHCSFaj1ae1sT1YeiMWmUCtmOhHfecS7ZUpGfIx7WjR7ksjKssdWnGSKDUhIdnnw7P0IbsHPVWKYvUwr7X0P+UkzkEnGxYhOAuJI0IaMU+B6IG/IyoRV0qNh1Sgh/EQ0a/hFteQUY4kLlIpex7/PCkNktG3imbc1Mw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18096099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ANVF2QhaCgqXk+wQxgemPRrE1/p0d5Dsp/9Ds1352vytK3+wOb6aefH92GNDLYeo019xdwK1ZpucSWC6ODmPXjr+lDyXK6uCMEjCHg4Dszr9VKd/ib6T/JX3ix6YejRXpSqfhFuUfHM/HfQeEqo4ij5Sz66MXJ6w5v2k9PHqBIy5H6Im1hAjRvgpKDagSRbTKkPCbzQdKzLB+yuP50NpPcCPbcN4iQLVoR1mj3iyLcg8uU/a/eeU2+22uh3V1YzqpkPK7ZaqQlGUD6eUW9/5/ekCKGPeiZGRFCWFqcWBZooBL73ApJGmwHEmEIquCwhbfjOXsogEIbm0V42V4TjQsR/YAuzy6cfdJBU9MHbEK5RWl/Q9C5hTrz09gevlWTjlT/ln2yFabf+cFEZ6TQBNtsEnCp0pLYNLQtUXcIfzavZCuodAGzC6jXgImmb2oi3x
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 04:17:29.4317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b2ad14-3461-43c3-0ad4-08dea026117b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
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

Add comprehensive ASIC-based test filtering system following IGT
coding standards with three-tier priority configuration.

Structure and Design:
- Uses family range arrays similar to amd_queue_reset.c
- Supports up to 4 ASIC ranges per skip rule
- Intensive use of amdgpu_asic_addr.h definitions (FAMILY_*, AMDGPU_*_RANGE)
- No global variables - all state in struct asic_filter_context
- Read-only static const tables (asic_table, builtin_skip_table)

Three-Tier Priority System:
1. Built-in production array (checked first, requires rebuild)
2. Config file /etc/igt/asic_skip.conf (development, no rebuild)
3. Environment variable IGT_ASIC_SKIP_CONFIG (runtime, no rebuild)

Features:
- Family range structure: {family_id, chip_id_min, chip_id_max}
- Glob pattern matching for subtests (fnmatch)
- Comprehensive deployment guide in source code
- 10 commented examples in builtin_skip_table[]
- Complete family & range documentation
- Dump functionality showing all three sources

Documentation in Source:
- 5-step deployment guide
- Family & range reference (9 families, 18 ranges)
- Glob patterns guide
- 10 ready-to-use examples

Files Added:
- lib/amdgpu/amd_asic_filter.h - API and structures
- lib/amdgpu/amd_asic_filter.c - Full implementation with guide

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_asic_filter.c | 801 +++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_asic_filter.h | 136 ++++++
 lib/meson.build              |   1 +
 tests/amdgpu/amd_basic.c     |   9 +
 4 files changed, 947 insertions(+)
 create mode 100644 lib/amdgpu/amd_asic_filter.c
 create mode 100644 lib/amdgpu/amd_asic_filter.h

diff --git a/lib/amdgpu/amd_asic_filter.c b/lib/amdgpu/amd_asic_filter.c
new file mode 100644
index 000000000..5a4685a1e
--- /dev/null
+++ b/lib/amdgpu/amd_asic_filter.c
@@ -0,0 +1,801 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * ASIC-based test filtering - Three-tier implementation with family ranges
+ */
+
+#include <fnmatch.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <ctype.h>
+
+#include "igt.h"
+#include "amd_asic_filter.h"
+#include "amdgpu_asic_addr.h"
+
+/* Maximum entries from config file and env variable */
+#define MAX_CONFIG_ENTRIES 256
+#define MAX_ENV_ENTRIES 128
+#define MAX_LINE_LENGTH 512
+
+/* ================================================================
+ * PRIORITY 1: BUILT-IN PRODUCTION SKIP TABLE
+ * ================================================================
+ * Edit this array to add permanent production skip rules.
+ * This is checked FIRST before config file or env variable.
+ *
+ * ----------------------------------------------------------------
+ * STRUCTURE (similar to amd_queue_reset.c dynamic_test array)
+ * ----------------------------------------------------------------
+ *
+ * struct asic_skip_entry {
+ *     const char *test_name;          // Test binary name or "*"
+ *     const char *subtest_glob;       // Subtest pattern or "*"
+ *     const char *reason;             // Human-readable reason
+ *     struct asic_family_range ranges[MAX_ASIC_RANGES];  // Up to 4 ranges
+ * };
+ *
+ * struct asic_family_range {
+ *     int family_id;      // e.g., FAMILY_NV, FAMILY_GFX1200
+ *     int chip_id_min;    // Min chip revision
+ *     int chip_id_max;    // Max chip revision
+ * };
+ *
+ * ----------------------------------------------------------------
+ * DEPLOYMENT GUIDE
+ * ----------------------------------------------------------------
+ *
+ * 1. Copy this file to IGT:
+ *    cp amd_asic_filter_v4_updated.c \
+ *       /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_asic_filter.c
+ *
+ * 2. Edit builtin_skip_table[] below (add your rules)
+ *
+ * 3. Rebuild IGT:
+ *    cd /home/vprosyak/src/igt-gpu-tools
+ *    ninja -C build
+ *
+ * 4. Test environment variable (no rebuild needed):
+ *    export IGT_ASIC_SKIP_CONFIG="navi48:amd_basic:*-UMQ:Testing"
+ *    ./scripts/dump_asic_skip_rules.sh
+ *
+ * 5. Test config file (no rebuild needed):
+ *    sudo vim /etc/igt/asic_skip.conf
+ *    # Add: navi48:amd_basic:*-UMQ:Testing UMQ
+ *
+ * ----------------------------------------------------------------
+ * FAMILY & RANGE DEFINITIONS (from amdgpu_asic_addr.h)
+ * ----------------------------------------------------------------
+ *
+ * Common Families:
+ *   FAMILY_GFX1200  - Navi48, Navi44 (GFX12)
+ *   FAMILY_GFX1150  - GFX11.5 series
+ *   FAMILY_GFX1100  - Navi31, Navi32, Navi33 (GFX11)
+ *   FAMILY_GFX1103  - GFX11.0.3
+ *   FAMILY_NV       - Navi10-24, Sienna Cichlid (GFX10)
+ *   FAMILY_AI       - Vega, Arcturus, Aldebaran (GFX9/CDNA)
+ *   FAMILY_RV       - Raven, Renoir (GFX9 APU)
+ *   FAMILY_VI       - Polaris, Fiji, Tonga (GFX8)
+ *   FAMILY_CZ       - Carrizo, Stoney (GFX8 APU)
+ *
+ * Common Ranges:
+ *   AMDGPU_GFX1200_RANGE         0x01, 0xFF  (all GFX12)
+ *   AMDGPU_GFX1100_RANGE         0x01, 0x10  (Navi31)
+ *   AMDGPU_GFX1101_RANGE         0x20, 0xFF  (Navi32)
+ *   AMDGPU_GFX1102_RANGE         0x10, 0x20  (Navi33)
+ *   AMDGPU_NAVI10_RANGE          0x01, 0x0A
+ *   AMDGPU_NAVI12_RANGE          0x0A, 0x14
+ *   AMDGPU_NAVI14_RANGE          0x14, 0x28
+ *   AMDGPU_SIENNA_CICHLID_RANGE  0x28, 0x32  (Navi21)
+ *   AMDGPU_NAVY_FLOUNDER_RANGE   0x32, 0x3C  (Navi22)
+ *   AMDGPU_DIMGREY_CAVEFISH_RANGE 0x3C, 0x46 (Navi23)
+ *   AMDGPU_BEIGE_GOBY_RANGE      0x46, 0x50  (Navi24)
+ *   AMDGPU_VEGA10_RANGE          0x01, 0x14
+ *   AMDGPU_VEGA12_RANGE          0x14, 0x28
+ *   AMDGPU_VEGA20_RANGE          0x28, 0x32
+ *   AMDGPU_ARCTURUS_RANGE        0x32, 0x3C
+ *   AMDGPU_ALDEBARAN_RANGE       0x3C, 0xFF
+ *   AMDGPU_POLARIS10_RANGE       0x50, 0x5A
+ *   AMDGPU_POLARIS11_RANGE       0x5A, 0x64
+ *   AMDGPU_POLARIS12_RANGE       0x64, 0x6E
+ *
+ * See /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amdgpu_asic_addr.h
+ * for complete list!
+ *
+ * ----------------------------------------------------------------
+ * GLOB PATTERNS (for subtest_glob field)
+ * ----------------------------------------------------------------
+ *
+ *   "*"            - Match all subtests
+ *   "*-UMQ"        - All user queue (UMQ) tests
+ *   "cs-gfx-*"     - All GFX command submission tests
+ *   "cs-compute-*" - All compute command submission tests
+ *   "cs-sdma-*"    - All SDMA tests
+ *   "sync-*"       - All sync dependency tests
+ *   "cs-*-UMQ"     - All command submission UMQ tests
+ *
+ * ----------------------------------------------------------------
+ * EXAMPLES
+ * ----------------------------------------------------------------
+ */
+static const struct asic_skip_entry builtin_skip_table[] = {
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 1: Skip all UMQ tests on Navi44 (single ASIC range)
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "amd_basic", "*-UMQ", "UMQ not supported on Navi44",
+	  { {FAMILY_GFX1200, AMDGPU_GFX1200_RANGE} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 2: Skip specific subtest on Navi10 only
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "amd_basic", "cs-compute-with-IP-COMPUTE-UMQ",
+	  "Compute UMQ hangs on Navi10",
+	  { {FAMILY_NV, AMDGPU_NAVI10_RANGE} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 3: Skip on multiple ASIC ranges (Navi10, Navi12, Navi14)
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "amd_userq_abort", "*", "Queue reset unstable on Navi10/12/14",
+	  { {FAMILY_NV, AMDGPU_NAVI10_RANGE},
+	    {FAMILY_NV, AMDGPU_NAVI12_RANGE},
+	    {FAMILY_NV, AMDGPU_NAVI14_RANGE} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 4: Skip all UMQ on CDNA (Arcturus + Aldebaran)
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "*", "*-UMQ", "UMQ not supported on CDNA",
+	  { {FAMILY_AI, AMDGPU_ARCTURUS_RANGE},
+	    {FAMILY_AI, AMDGPU_ALDEBARAN_RANGE} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 5: Skip all tests on entire ASIC
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "*", "*", "Navi44 not ready for production",
+	  { {FAMILY_GFX1200, AMDGPU_GFX1200_RANGE} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 6: Skip all GFX tests on Vega family
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "amd_basic", "cs-gfx-*", "GFX tests broken on Vega",
+	  { {FAMILY_AI, AMDGPU_VEGA10_RANGE},
+	    {FAMILY_AI, AMDGPU_VEGA12_RANGE},
+	    {FAMILY_AI, AMDGPU_VEGA20_RANGE} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 7: Skip using custom chip range (like amd_queue_reset.c)
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "amd_queue_reset", "CMD_STREAM_EXEC_INVALID_*",
+	  "Stressful operations disabled on late Arcturus",
+	  { {FAMILY_AI, 0x32, 0xFF} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 8: Skip on all GFX11 variants (multiple chip IDs)
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "amd_basic", "sync-*", "Sync tests unstable on GFX11",
+	  { {FAMILY_GFX1100, AMDGPU_GFX1100_RANGE},
+	    {FAMILY_GFX1100, AMDGPU_GFX1101_RANGE},
+	    {FAMILY_GFX1100, AMDGPU_GFX1102_RANGE} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 9: Skip all Polaris ASICs for specific test
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "amd_queue_reset", "*", "Queue reset not supported on Polaris",
+	  { {FAMILY_VI, AMDGPU_POLARIS10_RANGE},
+	    {FAMILY_VI, AMDGPU_POLARIS11_RANGE},
+	    {FAMILY_VI, AMDGPU_POLARIS12_RANGE} } },
+	*/
+
+	/* ════════════════════════════════════════════════════════════
+	 * Example 10: Global wildcard - skip everywhere
+	 * ════════════════════════════════════════════════════════════ */
+	/*
+	{ "*", "cs-compute-with-IP-COMPUTE-UMQ",
+	  "Compute UMQ disabled globally for production",
+	  { } },
+	*/
+	/* Note: Empty ranges {} means skip on ALL ASICs */
+
+
+	/* ════════════════════════════════════════════════════════════
+	 * ADD YOUR PRODUCTION SKIP RULES HERE
+	 * ════════════════════════════════════════════════════════════
+	 *
+	 * Format:
+	 * { "test_name", "subtest_glob", "reason",
+	 *   { {FAMILY_XX, AMDGPU_XX_RANGE},
+	 *     {FAMILY_YY, AMDGPU_YY_RANGE} } },
+	 *
+	 * Uncomment examples above or add your own rules below:
+	 */
+
+
+
+
+	/* ════════════════════════════════════════════════════════════
+	 * SENTINEL - MUST BE LAST (DO NOT REMOVE)
+	 * ════════════════════════════════════════════════════════════ */
+	{},
+};
+
+/* ================================================================
+ * PRIORITY 2 & 3: RUNTIME CONFIGURATION STORAGE
+ * ================================================================ */
+
+/* Filter context - holds all runtime state (no globals) */
+struct asic_filter_context {
+	struct asic_skip_entry config_entries[MAX_CONFIG_ENTRIES];
+	int config_entry_count;
+
+	struct asic_skip_entry env_entries[MAX_ENV_ENTRIES];
+	int env_entry_count;
+
+	bool initialized;
+	char current_asic_name[64];
+};
+
+/* Single static instance - initialized on first use */
+static struct asic_filter_context *get_filter_context(void)
+{
+	static struct asic_filter_context ctx = {0};
+	return &ctx;
+}
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
+/* Helper: Match wildcard or exact string */
+static bool match_string(const char *pattern, const char *str)
+{
+	if (!pattern || !str)
+		return false;
+
+	if (strcmp(pattern, "*") == 0)
+		return true;
+
+	return fnmatch(pattern, str, 0) == 0;
+}
+
+/* Helper: Check if entry matches ASIC/test/subtest */
+static bool entry_matches(const struct asic_skip_entry *entry,
+                          const struct amdgpu_gpu_info *gpu_info,
+                          const char *test_name,
+                          const char *subtest_name)
+{
+	int i;
+	bool range_match = false;
+
+	/* Check family/chip ranges */
+	for (i = 0; i < MAX_ASIC_RANGES; i++) {
+		if (entry->ranges[i].family_id == 0)
+			break; /* No more ranges */
+
+		if (entry->ranges[i].family_id == gpu_info->family_id) {
+			int chip_rev = gpu_info->chip_rev;
+			if (chip_rev >= entry->ranges[i].chip_id_min &&
+			    chip_rev < entry->ranges[i].chip_id_max) {
+				range_match = true;
+				break;
+			}
+		}
+	}
+
+	/* If ranges specified but no match, skip this entry */
+	if (i > 0 && !range_match)
+		return false;
+
+	/* Check test name match */
+	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
+		if (!test_name || !match_string(entry->test_name, test_name))
+			return false;
+	}
+
+	/* Check subtest glob match */
+	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
+		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
+			return false;
+	}
+
+	return true;
+}
+
+/* ================================================================
+ * CONFIG FILE PARSER (/etc/igt/asic_skip.conf)
+ * ================================================================ */
+
+/* Helper: Trim whitespace from string */
+static char *trim(char *str)
+{
+	char *end;
+
+	while (isspace(*str))
+		str++;
+
+	if (*str == 0)
+		return str;
+
+	end = str + strlen(str) - 1;
+	while (end > str && isspace(*end))
+		end--;
+
+	*(end + 1) = 0;
+	return str;
+}
+
+/* Parse one line from config file */
+static bool parse_config_line(char *line, struct asic_skip_entry *entry)
+{
+	char *asic, *test, *subtest, *reason;
+	const struct asic_info *info;
+
+	/* Skip comments and empty lines */
+	line = trim(line);
+	if (line[0] == '#' || line[0] == 0)
+		return false;
+
+	/* Format: asic:test:subtest:reason */
+	asic = strtok(line, ":");
+	test = strtok(NULL, ":");
+	subtest = strtok(NULL, ":");
+	reason = strtok(NULL, "\n");
+
+	if (!asic || !test || !subtest) {
+		igt_warn("Invalid config line format (expected asic:test:subtest:reason)\n");
+		return false;
+	}
+
+	/* Allocate and copy strings */
+	entry->test_name = strdup(trim(test));
+	entry->subtest_glob = strdup(trim(subtest));
+	entry->reason = reason ? strdup(trim(reason)) : strdup("No reason");
+
+	/* Get family/chip from ASIC name */
+	memset(entry->ranges, 0, sizeof(entry->ranges));
+	info = get_asic_info(trim(asic));
+	if (info) {
+		entry->ranges[0].family_id = info->family_id;
+		entry->ranges[0].chip_id_min = info->chip_id_min;
+		entry->ranges[0].chip_id_max = info->chip_id_max;
+	} else if (strcmp(trim(asic), "*") == 0) {
+		/* Wildcard - no range restriction */
+	} else {
+		igt_warn("Unknown ASIC name: %s\n", trim(asic));
+	}
+
+	return true;
+}
+
+/* Load config file */
+static void load_config_file(struct asic_filter_context *ctx, const char *filename)
+{
+	FILE *f;
+	char line[MAX_LINE_LENGTH];
+
+	f = fopen(filename, "r");
+	if (!f) {
+		igt_debug("Config file not found: %s\n", filename);
+		return;
+	}
+
+	igt_info("Loading ASIC skip config from: %s\n", filename);
+
+	while (fgets(line, sizeof(line), f)) {
+		if (ctx->config_entry_count >= MAX_CONFIG_ENTRIES) {
+			igt_warn("Config file has too many entries (max %d)\n",
+			         MAX_CONFIG_ENTRIES);
+			break;
+		}
+
+		if (parse_config_line(line, &ctx->config_entries[ctx->config_entry_count])) {
+			ctx->config_entry_count++;
+		}
+	}
+
+	fclose(f);
+	igt_info("Loaded %d skip rules from config file\n", ctx->config_entry_count);
+}
+
+/* ================================================================
+ * ENVIRONMENT VARIABLE PARSER (IGT_ASIC_SKIP_CONFIG)
+ * ================================================================ */
+
+/* Parse environment variable entries (semicolon-separated) */
+static void load_env_variable(struct asic_filter_context *ctx)
+{
+	char *env, *env_copy, *entry_str, *saveptr;
+	const char *env_value;
+
+	env_value = getenv("IGT_ASIC_SKIP_CONFIG");
+	if (!env_value || env_value[0] == 0) {
+		igt_debug("IGT_ASIC_SKIP_CONFIG not set\n");
+		return;
+	}
+
+	igt_info("Loading ASIC skip config from IGT_ASIC_SKIP_CONFIG\n");
+
+	env_copy = strdup(env_value);
+	env = env_copy;
+
+	/* Parse semicolon-separated entries */
+	while ((entry_str = strtok_r(env, ";", &saveptr)) != NULL) {
+		env = NULL; /* For subsequent strtok_r calls */
+
+		if (ctx->env_entry_count >= MAX_ENV_ENTRIES) {
+			igt_warn("Too many env variable entries (max %d)\n",
+			         MAX_ENV_ENTRIES);
+			break;
+		}
+
+		if (parse_config_line(entry_str, &ctx->env_entries[ctx->env_entry_count])) {
+			ctx->env_entry_count++;
+		}
+	}
+
+	free(env_copy);
+	igt_info("Loaded %d skip rules from environment variable\n", ctx->env_entry_count);
+}
+
+/* ================================================================
+ * PUBLIC API IMPLEMENTATION
+ * ================================================================ */
+
+void amdgpu_asic_filter_init(void)
+{
+	struct asic_filter_context *ctx = get_filter_context();
+
+	if (ctx->initialized)
+		return;
+
+	igt_info("Initializing ASIC filter system (3-tier priority)\n");
+
+	/* Priority 1: Built-in array (always loaded) */
+	igt_debug("  Priority 1: Built-in array\n");
+
+	/* Priority 2: Config file */
+	igt_debug("  Priority 2: Config file /etc/igt/asic_skip.conf\n");
+	load_config_file(ctx, "/etc/igt/asic_skip.conf");
+
+	/* Priority 3: Environment variable */
+	igt_debug("  Priority 3: Environment variable IGT_ASIC_SKIP_CONFIG\n");
+	load_env_variable(ctx);
+
+	ctx->initialized = true;
+	igt_info("ASIC filter initialization complete\n");
+}
+
+bool amdgpu_asic_should_skip(const struct amdgpu_gpu_info *gpu_info,
+                             const char *test_name,
+                             const char *subtest_name,
+                             enum skip_source *source,
+                             const char **reason)
+{
+	struct asic_filter_context *ctx = get_filter_context();
+	const struct asic_skip_entry *entry;
+	int i;
+
+	if (!ctx->initialized)
+		amdgpu_asic_filter_init();
+
+	/* Save current ASIC name for dump */
+	snprintf(ctx->current_asic_name, sizeof(ctx->current_asic_name), "%s",
+	         get_asic_name(gpu_info->family_id, gpu_info->chip_rev));
+
+	/* Priority 1: Check built-in array FIRST */
+	for (i = 0; builtin_skip_table[i].test_name || builtin_skip_table[i].reason; i++) {
+		entry = &builtin_skip_table[i];
+		if (entry_matches(entry, gpu_info, test_name, subtest_name)) {
+			if (source)
+				*source = SKIP_SOURCE_BUILTIN;
+			if (reason)
+				*reason = entry->reason;
+			igt_debug("Skip (built-in): %s:%s - %s\n",
+			          entry->test_name ? entry->test_name : "*",
+			          entry->subtest_glob ? entry->subtest_glob : "*",
+			          entry->reason ? entry->reason : "no reason");
+			return true;
+		}
+	}
+
+	/* Priority 2: Check config file */
+	for (i = 0; i < ctx->config_entry_count; i++) {
+		entry = &ctx->config_entries[i];
+		if (entry_matches(entry, gpu_info, test_name, subtest_name)) {
+			if (source)
+				*source = SKIP_SOURCE_CONFIG;
+			if (reason)
+				*reason = entry->reason;
+			igt_debug("Skip (config): %s:%s - %s\n",
+			          entry->test_name, entry->subtest_glob, entry->reason);
+			return true;
+		}
+	}
+
+	/* Priority 3: Check environment variable */
+	for (i = 0; i < ctx->env_entry_count; i++) {
+		entry = &ctx->env_entries[i];
+		if (entry_matches(entry, gpu_info, test_name, subtest_name)) {
+			if (source)
+				*source = SKIP_SOURCE_ENV;
+			if (reason)
+				*reason = entry->reason;
+			igt_debug("Skip (env): %s:%s - %s\n",
+			          entry->test_name, entry->subtest_glob, entry->reason);
+			return true;
+		}
+	}
+
+	if (source)
+		*source = SKIP_SOURCE_NONE;
+	if (reason)
+		*reason = NULL;
+	return false;
+}
+
+void amdgpu_asic_require(const struct amdgpu_gpu_info *gpu_info,
+                         const char *test_name,
+                         const char *subtest_name)
+{
+	enum skip_source source;
+	const char *reason;
+
+	if (amdgpu_asic_should_skip(gpu_info, test_name, subtest_name, &source, &reason)) {
+		const char *source_str;
+
+		switch (source) {
+		case SKIP_SOURCE_BUILTIN:
+			source_str = "built-in array";
+			break;
+		case SKIP_SOURCE_CONFIG:
+			source_str = "config file";
+			break;
+		case SKIP_SOURCE_ENV:
+			source_str = "environment variable";
+			break;
+		default:
+			source_str = "unknown";
+		}
+
+		igt_skip("Skipped on this ASIC [%s]: %s\n",
+		         source_str, reason ? reason : "no reason");
+	}
+}
+
+void amdgpu_asic_filter_dump(void)
+{
+	struct asic_filter_context *ctx = get_filter_context();
+	const struct asic_skip_entry *entry;
+	int i, j, total_count;
+
+	if (!ctx->initialized)
+		amdgpu_asic_filter_init();
+
+	printf("\n");
+	printf("═══════════════════════════════════════════════════════════════════\n");
+	printf(" ASIC SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n");
+	printf("═══════════════════════════════════════════════════════════════════\n\n");
+
+	if (ctx->current_asic_name[0]) {
+		printf("Current ASIC: %s\n\n", ctx->current_asic_name);
+	}
+
+	/* Priority 1: Built-in array */
+	printf("───────────────────────────────────────────────────────────────────\n");
+	printf(" PRIORITY 1: BUILT-IN PRODUCTION ARRAY\n");
+	printf(" Source: lib/amdgpu/amd_asic_filter.c (builtin_skip_table[])\n");
+	printf("───────────────────────────────────────────────────────────────────\n");
+
+	total_count = 0;
+	for (i = 0; builtin_skip_table[i].test_name || builtin_skip_table[i].reason; i++) {
+		entry = &builtin_skip_table[i];
+		total_count++;
+		printf("  %2d. %s : %s\n",
+		       total_count,
+		       entry->test_name ? entry->test_name : "*",
+		       entry->subtest_glob ? entry->subtest_glob : "*");
+		printf("      Reason: %s\n", entry->reason ? entry->reason : "no reason");
+
+		/* Print family ranges */
+		printf("      Ranges: ");
+		for (j = 0; j < MAX_ASIC_RANGES && entry->ranges[j].family_id != 0; j++) {
+			if (j > 0) printf(", ");
+			printf("{0x%02X, 0x%02X-0x%02X}",
+			       entry->ranges[j].family_id,
+			       entry->ranges[j].chip_id_min,
+			       entry->ranges[j].chip_id_max);
+		}
+		if (j == 0)
+			printf("(all ASICs)");
+		printf("\n\n");
+	}
+	if (total_count == 0) {
+		printf("  (No built-in rules)\n\n");
+	}
+
+	/* Priority 2: Config file */
+	printf("───────────────────────────────────────────────────────────────────\n");
+	printf(" PRIORITY 2: DEVELOPMENT CONFIG FILE\n");
+	printf(" Source: /etc/igt/asic_skip.conf\n");
+	printf("───────────────────────────────────────────────────────────────────\n");
+
+	if (ctx->config_entry_count > 0) {
+		for (i = 0; i < ctx->config_entry_count; i++) {
+			entry = &ctx->config_entries[i];
+			printf("  %2d. %s : %s\n",
+			       i + 1,
+			       entry->test_name,
+			       entry->subtest_glob);
+			printf("      Reason: %s\n\n", entry->reason);
+		}
+	} else {
+		printf("  (No config file rules loaded)\n\n");
+	}
+
+	/* Priority 3: Environment variable */
+	printf("───────────────────────────────────────────────────────────────────\n");
+	printf(" PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n");
+	printf(" Source: IGT_ASIC_SKIP_CONFIG\n");
+	printf("───────────────────────────────────────────────────────────────────\n");
+
+	if (ctx->env_entry_count > 0) {
+		for (i = 0; i < ctx->env_entry_count; i++) {
+			entry = &ctx->env_entries[i];
+			printf("  %2d. %s : %s\n",
+			       i + 1,
+			       entry->test_name,
+			       entry->subtest_glob);
+			printf("      Reason: %s\n\n", entry->reason);
+		}
+	} else {
+		printf("  (No environment variable rules)\n\n");
+	}
+
+	printf("───────────────────────────────────────────────────────────────────\n");
+	printf(" SUMMARY\n");
+	printf("───────────────────────────────────────────────────────────────────\n");
+	printf("  Built-in rules:     %d\n", total_count);
+	printf("  Config file rules:  %d\n", ctx->config_entry_count);
+	printf("  Environment rules:  %d\n", ctx->env_entry_count);
+	printf("  Total skip rules:   %d\n", total_count + ctx->config_entry_count + ctx->env_entry_count);
+	printf("\n");
+	printf("═══════════════════════════════════════════════════════════════════\n\n");
+}
+
+int amdgpu_asic_filter_dump_to_file(const char *filename)
+{
+	FILE *old_stdout;
+	FILE *f;
+
+	f = fopen(filename, "w");
+	if (!f) {
+		igt_warn("Failed to open %s for writing\n", filename);
+		return -1;
+	}
+
+	/* Redirect stdout to file */
+	old_stdout = stdout;
+	stdout = f;
+
+	amdgpu_asic_filter_dump();
+
+	/* Restore stdout */
+	stdout = old_stdout;
+	fclose(f);
+
+	igt_info("Skip filter configuration dumped to: %s\n", filename);
+	return 0;
+}
diff --git a/lib/amdgpu/amd_asic_filter.h b/lib/amdgpu/amd_asic_filter.h
new file mode 100644
index 000000000..793fff21a
--- /dev/null
+++ b/lib/amdgpu/amd_asic_filter.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_ASIC_FILTER_H
+#define AMD_ASIC_FILTER_H
+
+#include "amd_ip_blocks.h"
+#include "amdgpu_asic_addr.h"
+
+/**
+ * ASIC-based test filtering - Three-tier priority system
+ *
+ * Priority order (checked in sequence, first match wins):
+ *   1. PRODUCTION: Built-in compile-time array (in amd_asic_filter.c)
+ *   2. DEVELOPMENT: Config file /etc/igt/asic_skip.conf (if exists)
+ *   3. RUNTIME: Environment variable IGT_ASIC_SKIP_CONFIG
+ *
+ * Usage in tests:
+ *   igt_fixture() {
+ *       setup_amdgpu_ip_blocks(...);
+ *       amdgpu_asic_filter_init();
+ *   }
+ *
+ *   igt_subtest("my-test") {
+ *       amdgpu_asic_require(&gpu_info, igt_test_name(), "my-test");
+ *       // test code
+ *   }
+ *
+ * Config file format (/etc/igt/asic_skip.conf):
+ *   # Lines starting with # are comments
+ *   # Format: asic:test:subtest:reason
+ *   # Use * as wildcard
+ *
+ *   navi48:*:*:All tests disabled on Navi48
+ *   navi10:amd_basic:*-UMQ:UMQ not supported on Navi10
+ *   navi14:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:Compute UMQ hangs
+ *
+ * Environment variable format (IGT_ASIC_SKIP_CONFIG):
+ *   Same as config file, but semicolon-separated entries:
+ *   export IGT_ASIC_SKIP_CONFIG="navi48:*:*:Testing;navi10:amd_basic:*-UMQ:Broken"
+ *
+ * Dump all skip rules:
+ *   amdgpu_asic_filter_dump() - Shows all three sources
+ *   Or use script: ./scripts/dump_asic_skip_rules.sh
+ */
+
+/* Maximum ASIC family ranges per skip entry */
+#define MAX_ASIC_RANGES 4
+
+/* ASIC family range structure */
+struct asic_family_range {
+	int family_id;      /* AMDGPU family ID (e.g., FAMILY_NV) */
+	int chip_id_min;    /* Min chip ID in range */
+	int chip_id_max;    /* Max chip ID in range */
+};
+
+/* Skip entry structure - similar to amd_queue_reset.c dynamic_test */
+struct asic_skip_entry {
+	const char *test_name;          /* Test binary name (e.g., "amd_basic") or "*" */
+	const char *subtest_glob;       /* Subtest pattern (fnmatch) or "*" */
+	const char *reason;             /* Human-readable reason */
+	struct asic_family_range ranges[MAX_ASIC_RANGES];  /* Array of family/chip ranges */
+};
+
+/* Skip source type for reporting */
+enum skip_source {
+	SKIP_SOURCE_BUILTIN,    /* From built-in array */
+	SKIP_SOURCE_CONFIG,     /* From /etc/igt/asic_skip.conf */
+	SKIP_SOURCE_ENV,        /* From IGT_ASIC_SKIP_CONFIG */
+	SKIP_SOURCE_NONE,       /* Not skipped */
+};
+
+/**
+ * amdgpu_asic_filter_init - Initialize the filtering system
+ *
+ * Loads skip rules from:
+ *   1. Built-in array (always loaded)
+ *   2. /etc/igt/asic_skip.conf (if exists)
+ *   3. IGT_ASIC_SKIP_CONFIG env variable (if set)
+ *
+ * Call once in igt_fixture after setup_amdgpu_ip_blocks().
+ */
+void amdgpu_asic_filter_init(void);
+
+/**
+ * amdgpu_asic_require - Check if current test should run on this ASIC
+ * @gpu_info: GPU information structure
+ * @test_name: Test binary name (use igt_test_name())
+ * @subtest_name: Subtest name
+ *
+ * Checks all three skip sources in priority order.
+ * Calls igt_skip() if test should be skipped.
+ */
+void amdgpu_asic_require(const struct amdgpu_gpu_info *gpu_info,
+                         const char *test_name,
+                         const char *subtest_name);
+
+/**
+ * amdgpu_asic_should_skip - Query if test should be skipped (without skipping)
+ * @gpu_info: GPU information structure
+ * @test_name: Test binary name
+ * @subtest_name: Subtest name
+ * @source: Output parameter for skip source (can be NULL)
+ * @reason: Output parameter for skip reason (can be NULL)
+ *
+ * Returns: true if test should be skipped, false otherwise
+ */
+bool amdgpu_asic_should_skip(const struct amdgpu_gpu_info *gpu_info,
+                             const char *test_name,
+                             const char *subtest_name,
+                             enum skip_source *source,
+                             const char **reason);
+
+/**
+ * amdgpu_asic_filter_dump - Dump all skip rules from all sources
+ *
+ * Prints formatted output showing:
+ *   - Built-in array rules
+ *   - Config file rules
+ *   - Environment variable rules
+ *   - Current ASIC information
+ *
+ * Useful for debugging and verification.
+ */
+void amdgpu_asic_filter_dump(void);
+
+/**
+ * amdgpu_asic_filter_dump_to_file - Dump skip rules to file
+ * @filename: Output file path
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int amdgpu_asic_filter_dump_to_file(const char *filename);
+
+#endif /* AMD_ASIC_FILTER_H */
diff --git a/lib/meson.build b/lib/meson.build
index 0e7efadf3..8252d48cd 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -186,6 +186,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_mmd_shared.c',
 		'amdgpu/amd_jpeg_shared.c',
 		'amdgpu/amd_utils.c',
+		'amdgpu/amd_asic_filter.c',
 		'amdgpu/amd_vcn_shared.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 3ad023472..507fcc25e 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -18,6 +18,7 @@
 #include "lib/amdgpu/shaders/amd_shaders.h"
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
+#include "lib/amdgpu/amd_asic_filter.h"
 #include "lib/amdgpu/amd_utils.h"
 
 #define BUFFER_SIZE (8 * 1024)
@@ -883,6 +884,7 @@ int igt_main()
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+		amdgpu_asic_filter_init();
 	}
 	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
 	igt_subtest("memory-alloc")
@@ -956,6 +958,7 @@ int igt_main()
 
 	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
 	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
+		amdgpu_asic_require(&gpu_info, igt_test_name(), "cs-gfx-with-IP-GFX-UMQ");
 		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("cs-gfx-with-umq")
 			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
@@ -964,6 +967,7 @@ int igt_main()
 
 	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
 	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
+		amdgpu_asic_require(&gpu_info, igt_test_name(), "cs-compute-with-IP-COMPUTE-UMQ");
 		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("cs-compute-with-umq")
 			amdgpu_command_submission_compute(device, true);
@@ -972,6 +976,7 @@ int igt_main()
 
 	igt_describe("Check-sync-dependency-using-GFX-ring");
 	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
+		amdgpu_asic_require(&gpu_info, igt_test_name(), "sync-dependency-test-with-IP-GFX-UMQ");
 		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("sync-dependency-test-with-umq")
 			amdgpu_sync_dependency_test(device, true);
@@ -980,6 +985,7 @@ int igt_main()
 
 	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
 	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
+		amdgpu_asic_require(&gpu_info, igt_test_name(), "cs-sdma-with-IP-DMA-UMQ");
 		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("cs-sdma-with-umq")
 			amdgpu_command_submission_sdma(device, true);
@@ -988,6 +994,7 @@ int igt_main()
 
 	igt_describe("Check-all-user-queues-for-write-operation");
 	igt_subtest_with_dynamic("all-queues-test-with-UMQ") {
+		amdgpu_asic_require(&gpu_info, igt_test_name(), "all-queues-test-with-UMQ");
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
 				userq_arr_cap[AMD_IP_COMPUTE] &&
 				userq_arr_cap[AMD_IP_DMA]) {
@@ -998,6 +1005,7 @@ int igt_main()
 
 	igt_describe("Check-GFX-CS-FENCE_WAIT_MULTI-packet");
 	igt_subtest_with_dynamic("cs-gfx-fwm-UMQ") {
+		amdgpu_asic_require(&gpu_info, igt_test_name(), "cs-gfx-fwm-UMQ");
 		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("cs-gfx-fwm-umq")
 				amdgpu_fwm_test(device, AMDGPU_HW_IP_GFX);
@@ -1006,6 +1014,7 @@ int igt_main()
 
 	igt_describe("Check-COMPUTE-CS-FENCE_WAIT_MULTI-packet");
 	igt_subtest_with_dynamic("cs-compute-fwm-UMQ") {
+		amdgpu_asic_require(&gpu_info, igt_test_name(), "cs-compute-fwm-UMQ");
 		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("cs-compute-fwm-umq")
 				amdgpu_fwm_test(device, AMDGPU_HW_IP_COMPUTE);
-- 
2.53.0

