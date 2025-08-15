Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C76CA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1D010E958;
	Fri, 15 Aug 2025 04:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qIsHrGHy";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CE710E958
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNwFTcGYsDK+uZTpmRMaGf+PdZJywiDDH+5IesK9C4Mb536Df02kcV3SMH4Wu7NqBPLqKgEIJf5b6ofHSzX9O0OfC6fLwKaaRjJVACWNCbL5Qmu3P0XocMKEteg+soQvCQZlRJ2Lm3s9NV/wwSc0s+AHP9NSDClhUZuPV4qTFyhAnV1pf8NkBIg7AERLiEc6jpZIvV6FUQMxpadKD5R9Kw/7N+xqwRpY40Mxy/Y37UcLIlbm/snJadpSjjeZUOLgkjHoU0ByGqU2AoiRPhvIKdMvuuQjIG/N6zPQGHtZNDcP2zP4gh+VU8gfoxsPKbk1yIj+lRIiHCpqcLfveSeycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM/kviV0X0WFsRZE8i/Fkj9IzsxZp6gVp09ayrkeuW8=;
 b=Qst/HEKOJi/zgRJfuWT6Hr/jfu8zff+i8nmE7Ms/O2QW0lRpuTAmOW6kHAQ4diiQgbUDn02vhRfTk0r57+VgUfzVjITJ5JGjc8i+14i/dG/RSGk4rRmyG8X7jrcjG6B4tfkYrrNs4UB1zBGzq+80kRDBzBewZaTtCnUICejaMVcKZ5UbK9GnCIMFesffpcxS215/O/47jBjdPBVqQHx8sNypqg7cK0Kry8F9yMQpTOFO7DFpt2h4WeijdGb+SqoAubCbJFeZMTCOFYxzEOvuvvas/wVz66UwojKYTJ1YXAuK4jXO5GjVmRmSzPrT7Xck3+/ZyingqCfTm7dCA6yhpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM/kviV0X0WFsRZE8i/Fkj9IzsxZp6gVp09ayrkeuW8=;
 b=qIsHrGHyP7dt7neFIezeTaubz0jPx265BnGu7u6MAP20BBWScY5XVHiI8J4W7cYBnnYtN5sJDB/u+RYOvqbgcp8D5ApyTKMs0T9pF6POPHLvJ452Cpwn2SBfDy2fDM4Ggs8EFaJY1W0JyU7prwXpuA+d3okGb3Tg/yZ5nWIR360=
Received: from BYAPR08CA0031.namprd08.prod.outlook.com (2603:10b6:a03:100::44)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Fri, 15 Aug
 2025 04:07:17 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::30) by BYAPR08CA0031.outlook.office365.com
 (2603:10b6:a03:100::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:07:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:07:16 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:07:13 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 00/30] IGT tests for the KMS Color Pipeline API
