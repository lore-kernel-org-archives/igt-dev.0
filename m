Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D1ECDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 17:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2C10EC3D;
	Tue, 23 Jun 2026 17:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eEFu6rgU";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D91510EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ab160Qr/2sVOFeNjxLngIzWndzdXaGIIRkq2o991ccipY3HSxP+9M3pCV3fquM5hWkKR829j9BbMgBrHE+Pt2spBC+aaA+SzBud8bey7EhSzbvm6e1W3Ie/ctyX4axkDd28iWlXHH4tY7sr02FlNlgDHjtbmNqTfQc7fVmHBLXHTWx6hyBM04yMhaNOCejKXcvgDuZF82RUaz/hRzVulz8X2rNAKGlBvt2DkYhjCydIrn+q8QSBQGevTMQ1BZ/jSWrJ/co5vLCnT+MCuqIE0zgiwHzlOYF2aLuSZbi/6Pqo6Ll4Vqm9KNdzUTRxeDot0mx6NfYHfJxf4E6M+cLxDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEmTGfFwAbzRdtH6zJouhjVyvgnOfT3+WyxnFj2nQBQ=;
 b=lAp0lxzd2KLtl0sYLpZbEMeqT1mcuBOML8Y5Izidd7USMDlUS7NqQZuUpfVx81moBAJtpIe7bVTwhv1gutgMAn4HmqcbvJ3MS3oRfvq3aJm0P4snuBhRTme1zcnD/0KWx3zd0DIk4nPZyj2yzKf5ZdW+IdeR3ZcgvASk0wrgkCTrqHCi+zxQV/7XvXtsBcW5o/friyhzvhi4XHLbehTgqin2bsD7i5FpvijZbRlevSk3qziYBMTPGMwhO+hRvCexSkGKCCnlD3BLel/MTbSKLVGibfZi471Zolrmaw4f/S+hOf1pWaOiZdaUPYHtZJG0OhwMTFE3PlF3ypzh7NfxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEmTGfFwAbzRdtH6zJouhjVyvgnOfT3+WyxnFj2nQBQ=;
 b=eEFu6rgUOy3mRvphV6oQNCOXXftKpWc/Q07SJr/tQg5VFH230jSu9pIG3WZSN735JRF4x5TAXJDAnuxOrqGOg8IbnGEuW8QxTlxRhX+gY7RE2oG+yS1LzPrEZ/9EXaXCv5WYf8luBUQgq7iRtyrU9qMJsm2CY98HhJRcP/LdXCo=
Received: from BN9P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::13)
 by LVUPR12MB999183.namprd12.prod.outlook.com (2603:10b6:408:3a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 17:57:46 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:10c:cafe::82) by BN9P222CA0008.outlook.office365.com
 (2603:10b6:408:10c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 17:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:45 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:44 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Stone <daniels@collabora.com>, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, Melissa Wen <mwen@igalia.com>,
 Simon Ser <contact@emersion.fr>, Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v3 00/12] YUV Conversion Colorop tests
