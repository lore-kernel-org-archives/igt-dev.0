Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1342F433DD
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 03:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE0710E7EF;
	Thu, 16 Apr 2026 03:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lx3EbvXA";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1926D10E7EF
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 03:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6tMAuIsHBxkH9Ilb0zb58FCCAIPZ0pyLRz3r8Ku4ObDnAZ8fnB5uoGT0sFWMDRaZAald0F4sCHxwcu18h+HgMIWEddoMslDHHVIdlsS468MjYiBxGRctPQSsJznBFD9ybIC3nYiDa2z5NEchQvlRWxKj2xkglgrEbaJ0ig+7oCKVTlDnvM39M55vz6qOwsFjPFkfzOsCNPDI0lIG/WGVsyLD1gneZ9/0Jj1TOP9U+t30ynPfe+nqWOCgBtK//cwcmvPtIvjtc+C4XNKj0H9n2hVg5IM4NPvvjJrHrwjHaILLkZovDgOQKd231JUV9y4V11Pl76Ox/XYiUayGFPAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0ay8zGVw0XLUzMHx+FxXtx19Hor5yMzl4KURW0NDns=;
 b=NwQxq2oK1IRJEfeIQVidij2Vl2rAujCIc7wQN/uaQlJY0fA77YDsMsc5KjVH5Xdqk6PG4benrAShXH73wlVKqstl3gZZyuaRRVrFfUbRVW9e+VlmYz+oZci6mA/knkDZZ+Fd0kSz2w7+dY5Et9ENOLWYAtkPvK4esoUlMI744z6VxHgq0uRQsG2Rd5pngxv1KeLRNgms7QKULDnElYkncTzdHTG7mkemC7yjFRy115xOLqxmXVzyj+wJ1heNVYkfZnYh64Sx+glyAhdeK8HbYcSPZSBCSRXOz85qh2VDt/VWnfohLBrm4VmXZHme2sufpbhS5IEmbL0ru86YVgUsag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0ay8zGVw0XLUzMHx+FxXtx19Hor5yMzl4KURW0NDns=;
 b=Lx3EbvXA1cDtebVOBkoCeXhFSizMl37EZxDn3kVsn/RG0Dio/3mmb5ewhxZTle5OJsFURLyXE50rBBG2AO1T25olcKRyY2u3WEJAKjivt+SdzW95DtfWj1Dz/R9BJ1mhRxf+kvFsVB83diSahJ+fG2id4mLQE3HESBO3ub8NfZs=