Date: Thu, 14 Aug 2025 22:06:29 -0600
Message-ID: <20250815040659.3321102-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: ca36bc7e-1308-4c50-d183-08dddbb138d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fjp805xHwr1oebNr4rLJ9bJWQwxDXpAWupxVZkSCmwZrkL4v3MvU6VoJuVIZ?=
 =?us-ascii?Q?GzhWH7uSFyVZONvK+ME552uc0mqmKhsLU9UuDb7bhYpjcszk7tacjAnAMcwE?=
 =?us-ascii?Q?ytGdIXd1UVk7F28lLVrcaCLXYXnpTz9iro9NWdRZsILbVnURxlGjSUrhpcOh?=
 =?us-ascii?Q?xGCSil6oQquT770ppQnheZwNuxRLqzLwn7jYNaNhXtkfIFIa5ROGFtSOYSVL?=
 =?us-ascii?Q?sbfTqHNsOmKOAUdmUKxxuTLmYSt38I01JPATk+1FtLPZx8Cb10yVTcvqCFj1?=
 =?us-ascii?Q?y5HZTzyTGQRR8DT/K11CU+2KXFbsJX/63cMm9+PYztHc3VYdN+OKus+jxhDt?=
 =?us-ascii?Q?UskkjmcbWdn/2EJGgbgX+aWc+MRWpybKNEyvtEZpOw32umZp4+WRTpbmWT0L?=
 =?us-ascii?Q?YA3TXgvUHK5yLFlXAljSQPU4Fk2cyEH7JsDdjJLLpmBaBrSH4Rd0hR/YUuSy?=
 =?us-ascii?Q?SIbl8M+tmpUbjKTI2k0O86p8HlMCUOGYr59Jp3vlxDEAL3iJ2mIdmbUen4Nt?=
 =?us-ascii?Q?1xqTEFV/xBqedJn+YO+n2pz+YXEEGrF19yWLjnwdp+jz4zWCnayUkvm0oDRN?=
 =?us-ascii?Q?SUVTIz/VNK2GojeUNJkSdeW2SQHV+zebLYQCGWjgDQjVrCrWzHZZmnOapQiu?=
 =?us-ascii?Q?JQONSKoy4cwgbSdqUz/Xa1k+kGtjvGBrl+dU7IBjp3KgkgubSUQBaeu6STyX?=
 =?us-ascii?Q?/GqafbTqBbsUEkG11BoA5vE0gWEjbilNIRzzfs60MbD4wIpn6UT4pg1iLB/S?=
 =?us-ascii?Q?Fe76ysW/8EQLNskif4ZiK3mnvvG6oDlSQMR34f5RfVmIzOcysaaATDOLd4Uk?=
 =?us-ascii?Q?n0GU19Qpnc0vwgW/bpbWehLA+i6ul2qBk/KffXDXkDZggphE8vBGrLTGI780?=
 =?us-ascii?Q?dotyZGbIINDp5wyGdCTDgD5hNsjckCGzpssgBWI44jnOU/xY+chXiRzJzwJK?=
 =?us-ascii?Q?lVD2u7f09NAbyAHg4TO2XUSlKNM0/t2dxo9RFhpzR1ps/9ZCKe9fvjmDIEIg?=
 =?us-ascii?Q?oMYA5g7tGiuoKSuSP/ZlsgbGto9TZVHOqWgzTy07GVUaLntM5PznDPM4jsl2?=
 =?us-ascii?Q?FOzZNyx8X2J3u4y6/iTai+zRuaRBw1LSjhM2Rw0YrSfzM2iibBbpzoRH8o/H?=
 =?us-ascii?Q?J6zTj6AQncPvwfcij09NZiI+Er5BmgSVgMPhwkWdgClNOLNtOPke2k0mv6b/?=
 =?us-ascii?Q?j6qFadtmT4Oag8jBBqapt1MDiZvyXIb5vU0NbpA4y1e9TTPs7Eh3LesQvTN3?=
 =?us-ascii?Q?sa3YjqHKuDssO8jkLMIUXHuPpKuMmf3/oIlEvgo7kkzj3osSoUQR574V557N?=
 =?us-ascii?Q?YvWZPuqaRB0igRQZu63tsrOa2N9sqOkLTH1SXuMI66X9TP108WMK/s6/vZV8?=
 =?us-ascii?Q?5McT8una3W94oOiY1LOwi27SJic+iv8Lf82brHO1Cy7UMqCMzbPGGjqWnxy8?=
 =?us-ascii?Q?qROArTkSq4WGmz0m6CvMyzCUN1HbVCC6Ob4BXgBiX/zymv9aSMR31Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:07:16.4432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca36bc7e-1308-4c50-d183-08dddbb138d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474
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

[1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v11

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

Alex Hung (9):
  tests/kms_colorop: Add a TF sRGB test
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

Harry Wentland (20):
  tests/kms_writeback: Fix kms_writeback for VKMS
  lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
  drm-uapi: Add COLOROP object
  tests/kms_properties: Add colorop properties test
  igt/color: Add SW color transform functionality
  lib/igt_fb: Add igt_copy_fb function
  lib/drmtest: Add is_vkms_device()
  tests/kms_colorop: Add kms_colorop tests
  lib/igt_kms: Add support for DATA colorop property
  lib/igt_color: Add support for 3x4 matrices
  tests/kms_colorop: Add 3x4 CTM tests
  tests/kms_colorop: Add bypass test
  tests/kms_colorop: Add 10bpc test
  tests/kms_colorop: Skip if writeback does not support fourcc
  lib/igt_fb: Allow any non-planar format for igt_copy_fb
  lib/igt_color: Support color transform for XRGB2101010
  lib/igt_color: Add PQ variants for 0-1 and 0-125 range
  tests/kms_colorop: Add tests for PQ variants
  lib/igt_color: add BT2020/BT709 transfer functions
  tests/kms_colorop: Add TF BT2020/BT709 tests

 include/drm-uapi/amdgpu_drm.h |    9 -
 include/drm-uapi/drm.h        |   15 +
 include/drm-uapi/drm_mode.h   |  111 +
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  634 +++++
 lib/igt_color.h               |  149 +
 lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
 lib/igt_fb.c                  |   33 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  378 ++-
 lib/igt_kms.h                 |   98 +
 lib/meson.build               |    1 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_colorop.c           |  734 +++++
 tests/kms_colorop.h           |  262 ++
 tests/kms_properties.c        |   92 +-
 tests/kms_writeback.c         |   19 +-
 tests/meson.build             |    1 +
 19 files changed, 7543 insertions(+), 42 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

-- 
2.43.0

