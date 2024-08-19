Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDB2C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C15210E42B;
	Mon, 19 Aug 2024 20:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IohMFeDn";
	dkim-atps=neutral
Received: from outbound.mail.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECB010E416
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvffIadDGwJNTe/50FeY1ObwF/j/Q2AdMBp64G/SyyBsH6XMyJWWq0AXr5XMylr6GyKw8/uUwc94tD081seGJkoa7ZiPZzC7rtYdmJAVBmfeU9Mb/4VWtvlv3cR72uBYDN6IpJPsfRj5U2YwyOPX3fEwQPt3QzYmgQVuTgM304e4tttrObr4EWj5uZZ0CWOYWgqdaxsvx7pyoY9+yZBz6nNVMq7f6oFtpg/6kgNegF9KFbbZPE6QbMr2rH+M5BnqJn2Uft3xCGlcQMPh6Q2ZjbuNx9vmTZf5R64wiQO66af8UxY8+xWSZqDwjRoOpkbHDEmRiWU+bdMxHaa/xGAZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWyVFiIJGNyvl7OA0ftZQtSRDDzWcnrAIlmQyLMp4Uc=;
 b=W56qa2Lnd+ZjKGOBSThhiwljoySyzhSTQJpufaGHpj+H8YSuuAHYiIN1uXRbdzQxG+LiGSEaLmngylA+BVr910oYAFmPcV+Qne7e4kvmWgmYVr1Kv87OG2kNklLA8bc3srTz2+XoVwaE+nPDr59rT+qu13JPUFobbLEDmiLXT9QAXbFUmtAflpOBXjQavmazMtWZQzQaf5nuL5T9tRZatxRtp4wLPGgUurLpQGGo2+811jZf3+bNUfSC4AXDsP2kS+6AOw4pprLsLYT2ZVv7Uqr82Cr7Nbryiz2JAoRdyoS3JIsiJCyMMnEdfY5nTwFpkITCQeG3eU0M0QT7JKh2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWyVFiIJGNyvl7OA0ftZQtSRDDzWcnrAIlmQyLMp4Uc=;
 b=IohMFeDnD0D62p0baq6P4Pd8WzbmD/Y/tRdpRWidto01giagarEXGu31hUlguUxNSgIXPyPBKH2fQSMC3FjYBJ2Y3ezqG2n1VOprqZTTOq24I7iaKEaMSE/47ZZ0A+V19hz/ntXx6Lr0DeS+3AGPenJjOTOY9JSuRj5VgJMa+Ws=
Received: from CH0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:610:b1::22)
 by MW4PR12MB5665.namprd12.prod.outlook.com (2603:10b6:303:187::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:29 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::49) by CH0PR13CA0017.outlook.office365.com
 (2603:10b6:610:b1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:25 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:25 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 00/37] IGT tests for the KMS Color Pipeline API
