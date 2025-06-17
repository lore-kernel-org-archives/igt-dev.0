Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8925C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B5910E4C7;
	Tue, 17 Jun 2025 04:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y1QE3+B5";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9D410E4C7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmB2IYh7tu0T5B4M5HIsalJ/emwFgJBuDbHydrcmxB0rtIASe+ErI+DBC593mHg7nInDGuJEkwMgGfaX4FaaOq7Pvn+MzYYMPrK8s5KwuoHhccxyc4CttQrkIjl6jdk25Rjqh+UxmzRoauWlva0SeJyYEpu30ROGbnUI1XdOlxyn/9laaEBWRjQ4TlW1sAAB/LM464SWymgSCTpQmFVHVUoT8NKVBQhjs2SDoLKmcnWb9QDqtWCZBbfpxpo6bkjtZbWMyWnIj+RQlKcgtWRB6UdT/fTYgfpTW5pGC2vu5+0jEq46F7qWwo20Z4L0FROn8R73FmowTyURJsxfi5NW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8IL1JVv6lyPmK8gHRCtbBsB9PDmh1n0xyoxQmE1rY4=;
 b=ojGalJRD6hd865kXffTTZud/D/uGnMfm764JWRwr4OEcNWRoNsAH63+Pew9WtxszrXyU8wT6hv/zA3agajeGbJaog3nxEiN7+GlDe6j9Qvtg1r9DKve8kyap+ew5iFNHUA7jqRO/zgCBoSGhWnqDcGmDlqTK6lTwVeZ+WGdXWWyXTPT6f8iSNeuJetGEmsImQunPKoAb+yYTXp3VulB0QtnxPkD0I8ATu72uVggknTmjEuqgunhOYFD5JGelJ9ucPGhlnY7sn9q7m9gsZ4wP3KwZQ1jCnOhb4Y9SYm300bdd2i8tGkydLc3PAOfQB+B2vMed3qsCN8xEUCt9AnpibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8IL1JVv6lyPmK8gHRCtbBsB9PDmh1n0xyoxQmE1rY4=;
 b=Y1QE3+B5UIVKXbmGU4PAi+AX+zfjxBUXRmt3CwMf437YZ8GIm9Ww4oIvU3KKs8BRfspLPzTyWAVrp0lkHiSn45Qia05dxhZzBcSMzFNR64uB6xANeZ2Hthl0UMIiO7UxsLGbqYEZcUokliTBLvdwCHcgp5ZRjWmfSSehyi/Hqr8=
Received: from BN9PR03CA0587.namprd03.prod.outlook.com (2603:10b6:408:10d::22)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:36:46 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::1b) by BN9PR03CA0587.outlook.office365.com
 (2603:10b6:408:10d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Tue,
 17 Jun 2025 04:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:36:46 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:36:45 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 00/36] IGT tests for the KMS Color Pipeline API
