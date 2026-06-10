Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F676CD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 18:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2214910EB58;
	Wed, 10 Jun 2026 18:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0sHqxNNW";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011010.outbound.protection.outlook.com [52.101.57.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E46F10E1BD
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 18:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6oh+HNia99H9/Ppy3Md2v52KRj/lJMf5ccUpgg4D/JiVwuYQkbMjJz+l0yfg6kmsofMzqCCpcNbVPDpXOjKgo3FhNdfOr1oY4j9g8YmJqzGj/uQRMNvJxZjxknvuJpYK5sq8jl8pDeAsEMvvZLFLQR176Av7Nc4f0JOgLAzOzXiEo6dUhihTqVViyT5rwuvG+r80wokJxL0QCFhpXuNu5nrDl6OXYIpjBlGJbfLlFczwYMclory9pYExIuzj8xPTHr6qd+/zm/cboY4Ymgk0hsEUE8HUv7AldTWpLYEUZzt3DhH/r+PE5KMnF//0dqUy7yxItDD8Q170jTEHcJQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQDZahnDRUEFsL5R2cc6lJgelzKpd0I0dsBblaw0tDQ=;
 b=vB8bj9j82WoXX5L1mcsT6g1h4XvoeQta+8Gr/k6oCPCV0BZ+lb7pHrTZayA45OK3fWNhTmfN28pmL8IJmSMBNNaNa+zs1sh0bLFEuTtnXhcAJ7lcAv1vZtsEUzIUBEVQEfX/Yd+LE/3e2sZ1n1Tummj274/TgF8GVPmJqGVXcSOKhrPydJSFh3CIBULrKKogSLThK7JW3QXjjKgmXj7/rLhIfn8HPDfJ0a2OCVP0tPsYi1lahRqkBokc4tcPCL1POObzV/xpkhnXJvLSVn1bFu+iBWseIsUf2j2oFqGOAlzukpP+Wq1TwEmZLY1wu2OO1SFwJ/9j8YH/t+aDDcK1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQDZahnDRUEFsL5R2cc6lJgelzKpd0I0dsBblaw0tDQ=;
 b=0sHqxNNWf7e8M4WUPGUSDhdFMOxu6VVVfol62kMo2LahwXAcF1rdsOhhlaSs8uPjxHtJKdkVzB5BtiOjhopgg40NOacB0JykIEMOJLOD2IJ4wdmJ2vrGONXrShtplECNarQG7hgMC5oWvXR0NLEN2Yq2itfoaBNrSrNzaiH4v9E=