Date: Tue, 23 Jun 2026 13:57:25 -0400
Message-ID: <20260623175737.171142-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|LVUPR12MB999183:EE_
X-MS-Office365-Filtering-Correlation-Id: 96792581-48d0-4531-2080-08ded150ee42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|13003099007|3023799007|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: A+c6onKyu24rxP6q8qNDdyeRUq1tYRfCDIqz2NRWJhEI4CKCI5SE1owd8Irlu1K5DP8afonUJ7GPk7i9lFc63kOy7FJSDDbKe1jeafda4ujTDcv29KZnKGUMLvR56wAScLz7q+pR6kSgsZ1GlUgtSqdnfwqBxsOF5rBMQMSiVx81sxjILlw+9GaN/P8m9rQVSRTR5qes+jp0VNg1t2qqclF4ecj6e7X+6bJ0DSz+XqRmjL13xw3DsDkcUMIK/0DcQA86eo/nXj0zgrurUkIIiw+FnPILtAeE58unIH5W1xMi0hduubDGNlYaVrFJZ3Bi5Hv2QjOfqJBEIZVpl7XnPrJeEx02SwppobhcokkxXwWzxEF7qRhr1NU+wZsgTEYHOu1Duf9lXSlnqZStllufM7iPRm+D0HZpfKyKdz+xLsEGqqhKwC646f/6dTDy5zI/dKe7xokqIy8XjoPyTbv1e4AyPgFeCNUV0k/jZ8IKRIPFGO8eQQdejLPsZaw8c0v2SBXPFiw9XGAcZCi9KPMbemBi2jWWuKFBfSiKSdKDB46gwnq4e+TXzMeXSanmTDo8eyyJOrHjFxcrVI7ykWdn58AffAgqS0WlDfrFGvKS3V3G+ATrIUK6bWl1VBb3uAXFqNKpnb/mW8Ia6dpvtTg9kw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(13003099007)(3023799007)(6133799003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eUprI/PU29Z08+RPNc0rfsz7D3pTp3Dh2q2Ndm+hFoWnKzYG1Za3KuX15vY0ptpE97KPJk5gx7k0HD9x3M9PmHZegX6CdKYJFURj9QsRnyxQe0GawkTNZG2weuHajj4kpQQfxF36wgxFIu0GqeYob2Qe7pE5q0s8NrkfoqtdcNNVvkrkXxe5XkGvoT/v+1els7mWmgPOjsWBkAfctK2kk4X8SnH/h7HlE3eXTGF7Hl815FEaiOiuilZnzEnENzmCfTTUNT74BRuog4rLebNE1UkJMHZg0W74f46JBpWNmTdzeN1UtYuIU8I3D6Bgp1tX8MBD2LKJLDE59vduILLl1qL3ZubobdbZo1geZ3dfKCe3bDbNJbL+tyE4iEykv0EeagWjd/MNY9WI4UzWCpBgXKibiNN9r/e/V+NMRXYv9JgFVqCN/ZlCOsD/XDeujpf1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:45.7663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96792581-48d0-4531-2080-08ded150ee42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999183
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

This kernel branch introduces a new fixed matrix colorop with
named matrices, including matrices for all YCbCr conversions
from BT.601, BT.709, and BT.2020, both limited and full range.
https://gitlab.freedesktop.org/hwentland/linux/-/tree/csc-ff-colorop

These patches add the functionality to IGT to test NV12 and
P010 buffers with the kms_colorop tests, and add corresponding
tests for the Fixed Matrix colorop to kms_colorop.

These test work on amdgpu (P010-XR30 variants) and VKMS
(NV12-XR24 variants).

On AMD HW a couple extra driver fixes are needed. They can be
found at this kernel tree:
https://gitlab.freedesktop.org/hwentland/linux/-/tree/yuv-fm-colorop

This tree can be found at:
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/yuv-fm-colorop

Some more background on this work can be found at:
https://hwentland.github.io/2026/03/10/plane-color-pipeline-csc-3d-lut-kwin.html

v3:
- Update to use renamed Fixed Matrix colorop. Rename related functions.

Cc: Alex Hung <alex.hung@amd.com>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Robert Mader <robert.mader@collabora.com>

Harry Wentland (12):
  include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX
  lib/igt_kms: Add IGT_COLOROP_FIXED_MATRIX property
  tests/kms_colorop_helper: Add Fixed Matrix colorop infrastructure
  tests/kms_colorop_helper: Add helpers to get encoding/range from
    FIXED_MATRIX name
  lib/igt_fb: Add YUV color pattern framebuffer support
  lib/igt_color_encoding: Add XRGB2101010 format support
  lib/igt_color: Add YUV pixel reading support
  lib/igt_color: Refactor transform_pixels for input/output FBs and CSC
  tests/kms_colorop: Add FIXED_MATRIX colorop tests
  tests/kms_colorop: Keep CRTC active between YUV tests with temp FB
  tests/kms_colorop: Add bypass transition tests
  tests/kms_colorop: Increase VKMS bracket to 3 up

 include/drm-uapi/drm_mode.h |  11 +
 lib/igt_color.c             | 242 +++++++++++++++++---
 lib/igt_color.h             |   6 +-
 lib/igt_color_encoding.c    |   1 +
 lib/igt_fb.c                |  41 ++++
 lib/igt_fb.h                |   6 +
 lib/igt_kms.c               |   1 +
 lib/igt_kms.h               |   1 +
 tests/kms_colorop.c         | 432 +++++++++++++++++++++++++++++-------
 tests/kms_colorop_helper.c  |  75 +++++++
 tests/kms_colorop_helper.h  |  16 +-
 11 files changed, 721 insertions(+), 111 deletions(-)

--
2.54.0