Date: Mon, 16 Jun 2025 22:35:55 -0600
Message-ID: <20250617043631.2920587-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d63a9b-dd11-413c-cb1b-08ddad58915e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rtmufxz0EPNRVsYyuyZMZTM60rflCitJ+H0kKo1hBRF9FBPJ0vt+dyJl3Try?=
 =?us-ascii?Q?o/vGdSeDCOhNk3DAEcss8S82K5ghTxioaA1gc5QJGjYnIXwzv4evsFyE16MF?=
 =?us-ascii?Q?MiWK8f5d0HTcef3QYhz0ZDQRBPjqocLaKiKlO0aEJ1Eg5j6ZMpPuf2mw+64S?=
 =?us-ascii?Q?sc3iEvYNuYbheZD75ct91gt1M5BWJz1eXXvplfepuvuI7yDtcKgx/BDaCkHP?=
 =?us-ascii?Q?IdcOanXnEPLsRXLXMTN6BuEyFKeveLnFtbk/UwRlua4RJsefENIX/qrP+61k?=
 =?us-ascii?Q?eLwhI5eyiwiLVt3ziZkCi6MZQjwvuz2yw9btFMOnz1ZVJv2qvSwP5J7ZUSd+?=
 =?us-ascii?Q?dAW7mMENhM4vvqu/s1Io3GLbn6/VLLbf4l6YohZrD879Kv4OHfYNk6lTL2Zo?=
 =?us-ascii?Q?27lRI3epSazNT55pa9mgK+p6Aw6qjn5iN56RD6CcIu++OmzfYoHVEGPKEXvc?=
 =?us-ascii?Q?1XYJjeMW1z7BAGQcbrX1MQ5X+xAnfTM+ov5u4+d8Mx59cMlZYoQBMkm6XYYK?=
 =?us-ascii?Q?EUqezSVYxRsPunDJZb9BIBIUFNO0vlZ8fJQyhMPbm9BRqdKflxZEYMVOhuko?=
 =?us-ascii?Q?x3hDtLikoxti/2Gwr7sfwwDTZa8pB+1TvMeKroHh5L7vZb4B4q8epgPBXyXp?=
 =?us-ascii?Q?0qfLXM1uE2eXz3j7onMruQSqsqjkVfRGIR788QjDumx4YXSZPMQD9WSCTq6f?=
 =?us-ascii?Q?+Ecw6nt8H9TF5hBur1YLoSqfUqFg71pd27LrrSSePfYHyCfZVT4EL/kTOBTT?=
 =?us-ascii?Q?5h82DwkYEzltSmIcRbP8VFVSPqVGBsGp1IugBD1mHgvFo1Yjx4WZBq4P4ySQ?=
 =?us-ascii?Q?VEHdDRkUQsJdYiocsk79DCKrwDw5MRS7PB0TwAm2ICJ0ZyIa5OPbXP8ysKMM?=
 =?us-ascii?Q?y/DnusyuQ1n+BXXuitVqo1HJ4SLJIESTKwsQA/TE//L2YnFV6msFMgq7tUQH?=
 =?us-ascii?Q?fhjmyROQ/sTK345Il1+vHY38v29DTOK3Q8npRHQd/VoTC/WuoaRTYeQxWij+?=
 =?us-ascii?Q?dTSiUT4eB7pGrG3AyYmQqZOY6kzJmrzn2OOjnEzXbDAmVXQmisJcuO84IpkP?=
 =?us-ascii?Q?mbrWRkiDJjWSY3eey/5lDM68+n/NQuBMXDFFipKmyk/UcWS+BSdGN7rboJ8V?=
 =?us-ascii?Q?nxH5bT77ArQ93mJWTgYqFTfFrjfnAPUyJm9OfWhuWwEy81ZcpIQ4hgZKu3Lw?=
 =?us-ascii?Q?Vr1B/c810B5KoNBL8AV9hKNGwyCSAZKUD39XILYsjPfOsSdcpMYjzZiM3Umc?=
 =?us-ascii?Q?+a7fVpi1susgstaZ+LHT5+aHeY+MwZERkkKayk663Jo/EvtCxLGMlrmpy1sT?=
 =?us-ascii?Q?o6eHG6/wjL7rJLwvPmoHybMvNDktxaPBoWtZWJ/Qpm/sPY8pO+rvyqehk5a2?=
 =?us-ascii?Q?CXXU38X0FrBgSzawSoSgpWuo/mQ2N6QJMCGbbwhVG+5KL+lYw2lIPAwQo28O?=
 =?us-ascii?Q?x1QW59EaCUGcy7Afp4xBb3yCNH9q7G6A1Hdi4uDt+BD//WgPzu0rfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:36:46.3685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d63a9b-dd11-413c-cb1b-08ddad58915e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
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

[1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v10

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

Alex Hung (10):
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
  tests/kms_colorop: Add a colorop uniqueness subtest

Bhanuprakash Modem (1):
  lib/igt_kms: Destroy colorops on exit

Harry Wentland (25):
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
  tests/kms_colorop: Add 10bpc test and skip if format not supported
  tests/kms_colorop: Skip if writeback does not support fourcc
  lib/igt_fb: Allow any non-planar format for igt_copy_fb
  lib/igt_color: Support color transform for XRGB2101010
  lib/igt_color: Add PQ variants for 0-1 and 0-125 range
  tests/kms_colorop: Add tests for PQ variants
  lib/igt_color: add BT2020/BT709 transfer functions
  tests/kms_colorop: Add tests for BT2020/BT709 TFs
  lib/igt_color: Point license header at skia license

 include/drm-uapi/amdgpu_drm.h |    9 -
 include/drm-uapi/drm.h        |   15 +
 include/drm-uapi/drm_mode.h   |  109 +
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  648 +++++
 lib/igt_color.h               |  162 ++
 lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
 lib/igt_fb.c                  |   34 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  402 ++-
 lib/igt_kms.h                 |  100 +
 lib/meson.build               |    1 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_colorop.c           |  751 +++++
 tests/kms_colorop.h           |  261 ++
 tests/kms_properties.c        |   94 +-
 tests/kms_writeback.c         |   38 +-
 tests/meson.build             |    1 +
 19 files changed, 7613 insertions(+), 61 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

-- 
2.43.0

