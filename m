Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6917DC531F9
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 03:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015DD10E509;
	Tue, 28 Jul 2026 03:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xAYBk4Xb";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013055.outbound.protection.outlook.com
 [40.93.196.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8828110E509
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 03:30:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3nIJhCZ1JWmgvMELAfsFw4LnesGTYY7Oie9qOcSze8wlfsy8GvJPlJsJqTK9aoswEH8+1ROTj4JRj99z8BeGBT8JZ9VryB+sgK1YBnhROFJZLTQfTckuJ7m+3qtbSVTOxed/MdTTvrMTyk4//cDJZnutoGoYVhdmxveeoSwU5nc/HLd+OJ30jeDS5J6mzYDiRV/LcNiy+9IgbVQmrqfGq5dtkEnN92Ghb/g7d2cVS5QNbbx71gic5hNRLp7Nerg+g0dNPtvvu71JQYQsvuW/67HvgIlrJhsKL5niZfQJmjc4nT9N2Oz8AEwib53pakK76dShV/o/pAUju6wI6Fq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB6SG0R4MEnx8151zcSSsohtMqcZxhaIE1ma++C9hM0=;
 b=OJrzb1gF0py/R9fmW2KfebBITuoVtZIVZadl6Gl9uEJ3DELw7IR8k7TqPDSVDfVymaIOwklrcce8DZMmspwmlsgXZ8PIzrjkUm6o8JrvHYXwqP/PrZuaww+UmGBYNmWIzLy7cQaW/XJxToxBfWCoiH7GylR9ntVTlsfuvH+5ASCleFJPf5IQEkaPHQ3F/N2zEl0+AEm7HcNtyLkSxTxIlqXVhJJxXkf37FCDrIZZPcCzUNqed1BadIOxwgZh9YRguL/dGS6bOIMenLg2uIcr2oalhjziYcyuVQvClkvcSJ1JMYNVtqJRKm/UvLvYjs9XnLzp33IwQmeFUQ52AviO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB6SG0R4MEnx8151zcSSsohtMqcZxhaIE1ma++C9hM0=;
 b=xAYBk4XbCEvTsAvtxMR03oS+u0/bsy4Sga/oJrzAKgykx/xc3y0yzStF9QDnco21gy9pDtBZCsnaNw9CnPeIw9PhDRMt9bhPvlNeb1eSx6eNz+5ibG0vQoGC6sUlGxJh9YH0y/guAeb/rgewsbUn58REqSF74f64poPqQAGyYLo=
Received: from CH2PR07CA0038.namprd07.prod.outlook.com (2603:10b6:610:5b::12)
 by DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 28 Jul
 2026 03:30:09 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::c) by CH2PR07CA0038.outlook.office365.com
 (2603:10b6:610:5b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 03:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 03:30:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 22:30:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 20:29:51 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 27 Jul 2026 22:29:50 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Simona Vetter <simona@ffwll.ch>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v4 0/2] Add gem_change_handle_race test suite for
 DRM_IOCTL_GEM_CHANGE_HANDLE
Date: Mon, 27 Jul 2026 23:29:22 -0400
Message-ID: <20260728032949.171432-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DM4PR12MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2ff8e4-e7b0-4dea-b6b7-08deec5885c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|56012099006|11063799006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 8M/0vGDDf2l9wxz5XYenF1jWNEUcGjN3o7gXUSROpEeYsZ3cAxWdn9Q58UAtHDFOyVRSiFLdclt+nAK8A9NfGIsaXBcjeSz2QNk/dgFSbumrQtncBamrRUiTSOvYHaHGAHKg2biT3HH/+IVPEMQ8V1VVozj4pYFQTklT6klUrcT81ZtselV716j3qF1emgln2jeQHGbACVYuuhs1P6GPE/B51t8F5xwKj/5QbOj7uiCIx1HCkDQlNsUTtTTSuOTMS4za0uNhAIRdNz6FtE7IQCBCaTfo6RKts3MjpzKtRz1JKcyFyVB1Grobr5ytoJQo6yJYT2mnQh8LkLVprmZvqKkg5SeE68zHSwZQkHTeSXq90aJOBPiWQC2O6Rw7J0vzODzfu0cOlRT1lZVunyKT87yWedSG1hUNKW2P7wEhreyajvQ4k2X+2vzsaouDaAzYWTZA5TWO4mDrjf6rC1iQY1abX4yuERdns0ckfNuBqG1tV1P7FDXLyvFVhNfGMGEfLQIKfK1AE/YxWyyCt2pYw7loopmVP5Yx1POA2O6acls5K07ud6sT3EXqFhyLZ1hBBhc8t66LAWu6BQBXmvOo9yNvycXfMi73Xx5f5g/cpZsDNOhzJoE4rc3Smj7Saq9ix4TDelSnC3qNyeHOeHYXcdopdMDW143L/8FDR6n+9VfbSZQIbOl3QMNE21NPwULlV7Ostza6Xb0s97O5njEijQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NmeNBPlRJAMWbOvXnxHfR4YDpK7vVj82EKDa3FR5RSMlzNa1/eqVYTXV77gNSTkLY6VY02MuIXV2VgQFjkz6GY40TjHDXa9dSadd9C+0msz6jG9+CnMwLQp7IKnY3XbfHTc5u+PoyzA37wtPjCUMqyieL9lzh+wrOqJz+1XPtawPl994OdoZjJAHQ7RJoZ2Y7XC89shsbik6HjRoKmDMhQu4VM8oWhFqnufvWEBHdpamNyYB1Z7eLk/n6lxGHJa7Zj55tTyDOJ0eDruVd9QjlDxoNBxpTVhbaWgn6j/02Rt4BqJuUvAxGZokY95L8/anKtce3eJErJzMO9P7r6px0PDTCe+06dAZUwtRU/FFSFQ9jy96O4MHAazbR1iT10yqrsv3viol9zh/7VrRmtLvZUvrHtHk5vbZSXNdF9HkFDnaBdz31ZxvI6T2YJMu2EQR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 03:30:07.8361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2ff8e4-e7b0-4dea-b6b7-08deec5885c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6207
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

