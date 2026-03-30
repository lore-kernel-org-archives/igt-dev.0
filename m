Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221671061B0A
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A1110E6C6;
	Mon, 30 Mar 2026 15:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AKFybSuq";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A254F10E6C6
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMYZRAOezNYhbW4MRM2bMoKyIU6YF/p21sWHFyqdiEUvE5s5rIIye0Z5hlwwJ0Wr5ORymICNGgj34R8cfd7nhpxhPY0S7ROM9UIV5eSGz3PoHdQdFRXMNZ3HSptMqh2f0LsafPH/dNlCjBJEdLb4GfQdhsnbLv3dDLGFtuicxuOWsByWqyKh0po3I21NUjGQYqXGbSuEI8ns90C0WnHRpm5+hUC/XKcOhKdHmNpUY/i6lPxbHJMpoMB4I5jDOZ+Pf0XpUpRq4KYvqT3EsdoSz19UTpp6xxQxrb6ZjUoDTSH2Jc+YvzeB6UXki0KIapcWafgY+6ELV/4DA81H/B+dew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5u91Fx7/hPkGybDJcWpkQ0tPE/grZIHTYxOzN4FQUZg=;
 b=Msr/mbO7E66YQv15V0DYpEKIVgJsklb25SdamkSzkY5VOUr9irQcBRpo/zTCjPHq/NMQIwNWudzrr4+DI2mrxVgqTuhAUpnAptqfT3K76w/LbMO9YvXyIDvLmopXHIhuFIYu5uJCIw58F4ytaG6Ed+c3saChTa0YHJ0OUsZy+XiXBsyUn9zbmXHJbPLsZIGwUJGeFIJVF0y+KfSE8FpXqrnrRVBfkDXJsjENtJgI6hqmW2+gSmmbaMBSM6EYZ55tYX79nFnku+XyH6RjLKWJK209uBcbGgLhCkgC3EtQc2FMuEXMuxGUK8uZb7E+Uyo3RwNtRg2uC8skmiDDP8KgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5u91Fx7/hPkGybDJcWpkQ0tPE/grZIHTYxOzN4FQUZg=;
 b=AKFybSuqSuon4HkX3uNeWwomFNKf2ai/SDkvZYVUsMfjiymvGzQqW5mQxx7CIpJYyooPUIT2kehqmNM4MInZgN4Fj/2E6rAL8kiR9RUiynE7x+riEO7nMNjnDPHT3rtCEg0M20FBeoSqXc3VkZ3hJQm0culVtaZG62G4Ho+5Zek=
