Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90BFC5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277AB10F28A;
	Mon, 26 Feb 2024 21:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vDufAG3S";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D444E10F28A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxSL1L/JV6EtjF/BtF6Rr/6fdi+NRnC65omaPYXqJjG/XA56385pmrWpNORFb6uk6EiedK46AqeaNeXTOf3OAizmVc9iDjRD/rUnuW1OeILWHelfo40DGixQDV+LXNh2j3hGiZiOoi9mMQifhLyanZ8NJ79asNXsRIULMjJFtULvl4ssC5B/kS4kRdKNiQbnPx/hzbZ9pN7cjP/rgy0EFVywTT/xEp4drIVIuFs9vLuFbG3byJrUV6hAuANh09LBXo6NxOA0fxgp2FW11V0o5JfRBFTTa2CnzZG5eNbXzTby0/9DWMZAB1SdKqMncdJ5tHw0ySgFyudw7qGvRwRVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMySE11T8HqnM2O28uLJDqRVmCwAMnmmBQ9mac1/hA8=;
 b=l3FJHTZ3stAtMjTz4sEwBgGiKO84Q7VpMOOXc+xNy1hdUz7xayAvHs5S37r7fq85t3sFHgRmfMzvW9/pXzjn2qfci50A8h1FZKhKdy3qTRb0CH1uiKrWEkG58Ox56tTXsBGehvE5AXmADRJPj8Xdt2RLk61p4j/ClXnGDUq2hY3m1MS/9lANZspMkNKhN+Pmyc5bwoXRUBgct0iEc5cOpH80c6Fv3cE6d+lZvFbQ3sPwUpW7lCj3xP9K1FIZRKZoxA+LFEmSLnz2dMorjver+M2bzNwCK1buh/fXDxtCwEt8GSsJEeFF6PstcJHZYSTe1czD7R2Z74p1QAyA1krAmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMySE11T8HqnM2O28uLJDqRVmCwAMnmmBQ9mac1/hA8=;
 b=vDufAG3SlLsG2qMOXXeMMj46xjWRJ6NXOJrFUqjdZadeWEJj+f/igp86R1KYeXM4/XrmQ3tlSR3MiIzltWPvkamCaGlO04qEiFYZ1tMzRyZjwG+9H7p56mQcpJaEtaDC8Mfn1WBUTh6Dx33xuVxYS9Vlp0hXSn09F5iOJzEc7bc=
Received: from CH2PR12CA0008.namprd12.prod.outlook.com (2603:10b6:610:57::18)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:14:30 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::f9) by CH2PR12CA0008.outlook.office365.com
 (2603:10b6:610:57::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:29 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:14:29 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:29 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 00/32] IGT tests for the KMS Color Pipeline API
Date: Mon, 26 Feb 2024 16:13:44 -0500
Message-ID: <20240226211416.100660-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 325a33d1-af7f-4509-fb48-08dc370febd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5KRiLRpUD/FHJiQxneU3LoJCpPc2LLBUZRfuZSrnTFCzugfvvEWnsPUdnSNEylJaaowvuBR7EZQzT5XVDSs23ZSWv9zDGFKc5Wnkg8+RSIeEBlCyDIQ6MZ1aB5ATdBphkjTBKe7ti0N2YHxmyyvkRNjaoRjVQXfo8zzHRsIjVprNKLTEvK2UAxvP8RqjHvaz4KfYnIpgzuoeHdY/4efvwOUheZ+peKgQPt8LHsNxLRgk3oO+ZQKwPNUJJpQ25IWVHmQsUUL/9xfXGI2aXfLmAqXCE/ua2x6yViSoLtiIzxhbWbxBrCUzrSAN4+qgIOyK6HrR/7plkLGy/3yir9lcv6RwzhhE1llaucXlightNDpzV8S8ltlQanVg+EPqFzGEPFwvShUEtXCxtwLoYxi4BCI/8ga2+NZdU6a7jCoKmR+/+vjdqTIoHnOIdwm8fYCJvqWJsG7njJ/GVr4VQf2qtnwhUN4NALRlk5WHOZx+R2UxstqXVel0RYbYHr2nEqt6KsKaX7CWmWqdC/9rRX9Mj552iw6+A57JwZDUlkQHLli9cEUAgTHlkfYO1ZSXPflwaYsEjbprAknDnr+FVhOJ9ouDgHTDJF9F3wALN3dK/Kmz/aZLrV5gfvrlvVdKtBVUTIAdjYxRwEYy7IbLmc/vvXH0MnkbPOStwl5EJ1HiKhO5bzDzX4DxicBU+1VLjRvvxzgq5vjCHHE+X7frexXtVWQvXP3TjFlxPPApQVdvh8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:29.9889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 325a33d1-af7f-4509-fb48-08dc370febd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673
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

Kernel changes:
https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5

It also adds a new kms_colorop test case that tests the color pipeline
API. The tests are designed to be easily extensible with a "transform"
and "compare" function pointer for each test. The "transform" function
performs the transformations under test via SW routines. The "compare"
function compares the DRM/KMS result (via a writeback connector) with
the result derived via the SW "transform".

This series introduces a number of tests for pre-defined transfer
functions, custom LUTs, 3x4 CTMs, and a multiplier, as well as a bypass
test.

It tests 8-bit and 10-bit RGB surface formats, depending on support
by the driver, both on the drm_plane end as well as the writeback
drm_connector end.

Bhanuprakash sent an Intel series as a v4. This v5 does not incorporate
his patches yet as resolving that will require a bit more time.

v5:
 - Bypass test
 - 10 bpc support
 - Proper setup and cleanup
 - PQ/BT2020 TFs
 - 1D LUT tests
 - Multiplier tests

v4:
 - Intel color pipeline work, to be combined with v5 in a future iteration.

v3:
 - Remove need for IOCTLs and libdrm changes
 - Test colorop properties with both atomic and legacy code paths
 - move enum drm_colorop_type to drm_mode.h
 - Add descriptions for public functions in lib (Kamil)
 - Use SPDX style license identifier (Kamil)
 - Replace Skia license comment with copyright note in file header
 - Fix kms_colorop subtests if applicable color pipeline not found

Alex Hung (5):
  lib/igt_kms: increase MAX_NUM_COLOROPS to 128
  tests/kms_colorop: Add a sRGB test for EOTF -> Inverse EOTF -> EOTF
  lib/igt_color: Add 1D LUT color transformation support
  test/kms_colorop: Add tests that exercise the 1D LUT colorops
  tests/kms_colorop: Add multiplier tests

Harry Wentland (27):
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

 include/drm-uapi/drm.h      |  15 +
 include/drm-uapi/drm_mode.h |  24 ++
 lib/drmtest.c               |   5 +
 lib/drmtest.h               |   1 +
 lib/igt_color.c             | 460 +++++++++++++++++++++++++
 lib/igt_color.h             | 153 +++++++++
 lib/igt_fb.c                |  36 +-
 lib/igt_fb.h                |   3 +
 lib/igt_kms.c               | 327 +++++++++++++++++-
 lib/igt_kms.h               |  98 ++++++
 lib/meson.build             |   1 +
 tests/kms_colorop.c         | 662 ++++++++++++++++++++++++++++++++++++
 tests/kms_colorop.h         | 242 +++++++++++++
 tests/kms_properties.c      |  76 +++++
 tests/kms_writeback.c       |  56 ++-
 tests/meson.build           |   1 +
 16 files changed, 2116 insertions(+), 44 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

--
2.44.0

