Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B19710FC456
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 01:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B125110E70C;
	Thu,  9 Apr 2026 01:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LymwJvOJ";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010070.outbound.protection.outlook.com
 [40.93.198.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEED910E70C
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 01:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p009RmGYA8Cc7wYphJY4UK4VP3eJYM6ZPX2480EzqbGEn2rMI54X0Sx2rZrazwfFyDi8c51qjPjtp8Nun7lDbdfYRgGc2MhJZyIHQmkhsUXmx7SZ41kji9VruFhPi2LQEBALAStvAzfjn+qy5Qc3LyWffEd11K1i7D7TKOO18yEBE4MiuCDxEUazvHKlwggAOevxeKQ7CUaaMs1tx4sKNOifv8l7vDzWC5YMFZ4YUByJYZfDgpSIuOYLyXlS2PfvMl0WTQ28bOQAEFw8YTTtil2c9L91/FQE0oqxToR4Z/coPv9Up4+5GdjpZI//5NcWGfcEoXqxRjWBXAwMN7ZpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZaRv7qoEfOdx4HBv11M972K5PcIReqG/d3HavSmGqY=;
 b=lR+wZpNEyC5DpMo2nGorBFb2JREK6e2F0ULSxzkm9xlt4aKKOsuHLTf8IKkt5zE2qyzCyW3pki6ALNYtV7J1/vHmy5N3t0hgPZvm8WAkowfIhalQCNvghosyYDEdKI9Z3vu3ZeDXL9Z9TVW+5J83//fXntqVWvdAfncLqPrkF8y9gJpjSt7Tqn8FaLcgI9KWHDm30QtQaXZaKJ1QAOasLNAVG7L+BGNCcd00lXmYB9q3Mgs/HEDTAvvmysUfEcTafiRLjkTnRj0yFTG4pKgp75rKdqlrxShjTtdhMKSFsPdCRHX169v7oY4OhSDawuQIaTWK8YF2wbdIt2tokpMg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZaRv7qoEfOdx4HBv11M972K5PcIReqG/d3HavSmGqY=;
 b=LymwJvOJhrWKHcQKqzKf1keRyQQylN5lil7jbTkKeKeNoTakYkZMaFgEqFHY/JMt9ijEZ+wraT6m8qwi5hsNITi2PysGqzlXWdilAb17NUv40i5fWIiQ9YMVffm1ooDfIvmamNdx2DXjb7/HsZabB3nxf2+xH6C7WV3P5k94SZg=
Received: from BN9PR03CA0544.namprd03.prod.outlook.com (2603:10b6:408:138::9)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 01:43:48 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::3) by BN9PR03CA0544.outlook.office365.com
 (2603:10b6:408:138::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 01:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Thu, 9 Apr 2026 01:43:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 20:43:46 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Apr 2026 20:43:46 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: fix sched_mask leak on igt_assert failure in
 dispatch tests
Date: Wed, 8 Apr 2026 21:43:18 -0400
Message-ID: <20260409014335.79604-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH7PR12MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: e32b291e-04db-4380-814e-08de95d97136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ntz42bHm6qkZ8mmuRoe+Y+MXmpneGWzufav0R7opv1mR7VmmHQkACuKGNmQ3wd14Jk9jijsg2viRxZZXSOOtjxbGa9MwGRiJb0CYBQaZlnnI6p3l0bc4W5+5ZO2xkc/X/5PmxwwNA3jIN6j0yTrDIZcfsCIuCqvd95HUQoL3N7t7GT+IGO6lYi37x3T/mghh64+IGSlnKqwnXYsYKDf0BpR4R/Rx/PhKKJuCtkt42aHGef1m9aXBkFcXCAI6wSICMXXYHUJdSY2LgE+tdozZeSNtOGD/45fIadw3kyQTfrGFOQJXT61ErEZC2qU94YzXjRCybMqa8K/59ymddvgdqCgXzbI7Fb1tj20J2nRxGi6mBFazEomVMZnKjIaco4o6sx7cUbbg8tP8AU9WyA2fVm0U/pJ9WicwmAqh4JQBF+cs3YgvKM6BVA+XPbbb6Dp935DEiAXUGDMtYRKovBdsrev7N81RL/SvlSOBYu6Ojkw1w52Kjuuw8sYVl7788x78MOgThLUYqOBHAc94LKNDNyprkAgcUrujBl+WTtGSlK4fMKyq+1gjL2gWXcIC0F50ZqV1MJZL4blRFhGNGKhENPa9UFNbX+GVJR05Noq/rlszf5nz3oF58uNBzzoQXztHjBJ5YnoseENJrxBMKi20Bzo1HCUXPBeiO3CY9ZysgMa5BeyD2YMAaDEMcmNsCscOfdLkSuAIc22LSSdV6c8/H0PNUBTEb37rjq/W/4lxveDhTIfYsgo84jnIFBUiXv9/jixiXbh/o32pARBzT7NlPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bXQcY2LycTLFJws/MLR+8rR9TakYZuYA51aDbTPxbS6BcYFYhIlM+Do4QKZ1Fx7cQm7JmXvVekjhacQo4cWcK6H6qolhbxtlvudlI0mpA7wYoi7YG0dVAYic+SL1YE1KsA8Q41NA2zT8Bh8rlDSw+HJjNM5hfZUPbdkjHaHMI9NfJXMWxuBJoR3crV7KMcFTjkVY9OY4ZNkGOgMSF/cp5bZavne3hO6bwYcirdO2AJACXls0gJMFgpKZDxIL8Jgbgjz6oMsGcsfOT+lVDBUudFnZkUxMsGtrTsprcyzrWo6czzANhVgM+Cs7XymnS6zmTA9BRUSAay1o1MGXzAQOeUTtBUjkJIf4Z1cB889Hrc9amhjUBj9R76kup5VkNnD2onWlXC9MmBAw2JregxZm5jcpBez7LQ2JQsIUOJP6kTKmwLZA62iM6g4Sr3/ei/GY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 01:43:47.2591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e32b291e-04db-4380-814e-08de95d97136
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
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

amdgpu_dispatch_hang_slow_helper() and amdgpu_gfx_dispatch_test() isolate
individual compute/gfx rings by writing a single-bit mask to the sysfs
sched_mask file.  The original mask is restored at the end of the function,
after the ring iteration loop.

When any igt_assert fires inside the loop body (or in called dispatch
helpers like amdgpu_memcpy_dispatch_hang_slow_test), IGT's failure path
igt_fail() -> exit_subtest() -> siglongjmp() unwinds directly back to the
subtest entry point in igt_subtest_with_dynamic, completely bypassing the
mask restore code.  This leaves all-but-one hardware ring permanently
disabled for the remainder of the test process.

Subsequent subtests then see the drm_gpu_scheduler report ready=false for
the disabled engines, which can lead to NULL-pointer dereferences in the
kernel scheduler when attempting to pick a fence from a disabled ring.

Fix this with a three-layer safety net:

1. igt_install_exit_handler() -- a file-scoped exit handler registered
   once, which runs automatically during igt_exit() and on fatal signals.
   If the mask is still dirty (not restored), the handler writes the
   original mask back to sysfs.

2. Lazy restore at function entry -- sched_mask_arm() checks whether a
   prior subtest left the mask dirty and restores it before proceeding.
   This protects subsequent subtests within the same test binary.

3. Normal restore path unchanged -- the existing code at function end
   still runs on the happy path and now clears the dirty flag on success.

The static variables (sched_mask_sysfs, sched_mask_saved, sched_mask_dirty)
are file-scoped and shared between both functions, which is safe because
igt_runner executes tests sequentially (no parallel subtests).

Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c | 53 +++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 23c15ef1b..138222cde 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -12,6 +12,51 @@
 #include "amdgpu/amd_ip_blocks.h"
 #include "amdgpu/shaders/amd_shaders.h"
 
+/*
+ * Static state for sched_mask cleanup on abnormal subtest exit.
+ *
+ * When amdgpu_dispatch_hang_slow_helper() or amdgpu_gfx_dispatch_test()
+ * isolate a single compute/gfx ring via sysfs sched_mask, an igt_assert
+ * failure inside the dispatch helpers triggers siglongjmp() back to the
+ * subtest entry point, bypassing the mask restore at the end of the
+ * function.  This leaves all other HW rings disabled, which causes
+ * drm_sched to see ready == false and can lead to NULL-pointer
+ * dereferences on subsequent tests.
+ *
+ * Saving the original mask in file-scoped variables and registering an
+ * IGT exit handler guarantees restoration on both normal and abnormal
+ * exit paths (siglongjmp, signals, process exit).
+ */
+static char sched_mask_sysfs[256];
+static long sched_mask_saved;
+static bool sched_mask_dirty;
+
+static void sched_mask_exit_handler(int sig)
+{
+	char cmd[1024];
+
+	if (!sched_mask_dirty)
+		return;
+
+	sched_mask_dirty = false;
+	snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",
+		 sched_mask_saved, sched_mask_sysfs);
+	system(cmd);
+}
+
+static void sched_mask_arm(const char *sysfs, long mask)
+{
+	/* If a prior subtest left the mask dirty, restore it first */
+	if (sched_mask_dirty)
+		sched_mask_exit_handler(0);
+
+	strncpy(sched_mask_sysfs, sysfs, sizeof(sched_mask_sysfs) - 1);
+	sched_mask_sysfs[sizeof(sched_mask_sysfs) - 1] = '\0';
+	sched_mask_saved = mask;
+	sched_mask_dirty = true;
+	igt_install_exit_handler(sched_mask_exit_handler);
+}
+
 static void
 amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 			    uint32_t ip_type, uint32_t priority,
@@ -687,6 +732,9 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		sched_mask = 1;
 	}
 
+	if (sched_mask > 1)
+		sched_mask_arm(sysfs, sched_mask);
+
 	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
@@ -733,6 +781,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
+		sched_mask_dirty = false;
 	}
 }
 
@@ -769,6 +818,9 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		}
 	}
 
+	if (sched_mask > 1)
+		sched_mask_arm(sysfs, sched_mask);
+
 	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
@@ -811,6 +863,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
+		sched_mask_dirty = false;
 	}
 }
 
-- 
2.53.0

