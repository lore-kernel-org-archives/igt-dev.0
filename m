Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116FECEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73D810EBBD;
	Sat, 15 Nov 2025 00:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Fwp8j+CF";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012057.outbound.protection.outlook.com [52.101.43.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4ED10EBBD
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:18:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgJCZNtt4BP7sEiFhb/FjLfgv1lQ6jMZjalgQ1wanIgmrppOkQCxDjQ5NM8urgGsNmZ5pn5v3rkjYadtlVphczr/nD1p2yQnhHU1LRG3BS8HCikH4nmNsPXBzjEHMItEhMbdF1cd48IHYcQkg96drdG5eCi6i8+eht9OePCXrqPb946stRJvLyrQVRXaglfjKLCB/sri63yQlBmix7QD+OarVmjj2mOrCnqnQ1hQBp85nkBGQFoMlb2R1s3UV0itw28KR0l0+86JFtrEIHjLDkRHL0Z0a1zOvMhE03zN7+FMxASvmIhAs5urC9Lg1pUhtQH0R5y0HZH3iEfxygyFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deZWCFkBN4FaNhu1EZ3JG5RYO/1kku6zKzN4zb7S3Nw=;
 b=LQij5ixsGeYzhzyoYS9cTJDRmt3OTwwtizFimSiCtVe4md8umX/x9VL0RejVJDWAZtm/fh0TQvB+e37e4ljH8XnNRhGkuFMgY33UdxifduCSqbfsPG2xPxwaZQ9GG86fEdxHwt47QCnaFIjvBHcw4GCWCOzTeaW3QnEH3J/1mauQBGI/JqjtpEIbhkLePdQgQZT5MCkRxRMHcVk9O5ev0kuEq1Yv/dUC98Pajq7dVrVpf+TkP7p7ou1yvaj7lLso7n11gnkFxPJTorreq4KWx8ofvUKvQFf8rot9WOOmUw49bwyOMVPmMx+lS+TRoI40dLhQeSp5m/byeJFn+usHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deZWCFkBN4FaNhu1EZ3JG5RYO/1kku6zKzN4zb7S3Nw=;
 b=Fwp8j+CFl+YnzB3pI+OKzpUBaikDa9/G5dfdVygT+far9sjwfFqvhEpLAVHwUZN032NSIZ+cMEOMjvcaDjPKiV5pNwWGKd+armRrhyq0nvnpv5W4o1WYlEqyKJcpCmzIXNhtTmTTT+V5jYe9b1hQAlHSOYs+N3fgRD19sfyZ/XY=
Received: from BLAPR03CA0035.namprd03.prod.outlook.com (2603:10b6:208:32d::10)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:18:53 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::29) by BLAPR03CA0035.outlook.office365.com
 (2603:10b6:208:32d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:18:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:18:52 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V12 00/32] IGT tests for the KMS Color Pipeline API
