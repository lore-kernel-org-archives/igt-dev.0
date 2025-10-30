Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D63CCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4451F10E23C;
	Thu, 30 Oct 2025 04:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aXQHHw0j";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010018.outbound.protection.outlook.com
 [52.101.193.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A10510E23C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJt5uyaW+kg+mpYZg5RKuyRYBRjtvt8QIgq6k6VHSapztqoSazSJZBlS+Qg4dc29x8NkujzD7K/1Zzmt8xhFGVhOnusydZoRawYRK2LGGZ53OjovEsdu0pd0vjTB39EJVVH4gpOpukEP+8+7elfIeAYc4ap1dgUHh1WRdnepJfeClprhzQbrV1fFF8p5Cgb41re6cPKcGjBnTLilQXyB3iZwhyqO5Ufg7dkZMBvFUGDLUwzk6os/UIJAvYwH+Gpq0f8UYnsE265dA4LLwbA6QWqLFMdopAmHhfKj450gd4suIUWcwu6QIw1waibStilG0gUhQmXWy451IpERwy0TjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s17FJ3XwXyQZ35KSsyMg3zX+g9dozMPT5OVhTOMO03g=;
 b=AxQ9bp2eUqgdWdqg6eVtuompRF7VCUcC4ks78zgvqKCCLf+ezlsrsYNvyJm/GFHi4Y/wpeDEkMWPkFt5RUKqy36ViQ3FTvgWiVR8malFfig7WWI2j6H8q/6sL1uE7Tj+RfNGbQXCPZ5NLMednF1pewUbVC/Ye1UP4QrqCeuwI6bFhLWV9aTyOQpntPbJHW5yZbTNBR4m2UeZq8/2UU5kFaDpXSmwWGH+vbqKrBiB606XgBOMjBrrFDBQmchmU+LlNzFNNF8RARUezc/awv9DlFTwZgL5tysqyMxhHpX/t+CcTO8midZ7VfoYhZhJKo/9ubhuQ5a0G5tMaymlKuMqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s17FJ3XwXyQZ35KSsyMg3zX+g9dozMPT5OVhTOMO03g=;
 b=aXQHHw0jFZenBPSu+7W5nAyCzEMU+3WC4KAwyVucTj6FV+E++L1YEJryKBzI6CnIpzxWNyhV+C1EkAoHIY+HPjbNF1Od29jLArAwgqmWfCgKCB0VH1kpOMvoID2EyowyOybR5GwYiIJm1w00fkkW6+t/R9ylDDdkURKaCxIJpjU=
Received: from BN9PR03CA0347.namprd03.prod.outlook.com (2603:10b6:408:f6::22)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 04:28:19 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::46) by BN9PR03CA0347.outlook.office365.com
 (2603:10b6:408:f6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Thu,
 30 Oct 2025 04:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:28:18 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:28:17 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 00/32] IGT tests for the KMS Color Pipeline API
