Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82031C5516F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE7910F382;
	Fri, 31 Jul 2026 18:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ge4jn4yW";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1FD10F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7Az7wdY8VLjCJQc8Im1hQz371sGeEnZr+lz089Nv8+s5RQJqFhikBOoSLhqb2SHdu7naPr71jiPYhlDwX9PeE3RavKJq/v5cFJNwDGl6HJXUTw7nH96Z5GXdDR+T+CjI6X+TvKF1xaxr0+qva9YtSKEPwNfYY+zPHUNOAtpbPlcM0nIeTkVaZf4Uo65o4IcLqYIfxZtXk/aXeQR4+zZ+1mcMPK7ZV6F6QZBShCgf//GnZejR+W8HF1YpKnzDQM75mIpZ1rrJupHxW8bySAkWPCvBQMuJeO+1ihUiW1EM1uOcsNq0677fuggHyNQeUntPOqnsGY2Kuf13l4ODugBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7pPCCH1hToPdP/zQwaqPQRTmzho6ZxTNDoR/+0huMY=;
 b=gmZb3cIJ7eoVYV24wppnsn+SKFW9/7Ir9fW9MhKHwoaiizWW+1HhLIM0yzqGgnIjnJmbdxvs5bAaSX55YuwPrn+0xpEPIP4JRW3Zo9PQzHWTEp8yRskaqM0NR2II+0gn6THXlyEwTNNaTfY/xD9y1lryBbzMPHGEn+GGMLWxGDcykW2BqhxvcWgOyxRQTjc0UfT9h9xeyP6KsREhTc3MlTaoP2IEC9n9JDrQPtluaAxlKP/heGRQzT3mVmucqt/UezVGW7YK0uZm62cwFCSac+rSUTsKBowYHCHXKbKWgDE66yDzpjotAQEtmt2baHc+VmGCHa59irCS0VKcIGecww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7pPCCH1hToPdP/zQwaqPQRTmzho6ZxTNDoR/+0huMY=;
 b=ge4jn4yWlQp8azcnuvDMPTDMEB2hy9qYlqltgZ15/WjS7Z3XcecG5fEWmsy6CX1bixAvOLCUwlisFx9SYywREARoVnXKE7fiiF4kgk9MHZ3o/aWv4Ngjm4FcRU6gah0pIQXqvI+g0974StxmSLHrLAh+hy0u7QXeUJDWwukn6OU=
Received: from CH0PR13CA0016.namprd13.prod.outlook.com (2603:10b6:610:b1::21)
 by BN5PR12MB9540.namprd12.prod.outlook.com (2603:10b6:408:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 18:02:09 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::42) by CH0PR13CA0016.outlook.office365.com
 (2603:10b6:610:b1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.10 via Frontend Transport; Fri,
 31 Jul 2026 18:02:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:02:07 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:06 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Stone <daniels@collabora.com>, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>, Uma Shankar <uma.shankar@intel.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, Melissa Wen <mwen@igalia.com>, Simon Ser
 <contact@emersion.fr>, Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v4 00/10] [PATCH v4 00/10] YUV Conversion Colorop tests
Date: Fri, 31 Jul 2026 14:01:50 -0400
Message-ID: <20260731180200.668795-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|BN5PR12MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e6d7c4-2f21-4a09-2f0d-08deef2dd684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|56012099006|11063799006|10067099003|3023799007|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 5gZiVKv2eWksWmaXPAZrx9OY9yH5B9EhR/3e64DZ36lgclkq3bKTzSu/2gVFCxI9T/GjKQFkJHeqdGj3rdVk+ms2YRPajWzQEUrYuCKsUv6dBIJr++/uehvJUxSQsea5SnMm7mQ6eKtdW4KqLL6vNOOi7XkdwqlpNack/m0X7v61nppRY46zFTbBqNWtxqN3je1zZMhgT14NQX1RSy5Mu9S85OXrcVfG1PVxM8gWerjUsg5jF60TmsqpicIahPSTpitEexjtvLAjaz9GwWmGwD6tsTdTKKCeEVY0rO9ebyRzLIdEIyhupmMidIXs4DJ9yAELFMI6AdNhKhUCPkHFMd2l3qzL6IOvJuGgpuqf1tbt7FLQa5YAJzyf5nkyNZJLPiGo1vc3sx4vQOLLQb2LeYzlWgJ6X0il1DmmxwyM/3hEs9+8ivUiOjCAp/PY7JrlFuJebOvLeXGRK1Y94NE9DYNSEnCkbDq7CXlIQtxXccUwPn0PfGSbeVimqLiuenCaOqhDhwpPxpzu/XDzRsW0E7VKmB2fH9rKTl8mMTDvSouiZiURnsm2eg6KYAlRvyXm18Erk9jwDpJ4Pn3oCLhKiZ0R3hH5uacaemTKcmSFoZgFi9n33K6HC7Ti3v4SartWZ1O/nBF+xmGNkeZRi0S0ig==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(3023799007)(6133799003)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0aUmv2cl6buKVvGhkPJbDedtMXnctyJBmOPWWKVlefGzrNrGaRRWzx7shXqaxhEyAx+GRDG53H7O8s31r708Ax5u9jYqDha3YdiKQfW6iBnzQjoduAd5buy81IswSBrb4kmwPH61Zclir14hn3Mu/X/Bxw6WIDy+kby8oQdFmScicApB+7JJkRVdiTYSgQ1Cxex3OZDfu4TDhlqoHUzRddcSB5FFcg93a85rd/XjaaXA0COyWHCAJPbYu5II/8rDFgjW8VsL/ZhtV58yCTFcDAUAdephwFJELkjl15wdZYAUN7fUmGHA60Rgws2NLTBA/bA7DXiDu65rMj1u5rgl+udrNBUSGHq5qnSPzvCKq/wUn2hdTPTFSU73dPNpCcl8Hz1HexMxx7CpVsovjJqTVjLL+qE962YG296npvcpfEvkV56WRYslz20aZ/zvFBL4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:08.4420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e6d7c4-2f21-4a09-2f0d-08deef2dd684
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9540
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

The only patch that still requires review is:
  "lib/igt_color: Refactor transform_pixels for input/output FBs and CSC"

On AMD HW a couple extra driver fixes are needed. They can be
found at this kernel tree:
https://gitlab.freedesktop.org/hwentland/linux/-/tree/yuv-fm-colorop

This tree can be found at:
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/yuv-fm-colorop

Some more background on this work can be found at:
https://hwentland.github.io/2026/03/10/plane-color-pipeline-csc-3d-lut-kwin.html

v4:
 - Add encoding and range to kms_colorop_fixed_matrix_t and drop the
   fixed_matrix_type_to_encoding_range function (Alex)
 - Squash "Keep CRTC active between YUV tests with temp FB" into
   previous commit (Alex)
 - Couple minor fixups to "Refactor transform_pixels" commit (Alex)

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

 include/drm-uapi/drm_mode.h |  11 +
 lib/igt_color.c             | 242 +++++++++++++++++---
 lib/igt_color.h             |   6 +-
 lib/igt_color_encoding.c    |   1 +
 lib/igt_fb.c                |  41 ++++
 lib/igt_fb.h                |   6 +
 lib/igt_kms.c               |   1 +
 lib/igt_kms.h               |   1 +
 tests/kms_colorop.c         | 428 +++++++++++++++++++++++++++++-------
 tests/kms_colorop_helper.c  |  52 +++++
 tests/kms_colorop_helper.h  |  14 +-
 11 files changed, 690 insertions(+), 113 deletions(-)

--
2.55.0

