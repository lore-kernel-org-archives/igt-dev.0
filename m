Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0FFC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 04:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E295110F7AA;
	Wed, 27 Mar 2024 04:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VLYRcbVM";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F229910F7AA
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 04:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzvwiAJRUdwzL2i6CR1SlF6gE6sJuroxTtCZmoylT3cBbifYZICjPvy0WTBwtCrR0fwh+rgyPvWidxorevtV6U1O5Q8W4A1xjD0N+2tffyfsIJXQvXPyN6gpjFjOIAstskevFw5FRgL/yuyZM73ceTIxj1kOEJB7+TauynE1DzxMuhJFMozhWkWRIFzZCDP3wuaWbExOzCvFX50bCJkB/P2TmLMEsAEB07n1OX/7huuYd3nwjzV1q6ZkPLNKLFCcqT1cfIykIld6YulgWHTf7p4d0mcGI0KTPx5ex7h7U2SzgCAIvBX51TscXETAAbN3YP0fPmU8MMCe5n0otdZe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3clQyQUtsB9tAhjqdZUgr7/7EPaiLX2U0W3O0mBEp0=;
 b=O2j0uFOouNwe/be2EECEEjbtcIxLURtEgG9So7AvY+IdlZ+b9YwJ3Q11hNeeffxVyvcn0IiQFiBmvWhFRtzj7K+D146oJpAgvEQ+N+odOI4UZSlcgZGnonXzFWLQBVQhb54xAcS7AHbBiYXPK6S8Sf08mK68+9iOSCrr4yZnWio5/6BOCdT/lu5C66tnLdF0iNa2P0AD9qOTAE5RIuX9x9GStCACw8vfh/+LZe+WaHZVYGY8fzJGGKVIyl2j5KTgMpdliSqTRyKijr2xPZ0j3bM7AOYFoCOzHtbyGY2I0onpb+vM3jqkNXbMxkgzZhZncL80FxwNByfQz6pgyDifhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3clQyQUtsB9tAhjqdZUgr7/7EPaiLX2U0W3O0mBEp0=;
 b=VLYRcbVM4KyKfyYJYgislpMtGdPKL3K+FiIU2sAwZ1V1uKm9X/nsU4bie5Nn8u8RhWd18Tfzn8IHnukjwiV7Y4VKIycPEv2ObDGinY+Ak8w1oyiEFGkqZhhrJlunR3IAX+w17tXcUGV38poj1jjkqV+aa79f+1QiL4KKgqyaYg0=
Received: from BN9PR03CA0208.namprd03.prod.outlook.com (2603:10b6:408:f9::33)
 by PH7PR12MB9202.namprd12.prod.outlook.com (2603:10b6:510:2ef::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 04:01:59 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::41) by BN9PR03CA0208.outlook.office365.com
 (2603:10b6:408:f9::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 04:01:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 04:01:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 23:01:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 21:01:05 -0700
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 23:01:05 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse Zhang <Jesse.Zhang@amd.com>, "Tvrtko
 Ursulin" <tursulin@igalia.com>
Subject: [PATCH] tests/amdgpu: add gem create fuzzing test
Date: Wed, 27 Mar 2024 00:00:55 -0400
Message-ID: <20240327040055.457898-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|PH7PR12MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: dff8329d-52db-42d4-3cb1-08dc4e12a63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tvxKHwOo613o+CHBoepFVvClhzYFBQtJqvxzhCouR0qg+9vtwnulx2PA4fJiH4fUge4c1n9vBiU5KO01+hjFWxlLxTaCH+nkHVHu2CT9Bu7TGjvHD1dvRl75ReP+GAKC+krfabRqXtBdqh+dnVWaQ5hJSk5e320sF5SkynSpG4VuzKOvHS34eZgJsk7bPMs6QTfR37+T9F7SsnzyGGUu6ZJmLMudt/gcYpABmc840h80qrEwoI/H1KYyS5GwPap3b13N2byylCecNRT0LRVUbFllfRi+pkOS8fM0oSG3UJxkFNiH76UMEXMKm0gEVKRqZG3/o3tNXkr0Y5D4keHSWrbBkgZTnjX168JnG8hdRb7S4jQhhJLoq8mgmIFCXcrtC/rHmwo11lGy7u6QDKi2okMgHAjEC1CY/xBwZk9rJRz7/dIpIQic3BTD67gD999ugGxC05D9rPLCoRhXEsiLydcEISTdt1w1K8M1XWTa5tJXXwytvh9lk++7ppKR1HF9E2gicgOEYAVrd/rBNU3ugW98uWMNwNKsFOsc793e3JFSl1Q2QtbhOxM/DECMSdxyDfGZ5LLgDcBzcnbboU+qH2kt1AHmfnPBdfXCyD3zmvT0Ynq7FhgBolMlOZh74KfMyx0h1IPd9a7Lu78OBDnSf55jvjf/ELR2itiu2Ptx6d1JlR16ioqqicGo0aKEyFNu+7nK0HYjYB0hOgOKVVF1QQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 04:01:58.4511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dff8329d-52db-42d4-3cb1-08dc4e12a63a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9202
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

The bug in amdgpu was found using customized Syzkaller and with Kazan enabled.
Report a slab-use-after-free bug in the AMDGPU DRM driver.
Ftrace enablement is mandatory precondition to reproduce the error once after boot.
The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.

The following scenario is a different reproduction of same issue:
BUG: KFENCE: use-after-free read in amdgpu_bo_move+0x1ce/0x710 [amdgpu]
https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646.

Fix Christian König ckoenig.leichtzumerken at gmail.com
https://lists.freedesktop.org/archives/amd-gfx/2024-March/105680.html.

The issue is visible only when Kazan enables and dumps to the kernel log:
BUG: KASAN: slab-use-after-free in amdgpu_bo_move+0x974/0xd90.
We accessed the freed memory during the ftrace enablement in a
amdgpu_bo_move_notify.

The test amd_gem_create_fuzzing does amdgpu_bo_reserve 2 times.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>
---
 tests/amdgpu/amd_fuzzing.c | 69 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index 69c9e8dad..dccac8cc1 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -95,6 +95,67 @@ void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[], int size)
 	}
 }
 