Received: from PH7P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::27)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 18:05:48 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::57) by PH7P220CA0025.outlook.office365.com
 (2603:10b6:510:326::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 18:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 18:05:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 13:05:47 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 13:05:46 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: amd_lockdep: fix include order,
 copyright year and meson.build
Date: Wed, 10 Jun 2026 14:05:35 -0400
Message-ID: <20260610180545.71343-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8a5b88-6abd-4439-6c0f-08dec71ae612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: FRoFQs5axEKqms2LNVI58rOFA6qARi9v64jBilm+DxyWiJRWr4o73TqnHxODPBS/R73w7k332+nEbnfaL5uOMX4ffqfbOEgRrQZc+WwtNDZPmVuAJCm5WU6kObvlnqbqeBGFwAwhwv4JPyVN42JtRTQJy1z/hckTDxh9KrdF2ulVi3aYgKwnIoThtApWS3Ml/EnP/IRfa3Tr0886kefS1tRygOMwTB4pgqHgbItM11kmeMozXFHSn8h9FtfJYxREIk+D2RFiqqrnjVGKVkqq3HTVahQwoj8fKABcHNNzRObeJqzHyz/qC6mq8XpScTh1+oVv6ksaJREGSVhEMjLn9RvFu+woOG2SovQv6sasS6Af5utVPNiEYaxjvabxahJ+0MRz28fhLU5fFhGvz00WAr3HvpRpQ/KHGLn6ZEojAsL68Nye3KbYd6Hi/ID7W/V4lrxllgGIBeW3D2MBHelvi32yUd1cNehZ4LArcgGEt17QBSmWGR+Z+ecn+hgmGYfW2IBTvbB41rCubHMFhzcV5HL0+jZZfouZgRLr4sFGgDBzUYFpu+tvOvddnDkWtGKcWc2uen4+ty5hkVfEqsJIUIw+9+8kNc7txsOZ0J6Jt7Kemqt6pTFUxRWCS9LfKIWhTyYJhNudVixQm4GKpIdwpPP5P9Ord5aNPRMBkiOclQxLRJ2mDLbzS5ZUHUGCThPB0vwTADrXr36QhSjbJOyG0zZUdGhFGGRztNBSdmWpZtY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: en76/JOHCAAuGQdn+tniX4z27q5RHSxfT2Ct/dZhLYBosi5meB0qf3/A/WMchUwfzAlUjIJ8WxnbocBIEV2UYUvpmT64NEDq0G1ylErvP4ffpG54raoatVUSvcRzuqc4XW/AUQBYN7eN/jQJX7NrxHnndt9UV5p1uV/10EcTJcgP5gxpNBGdNKgweRo+zdfTWefIll6N9bBcTIvl7uGnPpfgmdlrbgr8H6wVJ2X+nNBU7qJPwlmwCgkEZEkWOyaNzwsSZFblcZLRkH/66e9mx2zzIaYn2WEsEWv2NkS/hzEba3+Sy3QVu0inaKvpRizxVHLl+fOFbD91adSLkPCI8Coi62iuRZ6L0vgOzfm9qOBcJrO+FVU6RbD8wjU8FVvoMYhtZ4KjMJQI2Z4A9rUwaZvGrBY7qf2EV8Y7mXvACi3geXmGI66Bw9IRN+vLl89W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:05:47.5392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8a5b88-6abd-4439-6c0f-08dec71ae612
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Address review feedback from Kamil Konieczny:
- Reorder includes: system headers first (alphabetical), then
  amdgpu headers, then IGT headers (alphabetical)
- Fix copyright year to 2026
- Fix meson.build alphabetical ordering (amd_lockdep after amd_dmabuf_unload)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_lockdep.c | 21 +++++++++++----------
 tests/amdgpu/meson.build   |  2 +-
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/tests/amdgpu/amd_lockdep.c b/tests/amdgpu/amd_lockdep.c
index d97c0747f..48d7ccafa 100644
--- a/tests/amdgpu/amd_lockdep.c
+++ b/tests/amdgpu/amd_lockdep.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright 2024 Advanced Micro Devices, Inc.
+ * Copyright 2026 Advanced Micro Devices, Inc.
  *
  * Test: amd_lockdep - Exercise lock-heavy GPU paths for lockdep validation
  *
@@ -22,19 +22,20 @@
  *   stress-all-paths             - Combined stress of all paths
  */
 
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <signal.h>
+#include <sys/mman.h>
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
 #include "igt.h"
 #include "igt_amd.h"
 #include "igt_taints.h"
-#include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
-
-#include <amdgpu.h>
-#include <amdgpu_drm.h>
-#include <pthread.h>
-#include <sys/mman.h>
-#include <signal.h>
-#include <fcntl.h>
-#include <errno.h>
+#include "lib/amdgpu/amd_memory.h"
 
 #define BO_SIZE (4 * 1024 * 1024)  /* 4MB */
 #define NUM_BOS 16
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index d7482318a..08206f8c8 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -15,7 +15,6 @@ if libdrm_amdgpu.found()
 			  'amd_cs_nop',
 			  'amd_cursor_overlay',
 			  'amd_deadlock',
-			  'amd_lockdep',
 			  'amd_dmabuf_unload',
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
@@ -29,6 +28,7 @@ if libdrm_amdgpu.found()
 			  'amd_jpeg_dec',
 			  'amd_jpeg_queue',
 			  'amd_link_settings',
+			  'amd_lockdep',
 			  'amd_max_bpc',
 			  'amd_mem_leak',
 			  'amd_mode_switch',
-- 
2.54.0