Date: Fri, 14 Nov 2025 17:18:09 -0700
Message-ID: <20251115001841.3563993-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a19e20-6976-4ba6-010b-08de23dc8f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W+ajTBX4D6XVLBF06L1A4lIRbopAkfzBQgPMO6U2UCAP5qZU8Vtmm3GprYQD?=
 =?us-ascii?Q?mQ/5CRp+tu61HthitMTOYKlXd+5SP+oKA+g8RzMKAJ1T4XZ300pqOo9fNXoV?=
 =?us-ascii?Q?3d1gtG/5sypOORp/M38FAshQT+L1AYy43cXVKer0WN56B1fHOlkkf5zPy3Bb?=
 =?us-ascii?Q?R3oO/tJgUg37lI1EVKKaCc6YH6BkUvP+NTzFYy5ANxOaxHWVbecBrZX+/P/a?=
 =?us-ascii?Q?7WafILWvw/3NSxr8BVxxFwRF7SKWBYKGsO3NMf55fSyK69bZhK8n41XVsy54?=
 =?us-ascii?Q?ECcSWuOqgt/ZhGH3yMeu03RUzD53zHTd4Os9XsDHxlzCZq2uZ18pkVnzq04C?=
 =?us-ascii?Q?zpAeV6gs5Mau4CFg83yOYQ+Fc4iSJzy7MzuCUm8p/N3vK4OUwhk1LT+OjTO4?=
 =?us-ascii?Q?rLR+Js4D2cYGdJ865l6F77NO4ovwEMTqKf8sUk+DLpnMWrhwIYXpXkUCHa+D?=
 =?us-ascii?Q?Yv2KRPaVcsqhp2Y//1zOZYwVshI5JclepcPzfqsPueD7hwtGjwUer98TT0W5?=
 =?us-ascii?Q?okf83i1uUuOThIIr7vY4KfSiouSQPCQXcl8omaCzEvBLGSfpSRFQT5xMIieO?=
 =?us-ascii?Q?SGbEe9qhsNhWBmgSb6SZ4M/cfci0M0T/GYoiice6o0EGmEn784vGcl4Cb/mp?=
 =?us-ascii?Q?8jEXVpEmvCzpU3u2fBAa8akCWAwtfAynQ5h5vWAybV49Niz7ODS3bl6p9rLV?=
 =?us-ascii?Q?4zOAMfV09uAzvfDbwIHxNW+givhGIPgvuPwhp9vS9y/4DodKAh4MtYB8a09S?=
 =?us-ascii?Q?xn3LFuGLO8oH8UKYvTR1PlPj21bUDoULg9NnDCBRhQkog8ZMbs38Zm7bRQ+l?=
 =?us-ascii?Q?OSj1BaJo7WuxRxkcsqlMzC032Bzu1/av2zVy9ziTaCmSm52cKvqSD6DXB86z?=
 =?us-ascii?Q?U7znGs2tg2eF01bdfzcOIDbHvvv8vIuBUWq1PWesGwuYa/mHvyabTzSVn6Fv?=
 =?us-ascii?Q?FhSCxvlAx5cqr4EMQQHuoMGUuY1cgeQh/NjxhHtWNmNQIvzpG3RwnLaImi84?=
 =?us-ascii?Q?RXwnzNgC3eiIVhTwDJ7Hm07HSymizf+kf/uc9/E6JBtMgMwrUppO7KtnwvcH?=
 =?us-ascii?Q?K5ns+8biGFFsGi7spyc63jZ5Cjf2QjiU4/hBT7pqsOCLnrKXAm03AM3PahOE?=
 =?us-ascii?Q?ApA+jiKTsU8mP72YN6PQyKMACTo3RlJKrNWHAfMDUTafEwTQ/USwSHGFfWTJ?=
 =?us-ascii?Q?MGfTgfpn7idWHRBbHSeB5l1IwruDnrbkxyc6jU3w63poCfCUaHCN3zQYCL+N?=
 =?us-ascii?Q?KLGI9XqCy9hR0RBvBmNBj6InBXLAwPUzKoC9QWQuRgjr2OxEhaiEUsBQQPBh?=
 =?us-ascii?Q?D4upNiWq/6boyg1q4UYZ4oXNP5Gfx7DMLr6oEbg3caFvr5prEfhIwQS+Qqxo?=
 =?us-ascii?Q?euw8GZ7iz2uwEa2SaGMrAKGJRlbxt9kNgxq0WENcfFw8tNMV2jlwbmlhcaS7?=
 =?us-ascii?Q?bPmPFTnFXlOSlNu5nPoUUG6m8uPt4afP9khIBX1cTvkW2u2+sOtljQanbaFI?=
 =?us-ascii?Q?tX340XQJnHr6qGdHar0inhRp7aFi5g9m4BRv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:18:53.3029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a19e20-6976-4ba6-010b-08de23dc8f15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
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

Both kernel patches and IGT patches are reviewed and the API is stable
for a few revisions. Does anyone have concerns if kernel and IGT patches
are to be merged?

This series introduces support for
* drm_colorop DRM objects
* COLOR_PIPELINE plane property

Kernel changes can be found at [1] and on dri-devel.

It also adds a new kms_colorop test case that tests the color pipeline
API. The tests are designed to be easily extensible with a "transform"
and "compare" function pointer for each test. The "transform" function
performs the transformations under test via SW routines. The "compare"
function compares the DRM/KMS result (via a writeback connector) with
the result derived via the SW "transform".

This series introduces a number of tests for pre-defined transfer
functions, custom LUTs, 3x4 CTMs, a multiplier, 3D LUT, and a bypass
test.

It tests 8-bit and 10-bit RGB surface formats, depending on driver support
on the drm_plane as well as the writeback drm_connector end.

