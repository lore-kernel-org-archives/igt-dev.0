Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BD6CD3436
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 02:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E7610E243;
	Thu,  7 May 2026 02:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WX9HWetc";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D89310E243
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 02:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toiCjy9GpGvx2uj3vu3/6ccIiguqWwooElFJlav0PXqzRC5rlIfWlYPxvvW+xBkWa/Dyo57HEVygFSGmq40EtpgVZ5jCHKbYFGH8JfCS6/wofp3mzgj5hSEDsWQVDS2Ix7UtI79tBGP8FWTS3ncRWJWy7S6JfqFRtprhZVHqLsxdmlHAsIH2T+dBPqbcAEr4w/NyofG7JSQMh4RF33ruWpc6DM8QBPRT3PqNhngm/PhG5VE1Or8n9f/6LiU3iZ0Ju/PayOFAvjxFt2CodmVsAtA8uEPAcda7LCmJxvqgNZlxtZZe6B6i7h40yFFE1ONBMjBHmd1DIlge0dqHhrFPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljaPHqEo8v7S6+S6/C0yZrmo4i7M6zd2M1WJKMNy0lE=;
 b=rdyZTLPmolGPxdn6aW6ckulUEJqjK0Q0Y+WHgLTQSSqEHf6m6s/rT4NiTXLUG6m5NpmE88I+WLE8WFTLACpCswRcgI+LYFg2dDkLpNNTauunMZwCwedn3cweyeUmgzHk0Mg6yjpECIw+p7AOUoT95Zzv/GxP7GoprynHaTgpoNhevsPrK+BepEFCMtt7v9Y7Tsvf25jVAlyZhbKxZLN+RV3b9KDfXbepmMsx/D3902ag9J5RvPUslGXWjF5/7+EGxCA2liOoLTl3zBb2XJsLMPgoSFUHCJlzpbUTiKMU3d1mUqqUsUPO/AoV4SGPKo8JmAoDXYnOaBALo7ZG8m1oCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljaPHqEo8v7S6+S6/C0yZrmo4i7M6zd2M1WJKMNy0lE=;
 b=WX9HWetcL3y3D9sxOyBZFPcs0ec+UlXr4D9GfgPwdZCV3FejbAQcsU3m5PrxcjDCDHERMpkg5Tc3AzSa+HT6KJXS8HvFqCvMstAag9Q04lyertH7KtQFqbMfR6evlr82P9I653NTDPlQgZ30gjmZHl6lqmK1s04p7rNtw6a50NM=