This series adds comprehensive race condition testing for the proposed
DRM_IOCTL_GEM_CHANGE_HANDLE ioctl to validate concurrent operation handling
in GEM handle management.

The test suite is GPU-agnostic and works with both Intel i915 and AMD amdgpu
drivers, focusing on proper locking and handle lifecycle management during
concurrent GEM operations.

v4 changes (addressing Kamil Konieczny's review feedback):
 - Removed running_under_gdb() function from patch 1 entirely
   (was wastefully added in patch 1 and removed in patch 2 in v3)
 - Fixed all double newlines throughout both patches
 - Moved all formatting/style fixes to patch 1 (patch 2 is now clean):
   * Removed #define _GNU_SOURCE (already defined by meson build system)
   * Added header comment explaining tests/intel/ location
   * Fixed check_kernel_traces() brace style
   * Enhanced pin_to_cpu() with error handling and ARM compatibility
   * Fixed variable declarations (C89 style)
   * Removed unnecessary braces in if statements
   * Fixed static variable initialization
 - Patch 2 is now completely clean: only adds new test functions
   (234 insertions, 0 deletions - no modifications to patch 1 code)
 - Added git format-patch -v4 for version tracking
 - Added meson.build entry to patch 1
 - Fixed compilation warning: _GNU_SOURCE redefined (removed from source)

v3 changes (addressing Kamil Konieczny's review feedback):
 - Removed reference to external documentation (RACE_CONDITIONS_EXPLAINED.md)
 - Sanitized test descriptions and comments (security consideration)
 - Renamed 'race-darknavy-cve' to 'race-close-before-lock'
 - Renamed internal functions and variables for clarity
 - No functional changes to test logic

v2 changes (addressing Kamil Konieczny's review feedback):
 - Added header comment explaining why test is in tests/intel/ directory
 - ARM compatibility fixes (graceful CPU pinning failure handling)
 - Made pin_to_cpu() handle failures gracefully with igt_debug()

v1:
 - Initial submission with 7 race condition subtests

Test coverage:
==============

Patch 1 adds 7 race condition subtests:
- race-change-vs-close: CHANGE_HANDLE races against GEM_CLOSE
- race-change-vs-change: Two CHANGE_HANDLE ops race on same handle
- race-change-vs-prime: CHANGE_HANDLE races against PRIME_HANDLE_TO_FD
- race-aggressive-change-vs-close: High-iteration close vs change
- race-exploit-single-thread: Sequential swap+close pattern
- race-exploit-random-handles: Random handle stress test
- race-close-before-lock: Close-before-lock scenario with CPU pinning

Patch 2 adds 5 edge-case and functional subtests:
- noop-same-handle: handle == new_handle returns success (noop)
- invalid-new-handle-exceeds-int-max: new_handle > INT_MAX returns -EINVAL
- invalid-handle-nonexistent: non-existent handle returns -ENOENT
- edge-new-handle-zero: new_handle == 0 (documents current behavior)
- functional-rename-verification: Verifies actual rename operation works

Testing:
========
Tested on AMD Navi 32 (GFX11) with amdgpu driver:
- All 12 subtests compile cleanly
- All subtests execute successfully
- No compilation warnings

The test is located in tests/intel/ following IGT convention for gem_* tests,
and uses i915/gem.h infrastructure while remaining vendor-agnostic via DRM core.

Cc: Simona Vetter <simona@ffwll.ch>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>

Vitaly Prosyak (2):
  tests/intel: Add gem_change_handle_race test suite
  tests/intel/gem_change_handle_race: Add edge-case and functional
    subtests

 tests/intel/gem_change_handle_race.c | 1977 ++++++++++++++++++++++++++
 tests/meson.build                    |    1 +
 2 files changed, 1978 insertions(+)
 create mode 100644 tests/intel/gem_change_handle_race.c

--
2.43.0
