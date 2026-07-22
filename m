Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CEEC4452D
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 02:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C74C10E3DC;
	Wed, 22 Jul 2026 02:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RWmLOwrD";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012006.outbound.protection.outlook.com
 [40.107.200.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7010E3DC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 02:22:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGCIn7O5WGulhYUOGSvgVYX54dDg8nusUxJleZGqI1DR6mHi9Bjy2bOee81pCLialMl9aSOtL/1dXcuexkLAB04ZtA3OkTYraMxC/DiUq0RkW6CMz1/SgKTwLJgjB/hbWrbPMpH1gUOvfFsMCMirXaL0HXQTAP4yKIQocXaHrEaIaXbnSP+IWeO41ZIxqSeOPKmroZM2L9QsmAXwSXeuH6IZdSlmDAzNWUdyfW6F9C03Zu3JGvbICBqW7WzJ1/kjSNirIM6FVUvxl4kG1hfSNN0otJG5HMVTtQ1nOtPlO7n5x3reDxCJszNfW8b7Oop4ewDj877745h30vXcyPvoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLehTx6uCl3oB5wp6VXMo94jn7nolnSQPjUvLwpugRo=;
 b=lip5JX0jFy0oqoAkIBZWRwUQMy9iFauZWe038OoDgGpEJHnLO77zMqirIFiVT6P5oq5M0TnTSCCgNkezWIKhc5mvdRQOxGnQuViV9bTBiSJ1kkBXs4255SwzEboojO/t2USkGjpJ3zKQs0emPD9ZZVq935DKZNryokBvG77qGAjKckL1TeuWvQwwGQ3wXG0Zg/42THmL1pjFKsL4NXJqh6/eE7Hq7bv/Z6Eh778RvDvsabrdyPvKIIQxfN+lc3uUNwe/O0/a8ONDm6FFk2cIRJ/DRL9Y3CEEs8cuSPPgU1nhRbIeg5a73NDIsxbaybxR8Fgc3KnoLJBk/D998O4ODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLehTx6uCl3oB5wp6VXMo94jn7nolnSQPjUvLwpugRo=;
 b=RWmLOwrD3ybWTDcvhdyM5qLRoWRvBW6SPMO+uXDc7+8a/pyXNY8A7ie9UdF0/YAQYivfP3znJ1NXBl1/dXDdND+roy3rx1Kjx7yEdRKFEW7X5AqxzsLBZKSsEEwY4OjfjP7au3T+a4gBqd7OHzVQ49R7zZECfpdFXl3bT7TVk64=
Received: from PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::12)
 by BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:21:55 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::9) by PH5P222CA0001.outlook.office365.com
 (2603:10b6:510:34b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 02:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 02:21:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 21:21:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 21:21:53 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 21 Jul 2026 21:21:53 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Jesse Zhang <jesse.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH v4 0/5] Generic platform filtering framework with AMD backend
Date: Tue, 21 Jul 2026 22:21:33 -0400
Message-ID: <20260722022150.191615-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|BL1PR12MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f97d050-acf4-4e2b-0189-08dee797ff81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 0jHwhDTc8q+nRKoqDxbJPT8KKLuw3kfS6REEBzuIwFfBflrpTPTJGSmVK/3pKo7sUyjKcUjzxgR8ZVOKtPVglRgTSby1J7Kcd7mRMugZd/NBBwMFW3OIgZV8xBPVCFBn3F6zjinUYLOER1pgQvLCxX4Y4J/zaZabPPsLbqY8jrcESm7bhd/zmVuFAXaioIcHMFxhTUovsAfl1tYWLdNM1aiBQ0PaU/Fgc+DmT4mBk/fvEYs2aR9htYYejWQC4j7TjNELXo/gzKSpEZaakdOItlURoPqjSWGHYLx/56tubW/qz86CuXKXvWq971gGTm7YEARW3lxB2kvNbMSeFQPMyQ92haNdoSmk+mIrj2QtWS6L+FALqo97XIaRZYi+0bP3eHRMr1IhnaptJyrn+h0emg3kPt40U9QI425SnOogbnCioQXLL3thvW5rCg7UZqxsbTUOVjq4+nzW8A1kYnaJVbFDbGVa9baDNWe88XXmxGfrZFK7m9V6IK3n6+fahcZ3w/BqbTD8yA6fEsno4Vz9QKWhAwui264BJzmxy+aCR+TmeoKVvMProaY1RHdMBkjQdBLxXyz6pTl9678vvJNZr+Un06cN6UIkwcGKBKUdPgqeSwlz3/imkXeWNuCSnJfcEgLHbtTIqrRO/iu8XWHVatpP6Q30pf+2yNLTGwYkpLOBmwyxBMCTlc72pBQ8zV4sp38NnloiuM+aXmdCQ2wugQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t01HBzsIlvos2dUifMOUElgujsVD05KF2Gsz/72hvA1BD5codg4Mgo8x5apEruU3sv+wE2iT8B5x1NzXQOgHCKmrHH7kV+pfFGcJ87yo76bhJrGDhpPppKGNbSD0t9Pmng+C+euYw0yUstIpMg2kwoupLxgUXqKm6yCFv+IX7Wrje5PqClJPwf0fyKGmY4G6DWIUpkg0RYutXV8SHgz8FLQmGck2TAF3icS8brTgK2HfHXaJu+IdOFy0LvlVipDoRmIdZG8s0jcwBz9Lyi4eYV+vFLPY012Ow7pmtladAoeMutQwYqKAzUYd+HEL73mD2vaZTJbZe8UtOE8HImlcm88FaP8HFryo0m0UdIV/UcwKIFAucHQsd7IPYFHALTvV3tJkN2KoL/Sjp2SsweMRTX9CfmbnR1SLdsfsQd3t0PXMHzj1FJyX7/ivnALc/+b+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:21:54.5025 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f97d050-acf4-4e2b-0189-08dee797ff81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5969
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