Received: from BYAPR02CA0046.namprd02.prod.outlook.com (2603:10b6:a03:54::23)
 by DM4PR12MB7621.namprd12.prod.outlook.com (2603:10b6:8:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 02:24:20 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::3a) by BYAPR02CA0046.outlook.office365.com
 (2603:10b6:a03:54::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 02:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 02:24:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 21:24:19 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 21:24:19 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 6 May 2026 21:24:18 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: Fix amd_fuzzing_kfd build on systems without
 drm headers in standard paths
Date: Wed, 6 May 2026 22:24:07 -0400
Message-ID: <20260507022415.157055-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|DM4PR12MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9ab06a-abda-469c-faa6-08deabdfbeae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: mibDNqfaMbErww5o9fJgjvlSIb0gmPnqgha5QBxcdZhPl7AMIYTmniQmJNQDtm53Z/5i7lofPNGV5plfxhR3pxHB1KnUMC7RK/LptLXrVLQpyZlOqXnG/BSflC0gIUYMcqBtkJF9LWNuBPJsNjAK7L7RYlOaXO9klU+6pqdWWZ/G3U11ktLYV+65joKLihka5YPNmAQmN/F1NI1Vd/7J98W1tYeaZ/nQMrLCvKZ0hHhT03KhWGCESqxOFM50W3VXbm3tF6986lKwchwIXPTR3MJX4KbZBdnSOfwk8Qure+XYTOqUJ7o41E+HESccRbsddXD15Wi2wWMA3Wz4957yJ2k+8Lp6ATPGmqIgAwy7di2f5JRbbPwaWBK0S8OWVnxGDJ+mfIZllzmguOjdChen4Vvo765QDf5iLGJkNqohDi9vB6JqsMD/3AJ8WTggEjaFf4tWZgWBhughsZWwXpJ+3cgy3mcNVvWUeksThSl1uxSJ8wLBItvwivcLBA0chdODP7459EBegjiQ6woBfLq1Po5DLXc6iz55Eejy10nAJnhTAZw7gYWRmfhbtLtCrQWMayxa0xaP2H71aCmYB+pbmWEpHPHtbSjurb5O8UcdMJlk5GO7tg9Ecvrs32rhqXKIYMIsnrDLwlcY3oh5ldXllk5QGjTxfobpbGAOfM0lJb6vfHVtzCBjz5LAgTAjTPF/reL6j8vgJVWFLBBXA7VX3Z4PvDD70A8oY/5TFd4GrO4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: n32njXEA2H+sz/zz7J8dTknLEL1Xgv2rBYnK7K9QAmTvC2IUB+V55SuBBHuZhZ+J0YkCDOzqgMXDGIMFOdh7RDOE9gjf9QYqAUg77x/krFmUNsvRAa+MA1UZsUim0DlU2mRlW69lX43Ag/QIj7KyhTQzWVMVRyk2jOgyY9RDzhy+utexz2NWWGWeMV9aeQiX9uwsLWmM5ke8yeKm1ojn37caohaLnMykRTKo1ab1FroKVdSO0d0cSgxT51MQFsi1DP/Rc1cAtxHRelKUny5dkH6UtHNtQV51KJO+vAjdotEdx47cFzdzK3W+ChJYhVkNNqWRYv36oFY+YaazeupaKBx4TBsuIjAtirhXjk0/CQa+wNbbBUb+SHzIPkdr+A4dbkuE6T51moYAmtwHSVbL3zYHmd9ikulnp/TVjbP4jZlAWoQdM3YUAW1B0NhZAGPr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 02:24:19.7277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9ab06a-abda-469c-faa6-08deabdfbeae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7621
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

PROBLEM:
The amd_fuzzing_kfd test fails to build on some systems with this error:

  FAILED: tests/amdgpu/amd_fuzzing_kfd.p/amd_fuzzing_kfd.c.o
  cc -Itests/amdgpu/amd_fuzzing_kfd.p ... -c ../tests/amdgpu/amd_fuzzing_kfd.c
  In file included from ../tests/amdgpu/amd_fuzzing_kfd.c:17:
  /usr/include/linux/kfd_ioctl.h:26:10: fatal error: drm/drm.h: No such file or directory
     26 | #include <drm/drm.h>

ROOT CAUSE:
The linux/kfd_ioctl.h header (kernel UAPI) includes <drm/drm.h> expecting
it to be in /usr/include/drm/drm.h. However:

1. On some systems, libdrm headers are installed in non-standard locations
   (e.g., /usr/include/libdrm/ instead of /usr/include/drm/)

2. The compiler flags show -I/usr/include/libdrm is provided, but
   kfd_ioctl.h uses #include <drm/drm.h> (not <libdrm/drm.h>), so it
   fails to find the header even though libdrm is installed

3. The test was built unconditionally even when KFD headers might not
   be properly available

SOLUTION:
This commit applies three fixes following the pattern used by
amd_kfd_dmabuf_unload.c:

1. Include <amdgpu_drm.h> before <linux/kfd_ioctl.h>
   - amdgpu_drm.h transitively includes drm.h through IGT's build system
   - IGT knows where to find drm headers on the system
   - This ensures drm/drm.h is available when kfd_ioctl.h needs it

2. Add #ifdef HAVE_KFD_IOCTL_H guard around the KFD header include
   - Prevents compilation when KFD headers are not available
   - Provides graceful fallback via existing #ifndef KFD_IOCTL_MAJOR_VERSION

3. Make test conditional in meson.build
   - Move amd_fuzzing_kfd from unconditional build list
   - Add it to the HAVE_KFD_IOCTL_H conditional block
   - Test only builds when meson confirms KFD headers are available

BUILD VERIFICATION:
After this fix, the test builds successfully on systems with KFD support
and is properly skipped on systems without it.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing_kfd.c | 3 +++
 tests/amdgpu/meson.build       | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing_kfd.c b/tests/amdgpu/amd_fuzzing_kfd.c
index 937f166f6..585cfad3f 100644
--- a/tests/amdgpu/amd_fuzzing_kfd.c
+++ b/tests/amdgpu/amd_fuzzing_kfd.c
@@ -14,7 +14,10 @@
 #include <unistd.h>
 
 #include "igt.h"
+#include <amdgpu_drm.h>
+#ifdef HAVE_KFD_IOCTL_H
 #include <linux/kfd_ioctl.h>
+#endif /* HAVE_KFD_IOCTL_H */
 
 #ifndef KFD_IOCTL_MAJOR_VERSION
 #warning "KFD IOCTLs not available (missing KFD_IOCTL_MAJOR_VERSION) - skipping KFD fuzzing test"
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index f5d8f2c7b..4637666d9 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -21,7 +21,6 @@ if libdrm_amdgpu.found()
 			  'amd_fuzzing',
 			  'amd_fuzzing_sysfs',
 			  'amd_fuzzing_debugfs',
-			  'amd_fuzzing_kfd',
 			  'amd_hotplug',
 			  'amd_gang_cs' ,
 			  'amd_ilr',
@@ -76,7 +75,8 @@ if libdrm_amdgpu.found()
 		warning('libdrm <= 2.4.104 found, amd_queue_reset test not applicable')
 	endif
         if config.has('HAVE_KFD_IOCTL_H')
-                amdgpu_progs +=[ 'amd_kfd_dmabuf_unload', ]
+                amdgpu_progs +=[ 'amd_kfd_dmabuf_unload',
+			  'amd_fuzzing_kfd', ]
         else
                 warning('linux/kfd_ioctl.h not found, amd_kfd_dmabuf_unload test not applicable')
         endif
-- 
2.54.0