Date: Wed, 29 Oct 2025 22:27:29 -0600
Message-ID: <20251030042801.2315866-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 215795c2-4c86-4362-54cb-08de176cc070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bujhsGv++wB5Wc8fK2tjmBhwLRfIgr/yLA+wPL9ohTlCf6KtqqVh9hzhGaYz?=
 =?us-ascii?Q?3iuTGELDBd1d+PearDDU3+QOZfP5n4Uq1VCZbSf3Q4K21KlxnwiWkFBboFrk?=
 =?us-ascii?Q?hSOOGk6HeAtC+W81ok5PL+AzU9tegyMzP5WEhBP12nJjM8blENPWvsxWsn2W?=
 =?us-ascii?Q?aq7UUu5piCAWPUborFiCD0tFG6pgx//7DyD4asyGFOOBJMCn9IISJTsxU1Xw?=
 =?us-ascii?Q?NBtF1v5ZHuSi6Li50bSwvK8R9+IV+MtYUNp2fPA+JBE4DdV+VPSOWGjWEZ8l?=
 =?us-ascii?Q?v9iVSmn8BZdYEYo9uEAh/CjQYcBOAGe7vO6g5fF88fHDUYtiAoKRaEWurRl9?=
 =?us-ascii?Q?WioFM/oxg5oHdby8gpPi0v87hdCM68NPnzx9CY1eJ6xcVy/NsQ3JaZFn+Wjw?=
 =?us-ascii?Q?7Hhzk7Vdy+8jgNCTatkxMJqb7QnmbfAmKd7iQ8dnbj6vr6OZcjR02TnJ0PvR?=
 =?us-ascii?Q?nUSFieNtSmUC4QhNmIHvtyw//kleBcpb83u3l+EKvESi8jhJWILmntNs7hC8?=
 =?us-ascii?Q?yjRD4Equ128G5QmappLU6iPrpEMPDic6fcFKr9S7ESyNVdnTKDfUelWMZW/+?=
 =?us-ascii?Q?XW1O50nLuGbvX73ZCwylewYitQnB7V1nmgrXhKJ3EFYiuq/0ryhUkdSprMQd?=
 =?us-ascii?Q?Sa2WgoaDM39LxCpZ5VTNsX+3fImAl/4lowUX7ByGpQV80kqYCK8TWNtYR5SB?=
 =?us-ascii?Q?IoBQbJjP5D2suZW4XnNrzo1bGvjb0w23GqkMhiFhEh6vp1eYC4QKUPHpfSyN?=
 =?us-ascii?Q?JbAV8KVjGjHLgIi7VqDUOCMf7dmbUk1SZpL25fMEq5Nz1G7inbaKw0rNGLKP?=
 =?us-ascii?Q?EbubJjhDq7u0/uxzCjb0n1uo0qWfeCPpvMKQ6/GEjAd7dmBdnlUB1MV+HWON?=
 =?us-ascii?Q?/J6hm0BCEfwQx6xTexNFLwcKtkSQETIN64jlfNEBr9hYKi5maq+WTV/IWxd7?=
 =?us-ascii?Q?1u+6+UBjevXZRvyCdVlSuyWHb4AC7O7uZkcNrXkvHAMiiyXGC7Rgp6HQw4py?=
 =?us-ascii?Q?Cmkn8tt7kM6A28U114m+OwO+vE1hr6xZAoIXHaueagKmxmRXE45cX5L0nAX8?=
 =?us-ascii?Q?msc3UHnw5MJVtYO8j4ZuFDu6mDG/2RhckJalpJQDLdHf+JF64nYVB0i6CTlW?=
 =?us-ascii?Q?IBdS2Oq1jIq+dgzAvKte6bCdVTKezkOzOa/aO7ismqDF+npY389lh6g5gMRt?=
 =?us-ascii?Q?xvJ1FADomg1BFj++y6H5phQktILDOh+SC/GewBf5b4Q0ZKLqGOjesC+NX0uN?=
 =?us-ascii?Q?yNgNtPNXCRhAfECOhxlF5ZwDcjKXcMYcMavV2eqTLEKPhATDWPKDsxjsJ7Bj?=
 =?us-ascii?Q?TDGKAvtDmweVX0Rl+XQ1axduU6CQY3S1d8epum6sxI7g5kWKZjGLFRwhJfNu?=
 =?us-ascii?Q?nkLUGGM95dkxf+sw1ZDM1RhFciuZhafX8hhUiTFd7Qy7+fv17ZRL8lvmH/B3?=
 =?us-ascii?Q?YJylXXEIYniDQa40QxKGMw46KJ1RTr/c2mMqTr/M8kAbUr36m3u46b4PIoc8?=
 =?us-ascii?Q?YSkwDFoy7ukLAqM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:28:18.5248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 215795c2-4c86-4362-54cb-08de176cc070
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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

[1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v12

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
 lib/igt_fb.c                  |   45 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  412 ++-
 lib/igt_kms.h                 |  102 +
 lib/meson.build               |    1 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_colorop.c           |  704 +++++
 tests/kms_colorop.h           |  266 ++
 tests/kms_properties.c        |   94 +-
 tests/kms_writeback.c         |   24 +-
 tests/meson.build             |    1 +
 19 files changed, 7570 insertions(+), 43 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

-- 
2.43.0

