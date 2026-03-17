Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F7FED9E4
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91C510E6EB;
	Tue, 17 Mar 2026 16:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1MqdrEPn";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013067.outbound.protection.outlook.com
 [40.93.201.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DED10E6DB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCH7AjDpAmZaZiWCkOUcEJhVB1cNc5+ulbwrLQe+qP2kxVdEviMZgI9fUtXjjoRNE37q8X4ne+J7fWOhXkAJOjXV6jOBF2qWgOQr8fSmoqkAQ78mY9odSWuwV9fby3wuV7UYmuGsmWikeqJXSDcgrKMbCWnfz0SixkiyROm8zFSK81Jhg8Y0XvYuW4GK9CSVjhqFZdyWLSPrMRZYAAaz1IN/w6HH/FkRKZ49pA+OVkny2ymbfnzZHVber9pAtuE3rhU72IO7Je8fSRUqA3trh9nCEudeVaezzWcNyTRmCpHqhrLro0YpeqINe2gjnMhLxq7lToP+HfHzUdeuXR7GFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/IFDDKlkk2YpEuFZrqt1/Nl3HuMF4NlWWBmc7+EJss=;
 b=J/klNygP8TnHNjpU57uKvI13JE51AJV9YOIF1dpXzcuotCrlfrZFIwe9uGp4fxQ+BpRVzSbcvRJYqFpnrnQa8nxyogN+OY70BmAeLn6DlsjW1L7YpumfgxPyCjbyOmVFwm0eLn+wBvrnAtBPAWcse3Bz4LZILlNnhdtLNrUYmNokUslZfy/lJ8OD7h6C2kFLQjNd05mOzQd02ps3wbJrYgRnP1SqrThPMSF5GDq3Pxq3d7nJTVzUXr4JZ6eB4DdgVHJ4CpUKy8iTAbicvjd8X97+CcMjebJ8oZwhb+rtZXsccI+3zRvqP+O3recdMQ0KfhexfRg+8M+GpbJ12YS5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/IFDDKlkk2YpEuFZrqt1/Nl3HuMF4NlWWBmc7+EJss=;
 b=1MqdrEPnl58eoepLcolxLBntAx6kKO3EzjpXp5GVqojDoApSNNz8yrorhc5nsIbUv2ULfOjNgY1VSoLwbZuclzQy0MGxu9nrbQ8W5dGDT21nHrX5DNoDoMdF0/ZQZVnAqsBAEh/5TTwugPU5KZeXqUsqDP5WAptgVfw20/sf2Fg=
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by IA1PR12MB8493.namprd12.prod.outlook.com (2603:10b6:208:447::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:04:55 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::b2) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Tue,
 17 Mar 2026 16:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:04:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:46 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:45 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Stone <daniels@collabora.com>, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, Melissa Wen <mwen@igalia.com>,
 Simon Ser <contact@emersion.fr>
Subject: [RFC PATCH 00/10] CSC Colorop tests
Date: Tue, 17 Mar 2026 12:04:26 -0400
Message-ID: <20260317160443.229812-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|IA1PR12MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: e757fe6e-05e5-4aa7-e6c4-08de843eede6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: +aBIl1Le/aPl5ilUOYMN5tapdHpao/UcUc0lDZ/g5yIoJqnecxVX2u8dHBZOSHP0VB0Hl1nDAOTJ3BcT5vtrJzMf19In+XB/NWrE1C46vCORWz8VDJioPpRtlfJbYzBpeyBpFPwgy687HASWk4HUNWhZ5uq58lyHTC8/RobSyGtw3Vj3JIvCQEcsqJpg88F5xjX+PTxE6JLT6s+Cqmmnn5YP8Uupv/q6Y4AbGXMcnvj8dKnNvVthbO0902RSdGoKQLUNGbHIwzmU+jiJ/E/pPrdaom8KDPZFhSuTZxpi9mDRV5wrnjyFQVhi31tsugeWM/GoqxnDMCXrGFpVNWzdGsdajsZpRL+ZJHXQJUNAVhoDnq9V8IOvysbgVgfZI9RKcotOxVK8Ffvaea+4ktpaMgACymQigPLdxHzjir6KkSuIBhoXtUCeU6J9pMDL9m5M7DuDfuDNEoB7JBK1+VMm7xUKOQjjJyGWcyDxG4RBIPZ5rre1yLNWtYUhWtfkcYRiJv6wO2oFYx6Xn0q+3uAxGOm9S7iIXZLlK0rduqif8zusiUm+b6A/KSJNfB/Rms9/jDDD6m5sNi9CZXoRGJVUphgI8LciPtmn4ptVm/6NqjOe2O1v/0Ospc1G4hrcKvaJ4up0METlNS69m2tHnTCkq8gdxQFXxIuuSatGVdoMKZHltKQY8TMOtvXegM5U/wx0hvRQZmAboEmPl077fpDYjw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dfIavCyqWCfILuaGZWlVE7M3cYpjus8hhOnQnWfVkeTToQ/41yjUBqnxogbw3TXoolh+nlf8QE3Jr7iMWKMWg+/6Fw991ixZM4Mbswml4aGf9B9cfz6ZMxjxbWJO6Xl/0X8UmZq3ilwRBIVNAu9fWYG+EWGGEXEDBl1m4wgYvRkXfK3RQlySkOCKDObMgqcEml3LnCxVcmRygGEkazI/x6cdIvVuZ3EIsbrr7JzbeaANt6C95zC2RO9bG/P/bDhkrOSVwP7l17m244B1dCMIRQgGdmm83X+Ayvoah9WyIeIPsAZM9RrgfFFwpyQbxo7XFb78eH6a04qdhdsjoS5+7W2GNcdQbg22eABMG7JZ5Bqw7L1faQ+Tzf+V6fAa8PXddcLpJOzdfb+CVK2ineQPsHjrrPWTIVlOix3ymPjvzapTtwCfYHh5VvnWsGDu4s9M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:04:54.6223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e757fe6e-05e5-4aa7-e6c4-08de843eede6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8493
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

I'm introducing a new color-space conversion (CSC) colorop
with the kernel patches in this kernel branch:
https://gitlab.freedesktop.org/hwentland/linux/-/tree/csc-colorop

These patches add the functionality to IGT to test NV12 and
P010 buffers with the kms_colorop tests, and add corresponding
tests for CSC to kms_colorop.

These test work on amdgpu (P010-XR30 variants) and VKMS
(NV12-XR24 variants).

On AMD HW a couple extra driver fixes are needed. They can be
found at this kernel tree:
https://gitlab.freedesktop.org/hwentland/linux/-/tree/csc-colorop-all

Some more background on this work can be found at:
https://hwentland.github.io/2026/03/10/plane-color-pipeline-csc-3d-lut-kwin.html

Cc: Alex Hung <alex.hung@amd.com>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Simon Ser <contact@emersion.fr>

Harry Wentland (10):
  include/drm-uapi: Add DRM_COLOROP_CSC definition
  lib/igt_kms: Add CSC colorop infrastructure
  lib/igt_fb: Add YUV color pattern framebuffer support
  lib/igt_color_encoding: Add XRGB2101010 format support
  lib/igt_color: Add YUV pixel reading support
  lib/igt_color: Add CSC transform functions for YUV to RGB
  tests/kms_colorop: Add CSC colorop tests
  tests/kms_colorop: Keep CRTC active between YUV tests with temp FB
  tests/kms_colorop: Add bypass transition tests
  tests/kms_colorop: Increase VKMS bracket to 3 up

 include/drm-uapi/drm_mode.h |   1 +
 lib/igt_color.c             | 302 ++++++++++++++++++++++---
 lib/igt_color.h             |  10 +-
 lib/igt_color_encoding.c    |   1 +
 lib/igt_fb.c                |  44 ++++
 lib/igt_fb.h                |   6 +
 lib/igt_kms.c               |   2 +
 lib/igt_kms.h               |   2 +
 tests/kms_colorop.c         | 432 +++++++++++++++++++++++++++++-------
 tests/kms_colorop_helper.c  |  48 ++++
 tests/kms_colorop_helper.h  |  13 +-
 11 files changed, 749 insertions(+), 112 deletions(-)

--
2.53.0

