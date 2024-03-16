Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C547C54E5D
	for <igt-dev@archiver.kernel.org>; Sat, 16 Mar 2024 03:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA837112353;
	Sat, 16 Mar 2024 03:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l9cOoaG/";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D1C112353
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Mar 2024 03:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpKXyvsPPw+RZNZU+nQnruk6puRVhoNA0fnyUcp4ulxoCiqOzbJHKnlH8M0NqIZGGbS27+LQFgkGwkQijY7LVM2rAm9rrFAp97MMug0eMFO81AK4kJrKDW9BJ3CEk6bZpKenb1H6RMx3M01/w07BV9aqO91z/GzBT+1QA9Ds4AGEHqWvIMOQk1GxL4bJdyJ40t5HDfTyoJSZrJLLOdfqjT6IIF4CVOLkQIDFjVf/ZxUREoQtDKgjz3+u7eUH7K55bPuKyO+TeTQG36WbpZqWvmhLziVie+MXpabf/EuhzwpznDSujs9AsxsBk0iBeqbZZIKe6NfnDCW5+S3wjXM9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfygeKO0ncWjdOtc1yI72/txKrclFx3/lXgWFCZIdVM=;
 b=e9XhaIkSLyq0niNCpvu4xw5N+n+A0pL1ywaVF/tAFNlm3jzeuvBJVtG2bGQlI/IayVmuF10hKOXebDtYQCXbC73cx0sU6ns7dTbiiH4566s450JjDJrD93WQRiw7unSyoD+VHD7vDQFWf/q+PNL1ltn0eIjWYg8HhsgoxTUMji0KXVtwfUftYzJvWtSVvMVZCmL9RVng/2Tr5go85SPAQ0OaYvLNZ+7eraHJ7HCjjY07guWe3jL09IejCdzSqFsWHnTPIyt6w7UhFYueETAHC1t0xEPJcF3tx3814My3IjnsM0T8bvfTf8BU7mEVcdX8ft3UETqR1d8+8NrVWQbUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfygeKO0ncWjdOtc1yI72/txKrclFx3/lXgWFCZIdVM=;
 b=l9cOoaG/Cjutmx5ziKDBqxKZVy0jCy9z0AXCQokBqqaN+jFq/srTWYsYHP0+W8yocDyaO8+AhEy1xMdboPsEl1AuGCxtDbPC6iBr+Gr/5UxcO859Mh0mBvCacOCWqcB9qgRRRhrPASP+DKaVlwgq4zO8z9jUfrDd0zvJc6pZQGw=
Received: from CY5PR15CA0257.namprd15.prod.outlook.com (2603:10b6:930:66::21)
 by PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Sat, 16 Mar
 2024 03:34:08 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:66:cafe::9f) by CY5PR15CA0257.outlook.office365.com
 (2603:10b6:930:66::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.23 via Frontend
 Transport; Sat, 16 Mar 2024 03:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Sat, 16 Mar 2024 03:34:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Mar
 2024 22:34:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Mar
 2024 22:33:51 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 15 Mar 2024 22:33:50 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add fuzzing tests
Date: Fri, 15 Mar 2024 23:33:48 -0400
Message-ID: <20240316033348.451162-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: fbedf04d-eff9-4ed6-f27b-08dc4569efba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MFMZkkpi5Dn4zkS+ZdNByyegfeDhR76pXW5HOpLXc48bCdB7jVRmZdKah0qqY4ydwVmAwaFcob97eIwOFntKHs1bH1RbX7ca0XXHhOpyX+MC245AnaW7qLpt0dgT7KBR607L/5536dbh4g7Xa7klhsDZpGrV1eltgPauwOFlToJ9T31lruRdRi/pvWEYwmrK0JFpnUfiKIiwzZUTVJ04sDWUr3D/08rtI1RjQ4UUIrwhJ11dDqQIxhInDDEFKwWzmHb5GR0iRFJTHGHCMVd7+pto8464oHNqwq6u8ua20tK8xYYJ8IKGtRXsHMX+CTqH6g+NdTFtjAJrhd3UjT5zNJMDC6Eljp7Zd4Ph1uWNYJ/eU8slrqZst6lpu0/0J91uZRdxRsqjpPbH3NGRmvuIoGhwxmP4f5t4ON0xc/AIpz6t9OqDNh2ooPOBNJR9QGoM5hiejwep5sA1/8blZ0hbLUQymtuASUbcdkE0nL8S23y3B4GprZEp5Y7R5rqzbPCJ0KuU2jKVlQloZZFWIYNR4acGUreVV23zML0ldoGGfQwcQRbNAhwHpULrdvyHtEz6IbBw1KsdhvG2oX62KgEeupptHtQEpEY902fD20un3FWQtv3WOMEs1iuE0Mestt+pqRsaQ2m/C9s1QC0GLoyUFsbPZzx0W4eKdUc7F/FJ+GDDePJ2uzOHRGOIUaqfx5K8yxsjAchGEpAGlJO/o+TD5EQynUFOIC6IQqq6BR8s2hGZYLGj1LkezVkVu4GyzTM
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 03:34:07.4591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbedf04d-eff9-4ed6-f27b-08dc4569efba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429
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
 tests/amdgpu/amd_fuzzing.c | 119 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 tests/amdgpu/amd_fuzzing.c

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
new file mode 100644
index 000000000..d9bd8a072
--- /dev/null
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_gfx.h"
+
+const struct amd_ip_type {
+	const char *name;
+	enum amd_ip_block_type type;
+} amd_ip_type_arr[] = {
+	{"AMD_IP_GFX",		AMD_IP_GFX},
+	{"AMD_IP_COMPUTE",	AMD_IP_COMPUTE},
+	{"AMD_IP_DMA",		AMD_IP_DMA},
+	{"AMD_IP_UVD",		AMD_IP_UVD},
+	{"AMD_IP_VCE",		AMD_IP_VCE},
+	{"AMD_IP_UVD_ENC",	AMD_IP_UVD_ENC},
+	{"AMD_IP_VCN_DEC",	AMD_IP_VCN_DEC},
+	{"AMD_IP_VCN_ENC",	AMD_IP_VCN_ENC},
+	{"AMD_IP_VCN_JPEG",	AMD_IP_VCN_JPEG},
+	{"AMD_IP_VPE",		AMD_IP_VPE},
+	{"AMD_IP_MAX",		AMD_IP_MAX},
+	{},
+};
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
+	igt_info("%s DRM_IOCTL_AMDGPU_GEM_USERPTR r %d\n", __func__, r);
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
+	igt_info("%s DRM_IOCTL_AMDGPU_CTX r %d\n", __func__, r);
+	igt_assert_eq(r, 0);
+
+	for (i = 0; i < size; i++) {
+		memset(&cs_wait, 0, sizeof(union drm_amdgpu_wait_cs));
+		cs_wait.in.handle = 0x0;
+		cs_wait.in.timeout = 0x2000000000000;
+		cs_wait.in.ip_instance = 0x0;
+		cs_wait.in.ring = 0x0;
+		cs_wait.in.ctx_id = ctx.out.alloc.ctx_id;
+		cs_wait.in.ip_type = types[i];
+		r = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_CS, &cs_wait);
+		igt_info("%s AMDGPU_WAIT_CS %s r %d\n", __func__,
+				amd_ip_type_arr[types[i]].name, r);
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

