Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF930C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1CA10E0B5;
	Wed, 26 Mar 2025 23:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J58HGZJ7";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DDC10E0B5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjtFU7qxXZxDpsS/gZjX8fPyYKBdL0ZWA8f6+oE2ogpjSbnxO6wfjdxQ1G2Ywzq534thqbIS+xdkeErgIaODCZlvRn6+TtcLwikfejVjnyuhYDtoEyBuZPs087uP7TZ6d6iwd2vjnQ2uqDtmcyAOKfLdXYTVsoaTJ2tZUS53q6YToBLF8C1iWs/Tn5Zxc5euTmFHu6zYkf4WQOPYgC7Ihpt4vcJBjnI4A+Ksjt7s2z4FLdkKI9vEx/GLqY2TKqHPaBGBK6t1zBuYfdPYY/1uWrYzWxzPJ0/BKAL2W5KfBc3BTqdo5hPZ5oIVp4skZ8KVZeBDAWzf5GwOglGMskZeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU0i32XFGnz6KtSjF9QhSk8aTYprddmJINa/bHtZcAI=;
 b=Hynxrmd5fWN5jv3LOPH+gPEHmT14ZZCWJIPuc2MLwx5XMJnI7ow4lVQgfQMqWSXrTSQJT9HtOskLZjNLFzcsOlFJ/eaG0aNQCdeOte6j/FNnKD0jVzLPeDh+CdqKr2fVXmP/arGW03fX5ouCzjBJSwNQafKq3atDai7ARDLvKRsnjnhTKacoQFW3/J6oaIZ9hvKLZc5EN4ZKBBxvp7hD0eDHf6Fr+N4d5A/1Uq3wADsu7BzFDNRgIZ11/I0ptcgHmBis7y2hdgwBz0oBaD5YsNuaufUe6ZHL72fZKFAQ4safpvs75heI+NGOHgyO4jt+RqSnapxLXicclYwNvSLBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YU0i32XFGnz6KtSjF9QhSk8aTYprddmJINa/bHtZcAI=;
 b=J58HGZJ74egUzvI4SM7CCqnfCx7K7GJHFH55TszgkT8bOKpb86/5Ou2GvrbZlrnHMnkpaWwImsuwBROU4S0CJCtSv0y5utfnkE5qGElkAAn5bO3T3eOqhqOdP6RAuUJG3w6EZzZcyhMydmBOb5rS7l+QdtyQa9iT5uS0b9uzDFI=
Received: from MW4PR03CA0136.namprd03.prod.outlook.com (2603:10b6:303:8c::21)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:39:34 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:303:8c:cafe::85) by MW4PR03CA0136.outlook.office365.com
 (2603:10b6:303:8c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:39:33 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:39:32 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 00/37] IGT tests for the KMS Color Pipeline API
Date: Wed, 26 Mar 2025 17:35:32 -0600
Message-ID: <20250326233609.2980110-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba705ae-fee1-43b8-63ae-08dd6cbf7631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YnlLK2pLAo355vOve+3r9TPCJUKjb9HxSCVQ2sbqwFSjvQMFKOCNJB3S+HKe?=
 =?us-ascii?Q?LKT+09rJEscOba/Mal5/9x8i6vZZ5djneM9HpO/LBxvswICf3QCR1np0OlyC?=
 =?us-ascii?Q?IfjAB25S26lT29kdN6htXfiqJIoPYNqQuuUY2Uo5sZjwLJOEOdPnVHSCmiw9?=
 =?us-ascii?Q?Oqzm+ysK82owGvcCyBRZBTRwfyQJj38nWWbFa8XUYfTo+eIxtpcO9AJN/S7+?=
 =?us-ascii?Q?Iz9JYlB9o0csWeMYRHz3O9r24RJTaGNpdP9AzX/QOuSYwMwvpd61UW5MAByz?=
 =?us-ascii?Q?W3oHOCmJx0S/FDdi01VJ5rJfTb9T4hdxo6W4i0oFHl2uMYEBG/ocJs7aAxlB?=
 =?us-ascii?Q?HxcZtdQKmsISe7um7pzLl8i8R9DvmYWXyfmJm/oajKr7UudcTwXoK4xNY954?=
 =?us-ascii?Q?+1ZoE4faznwlK20NO2b2doea94mtZ6oXFz13jhN6PqAsnhV3BoFctnXeFaZI?=
 =?us-ascii?Q?AdvvS0cfKxjNnGUxn95DpaqyB4e232lXw+FWNquO535ntIomC5qqjr7TkCqC?=
 =?us-ascii?Q?q+ryLOj17a0od43zmqYioHpqG1kEa6VpzPrVwSXnWWBtNCK5oWM2uJuXMft0?=
 =?us-ascii?Q?3rOT9kiRt2NPaU3QDxcms14Ep+KZaGpQXZkcYvCxWkdF4MhUaP2XtEaR0IzW?=
 =?us-ascii?Q?sI6Du5nV6IxD3pFSNRkgBaTAMXxrabPKU0BMZm4mKuPOeKELmoHWjtlBUUNN?=
 =?us-ascii?Q?u7N0ZZrlH0eHVN/l8v2f8n8RBH+MiN8nWYg56LgAHyBkAADT/FMW2cddvl0l?=
 =?us-ascii?Q?fZEGl7df6JQtOrjGDSGxJyL9PuJkM0eh+zuXkh4Y/z5lqTn/hkhGvSuNlG+E?=
 =?us-ascii?Q?2NW9uBhRC9yNTLhwAYDTKVme8j0WoEF/AFi4jmJe+dihv00afEDNMabaXekg?=
 =?us-ascii?Q?anohLdmrYAFgVfQSlgp/dhAqKLmn1AgCzEQLt7m8Rn4SAgYcf6VGzaLE1RFe?=
 =?us-ascii?Q?tpxOGIUGyLfbcP33Mw6jsk7mTl4cv2kw3P7FOzcqbVyguA5W6qZSeItoK8ba?=
 =?us-ascii?Q?CTFww8JURD6WWzM6yaR88rzVwVcV8DtwtVaqssPXZDVzSZ0PyTOeBZ5x0VOM?=
 =?us-ascii?Q?SYatcBZiF3ZGTP29aKN8RG37gxUJBh7fd3ZYOp9jrYcC/QFePQ8K0oa87NkW?=
 =?us-ascii?Q?MghckFNq5nZrNL42deK7+Fb37xMi5aYg8NT4XvfuZHfqYBvztqFppst81Q/Z?=
 =?us-ascii?Q?g0hEkQgIKcvf4o40yodzHIhwO3KrJcmKAUopeIE1qobbLYa/uEY2y6B48Iv+?=
 =?us-ascii?Q?THc5jjtSFN8yVvAEw3ZX1aEvY+63Q6WBN8lB6JoKShf0QkwOPjtASWKqXzxw?=
 =?us-ascii?Q?6e3kgcOpfvTSHlRI9QUYkNshHz4tu8M+wkRRWfAEJ/WFP7p7t5RdyJqlMVY0?=
 =?us-ascii?Q?FS/nh6139FPDcn/kHbk1nmRW4oKy1ROL0mhG1YFW6TWkasOlBWRz+EW1XKKa?=
 =?us-ascii?Q?yc5QHTXTmF8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:39:33.2729 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba705ae-fee1-43b8-63ae-08dd6cbf7631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700
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