This series implements a vendor-agnostic platform filtering framework
for IGT, allowing test skipping based on platform characteristics.

Changes in v4 (addressing Krzysztof Karas detailed review of v3):
====================================================================
- Fixed documentation comment placement - ALL moved before functions
- Reorganized commit message for clarity (v4 changes listed first)
- Added prominent note that patch 1/5 is generic (no vendor code)
- Proper [PATCH v4 X/Y] format using git format-patch --subject-prefix
- Addressed process feedback: waited 12 days between v3 and v4

Code quality fixes in v4:
- lib/igt_platform_filter.c: Moved 4 doc comments before functions
  (igt_platform_should_skip, igt_platform_require, 
   igt_platform_filter_dump, igt_platform_filter_dump_to_file)
- All commit messages: Separated "vN changes" from "design rationale"
- Patch 1/5: Added prominent note about generic/vendor-agnostic nature

Changes in v3 (addressing Kamil Konieczny's review):
=====================================================
- Squashed header and implementation into single commit
- Removed "Function prototypes..." comment from header
- Added comprehensive documentation (patch 5/5)
- Automatic filtering via __igt_run_subtest() hook (patch 4/5)
- Fixed code style (SPDX, include order, checkpatch clean)
- Removed unnecessary newlines before single-statement returns

Key features (unchanged since v3):
===================================
- Vendor-agnostic callback-based design (any vendor can plug in)
- Three-tier priority: built-in > config file > env variable
- Automatic filtering via __igt_run_subtest() hook (no manual calls)
- Comprehensive documentation with real-world examples

Design rationale (from original RFC discussion):
=================================================

This implementation addresses feedback from multiple reviewers on the
original RFC patch series.

Jani Nikula requested vendor-agnostic design:
  "I would have expected an attempt to make an IGT shared filtering
   system generic enough to plug into any vendor's platforms."

   Resolution: Implemented platform_filter_ops callback structure
   allowing any vendor (Intel, AMD, Qualcomm, etc.) to provide their
   own backend without modifying core framework.

Kamil Konieczny requested config file as primary method:
  "Add also example with config file as env vars are not convenient
   for large tests lists"

   Resolution: Patch 5/5 documentation shows config file as
   RECOMMENDED method with wildcards, real-world examples, and
   best practices.

Kamil Konieczny requested automatic filtering:
  "imho you can get test name in require, no need to repeat it"

   Resolution: Went further - patch 4/5 adds __igt_run_subtest() hook.
   Tests don't call igt_platform_require() at all - filtering is
   completely automatic. Zero manual calls needed in subtests.

Series structure:
=================
Patch 1/5: Generic framework (vendor-agnostic, NO AMD code)
Patch 2/5: AMD backend implementation (separate from core)
Patch 3/5: Initialization check (safety layer)
Patch 4/5: Automatic filtering hook (__igt_run_subtest)
Patch 5/5: Documentation (config examples, API usage)

Testing:
========
Tested on:
- AMD Navi48 (family_id 0x96, chip_rev 0x02)
- AMD Navi10 (family_id 0x8F, chip_rev 0x00)

All three priority levels verified working.
Automatic filtering verified - no manual calls needed.
checkpatch.pl clean.
No compiler warnings.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>

Vitaly Prosyak (5):
  lib: Add generic platform filtering framework
  lib/amdgpu: Add AMD platform filtering backend
  lib: Add platform filter initialization check for automatic filtering
  lib/igt_core: Enable automatic platform filtering in subtest
    execution
  docs: Update platform filtering documentation per review feedback

 docs/platform_filtering.md    | 245 +++++++++++++++++
 lib/amdgpu/amd_platform.c     | 187 +++++++++++++
 lib/amdgpu/amd_platform.h     |  32 +++
 lib/amdgpu/meson.build        |   2 +
 lib/igt_core.c                |  17 +-
 lib/igt_platform_filter.c     | 565 ++++++++++++++++++++++++++++++++++++++
 lib/igt_platform_filter.h     | 122 ++++++++
 lib/meson.build               |   1 +
 8 files changed, 1170 insertions(+), 1 deletion(-)
 create mode 100644 docs/platform_filtering.md
 create mode 100644 lib/amdgpu/amd_platform.c
 create mode 100644 lib/amdgpu/amd_platform.h
 create mode 100644 lib/igt_platform_filter.c
 create mode 100644 lib/igt_platform_filter.h

-- 
2.54.0