Received: from DS7PR03CA0256.namprd03.prod.outlook.com (2603:10b6:5:3b3::21)
 by DS2PR12MB9568.namprd12.prod.outlook.com (2603:10b6:8:27c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 16 Apr
 2026 03:35:33 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::52) by DS7PR03CA0256.outlook.office365.com
 (2603:10b6:5:3b3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Thu,
 16 Apr 2026 03:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 03:35:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 22:35:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 20:35:32 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 22:35:31 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: Add configuration-driven ASIC filtering system
Date: Wed, 15 Apr 2026 23:34:12 -0400
Message-ID: <20260416033518.29499-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DS2PR12MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: 97eb2b46-6f3a-4f39-bd49-08de9b693721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|18096099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 8QcPYHylKhjfVFATGr0W/zgAXu0y2nUWBAJFZgpX0ik5iaNhOrcPVsJXGus4Phgp+bLr6Cg4pvLI7hhQXPCI7WMoubfMYASGjk2hj2fpOBSI5rw5da7ikSJNpzt19UFpTv0fd7OYvdaC8g6+x1atc/aBpOW5D4+B8RYY0L1pL4kUwZ+s0K2f8ZscVto5Sfm3jf7YOUI44pRYc+cuYibpgyMUmMmMuN2Kf+HvU1WpNBGglyzAvHVpM5iUMZba0CeBQ8vFGpsG4JJxNsvBEw1N7HXfZvn7wquinDB7Pk0IAOtsiq0b3iVranYpK3Z+8NoP/0wVacFrfQEbRcnU4QXIoGRdmdGn+P6tInhInTITCIneQM1O0kzcLHKW6gZro1nDr7AGk6HM0YJP7hPBweuSXsEiNeVjs1gPR5w46fPKYcF9610yQDDYpGbuoDrQcRCYrwzu2gIQzqSaXO7TSQasQ7VKAudmOSdfCeYeAxWA0aLQNDd3kt2t9W1LMXNWQK4ZedBW+VrLKsa4IFvWQOGlI26mbgMGAE9wbk1qdFBi3/f0sdb2DZcqxYInT2TUpE308WVz/JEUaK/f1gLc+4ER1pp4l7qGbvBNriBFj7mXFweTGcGA9n0EiMM8nNSuCUWMIcCWuU9nI+81NqbIBv1BKD/YN7EjRRDp7EayrM/iY470F2lqqEMCFVx154IDQMOaf09obRaocaIBMgQJqNV2dhCInGUwmaVIakSJHR6NQY+3n3VIC57LQcK9R7eIZUk2Cfzl+nMJK4W3J+gNKKaIGw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18096099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8WXS/ziHU0/JTg8VyxF+0RoTUqpaVGkergUzKFi2j4vZAhM0i1rcjH67LVbkIeN1JEuM+9T4RmqmbU9EW5rXDFg8kAtAWhrFbOMbtwUpco4TdWLXV4nolUK9n0UPR7NAFHcFPuo28TOlGBtmgC+Mv8YxnANVGTzVPqiISpXrPIpuvV4qBO6rGWX6Q3xYv7Cn2eiR2L+/5aIsQV7UJYPXsmTL63XwjWGbvSJav5ZzQiLshoFfs6tZfvep6Dg+3gahGmkr0QsibURrkFjWcXBfxJQVwUmGLG3F53qpZBJP203rs9TeILOiGyr3vzVKrh+FXmwRoIRi7Ss2Rdj98bkzLzWUMjNnO4C5gymlaxF9x/3uyys6J9JeF+YDa44is1XRQdfnJdAOZI4cgnk7mmFPDYnjl+IPfIDkAbnl3rbHmxLsWI83RpVVD9TSk6MV66Qt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 03:35:33.1210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97eb2b46-6f3a-4f39-bd49-08de9b693721
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9568
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

Implement unified ASIC filtering with shared global configuration accessible
to all tests. Supports both global ASIC skips and fine-grained ASIC+subtest
combinations via configuration file.

Key Features:
- Config file format: asic:test:subtest (e.g., navi48:amd_basic:*-UMQ)
- Two skip modes:
  1. Skip entire ASIC: navi48:*:*
  2. Skip specific combinations: navi10:amd_basic:cs-gfx-*
- Shared global array (runtime_entries[]) accessible to all tests
- Glob pattern support for subtests: *-UMQ, cs-gfx-*, sync-*
- No environment variables required (CI provides config file)

Configuration Sources (priority order):
1. Runtime config file:
   - /etc/igt/asic_skip.conf (default)
   - /usr/local/etc/igt/asic_skip.conf (fallback)
   - Custom path via IGT_ASIC_SKIP_CONFIG env var
2. Compile-time skip table in amd_asic_filter.c

Compilation fixes:
- Added amdgpu_asic_addr.h include for FAMILY_* constants
- Fixed C90 mixed declarations warning
- Removed undefined FAMILY constants (GFX1151, GFX1152, RN, ST)
- Fixed indentation issues in amd_basic.c integration

Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_asic_filter.c | 408 +++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_asic_filter.h | 116 ++++++++++
 lib/meson.build              |   1 +
 tests/amdgpu/amd_basic.c     |   9 +
 4 files changed, 534 insertions(+)
 create mode 100644 lib/amdgpu/amd_asic_filter.c
 create mode 100644 lib/amdgpu/amd_asic_filter.h

diff --git a/lib/amdgpu/amd_asic_filter.c b/lib/amdgpu/amd_asic_filter.c
new file mode 100644
index 000000000..f13afafaf
--- /dev/null
+++ b/lib/amdgpu/amd_asic_filter.c
@@ -0,0 +1,408 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * ASIC-based test filtering - Configuration-driven implementation
+ */
+
+#include <ctype.h>
+#include <fnmatch.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <strings.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "amd_asic_filter.h"
+#include "amd_ip_blocks.h"
+#include "amdgpu_asic_addr.h"
+
+/* Default config file locations (checked in order) */
+static const char *default_config_paths[] = {
+	"/etc/igt/asic_skip.conf",
+	"/usr/local/etc/igt/asic_skip.conf",
+	NULL
+};
+
+/* Maximum runtime entries loaded from config file */
+#define MAX_RUNTIME_ENTRIES 256
+
+/* ------------------------------------------------------------------ */
+/*  Compile-time skip table                                           */
+/* ------------------------------------------------------------------ */
+static const struct asic_skip_entry asic_skip_table[] = {
+	/*
+	 * Example entries:
+	 *
+	 * Skip entire Navi48 for all tests:
+	 * ASIC_SKIP_ALL(navi48, FAMILY_GFX1200, 0x00, 0xFF,
+	 *               Navi48 not ready for testing),
+	 *
+	 * Skip UMQ tests on Navi48:
+	 * ASIC_SKIP(amd_basic, *-UMQ, navi48,
+	 *           FAMILY_GFX1200, 0x00, 0xFF,
+	 *           UMQ not supported on Navi48),
+	 *
+	 * Skip specific subtest on Navi10:
+	 * ASIC_SKIP(amd_basic, cs-compute-with-IP-COMPUTE-UMQ, navi10,
+	 *           FAMILY_NV, 0x31, 0x31,
+	 *           Compute UMQ hangs on Navi10),
+	 */
+
+	/* Sentinel - must be last */
+	{ NULL, NULL, NULL, NULL, 0, 0, 0 },
+};
+/* ------------------------------------------------------------------ */
+/*  Runtime configuration storage                                     */
+/* ------------------------------------------------------------------ */
+
+static struct asic_skip_entry runtime_entries[MAX_RUNTIME_ENTRIES];
+static int runtime_entry_count = 0;
+static bool filter_initialized = false;
+
+/* ASIC name to family/chip mapping */
+struct asic_info {
+	const char *name;
+	int family_id;
+	int chip_id_min;
+	int chip_id_max;
+};
+
+static const struct asic_info asic_info_table[] = {
+	/* GFX12 */
+	{ "navi48", FAMILY_GFX1200, 0x00, 0xFF },
+	{ "navi44", FAMILY_GFX1200, 0x00, 0xFF },
+
+	/* GFX11.5 */
+	{ "gfx1150", FAMILY_GFX1150, 0x00, 0xFF },
+	{ "gfx1151", FAMILY_GFX1150, 0x00, 0xFF },
+	{ "gfx1152", FAMILY_GFX1150, 0x00, 0xFF },
+
+	/* GFX11 */
+	{ "gfx1100", FAMILY_GFX1100, 0x00, 0xFF },
+	{ "gfx1103", FAMILY_GFX1103, 0x00, 0xFF },
+	{ "navi31", FAMILY_GFX1100, 0x00, 0xFF },
+	{ "navi32", FAMILY_GFX1100, 0x00, 0xFF },
+	{ "navi33", FAMILY_GFX1103, 0x00, 0xFF },
+
+	/* GFX10.3 */
+	{ "yellow_carp", FAMILY_YC, 0x00, 0xFF },
+	{ "beige_goby", FAMILY_NV, 0x00, 0xFF },
+	{ "dimgrey_cavefish", FAMILY_NV, 0x00, 0xFF },
+
+	/* GFX10 - Navi family */
+	{ "navi10", FAMILY_NV, 0x31, 0x31 },
+	{ "navi12", FAMILY_NV, 0x41, 0x41 },
+	{ "navi14", FAMILY_NV, 0x47, 0x47 },
+	{ "navi21", FAMILY_NV, 0x00, 0xFF },
+	{ "navi22", FAMILY_NV, 0x00, 0xFF },
+	{ "navi23", FAMILY_NV, 0x00, 0xFF },
+	{ "navi24", FAMILY_NV, 0x00, 0xFF },
+	{ "sienna_cichlid", FAMILY_NV, 0x00, 0xFF },
+	{ "navy_flounder", FAMILY_NV, 0x00, 0xFF },
+	{ "vangogh", FAMILY_VGH, 0x00, 0xFF },
+	{ "cyan_skillfish", FAMILY_NV, 0x00, 0xFF },
+
+	/* CDNA */
+	{ "aldebaran", FAMILY_AI, 0x00, 0xFF },
+	{ "arcturus", FAMILY_AI, 0x00, 0xFF },
+
+	/* GFX9 - Vega family */
+	{ "vega10", FAMILY_AI, 0x00, 0xFF },
+	{ "vega12", FAMILY_AI, 0x00, 0xFF },
+	{ "vega20", FAMILY_AI, 0x00, 0xFF },
+	{ "raven", FAMILY_RV, 0x00, 0xFF },
+	{ "raven2", FAMILY_RV, 0x00, 0xFF },
+	{ "renoir", FAMILY_RV, 0x00, 0xFF },
+
+	/* GFX8 - Polaris/Fiji family */
+	{ "fiji", FAMILY_VI, 0x00, 0xFF },
+	{ "polaris10", FAMILY_VI, 0x00, 0xFF },
+	{ "polaris11", FAMILY_VI, 0x00, 0xFF },
+	{ "polaris12", FAMILY_VI, 0x00, 0xFF },
+	{ "tonga", FAMILY_VI, 0x00, 0xFF },
+	{ "topaz", FAMILY_VI, 0x00, 0xFF },
+	{ "carrizo", FAMILY_CZ, 0x00, 0xFF },
+	{ "stoney", FAMILY_CZ, 0x00, 0xFF },
+
+	{ NULL, 0, 0, 0 }
+};
+
+/* ------------------------------------------------------------------ */
+/*  Helper functions                                                  */
+/* ------------------------------------------------------------------ */
+
+/* Get ASIC info by name (case-insensitive) */
+static const struct asic_info *get_asic_info(const char *name)
+{
+	const struct asic_info *info;
+
+	if (!name)
+		return NULL;
+
+	for (info = asic_info_table; info->name; info++) {
+		if (strcasecmp(name, info->name) == 0)
+			return info;
+	}
+
+	return NULL;
+}
+
+/* Parse config file line: asic:test:subtest */
+static bool parse_config_line(const char *line, struct asic_skip_entry *entry)
+{
+	char buf[512];
+	char *asic, *test, *subtest;
+	char *end;
+	const struct asic_info *info;
+
+	/* Skip comments and empty lines */
+	while (isspace(*line))
+		line++;
+	if (*line == '#' || *line == '\0')
+		return false;
+
+	/* Copy to modifiable buffer */
+	strncpy(buf, line, sizeof(buf) - 1);
+	buf[sizeof(buf) - 1] = '\0';
+
+	/* Remove trailing whitespace/newline */
+	end = buf + strlen(buf) - 1;
+	while (end > buf && isspace(*end))
+		*end-- = '\0';
+
+	/* Parse: asic:test:subtest */
+	asic = buf;
+	test = strchr(asic, ':');
+	if (!test)
+		return false;
+	*test++ = '\0';
+
+	subtest = strchr(test, ':');
+	if (!subtest)
+		return false;
+	*subtest++ = '\0';
+
+	/* Translate wildcards */
+	if (strcmp(asic, "*") == 0)
+		asic = NULL;
+	if (strcmp(test, "*") == 0)
+		test = NULL;
+	if (strcmp(subtest, "*") == 0)
+		subtest = NULL;
+
+	/* Get ASIC family/chip info */
+	if (asic) {
+		info = get_asic_info(asic);
+		if (!info) {
+			igt_warn("Unknown ASIC '%s' in config, skipping\n", asic);
+			return false;
+		}
+		entry->asic_name = strdup(asic);
+		entry->family_id = info->family_id;
+		entry->chip_id_min = info->chip_id_min;
+		entry->chip_id_max = info->chip_id_max;
+	} else {
+		entry->asic_name = NULL;
+		entry->family_id = 0;
+		entry->chip_id_min = 0;
+		entry->chip_id_max = 0xFF;
+	}
+
+	entry->test_name = test ? strdup(test) : NULL;
+	entry->subtest_glob = subtest ? strdup(subtest) : NULL;
+	entry->reason = strdup("From config file");
+
+	return true;
+}
+
+/* Load configuration from file */
+static void load_config_file(const char *path)
+{
+	FILE *fp;
+	char line[512];
+	struct asic_skip_entry entry;
+
+	fp = fopen(path, "r");
+	if (!fp)
+		return;
+
+	igt_debug("Loading ASIC skip config from %s\n", path);
+
+	while (fgets(line, sizeof(line), fp)) {
+		if (runtime_entry_count >= MAX_RUNTIME_ENTRIES) {
+			igt_warn("Max runtime entries reached, ignoring rest\n");
+			break;
+		}
+
+		memset(&entry, 0, sizeof(entry));
+		if (parse_config_line(line, &entry)) {
+			runtime_entries[runtime_entry_count++] = entry;
+			igt_debug("  Loaded: %s:%s:%s\n",
+			          entry.asic_name ? entry.asic_name : "*",
+			          entry.test_name ? entry.test_name : "*",
+			          entry.subtest_glob ? entry.subtest_glob : "*");
+		}
+	}
+
+	fclose(fp);
+}
+
+/* ------------------------------------------------------------------ */
+/*  Public API                                                        */
+/* ------------------------------------------------------------------ */
+
+void amdgpu_asic_filter_init(void)
+{
+	const char *config_path;
+	int i;
+
+	if (filter_initialized)
+		return;
+
+	/* Check for environment override */
+	config_path = getenv("IGT_ASIC_SKIP_CONFIG");
+	if (config_path) {
+		load_config_file(config_path);
+	} else {
+		/* Try default paths */
+		for (i = 0; default_config_paths[i]; i++) {
+			if (access(default_config_paths[i], R_OK) == 0) {
+				load_config_file(default_config_paths[i]);
+				break;
+			}
+		}
+	}
+
+	filter_initialized = true;
+}
+
+void amdgpu_asic_filter_reload(void)
+{
+	int i;
+
+	/* Free runtime entries */
+	for (i = 0; i < runtime_entry_count; i++) {
+		free((void *)runtime_entries[i].asic_name);
+		free((void *)runtime_entries[i].test_name);
+		free((void *)runtime_entries[i].subtest_glob);
+		free((void *)runtime_entries[i].reason);
+	}
+	runtime_entry_count = 0;
+	filter_initialized = false;
+
+	amdgpu_asic_filter_init();
+}
+
+bool amdgpu_asic_should_skip(const struct amdgpu_gpu_info *gpu_info,
+                             const char *test_name,
+                             const char *subtest_name)
+{
+	const struct asic_skip_entry *entry;
+	int i;
+
+	if (!filter_initialized)
+		amdgpu_asic_filter_init();
+
+	/* Check runtime entries first */
+	for (i = 0; i < runtime_entry_count; i++) {
+		entry = &runtime_entries[i];
+
+		/* Check family/chip match */
+		if (entry->family_id != 0 &&
+		    entry->family_id != gpu_info->family_id)
+			continue;
+
+		if (entry->chip_id_min != 0 || entry->chip_id_max != 0xFF) {
+			int chip_rev = gpu_info->chip_rev;
+			if (chip_rev < entry->chip_id_min ||
+			    chip_rev > entry->chip_id_max)
+				continue;
+		}
+
+		/* Check test name match */
+		if (entry->test_name && test_name &&
+		    strcmp(entry->test_name, test_name) != 0)
+			continue;
+
+		/* Check subtest glob match */
+		if (entry->subtest_glob && subtest_name) {
+			if (fnmatch(entry->subtest_glob, subtest_name, 0) != 0)
+				continue;
+		}
+
+		/* Match found */
+		return true;
+	}
+
+	/* Check compile-time table */
+	for (entry = asic_skip_table; entry->asic_name || entry->test_name; entry++) {
+		/* Check family/chip match */
+		if (entry->family_id != 0 &&
+		    entry->family_id != gpu_info->family_id)
+			continue;
+
+		if (entry->chip_id_min != 0 || entry->chip_id_max != 0xFF) {
+			int chip_rev = gpu_info->chip_rev;
+			if (chip_rev < entry->chip_id_min ||
+			    chip_rev > entry->chip_id_max)
+				continue;
+		}
+
+		/* Check test name match */
+		if (entry->test_name && test_name &&
+		    strcmp(entry->test_name, test_name) != 0)
+			continue;
+
+		/* Check subtest glob match */
+		if (entry->subtest_glob && subtest_name) {
+			if (fnmatch(entry->subtest_glob, subtest_name, 0) != 0)
+				continue;
+		}
+
+		/* Match found */
+		return true;
+	}
+
+	return false;
+}
+
+void amdgpu_asic_require(const struct amdgpu_gpu_info *gpu_info,
+                         const char *test_name,
+                         const char *subtest_name)
+{
+	if (amdgpu_asic_should_skip(gpu_info, test_name, subtest_name)) {
+		igt_skip("Skipped on this ASIC by filter configuration\n");
+	}
+}
+
+void amdgpu_asic_filter_dump(void)
+{
+	const struct asic_skip_entry *entry;
+	int i;
+
+	printf("=== ASIC Filter Configuration ===\n\n");
+
+	printf("Compile-time entries:\n");
+	for (entry = asic_skip_table; entry->asic_name || entry->test_name; entry++) {
+		printf("  %s:%s:%s - %s\n",
+		       entry->asic_name ? entry->asic_name : "*",
+		       entry->test_name ? entry->test_name : "*",
+		       entry->subtest_glob ? entry->subtest_glob : "*",
+		       entry->reason ? entry->reason : "no reason");
+	}
+
+	if (runtime_entry_count > 0) {
+		printf("\nRuntime entries (%d):\n", runtime_entry_count);
+		for (i = 0; i < runtime_entry_count; i++) {
+			entry = &runtime_entries[i];
+			printf("  %s:%s:%s - %s\n",
+			       entry->asic_name ? entry->asic_name : "*",
+			       entry->test_name ? entry->test_name : "*",
+			       entry->subtest_glob ? entry->subtest_glob : "*",
+			       entry->reason ? entry->reason : "no reason");
+		}
+	}
+
+	printf("\n");
+}
diff --git a/lib/amdgpu/amd_asic_filter.h b/lib/amdgpu/amd_asic_filter.h
new file mode 100644
index 000000000..dfad7e00d
--- /dev/null
+++ b/lib/amdgpu/amd_asic_filter.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_ASIC_FILTER_H
+#define AMD_ASIC_FILTER_H
+
+#include "amd_ip_blocks.h"
+
+/**
+ * ASIC-based test filtering - Configuration-driven approach
+ * 
+ * This system supports two types of skip rules:
+ * 1. Skip entire ASIC (all tests/subtests)
+ * 2. Skip specific ASIC + test + subtest combinations
+ * 
+ * Configuration is loaded from:
+ *   1. Built-in compile-time table (asic_skip_table[])
+ *   2. Runtime config file: /etc/igt/asic_skip.conf (if exists)
+ *   3. Environment override: IGT_ASIC_SKIP_CONFIG (path to config file)
+ * 
+ * Config file format (line-based, # for comments):
+ *   # Skip ALL tests/subtests on ASIC
+ *   navi48:*:*
+ *   
+ *   # Skip all subtests in specific test on ASIC
+ *   navi10:amd_basic:*
+ *   
+ *   # Skip specific subtest pattern on ASIC
+ *   navi14:amd_basic:*-UMQ
+ *   navi10:amd_userq_abort:cs-gfx-*
+ *   
+ *   # Skip exact subtest on ASIC
+ *   navi48:amd_basic:cs-gfx-with-IP-GFX-UMQ
+ */
+
+/* Skip entry structure */
+struct asic_skip_entry {
+	const char *asic_name;      /* ASIC name (e.g., "navi48") or NULL for any */
+	const char *test_name;      /* Test binary name (e.g., "amd_basic") or NULL for any */
+	const char *subtest_glob;   /* Subtest pattern (fnmatch) or NULL for any */
+	const char *reason;         /* Human-readable reason */
+	int family_id;              /* AMDGPU family ID or 0 for any */
+	int chip_id_min;            /* Min chip ID in range or 0 */
+	int chip_id_max;            /* Max chip ID in range or 0xFF */
+};
+
+/**
+ * amdgpu_asic_filter_init - Initialize the filtering system
+ * 
+ * Call once in igt_fixture after setup_amdgpu_ip_blocks().
+ * Loads configuration from built-in table and optional config file.
+ */
+void amdgpu_asic_filter_init(void);
+
+/**
+ * amdgpu_asic_require - Check if current test should run on this ASIC
+ * @gpu_info: GPU information structure
+ * @test_name: Test binary name (use igt_test_name())
+ * @subtest_name: Subtest name (from igt_subtest_with_dynamic)
+ * 
+ * Checks skip configuration and calls igt_skip() if test should be skipped.
+ * Call at the beginning of each subtest.
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
+ * 
+ * Returns: true if test should be skipped, false otherwise
+ * Use for programmatic checks without triggering igt_skip().
+ */
+bool amdgpu_asic_should_skip(const struct amdgpu_gpu_info *gpu_info,
+                             const char *test_name,
+                             const char *subtest_name);
+
+/**
+ * amdgpu_asic_filter_reload - Reload configuration from file
+ * 
+ * Forces reload of config file. Useful for testing or dynamic config updates.
+ */
+void amdgpu_asic_filter_reload(void);
+
+/**
+ * amdgpu_asic_filter_dump - Print current filter configuration
+ * 
+ * Dumps all active skip rules to stdout. Useful for debugging.
+ */
+void amdgpu_asic_filter_dump(void);
+
+/* Convenience macros for compile-time skip table */
+
+/* Skip specific ASIC + chip range for test + subtest pattern */
+#define ASIC_SKIP(test, sub, asic, fam, chip_min, chip_max, reason) \
+	{ .asic_name = asic, .test_name = test, .subtest_glob = sub, \
+	  .reason = reason, .family_id = fam, \
+	  .chip_id_min = chip_min, .chip_id_max = chip_max }
+
+/* Skip entire ASIC family (all chip IDs) */
+#define ASIC_SKIP_FAMILY(test, sub, asic, fam, reason) \
+	{ .asic_name = asic, .test_name = test, .subtest_glob = sub, \
+	  .reason = reason, .family_id = fam, \
+	  .chip_id_min = 0x00, .chip_id_max = 0xFF }
+
+/* Skip entire ASIC for all tests */
+#define ASIC_SKIP_ALL(asic, fam, chip_min, chip_max, reason) \
+	{ .asic_name = asic, .test_name = NULL, .subtest_glob = NULL, \
+	  .reason = reason, .family_id = fam, \
+	  .chip_id_min = chip_min, .chip_id_max = chip_max }
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