[1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v8

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

Alex Hung (9):
  lib/igt_kms: increase MAX_NUM_COLOROPS to 128
  tests/kms_colorop: Add a sRGB test for EOTF -> Inverse EOTF -> EOTF
  lib/igt_color: Add 1D LUT color transformation support
  test/kms_colorop: Add tests that exercise the 1D LUT colorops
  tests/kms_colorop: Add multiplier tests
  scripts/convert_3dlut.py Convert a 3D LUT to igt_3dlut_t array for 3D
    LUT API
  tests/kms_colorop: Add a 3D LUT subtest
  drm-uapi: Update kernel doc for drm_colorop_type
  drm-uapi: Sync up definition with kernel colorop implementation

Harry Wentland (28):
  lib/drmtest: Add is_vkms_device()
  tests/kms_writeback: Fix kms_writeback for VKMS
  lib/igt_kms: Move get_writeback_formats_blob to lib
  lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
  include/drm-uapi: Add COLOROP object
  drm-uapi: Add 3x4 CTM
  drm-uapi: Add 1D LUT drm_colorop_type
  lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
  tests/kms_properties: Add colorop properties test
  igt/color: Add SW color transform functionality
  lib/igt_fb: Add copy_fb function
  tests/kms_colorop: Add kms_colorop tests
  lib/igt_kms: Add support for DATA colorop property
  lib/igt_color: Add support for 3x4 matrices
  tests/kms_colorop: Add 3x4 CTM tests
  tests/kms_colorop: Add bypass test
  tests/kms_colorop: Parametrize the buffer format
  tests/kms_colorop: Add 10bpc test and skip if format not supported
  tests/kms_colorop: Skip if writeback does not support fourcc
  lib/igt_fb: Allow any non-planar format for igt_copy_fb
  kms/colorop: Do proper setup and cleanup
  lib/igt_color: Support color transform for XRGB2101010
  tests/kms_colorop: Set wide [13, 13] bracket for comparison on amdgpu
  lib/igt_color: Add PQ variants for 0-1 and 0-125 range
  tests/kms_colorop: Add tests for PQ variants
  lib/igt_color: add BT2020/BT709 transfer functions
  tests/kms_colorop: Add tests for BT2020/BT709 TFs
  lib/igt_color: Point license header at skia license

 include/drm-uapi/amdgpu_drm.h |    9 -
 include/drm-uapi/drm.h        |   15 +
 include/drm-uapi/drm_mode.h   |   99 +
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  648 +++++
 lib/igt_color.h               |  162 ++
 lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
 lib/igt_fb.c                  |   34 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  359 ++-
 lib/igt_kms.h                 |  100 +
 lib/meson.build               |    1 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_colorop.c           |  702 +++++
 tests/kms_colorop.h           |  261 ++
 tests/kms_properties.c        |   94 +-
 tests/kms_writeback.c         |   38 +-
 tests/meson.build             |    1 +
 19 files changed, 7523 insertions(+), 49 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

-- 
2.43.0