+static int
+amdgpu_ftrace_enablement(const char *function, bool enable)
+{
+	char cmd[128];
+	int ret;
+
+	snprintf(cmd, sizeof(cmd),
+			"echo %s > /sys/kernel/debug/tracing/events/amdgpu/%s/enable",
+			enable == true ? "1":"0", function);
+	ret = igt_system(cmd);
+
+	return ret;
+}
+
+/* The bug was found using customized Syzkaller and with Kazan enabled.
+ * Report a slab-use-after-free bug in the AMDGPU DRM driver.
+ * Ftrace enablement is mandatory precondition to reproduce the error once after boot.
+ * The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
+ *
+ * BUG: KFENCE: use-after-free read in amdgpu_bo_move+0x1ce/0x710 [amdgpu]
+ * https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646
+ *
+ * Fix Christian König ckoenig.leichtzumerken at gmail.com
+ * https://lists.freedesktop.org/archives/amd-gfx/2024-March/105680.html
+ *
+ * The issue is visible only when Kazan enables and dumps to the kernel log:
+ * BUG: KASAN: slab-use-after-free in amdgpu_bo_move+0x974/0xd90
+ * We accessed the freed memory during the ftrace enablement in a
+ * amdgpu_bo_move_notify.
+ * The test amd_gem_create_fuzzing does amdgpu_bo_reserve
+ */
+static void
+amd_gem_create_fuzzing(int fd)
+{
+	static const char function_amdgpu_bo_move[] = "amdgpu_bo_move";
+	union drm_amdgpu_gem_create arg;
+	int ret;
+
+	ret = amdgpu_ftrace_enablement(function_amdgpu_bo_move, true);
+	igt_assert_eq(ret, 0);
+	arg.in.bo_size = 0x8;
+	arg.in.alignment = 0x0;
+	arg.in.domains = 0x4;
+	arg.in.domain_flags = 0x9;
+	ret = drmIoctl(fd, 0xc0206440
+			/* DRM_AMDGPU_GEM_CREATE amdgpu_gem_create_ioctl */, &arg);
+	igt_info("drmCommandWriteRead DRM_AMDGPU_GEM_CREATE ret %d\n", ret);
+
+	arg.in.bo_size = 0x7fffffff;
+	arg.in.alignment = 0x0;
+	arg.in.domains = 0x4;
+	arg.in.domain_flags = 0x9;
+	ret = drmIoctl(fd, 0xc0206440
+			/* DRM_AMDGPU_GEM_CREATE amdgpu_gem_create_ioctl */, &arg);
+	igt_info("drmCommandWriteRead DRM_AMDGPU_GEM_CREATE ret %d\n", ret);
+
+	ret = amdgpu_ftrace_enablement(function_amdgpu_bo_move, false);
+	igt_assert_eq(ret, 0);
+
+}
+
 igt_main
 {
 	int fd = -1;
@@ -114,6 +175,14 @@ igt_main
 	igt_subtest("cs-wait-fuzzing")
 		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
 
+	igt_describe("Check cs wait fuzzing");
+	igt_subtest("cs-wait-fuzzing")
+		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
+
+	igt_describe("Check gem create fuzzing");
+	igt_subtest("gem-create-fuzzing")
+		amd_gem_create_fuzzing(fd);
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.25.1

