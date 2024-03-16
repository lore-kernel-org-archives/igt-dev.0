Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB295C54E58
	for <igt-dev@archiver.kernel.org>; Sat, 16 Mar 2024 02:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BE7112A40;
	Sat, 16 Mar 2024 02:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="st6Cr0ih";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58861112A40
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Mar 2024 02:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpIYCQS8LpqPWfThSWuItO0to3jnaNHBqnt+5rtEY/btDxGcICRcjve82BWjt5bRa6vRNlB6CX0RNg3bOEZJyM6C+pX7Cx8qTLOy0+JTPbjMcQTG+JSEF7nqxajjUWqcICjiJcY5+lg3WZps8gD5/dH6B0GBS5nhSOZIJnpT9XGCn5FhSTLtxjfvMlpBpp8A4OISfqRA4Mpog8Hkzp6qqDiKzXHCOsqWxJDC/LW/oEJ4Q88rpFTeL7/PwR49M94E4L3nD8rImMqTTVc3rQzfIFY9KE/rO546sB4adUGW0MVR6drgxFicUS4r8v+TOMy8c0OWKtFakEiDimYoQnZV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCK1jXkgNJ/Of7+3ybwHTCna2niTgWqwiVnl8Qz7U+c=;
 b=LekPDCmzpeyD694rA7EDlj2+6yk1bVt4FahVFMwB3ybBZQ1slm4fSApL8WhkEKq7AZ/RoSgr2s9jLcP9BpNcZ2hSt4ZWmW/ZsqfNpy2Fwk14sVPanj+APuXpRfkwA+xS46uisYGT/hN721NUXWPm5FtX/U1AWkqdcq2hAQxCHbx8/bCDcTva0F7jn+5RmvY6dJ22cyqbA9/StWO1AmHPqxSkXOGcRsasjU9guW/edpc6sUy1g5eiQraAwGIcnqzCnRlSNOPMgRvBQ5AzUjMv1skScih+qw+A7wqXQ0UvgI3PKtcs/n7fRj4YGhYH77wbAzezIOon5MhA38AoTQnmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCK1jXkgNJ/Of7+3ybwHTCna2niTgWqwiVnl8Qz7U+c=;
 b=st6Cr0ihw1tP8tHmG1vGMYAYx47r5ScIQkG2S2cDVyxs4xnjiTPx6r7NXRotbvHFRH/yBOx2SpI1gsfpLWZgvJeJ3WfFyZCL8lLRj7ePSHCC+P+PPTTLOIunYDzoKAo7HqGS0ziNrPLfRHHQxmJFbj6Tqgx963pBKTKquaioe5U=
