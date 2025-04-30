Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00569C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97AD10E24D;
	Wed, 30 Apr 2025 01:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eSNz1Okm";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77F210E24D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EL836z3tGSU8VADxuhreZrbduGv2EB1RHrpaitI3/3wCPCNXr+qVc3wl5/cDHEnxbaWLrEA4LbW7G1qjQs18PG6bO6TbdCzwaRP56jE6KuK4MjxkKF3kXpuFlxjox/0Rha6WaEfifwHKu5CJnBSaIMzDPTxQUJ2vcD9Jz6TDqtbOHxWV119JZNa2N0XxkuV+Gn92RyA4RdPnch0DAWyqsZ6RPD38zzhFgrLB13Sgo+mBvxxwm6M4BmMvfxvmdf966FFxHi1IlOC1T45ZLscphKHCCe6lVxso+2cmahfQt92dQUv/vA93gMoXv8B8uy4Lg6FhduG0dlNpe5DtwaDJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dbUo3R6bfxBEd0YVfug86Yaewt0ncrc7d02nQlgQD4=;
 b=LMH2prQTaiL8Ui1vR+nXEl68woM+Th+tOhnqJI33DZ9qS1mwLbnIw4/GWmpeDTTOwT4pQShX2QeHx0WvGxkrZB/62Lcc/RHdfxfojNAVqT5EHu37DTgoohFcw22cGSIZav85SPYOvIHf+5Cr1oMOXUpCLrart6HWbifh5EfFKf9FgQ8IS8nx0cJB0XWWlcoMGP0Bv18sBlqe0reu7Dx5nLZgUBdoPcBTYEz5kKn77vFfHyDb1v2uMDWEPPnssPrXtc3wg+43rFNGfvk8moDrJ8wqTUW9Hp/xGRA404EyidbTuWpPYPGMFr8ddnDjdJ3wySVm8zmO2qVMvFg1jOs6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dbUo3R6bfxBEd0YVfug86Yaewt0ncrc7d02nQlgQD4=;
 b=eSNz1OkmPWX3NeBmdI50/b//7d5a5WrgGzfSbe2ql6K/PJggxNIqN7MqXCMsJJmaGthqlQhziFqj6tMW7qMk669J3C3F+Vh+EpBA786beI5aYID8TEqZEvBpXPGVTGzYMUqOZro/3RQOYPsJFWPYBWLOjsFRb0sD0aap4riVt7U=
Received: from SJ0PR03CA0358.namprd03.prod.outlook.com (2603:10b6:a03:39c::33)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:35:24 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::53) by SJ0PR03CA0358.outlook.office365.com
 (2603:10b6:a03:39c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Wed,
 30 Apr 2025 01:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:35:22 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:35:21 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 00/36] IGT tests for the KMS Color Pipeline API
