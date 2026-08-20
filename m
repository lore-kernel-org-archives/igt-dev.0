Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDE3C5B572
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 01:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C27A10E10F;
	Thu, 20 Aug 2026 01:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PKGg6h3H";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012070.outbound.protection.outlook.com
 [40.107.200.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA9610E114
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 01:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnx5+QfVM/cGr1t6P+e+4MMdoXCUbcu/H3leZ5NGZgbnRlA59J1ctPPcH9ZLwFJFneSN6ocNNP8qYnM62ga8JTd/zLO5LYkpAlPMF1TtAau9JqCB/oz66jRnrKFXjQFrDEnGA1yae6pKq8LlkCBiGGDNrCqGLrfXRR3CtUQurM+FwxLIvdD31uBaTJZ8/vcVB/UPqCuyQNYfABYIe0ov1ZtdqJ7pohNF7FSHMGSHRZN713XaKWuB63TdTVnE5umcwn2NpSGfBf4EGqw0rK9DYhIDU89BIce7muILAzDOSITfjXx5OL9nJPa4ksktB8zevdW1l0wv5eZCHoKoQWyVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iop0Xgpp06ZipQpH1eHlgLhCnyz6e9PS/g03eqw9OE=;
 b=n7gJMjEKnQyJocJ7keNxfgzklCPOaX8IB3kfD6GlVzo7KFf1R3xN60RmPZj+dVVFyrDLwAAp5AFldVRjBLvspsR2ZpP7XwT8Y5/aNElvxasbM9fa4qrTwaSq3xfW3z6fKraICi7m+rhAXoFXXLjiCIkSaOkSZQCmDV/BSEJeQ+qYfZ+m6ekNNdydkqQZDEe/VFeRdBiZFQjy8LpYqQLwotawYv2IG+DoAjRwg6Y5uL3GzMsMUxaiL9sqM2iKYbilDh/VLMTOkVvXDuLfZsVA/6gPnFWfiA5O4J2I83L555BPJ+Tjt9p3jEzmfaBhX1cHbh7o1/y8RsU9xvsilWyRTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iop0Xgpp06ZipQpH1eHlgLhCnyz6e9PS/g03eqw9OE=;
 b=PKGg6h3HdVnKg1rttfJtht6ebahOIJNxePsFzs2SECdMVKeyNXQUc/Sz/PwPvl1CuFbfRtRlsU3q04bcXB7A+bwAu7pjwgMzWwbRdL9iri1AcNimQWcs9nK56aeJuWoMALUNlU3/xyxVHiGxRrpey6rVLghOg3Pzh5kSLbAuKSk=
Received: from BN0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:408:141::13)
 by CH3PR12MB8971.namprd12.prod.outlook.com (2603:10b6:610:177::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 01:28:27 +0000
Received: from BN2PEPF0000A7FF.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::2c) by BN0PR07CA0030.outlook.office365.com
 (2603:10b6:408:141::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 01:28:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A7FF.mail.protection.outlook.com (10.167.245.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 01:28:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 20:28:25 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 20:28:24 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <jani.nikula@linux.intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.kozlowski@canonical.com>,
 <jesse.zhang@amd.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, "Pawel
 Sikora" <pawel.sikora@intel.com>
Subject: [PATCH v6 0/4] lib: Add generic platform filtering framework for IGT
Date: Wed, 19 Aug 2026 21:27:15 -0400
Message-ID: <20260820012820.129589-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FF:EE_|CH3PR12MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a066b7-7607-48d6-4f56-08defe5a55d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: ew1fOcELHuGsr6ebCx8KI+V3Bf/hhpWU9TOBa7mkWXzq+WSYy3GfQgfp1J2RlnnTXc44Mqy19AKCtBsE4xtDAIO/n3dVzonLBTyzB8VvM7yiwOJ5z4UD1uQ9Ct7ho/C6/fnFCp2+ZJzg0nz/STJmucjDAwjtsbBmZ35b4RryxcW/7r7K5goqlPHixkwmWEObeIFtej5IcNz3ElDPW+I29dwPdQjMRpPWo9vKyB396KScWLLVoV21dv8rn484oDhWL4TqZWsxaJ+ZPog/YnWRrooEcbIu+ytypk7ZiFQF1uwTfcnDetBFYWemtS+ef1gUra2XCf8mRRVe6CM34xrnbzXiKe1OSuPALjenjqbsn98PcX+JrxnivxDYNcLYsNypjIboK6gipBEd45lFztX5B3ptV0EeFTCv3irPpGyfrGgJIK1E3UVkWuPR2WILrGYYoHDBZldiz7r/5yylIAZ9P+MRGPL6kVlhcnAGxtexIFy/Pe1cyRbmVfzb+wkJZt3bAyiiZSqziqnDj1sF4pLNcFRYYxQFx0d8ZyUFTD+JcVViosl0r2OPDdORjKyPYGvtb/f1pt5tEDCP714odoSrh9pRSxRgvcklJrrLNID5Acc5lvus/Zp/1CEWvFCtK6CEuqAPRFgtZdq1IoZoVI/HUnCHZZpkq24JrNqep68yvLBEgpDd+AazZbkJM/0Db1Z24QTwqOtFr0ClsBDwwaqT1A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JWS4KDt2Voog3fgPKvDATkvKWXjXqcEo9W/MEXpc0Vivhu5ObeCnJY6PhdO+xmqZS4+wBD2tmzYcsE7k/hFnNpHJPSQACItiZzW7LlgbdlDWNBVG9syqjLMOZ2IbHs6k8VU45llPIRGl7R7gVEPlGyzgnBOnDhWN/ri8Jc1HGE9ZBQiPUqFH8uNMVdw1HEproPYBVp566rDtAykKY0pcbFN3h9p7nXu981eKgDYg3o1cCLuNhC/0/fjHZAuvIU4OBF6m0BqjjYzRH72FKcDFhhzhNNgCJ6R2hCxh6Ak5I4hhfmS6kxqTWnIcBEbcWl0ygX2MoWMM2oHnaTOnqDd4o2vqMyCWtUNB1dDTWbQi4yXOZWLiv54PWGCEcQB0ar2Juy6bJ2rW0e7SRV1fruwMKySkrPfGZXWVpjadjL6n+NZTDQcAcsr/ln2JZhpu7FBH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 01:28:27.3377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a066b7-7607-48d6-4f56-08defe5a55d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A7FF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8971
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

This series introduces a vendor-agnostic platform filtering framework
for IGT that allows tests to automatically skip based on hardware
platform rules, without requiring manual igt_skip() calls in each
subtest.

The framework uses a callback-based design (platform_filter_ops) so
any vendor can plug in their own backend without modifying the core.
AMD support is included as the first backend.

Patch overview:
  1/4 - lib: Generic framework (platform_filter_ops interface,
        built-in/config/env priority tiers, automatic subtest hook)
  2/4 - lib/amdgpu: AMD backend (ASIC identification, name table,
        built-in skip rules, amd_platform_filter_init())
  3/4 - lib/igt_core: Hook into __igt_run_subtest() for automatic
        filtering without manual igt_platform_require() calls
  4/4 - docs: Platform filtering usage guide

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Pawel Sikora <pawel.sikora@intel.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
v6 changes (checkpatch run from igt-gpu-tools/ using .checkpatch.conf):
- Remove unnecessary braces from single-statement if blocks (patch 1)
- Split igt_info line exceeding 100 columns (patch 1)
- Fix block comment closing style in .c files (patches 1 and 2)
- Fix parameter alignment in function definitions and declarations
- Remove Change-Id metadata from all commit messages
- Add Acked-by: Kamil Konieczny to patches 1 and 4

v5 changes (addressing Kamil Konieczny review):
- Replaced emoji with ASCII equivalents in documentation
- Removed Gerrit Change-Id metadata
- Restructured commit messages per upstream standards
- Added Pawel Sikora to Cc

Vitaly Prosyak (4):
  lib: Add generic platform filtering framework
  lib/amdgpu: Add AMD platform filtering backend
  lib/igt_core: Enable automatic platform filtering in subtest execution
  docs: Update platform filtering documentation per review feedback

 docs/platform_filtering.md | 351 ++++++++++++++++++++++
 lib/amdgpu/amd_platform.c  | 330 +++++++++++++++++++++
 lib/amdgpu/amd_platform.h  |  53 ++++
 lib/igt_core.c             |  18 +-
 lib/igt_platform_filter.c  | 575 +++++++++++++++++++++++++++++++++++++
 lib/igt_platform_filter.h  | 124 ++++++++
 lib/meson.build            |   2 +
 mkdocs.yml                 |   1 +
 8 files changed, 1453 insertions(+), 1 deletion(-)
 create mode 100644 docs/platform_filtering.md
 create mode 100644 lib/amdgpu/amd_platform.c
 create mode 100644 lib/amdgpu/amd_platform.h
 create mode 100644 lib/igt_platform_filter.c
 create mode 100644 lib/igt_platform_filter.h

-- 
2.54.0

