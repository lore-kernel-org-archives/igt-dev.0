Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9BCC54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 18:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502E110F803;
	Mon, 18 Mar 2024 18:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2HbTqU1Q";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4154010F6C1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 18:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB/qvGCtmMYwX5fmYR0f/GgKbeyqx53QwnA+ogNEYnT/Bht0MuScJXRTo8INHnaKLUwBJObMs+VSwJFOrNiq9GDk5cYX/uWhWa2YZxNjcBeSCnjF0o5o8A8V+5JEYEzFWj+0I43mHDn4k3zFxl9k6SytT7XHi9O+a3LLvVbD2NWZVx8UOqq1spT6HA7JuqOiU0YdQaPnYebQtLbecLYj6qvjDwRF30Dqyo2/H8jT9B6Lc8zifn6YAkaOpztFKz36z97sUvptA3JWNoTv577fbRida3fva0/BMMhywkh+eHaDTyGxrBZn7MMputsDXZBn8dtwSOHp/MwSv3lgmlikgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhsUC2gG/Sy8Reg2tGKv6nYRsuAecN56uHBp0bmFuHs=;
 b=W+rBcPGpx1xcNSqSBhyCwnlg5/sS8verPsplt6vf4LWwCU8UsUNTMzRcBz+WQ1yDWgdmiZmaFHmXiUw306KahlIQCTAo9eq/DQyQKHewHI9f9218qeuNTn+SE7rt6sx2Fhw2Xf3hrTwK20FyOs+iktI3nJUpDjXSzPI5cSihpRP9E0WZVi5YCBMoxN4DvH91Qem36MyKaq5N4FSJ3HN9pGBpA1RSZ+Q3Q6mRcDYPPPsSTCOCyejqdJalHXokRlZfN4lZ3zDRJUkJfpnSg3VejJLoR0gFOTGAh2YKSGhbYEHojmQnZsiiKbVWhyzic4xvtke3fJQmSY9Gr9gkqwh4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhsUC2gG/Sy8Reg2tGKv6nYRsuAecN56uHBp0bmFuHs=;
 b=2HbTqU1Qe05YT4L6u+5GROWhXnABxvGYO84OOpjeiX/JolKLQUS557wpUy9Mmj0/nFAS8bjLR88ca3eeT5d1t4hsH6CN4ek5oNeBuDN13qV3h2gt2XMAxhXdLI6oYkV5aSG+KslYHz6uuIEPTF9TBVpBL9B6NWGRtT4VJFRZOFo=
Received: from BYAPR06CA0042.namprd06.prod.outlook.com (2603:10b6:a03:14b::19)
 by IA1PR12MB6579.namprd12.prod.outlook.com (2603:10b6:208:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 18:41:03 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::4a) by BYAPR06CA0042.outlook.office365.com
 (2603:10b6:a03:14b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Mon, 18 Mar 2024 18:41:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 18:41:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 13:41:02 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 13:41:01 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Joonkyo Jung
 <joonkyoj@yonsei.ac.kr>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add fuzzing tests
Date: Mon, 18 Mar 2024 14:40:56 -0400
Message-ID: <20240318184056.108067-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|IA1PR12MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: fedbba13-6026-4b91-0ce9-08dc477af6d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q79HoUIZdfZg9rj783Z6IpjfJqOVvLDflUQ+gbKIptvc7FdzJyIx95X04cqWQrQjIYfzC0pQ7Ww7EKbtrlrdjmDQtchGTdsf2rOfuawdavIQVeEJxLkZBYem3BMWjYrh7ctq46dQy9vEYE5UefGcaNNP7KpWz1tBgGVH+R+L6dvIs5oH37Gn1Dqr7MDfClUbr8sLlwif+Q9EA7F0i5VYcwwD25+ydeVUtweyZ/EpEsWVnEXMXkYczHQp+Nq9F7YFHIvKnwdGb23ZfZWkSVE6Gx5JHPOrNETqsF+xjyF0ATPvfvZK66utFCU4hmX4Vt7PBK1NvFEdotNjZYW+ykW24ZgAF8gNYu5ELpvkk5eYrcvLgnCoZBjNaSCpaNqIB+xpGJAj2Cl7VfhY897ovaqKP0HjvZuKLSPnylaK2N6faODds2rbHY5IetGx9zBTl/J5D+zFzACtPrsslsIGo7zUYANQLHi4n4kBVOiiwI2YN5zHFAl+se+7nYoWv0DTllVUXNWNsvRy2bCMniNwKRR9BZGYntv2z//jx5WXSPQ0cR2JtrhxzIK2pfYg+rCMIhfGnhUfj5XMpvC6uhotZeBxcC2bwKQjWrBL2xcQvsDHVkXTGb+p3damfPRX80mFnzUu/rv7jwB4UBuB/NeJo0Kxdtks6Dfddz5e69+PmjwAOlKzqHB1s69H/qnpC280nciUb4e6PPVK4uetfgS+Zzt8nv48LqDZz3HkW71+08+9nDsPduVLgJ5DZK3SlFtggVDh
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 18:41:03.0123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fedbba13-6026-4b91-0ce9-08dc477af6d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6579
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

v2 : File names in 'meson.build' are sorted alphabetically
     (Kamil)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 120 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 tests/amdgpu/amd_fuzzing.c

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
new file mode 100644
index 000000000..69c9e8dad
--- /dev/null
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_gfx.h"
+#include "lib/ioctl_wrappers.h"
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
+	r = igt_ioctl(fd, DRM_IOCTL_AMDGPU_GEM_USERPTR, &user_ptr);
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
+	r = igt_ioctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
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
+		r = igt_ioctl(fd, DRM_IOCTL_AMDGPU_WAIT_CS, &cs_wait);
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
index a58d18ad3..d7152a356 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -13,6 +13,7 @@ if libdrm_amdgpu.found()
 			  'amd_deadlock',
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
+			  'amd_fuzzing',
 			  'amd_hotplug',
 			  'amd_gang_cs' ,
 			  'amd_ilr',
-- 
2.25.1