Date: Tue, 29 Apr 2025 19:34:18 -0600
Message-ID: <20250430013454.226910-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|SA1PR12MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: cad64e62-6ee8-40f9-ed90-08dd87874689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C6rErsyMJB+j6K6R5M8h2pq9COR1qLFxQC7xO8AobzF4WiIAVmTJYDAd1BxY?=
 =?us-ascii?Q?5e1SYZpM/lb24MJOG/r8C/VsZkW664zAMi+CijQ4aSTWfe16AImk59vcKPJ7?=
 =?us-ascii?Q?x3QHzNb1eKpoiDtLyPXrlfbO2Kci45nS2W2KSFz/rJB+cgCWAf05HQMj2pq8?=
 =?us-ascii?Q?LtuKUpXcUxRMVM7nLjMtVjYdSR82JL/XXAsuSO2AIpgeI/xO3dHXby618RMA?=
 =?us-ascii?Q?Cd3CHDzPbjJRxN0r0bGXFdUOFs6awTh0awKBLtj0n9n3sSecYZUYOuh/qNC4?=
 =?us-ascii?Q?iJZhofA4mjKKiL6nRniB84gFXxZ/HDBV2K66MV2730s33XoAPoGADFqdez/k?=
 =?us-ascii?Q?xj/k+E/IBiNOCVB8b2UxcnK922C/5rSKwc1w4iOb1fgvCRbedF6NDPVgV26u?=
 =?us-ascii?Q?VbC3yD72YX0FFd0Qxc0FF07G++F/1YK8MtdOB8r0Qd7Gwez0WBdFDdEU13rF?=
 =?us-ascii?Q?ve0RQlEa6mOzMeIl50Zy6czw9FdOkYxaHFcNHbQgyfsRG78Z9UWh36bv13zg?=
 =?us-ascii?Q?yuQvdotKqTqVkVXK1y0hjfU02tlWykeU5r53d5R5c8DPumVrRe0NYl9SA9A6?=
 =?us-ascii?Q?lvpvmFSRQy8FG0fXIpcjXOkKrwvSavIQO2ucTFjtKO9Bt8AVMRoa5v/VNp8T?=
 =?us-ascii?Q?xZxEK4wzKUhdSr0w5eaAmR4JDtoclA8F6Pw6cv6hRXVmtSvwbj4hyeW2QZ7g?=
 =?us-ascii?Q?/cipNbdpNbA3QckWtUjBm7TuUBi8EOwQZ2E54lLAxeKim51z6j+AbKPFkUgA?=
 =?us-ascii?Q?skLPdpbYHvkrNBX6ANXFCIXZm5jLHBQ9ivPvydVXj27Rfr8Bszzpzh9z/zbK?=
 =?us-ascii?Q?Vq5fCOUGMgjTFln/OrWapKhZu+tmUa/EA7jFQgILagwHWMwtU9Hr/VedDhhR?=
 =?us-ascii?Q?m2i2UWzO1n48iXbI25YJ5KXfJXVfb3r8mpsqn+rwLvq282Qz9my6emnCRsUt?=
 =?us-ascii?Q?wzMlbBANYrK2P2iwAesa6ql84XstdHjL2vIgJQlcgBiYpMfdmw2Bi25ZjTdp?=
 =?us-ascii?Q?NFlGdD/Uz8qC33FCx164jzY8rkz09FeYpUqyNWyZyIX4FjPnxNs1Yd8jhHS8?=
 =?us-ascii?Q?uk4p1yOktV3/TZ4+GQa8xKNSvuUfUH5+OhE4hTeuxAMkDKpYwwxHoomqgWH6?=
 =?us-ascii?Q?cQ6RjpztDnNUAd6qZtDYjI69nXj3cqu9BHRMKNHunleM5zZxSagem83dRRnX?=
 =?us-ascii?Q?YG1oGUyBBaCL+rcccauIlQw109N2Rh434jvUCE8DLtwLct6bktobDFQTvjmI?=
 =?us-ascii?Q?FS3FNBowWRRmxugF1SfSwMTc4UjQ62cHxZ64QoHPYZRszRwalQd7QiVeoh32?=
 =?us-ascii?Q?6QEzabT8dWxqR0u+T33fMUnxqnHTNFwSYH874YDhlkSR80GZFq/SkBZ5mN3v?=
 =?us-ascii?Q?ygmTznz2YZvLN1sKSNpiltjo98mHKmbvHVk+5Rxns4Cmcp4WdBoSk9s/AF1R?=
 =?us-ascii?Q?vRQZPSMlP2NIvdRsGBPFHidHApjnXJYcW1hpiungdU4af+gAS8X5eA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:35:22.8848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad64e62-6ee8-40f9-ed90-08dd87874689
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702
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

[1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v9

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
 include/drm-uapi/drm_mode.h   |   99 +
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  648 +++++
 lib/igt_color.h               |  162 ++
 lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
 lib/igt_fb.c                  |   34 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  371 ++-
 lib/igt_kms.h                 |  100 +
 lib/meson.build               |    1 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_colorop.c           |  751 +++++
 tests/kms_colorop.h           |  261 ++
 tests/kms_properties.c        |   94 +-
 tests/kms_writeback.c         |   38 +-
 tests/meson.build             |    1 +
 19 files changed, 7584 insertions(+), 49 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

-- 
2.43.0