Date: Mon, 19 Aug 2024 16:57:46 -0400
Message-ID: <20240819205823.316656-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|MW4PR12MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 620986a8-d966-41bb-cffa-08dcc091ac24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/n2xxEKTvNclze6PizWvyckhEC58zGjRWBMYDfEOqGiIOw0eFNyrUnH7Gp2d?=
 =?us-ascii?Q?guW5sWy4KI5QyqYitssdmVoyFSyJm8B6mnmFhXjtBq2yg7cE9n/fuqbFVjEl?=
 =?us-ascii?Q?YaXpDOYO40HAXVgswUflvhpT2uqG+l0mmSmyYKBrLWRkefSqkVFYHncQsfsQ?=
 =?us-ascii?Q?ywqKe3BiqNb43Ev821Pxlf1mcpRgAh1teuQmck05HWCta57gafpzc2Kv1YSA?=
 =?us-ascii?Q?njIAnnGW1pf6Q+zti4RGKdpLX44CKZGR7GCf4xitVwWU4cGLi85QOYV6W8fw?=
 =?us-ascii?Q?7uTiDnCf2dRrCSlk8ttErIGW8f7wMYHT/IQJBwb6VjJhlb8WHLTKriPTpHbw?=
 =?us-ascii?Q?4sjzx2/pNnIGxYccjycmIojRCYZ3vJKoLy8uZyM7BBOVk+ors5itLRgFRJQ5?=
 =?us-ascii?Q?8j36j3v3vKzX4yT0wE2OMcAmNW92jE97O0KBOhL/lWLJMVA1h2PCd6564Pt0?=
 =?us-ascii?Q?MzVdG+kbPtO6I3JULwAoGnY1hapfYIvv4xbsvONL6k5MdyjFpBFwyo6uI3NS?=
 =?us-ascii?Q?OA8+NmUdNRqFpUc2oBhAwFwIc5lFxKxZd+RHeliFqfwcTwvqPtWpVJejtALD?=
 =?us-ascii?Q?wdOieDRa1uOqJoITyXOCFHd7GoRUiI/YvYA6QskPZIAGVhnoHN0fpafpv4OU?=
 =?us-ascii?Q?25IHQD0knFvhgNm60oZR2k1KD8NKt4c6qDeNv2SsQ7BlDJxFVPb6Rrh5aZLR?=
 =?us-ascii?Q?DMwFp+7PUgLSKUnvy8Yj1gz9RQkxUQS87HISEqfogKKGJ+mJgqnfRWSiLWGQ?=
 =?us-ascii?Q?7V7qXgmS7yFTUM/EqsN3BzbiFEE4YpFI5ZxAOzZhpdQo5HpS9A1P6f5wgz0B?=
 =?us-ascii?Q?ojHuBsJwP6hZQ+IupCn0mgofRf1Y9omUcODxVauemhPUk8bX3eHqifBCHDww?=
 =?us-ascii?Q?iSBaakLY9R4eEPTUNVs0j/MLediU0AsYxzhkHGXFpOjn0cUM0ZrcbXsthvd9?=
 =?us-ascii?Q?i85TXxG7A40Z9OOCu19esfKZwDmhiQE+vExmAxrqGeOki5YtyQF8CCljW7Xi?=
 =?us-ascii?Q?rX6MOTc9dEYZbaIPtbTtQCdGKL3rccB2LTdovF1eDXJvJAGUPtR1NyozHOAe?=
 =?us-ascii?Q?RZfg2+7e6T11tHpYNvuFODVnY2nTx47AMV26pNZRbnlXBDggCW2unLJrPJu+?=
 =?us-ascii?Q?bKvP0myQzIxjMjAzJdk3TJsRXrPIEuBarf7tlfXDosf6SBL9u1BcPaNVEnnU?=
 =?us-ascii?Q?T56H32LiWMXWlmNof7m/1DOVAxIjQuWcRwkJ2UoVmXbegHic4XSJlV6XnwK3?=
 =?us-ascii?Q?pEaVUUxKejdjwbyVVG1Syc10QtAz0SWqQZCG7ePf6QHXG9NEni57Ct+eSnqs?=
 =?us-ascii?Q?dj3Evxz114LeUN+AETDxzb5HUiiVNeq98XGTPG+06A9zSXZnZ+sjstxr/ftg?=
 =?us-ascii?Q?p2vk8XWMQLEgq1nml09wmw4IjNiS+le5wRv92L1FhjOetmQYqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:26.9871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 620986a8-d966-41bb-cffa-08dcc091ac24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5665
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

Bhanuprakash sent an Intel series as a v4. This v5 does not incorporate
his patches as rebasing them wasn't straight-forward.

[1] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline-v5

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
  tests/kms_colorop: Add 3D LUT subtests
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

 include/drm-uapi/drm.h      |   15 +
 include/drm-uapi/drm_mode.h |  131 +
 lib/drmtest.c               |    5 +
 lib/drmtest.h               |    1 +
 lib/igt_color.c             |  653 +++
 lib/igt_color.h             |  162 +
 lib/igt_color_lut.h         | 9866 +++++++++++++++++++++++++++++++++++
 lib/igt_fb.c                |   36 +-
 lib/igt_fb.h                |    3 +
 lib/igt_kms.c               |  329 +-
 lib/igt_kms.h               |  100 +
 lib/meson.build             |    1 +
 scripts/convert_3dlut.py    |   94 +
 tests/kms_colorop.c         |  714 +++
 tests/kms_colorop.h         |  275 +
 tests/kms_properties.c      |   69 +
 tests/kms_writeback.c       |   38 +-
 tests/meson.build           |    1 +
 18 files changed, 12458 insertions(+), 35 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

--
2.46.0