[1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v13

v12:
 - Replace fb->width * fb->height * cpp by fb->size
 - Remove unused enum "IGT_COLOROP_COLOR_DEPTH"
 - Clarify gamma 2.2 names (Gamma 2.2 Inverse OETF and Gamma 2.2 OETF)

v11:
 - Add new gamma 2.2 subtests (Patch 31 & 32)
 - Remove unnecessary TODO comments
 - Remove drmSetClientCap(... DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE)
   out of igt_display_require
 - Remove copyright (which is replaced by SPDX)
 - Merge all colorop from drm_mode.h in kernel to a single commit
 - Separate changes in kms_colorop and in lib to different commits
 - Move sharable functions to lib, i.e.,
  - get_and_wait_out_fence to igt_get_and_wait_out_fence
  - detach_crtc to igt_detach_crtc
 - Add --dump option to replace DUMP_FBS macro
 - Misc fixes and cleanup in code and comments
  - remove unused variables, functions and enum
  - fix typos and incorrect indentation
  - constify variables

v10:
 - Merge some patches accordingly
 - Change drm_color_lut_32 to drm_color_lut32
 - Fix 16bit to 32bit coversions in configure_3dlut()
 - Fix errors and warnings reported by checkpatch
 - Clear dead code and redundant debug messages and comments

v9:
 - Check !display->has_plane_color_pipeline before igt_plane_has_prop (
   IGT_PLANE_COLOR_ENCODING and IGT_PLANE_COLOR_RANGE)  (Chaitanya Kumar Borah)

v8:
 - Add a new colorop uniqueness subtest
 - Include a patch "lib/igt_kms: Destroy colorops on exit"
 - Add function documentation comment for get_writeback_formats_blob
 - Fix indentation errors and a new blank line at EOF

v7:
 - Add more documents and sync up with kernel implementation
 - Update 3DLUT tests according to kernel changes

v5:
 - Bypass test
 - 10 bpc support
 - Proper setup and cleanup
 - PQ/BT2020 TFs
 - 1D LUT tests
 - Multiplier tests
 - 3D LUT test

v4:
 - Intel color pipeline work, to possibly be combined with v5 in a future iteration.

v3:
 - Remove need for IOCTLs and libdrm changes
 - Test colorop properties with both atomic and legacy code paths
 - move enum drm_colorop_type to drm_mode.h
 - Add descriptions for public functions in lib (Kamil)
 - Use SPDX style license identifier (Kamil)
 - Replace Skia license comment with copyright note in file header
 - Fix kms_colorop subtests if applicable color pipeline not found

Alex Hung (12):
  drm-uapi/drm: sync with color pipeline commit
  drm-uapi: Add COLOROP objects
  lib/igt_kms: Add writeback functions
  tests/kms_colorop: Add a TF sRGB test
  lib/igt_color: Add 1D LUT color transformation support
  tests/kms_colorop: Add tests that exercise the 1D LUT colorops
  tests/kms_colorop: Add multiplier tests
  scripts/convert_3dlut.py Convert a 3D LUT to igt_3dlut_t array for 3D
    LUT API
  tests/kms_colorop: Add a 3D LUT subtest
  tests/kms_colorop: Add a colorop uniqueness subtest
  lib/igt_color: Add support for Gamma 2.2
  tests/kms_colorop: Add Gamma 2.2 tests for 1D Curves

Harry Wentland (20):
  tests/kms_writeback: Fix kms_writeback for VKMS
  lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
  lib/igt_kms: Add COLOROP properties and helper functions
  tests/kms_properties: Add colorop properties test
  lib/igt_color/igt_fb: Add SW color transform functionality
  lib/igt_fb: Add igt_copy_fb function
  lib/drmtest: Add is_vkms_device()
  tests/kms_colorop: Add kms_colorop tests
  lib/igt_kms: Add support for DATA colorop property
  lib/igt_color: Add support for 3x4 matrices
  tests/kms_colorop: Add 3x4 CTM tests
  tests/kms_colorop: Add bypass test
  tests/kms_colorop: Add 10bpc test
  tests/kms_colorop: Skip if writeback does not support fourcc
  tests/kms_colorop: Refactor to use a subtest group with fixtures
  lib/igt_color: Support color transform for XRGB2101010
  lib/igt_color: Add PQ variants for 0-1 and 0-125 range
  tests/kms_colorop: Add tests for PQ variants
  lib/igt_color: add BT2020/BT709 transfer functions
  tests/kms_colorop: Add TF BT2020/BT709 tests

 include/drm-uapi/amdgpu_drm.h |    9 -
 include/drm-uapi/drm.h        |   14 +
 include/drm-uapi/drm_mode.h   |   92 +
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  651 +++++
 lib/igt_color.h               |  149 +
 lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
 lib/igt_fb.c                  |   43 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  411 ++-
 lib/igt_kms.h                 |  101 +
 lib/meson.build               |    1 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_colorop.c           |  704 +++++
 tests/kms_colorop.h           |  266 ++
 tests/kms_properties.c        |   94 +-
 tests/kms_writeback.c         |   24 +-
 tests/meson.build             |    1 +
 19 files changed, 7566 insertions(+), 43 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

-- 
2.43.0

