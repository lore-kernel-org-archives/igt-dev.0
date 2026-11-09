Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ADE606A31C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 23:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=33rnpuUk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9723610E0E8;
	Mon,  9 Nov 2026 23:51:34 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F12C10E211
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 23:49:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZBv67NE1SayEvLDoHaDie4RlqjirLYpgH2L/4QQb5uO/ppMk3h72esZH+J31u0WUUNZ9cGqNegsKH0+2w2PgK05I5e6YRel6JmxP5Zpa+X+wbbsD2JN9IIDpPIA5uxvpCg6BTai2JgOkYM5+7DQWu5WmvfFlYAeK5gs+FFn6heUau43PphWShqUGWfzSlTmYpf3jWgtF0yMnLZnW7g/xwuxJf35nJjoQBZ1EY7WrxFuArj51R1QgxV8SmcEqbGl4X05XOJN8x5+Sgx0eM2nBMdmiZQbRWH1mIeO1OTW6x//KIaT2SvR+6EBTJJJtWJ86riCU3+PR1PKYntFD61FhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG84/Mgfqsk3P9yqjT3BUiJWu1srQdPKbr4xmkoYNT8=;
 b=iR6vn5jZR9GhBFE8l5NvcTkpJFgLghEwu7T2qtgb1hKOGUUF5QXXy1hKolqTkOaLK/u4X33fBgWxwgze++n6i7Ebgl84CnJDqH7v9rumD42/M0KIJzSoLjin4sqzsxo+hG6yBY3Gtte4I2tZBZgeXBeLpeP2BxIE7CvFr+LceWyqp0SpTIPo50MvogaHDRjUJQA77T0gvrEwc2PV/b7yyLYa5tnObxom2VAY6DZVIkbqtudympvP5GHvxjRY/edk7slbdvNt4oaEZe/6Rb8ES7sZEU6OjVPCxeoat/VSGDtq+yH5PlnYpjVQdPtaa2IeradEf2Gx+0oXkQCfDFOSdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uG84/Mgfqsk3P9yqjT3BUiJWu1srQdPKbr4xmkoYNT8=;
 b=33rnpuUksfDMmqj2Zad3eiv2kwKMSnUqUa24o9uz/UEFO8ccteIs68gFS+8xEHcDeL5PvAyNhf05Zx2sHSyJuyphR2WrNnbK4yIb3sgDbjAVNI6nFvYTSpVhBJn0PqIXVF6ptFbNUeZVX9++jzcaFBuw8LshYl9OjnKM0UThNB4=
Received: from BN9PR03CA0689.namprd03.prod.outlook.com (2603:10b6:408:10e::34)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 23:49:38 +0000
Received: from IA0PEPF00000043.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::81) by BN9PR03CA0689.outlook.office365.com
 (2603:10b6:408:10e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 23:49:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000043.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 23:49:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 17:49:37 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 17:49:37 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 17:49:36 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH] tests/amd/gem_list_handles: Add basic test for
 DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES
Date: Mon, 9 Nov 2026 18:48:22 -0500
Message-ID: <20261109234926.146697-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109234926.146697-1-vitaly.prosyak@amd.com>
References: <20261109234926.146697-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000043:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: d12d7aae-a943-4889-1885-08df3ebc1ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|10067099003|3023799007|11063799006|261009223027099003|261102123227099003|261028144727099003|261026121527099003|261022105027099003|56012099006|261022113327099003|261021123027099003|261021121427099003|261026140227099003|261102130727099003;
X-Microsoft-Antispam-Message-Info: NrQsUdjtXlRRDroIPtPEJqqoFjFPBB6x5uSNVE1lF9+lw6HE9zKFsRsQxum9nsR8tBNrEYn/gIND5FKYIPgDNzWrZxeTh62bz0Cr/b1xo4k4bYgqzOUzM4sPsCX8Ddp+Y+t+FgAYd9PMr5PgKe+KRYdnvraJBaARzQlccLmuO5zA+t8Pcsb1AChaPg79/+tM7vanbojd2DQHrNGX7ImMg8IwHicGWMNLTlQhaVQnG1iLyVtmF4hjwXNSCbFGdRgbOvKs4HaME01gO6rvBjI69y0O7STEO4Eb7h55aUo4VyoRo7ZqxidCnZXYAMBBY6n7JnJwbsynLuWxt4gY+NCbxm3iohhd8tr8vlP0fb8Y9QprgEX9Cs3sE23Vu3xQkp6EQyAivZo0wSZtIlGsQyT/XuQlAkiZVHgu8VxgIyxm+uU+E0TJ143SFSjEylhXP8mPiz8chNxwBkqdNZnrYPLQgpCLAXKuHa8ffFxeAWG8Q2sP3gGa38k4RlxQhO8q6RIlCF7706D32nbowEGpzuukodIIX3EmE3tmbn4mIZhZ0oV1ZhFZsUSifVo/C2EwEe7eGyO1q0+8aTkSN0PJCcmaLTwLdo6vnT7/0bNvBGGStb6GtE471Ppu17asn08tzuJ0T4Uo3xq23mOjICsqv/lzMv+lHq/GW78z5igUpdAsM9TxQYyMroU2Sqt1J6bKfYawTqf57v3AEtZOFhjYfE7NUA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(261009223027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261022105027099003)(56012099006)(261022113327099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102130727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +e3oZRUWcrFkKeVD1haXAxgjBkNFIuTPEdVOH0oEsNcSo2y3/iAZvZQIiStKQiTgdtHe/GaXJy1vUErkXmZua9+H34R+buiNeiKZ3odN8MLcGkHDcbj6BKDxcyiNl5Jl+ml554a9Z00U+RG87iyyCRWcBYBa+aURWzsWi/qsOjm6WdWXz2uVJvuRdmBdiZweXmLKttnqwKfYvHfhIR5p3bW3GhKUXXiSU+htiz6e3aV0Bm+dpUrcsb8aKaBaU6BBjM/XErz5g+uXRMMOGHMnGxZ0TKqeqLv5bbTdRVIfpMBjOMHun3YTTb8M1fnVXFKsQ9lKWBrU/5K2ZKCL+A9J/5SRwx+vX4zXDGRck1fiI1iV6BcR5gi4JezL8iTai9d+CntpAWD6PyoUfqbLHOZ9etpq3kdbeAP0i2jimGajDrJBAr//N1LxniRQ7M6YXiCb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 23:49:38.5204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d12d7aae-a943-4889-1885-08df3ebc1ddc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000043.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Add basic cases to verify input checking and normal operation: padding
compatibility, invalid userspace output pointers, zero/one/many buffer
objects, and two-pass count discovery. Check the returned GEM handles,
sizes, preferred domains, allocation flags and alignment.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_list_handles.c | 151 ++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build        |   7 +-
 2 files changed, 155 insertions(+), 3 deletions(-)
 create mode 100644 tests/amdgpu/amd_list_handles.c

diff --git a/tests/amdgpu/amd_list_handles.c b/tests/amdgpu/amd_list_handles.c
new file mode 100644
index 000000000..8c5529239
--- /dev/null
+++ b/tests/amdgpu/amd_list_handles.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2026 Valve Corporation
+ */
+#include <sys/ioctl.h>
+
+#include "igt.h"
+#include "drmtest.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+#include "lib/amdgpu/amd_memory.h"
+
+#define TEST_PADDING (1 << 0)
+#define TEST_FAULT   (1 << 1)
+#define TEST_TWOPASS (1 << 2)
+#define TEST_PROBE   (1 << 3)
+
+#define BUFFER_SIZE    4096
+#define MAX_BOS        1024
+
+static void
+basic(amdgpu_device_handle dev, unsigned int num_bos, unsigned int flags)
+{
+	struct drm_amdgpu_gem_list_handles_entry entry[MAX_BOS];
+	struct drm_amdgpu_gem_list_handles list = {
+		.entries = (uintptr_t)entry,
+		.num_entries = num_bos,
+	};
+	int fd = amdgpu_device_get_fd(dev);
+	amdgpu_bo_handle bo[MAX_BOS];
+	int i, ret;
+
+	igt_assert(num_bos <= MAX_BOS);
+	igt_assert_fd(fd);
+
+	for (i = 0; i < num_bos; i++) {
+		struct amdgpu_bo_alloc_request alloc = {
+			.alloc_size = BUFFER_SIZE,
+			.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
+		};
+
+		ret = amdgpu_bo_alloc(dev, &alloc, &bo[i]);
+		igt_assert_eq(ret, 0);
+	}
+
+	if (flags & TEST_PADDING) {
+		/*
+		 * Apparently kernel never checked for mbz so now we have to
+		 * keep accepting garbage.
+		 */
+		list.padding = 0x13ac5;
+	} else if (flags & TEST_FAULT) {
+		list.entries = 0;
+	}
+
+	if (flags & TEST_TWOPASS) {
+		if (flags & TEST_PROBE) {
+			list.num_entries = 0;
+		} else {
+			igt_assert(num_bos > 1);
+			list.num_entries = num_bos - 1;
+		}
+		ret = ioctl(fd, DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES, &list);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(list.num_entries, num_bos);
+	}
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES, &list);
+	if (flags & TEST_FAULT) {
+		i = errno;
+		igt_assert_eq(ret, -1);
+		igt_assert_eq(i, EFAULT);
+		goto out;
+	}
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(list.num_entries, num_bos);
+
+	for (i = 0; i < num_bos; i++) {
+		struct drm_amdgpu_gem_list_handles_entry *e = &entry[i];
+		uint32_t handle;
+
+		ret = amdgpu_bo_export(bo[i],
+			       amdgpu_bo_handle_type_kms_noimport,
+			       &handle);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(e->gem_handle, handle);
+
+		igt_assert_eq(e->flags, 0);
+		igt_assert_eq(e->size, BUFFER_SIZE);
+		igt_assert_eq(e->preferred_domains, AMDGPU_GEM_DOMAIN_GTT);
+		igt_assert_eq(e->alloc_flags,
+			      AMDGPU_GEM_CREATE_VRAM_CLEARED |
+			      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
+		igt_assert_eq(e->alignment, 0);
+	}
+
+out:
+	for (i = 0; i < num_bos; i++)
+		amdgpu_bo_free(bo[i]);
+}
+
+int igt_main()
+{
+	amdgpu_device_handle dev;
+	int fd = -1;
+
+	igt_fixture() {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver_render(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &dev);
+		igt_require(err == 0);
+	}
+
+	igt_describe("Check padding backward compatibility");
+	igt_subtest("padding")
+		basic(dev, 1, TEST_PADDING);
+
+	igt_describe("Check fault detection");
+	igt_subtest("fault")
+		basic(dev, 1, TEST_FAULT);
+
+	igt_describe("List no buffer objects");
+	igt_subtest("no-bos")
+		basic(dev, 0, 0);
+
+	igt_describe("Create and list one buffer object");
+	igt_subtest("one-bo")
+		basic(dev, 1, 0);
+
+	igt_describe("Create and list many buffer objects");
+	igt_subtest("many-bo")
+		basic(dev, 1024, 0);
+
+	igt_describe("Create and list many buffer objects in two-pass mode");
+	igt_subtest("many-bo-two-pass")
+		basic(dev, 16, TEST_TWOPASS);
+
+	igt_describe("Create and list many buffer objects in two-pass probe mode");
+	igt_subtest("many-bo-two-pass-probe")
+		basic(dev, 16, TEST_TWOPASS | TEST_PROBE);
+
+	igt_fixture() {
+		amdgpu_device_deinitialize(dev);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 61b81c814..11e5c00da 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -28,6 +28,7 @@ if libdrm_amdgpu.found()
 			  'amd_jpeg_dec',
 			  'amd_jpeg_queue',
 			  'amd_link_settings',
+			  'amd_list_handles',
 			  'amd_lockdep',
 			  'amd_max_bpc',
 			  'amd_mem_leak',
@@ -53,9 +54,9 @@ if libdrm_amdgpu.found()
 			  'amd_subvp',
 			  'amd_mem',
 			  'amd_remote_mem',
-                          'amd_userptr_invalidation',
-                          'amd_close_race',
-                          'amd_mes_reset',
+			  'amd_userptr_invalidation',
+			  'amd_close_race',
+			  'amd_mes_reset',
 			]
 	if libdrm_amdgpu.version().version_compare('> 2.4.97')
 		amdgpu_progs +=[ 'amd_syncobj', ]
-- 
2.55.0