Received: from SJ0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:a03:33e::14)
 by CH2PR12MB4214.namprd12.prod.outlook.com (2603:10b6:610:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:26 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::c0) by SJ0PR03CA0039.outlook.office365.com
 (2603:10b6:a03:33e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.25 via Frontend Transport; Mon,
 30 Mar 2026 15:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 10:35:20 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:19 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Stone <daniels@collabora.com>, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>, Uma Shankar <uma.shankar@intel.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, Melissa Wen <mwen@igalia.com>, Simon Ser
 <contact@emersion.fr>
Subject: [RFC PATCH v2 00/11] YUV Conversion Colorop tests
Date: Mon, 30 Mar 2026 11:35:07 -0400
Message-ID: <20260330153518.99898-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CH2PR12MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: 79aea5b4-3206-4175-cbbc-08de8e71f751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: gkOEHl70XbH6ohOVGPVsj78cN/Se6LhJa1LhF7d0Z+G04npDCMPDxDWnZhJuX1mSmoTcLK8WUxrn5uZFTogZ4B6XQGqEujDeBt5HO16Vr85xWc02YSK1HqjcIXg4DVjBPCJaq867CtpHFKAAjInQTa63PdFVzSHqLL6TdrZngx/YUpaigqXy7yU7BmhBwh67F20KhkqyEQh9B2UOJYcSMWUiC3B6sFam+FTm2XqyEh39WzEaMqpP27OAU9xX5Jd/dx3Zg2rqx45kxCtrCUuGuwIvxwRbfQd/K2qfjz3dmVpZ6a+7ONIhDs/WEd16n0U+9wxDqC3aAS9lId7RGUqoZaygH1wMdSiKvzdnfLR1JmHDqoTFo0QcZNzL2rgXimX0kDtjzGlPPdygS0+ZxLTYLpKOK11UG1kYsxSohLSC0lc8uvLn+HnpDWAwji1btOyIm+MnxakatNMHibjcNy8pXcTd7A8+AIPstw3iutXfd/HsAHi75m2xKp8J0CQIWt4isu3TE4FQ3ngJibddrf/DngNSZhozY8ZG2p7Lf7emAcBfiM2TWDjiRjo/eWMSnCbcnmLJTwyrtBAvBCocktcRiZmXXa0U/0144m39Pp8in+kCXbtJz9w+C5DiBs3A7/VJuM0+iRBse3frXIRgvfHTgUwhZDNlF03uJ+3QBpoUL+iquSyqU65l6QJb8RhTTYsWr038Dc5zSrtZydCMyW6D/b4kuS2/JpI3f46dOEzA2Hw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i++iwii9x4qXgCMSCGsuPa0wv1omCgWOxZuScfLwKz//bIAWSSHapP9bEsFSI9MxDJjFBkXT6MlH8U0HrLQuUmXUjaDajaI2QA5P4iDV5s8hiRKC9hprSUQNNBuMfCql4XW/kOzxOgHeiQXPNxxO/+n16SPTX0KGcxNTTHAJoBCZsEtas9314cUdLdcCwY5J4LNzfHP2JpeIabWP+v1SeZG3/JKCKeEobi2Hm7G9qirjgNELNQ7ia+yKt0tA04/gMz6OhFDBXMuqHvbl/oIDJj9KRBPefMcSwainYo9Gs9STh/8s4EgnfjrZwtvHLCaA7LEIM1eMnD7pTQoCXWL3zzadAZUpIW2eOlBL65HXUSyqtCHAcuY7B6d8uluwhI2euYbD4nIOlgA/P6VpsvELU92ZmlkueHh5hpxBm18Trrt4x5hRrC9zCNxVJ4GCjlh3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:26.2117 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79aea5b4-3206-4175-cbbc-08de8e71f751
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214
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

This kernel branch introduces a new CSC_FF colorop with
named matrices, including matrices for all YCbCr conversions
from BT.601, BT.709, and BT.2020, both limited and full range.
https://gitlab.freedesktop.org/hwentland/linux/-/tree/csc-ff-colorop

These patches add the functionality to IGT to test NV12 and
P010 buffers with the kms_colorop tests, and add corresponding
tests for CSC_FF to kms_colorop.

These test work on amdgpu (P010-XR30 variants) and VKMS
(NV12-XR24 variants).

On AMD HW a couple extra driver fixes are needed. They can be
found at this kernel tree:
https://gitlab.freedesktop.org/hwentland/linux/-/tree/csc-ff-colorop-all

This tree can be found at:
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/csc-ff-colorop

Some more background on this work can be found at:
https://hwentland.github.io/2026/03/10/plane-color-pipeline-csc-3d-lut-kwin.html

Cc: Alex Hung <alex.hung@amd.com>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Simon Ser <contact@emersion.fr>

Harry Wentland (11):
  include/drm-uapi: Add DRM_COLOROP_CSC_FF and drm_colorop_csc_ff_type
  lib/igt_kms, tests/kms_colorop_helper: Add CSC FF colorop
    infrastructure
  tests/kms_colorop_helper: Add helpers to get encoding/range from CSC
    FF name
  lib/igt_fb: Add YUV color pattern framebuffer support
  lib/igt_color_encoding: Add XRGB2101010 format support
  lib/igt_color: Add YUV pixel reading support
  lib/igt_color: Refactor transform_pixels for input/output FBs and CSC
  tests/kms_colorop: Add CSC FF colorop tests
  tests/kms_colorop: Keep CRTC active between YUV tests with temp FB
  tests/kms_colorop: Add bypass transition tests
  tests/kms_colorop: Increase VKMS bracket to 3 up

 include/drm-uapi/drm_mode.h |  25 +++
 lib/igt_color.c             | 242 +++++++++++++++++---
 lib/igt_color.h             |   6 +-
 lib/igt_color_encoding.c    |   1 +
 lib/igt_fb.c                |  41 ++++
 lib/igt_fb.h                |   6 +
 lib/igt_kms.c               |   1 +
 lib/igt_kms.h               |   1 +
 tests/kms_colorop.c         | 436 ++++++++++++++++++++++++++++++------
 tests/kms_colorop_helper.c  |  75 +++++++
 tests/kms_colorop_helper.h  |  16 +-
 11 files changed, 740 insertions(+), 110 deletions(-)

--
2.53.0