Received: from SA0PR11CA0096.namprd11.prod.outlook.com (2603:10b6:806:d1::11)
 by IA0PR12MB8905.namprd12.prod.outlook.com (2603:10b6:208:484::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Sat, 16 Mar
 2024 02:36:36 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::a1) by SA0PR11CA0096.outlook.office365.com
 (2603:10b6:806:d1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22 via Frontend
 Transport; Sat, 16 Mar 2024 02:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Sat, 16 Mar 2024 02:36:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Mar
 2024 21:36:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Mar
 2024 21:36:35 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 15 Mar 2024 21:36:35 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add fuzzing tests
Date: Fri, 15 Mar 2024 22:36:31 -0400
Message-ID: <20240316023631.420131-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|IA0PR12MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 48cd94c4-eaed-4876-5694-08dc4561e690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hxjyAQGoHv7wQbSwbzmV6dl8uMKsFYEt6/x9zD4fqfg6CelHIAgT4KLeg/EoZCW3OvuigYkp/yTQUtgjyru1QzIQ3ocr9qrPnExnobotNbFRb10ualpgLv+0xV6j7JieoW+4Jbs+Uu93BKTKUburnoMEol5lmxZtnEJNDOdkFEgl63BU09VWPRBfC2vr5iAwfK6RT4xcdpOow7Bw+9+pX4HCuzQlfjQmi6wjb7HJhlyu80q4HA1LQxTZk+vXrd4OsKXXvx740Kb6sJA27xMedGOj64lpB9Ca9vMUMz9CTf1GGnPc1FaN8iHjowfeT9SDKUKieoqXCooQQM9gWrhlAMHhMwxkVwlwWicZEbJz58IT47E/w3LFVzGylbrQ/QNgV6hN8lWQqwOL2ekTEKG3TrPT4V8IaB0enQYS1qeS3f7kt9x/YRzL6S/zUSqxJH5F72Bsb/jNPgnPv3x2aBr8tl2q4h+wM6mu3wXwUVLmxEEXPEQyyfxQwLWTwCv1D2g61L/g1j1EPDvRH58hqtZJZuk02kfKd49tou3OwTH3A+WLWITvbjVEMzU+oxDPo2Bz7PrLzJNScv/Bur88afm/z0njkhQwxt6D8BNuWIvcOjO343IECY9hDwW4sRbQ8BinD2yM5BU52knLDhd/6kYOVO5fbLg0sIxS2Bd354MZ/oNmXEyp6yFEiJsu6ZBZwTPVb971pkZfNpH5lMcLD2aOiNjr3MqQrjz7N2KxvZpytqqnQbX1nSweZxMZ0Gpixmum
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 02:36:36.1506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cd94c4-eaed-4876-5694-08dc4561e690
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8905
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

Joonkyo Jung was using customized Syzkaller with KAZAN
enabled to find the bugs in amdgpu and the drm scheduler.
Those new tests would help to keep the job state machine
of the drm scheduler and amdgpu in the correct state to
ensure that the wrong call sequence or invalid parameters
do not cause a kernel crash.

The sub-test 'user ptr fuzzing' sends
DRM_IOCTL_AMDGPU_GEM_USERPTR the invalid address and
2 GB allocation size.
The sub-test 'cs fuzzing' sends DRM_IOCTL_AMDGPU_WAIT_CS
for several IP types without previously submitted jobs.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 99 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 tests/amdgpu/amd_fuzzing.c

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
new file mode 100644
index 000000000..11a85f46c
--- /dev/null
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_gfx.h"
+
+/*
+ * The bug was found using customized Syzkaller and with Kazan enabled.
+ * It can be triggered by sending a single amdgpu_gem_userptr_ioctl
+ * to the AMDGPU DRM driver on any ASICs with an invalid address and size.
+ * The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
+ * The following test ensures that the found bug is no longer reproducible.
+ */
+static
+void amd_gem_userptr_fuzzing(int fd)
+{
+	/*
+	 * use-after-free bug in the AMDGPU DRM driver
+	 * fix in amdgpu commit 6dbd33a9c8747dbf1d149484509ad667cbdb3059
+	 * The error dump is available in dmesg only when KAZAN is enabled
+	 */
+
+	struct drm_amdgpu_gem_userptr user_ptr;
+	int r;
+
+	user_ptr.addr = 0xffffffffffff0000;
+	user_ptr.size = 0x80000000; /*2 Gb*/
+	user_ptr.flags = 0x7;
+	r = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_USERPTR, &user_ptr);
+	igt_info("%s DRM_IOCTL_AMDGPU_GEM_USERPTR ret %d", __func__, r);
+	igt_assert_neq(r, 0);
+}
+
+/*
+ *  The bug was found using customized Syzkaller and with Kazan enabled.
+ *  The bug can be triggered by sending an amdgpu_cs_wait_ioctl for ip types:
+ *  AMD_IP_VCE, AMD_IP_VCN_ENC, AMD_IP_VCN_JPEG, AMD_IP_VPE
+ *  to the AMDGPU DRM driver on any ASICs with valid context.
+ *  The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
+ *
+ */
+static
+void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[], int size)
+{
+	/*
+	 * null-ptr-deref and the fix in the DRM scheduler
+	 * The test helps keep the job state machine of the drm scheduler and
+	 * amdgpu in the correct state to ensure that the wrong call sequence does
+	 * not cause a crash.
+	 */
+
+	union drm_amdgpu_ctx ctx;
+	union drm_amdgpu_wait_cs cs_wait;
+	int r, i;
+
+	memset(&ctx, 0, sizeof(union drm_amdgpu_ctx));
+	ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
+	r = drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+	igt_info("%s DRM_IOCTL_AMDGPU_CTX ret %d", __func__, r);
+
+	for (i = 0; i < size; i++) {
+		memset(&cs_wait, 0, sizeof(union drm_amdgpu_wait_cs));
+		cs_wait.in.handle = 0x0;
+		cs_wait.in.timeout = 0x2000000000000;
+		cs_wait.in.ip_type = types[i];
+		cs_wait.in.ip_instance = 0x0;
+		cs_wait.in.ring = 0x0;
+		cs_wait.in.ctx_id = ctx.out.alloc.ctx_id;
+		r = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_CS, &cs_wait);
+		igt_info("$s AMDGPU_WAIT_CS ret %d", __func__, r);
+		igt_assert_eq(r, 0);
+	}
+}
+
+igt_main
+{
+	int fd = -1;
+	const enum amd_ip_block_type arr_types[] = {
+			AMD_IP_VCE, AMD_IP_VCN_ENC, AMD_IP_VCN_JPEG, AMD_IP_VPE };
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		igt_require(fd != -1);
+	}
+
+	igt_describe("Check user ptr fuzzing with huge size and not valid address");
+	igt_subtest("userptr-fuzzing")
+		amd_gem_userptr_fuzzing(fd);
+
+	igt_describe("Check cs wait fuzzing");
+	igt_subtest("cs-wait-fuzzing")
+		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index a58d18ad3..ce3ba5520 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -12,6 +12,7 @@ if libdrm_amdgpu.found()
 			  'amd_cs_nop',
 			  'amd_deadlock',
 			  'amd_dp_dsc',
+			  'amd_fuzzing',
 			  'amd_freesync_video_mode',
 			  'amd_hotplug',
 			  'amd_gang_cs' ,
-- 
2.25.1

