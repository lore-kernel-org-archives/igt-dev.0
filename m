Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4539CC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 04:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4B910EC97;
	Wed, 27 Mar 2024 04:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qys0pWHc";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2BC10EC97
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 04:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/rTEga2CwNZSZheRffXLS7pxjRvaAv5OzWtLkc3jnstwME1fG8LNblG5VAEdW6TpnCTTLhObu5GNZwD7NEQoARqeVEVFA5kbX2LZVYmCNin4IxLZGkyKNzI1867wdDdg6dFeDX8wleUSi2dyudgDzHO9UgmUyF+u1qh6ba/Q9mwOY9dizuH+5jXrMvrFxR2MeiVILKiiVsDoDTDpz2UzXyZ/cbr9cQeCkyK5ygtIBoTgn8+v5L83lFT2A45X7bI+H1HHnMAvL3k0AzwAE8NtBnubgGmRfRlsZikUp7FWhxP0h27soE0alQf6ROfMaLj5DGrm2IJxz/6/tceC8vGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3clQyQUtsB9tAhjqdZUgr7/7EPaiLX2U0W3O0mBEp0=;
 b=gU5kls/6IB6HeF/gSOHeaBkUQSBsXAJhDDeXDTtZMXD/+EnHtLIb//jM7bgm2HIOyIQw8IS8VnyOjxMgK/HMItfUX9DT+GY6LZT0tRlN1nsgorfBV6u7pMFlS085xty3qexp3TBSEic6MBJxIDQyhrj7XhsFjlKbagG1BU9P1nlC8QMFLQxFM0vsk0k9Xvo273qZ7kxpocbif6XMGN3wdWsa7CsXx6U7yKXyX7wADJRzJiSfTgDo4K+tqcr5wryAflGuU4PfGZhh1AKOTABtx34Wjiu1vWby7Y42UhRzCqLR8QqNhwch/fn0U3DJTxhRyl/z0tPmy4qbkmICXrVxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3clQyQUtsB9tAhjqdZUgr7/7EPaiLX2U0W3O0mBEp0=;
 b=Qys0pWHcr6kJJ03Kx1UraA9g8Fb2o8xaYDIgWAAcUZoSawvP1z7wy4B6nE4Cp0Z8HoeeY1HnIqg2S7do9oxECsZQHE9FjkRWZq5S4KYqpLB29DUg6z9yMgG1HvmHExQ+CNswPvDKJDAZGHA6ADLmaM91w5ye64KcVg2w0QLyXig=
Received: from CH0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:b0::22)
 by CY5PR12MB6430.namprd12.prod.outlook.com (2603:10b6:930:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 04:27:16 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::2e) by CH0PR03CA0017.outlook.office365.com
 (2603:10b6:610:b0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 04:27:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 04:27:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 23:27:15 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 23:27:14 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse Zhang <Jesse.Zhang@amd.com>, "Tvrtko
 Ursulin" <tursulin@igalia.com>
Subject: [PATCH] tests/amdgpu: add gem create fuzzing test
Date: Wed, 27 Mar 2024 00:27:03 -0400
Message-ID: <20240327042703.471787-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|CY5PR12MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c4602e-ca4d-4424-4d53-08dc4e162ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TBS7NmF7au2lqKRNuWa282/3/B111BuzI4vO4nYNFzZK4k5CRezspzqaMZbqJkulELCNqZhqEdv9jz1IY0BQHcCFDUWY6X/7PF+JqHhttX3ZF+8Bp7AH9LKEKSXuKmT0fa5GHaRxon3mDGxXz7rpJddFzYWK8V7IF2RK5qgBagE60XHvjtSKvklRaBXhTzqZE1DBOpFWR9AeZEIDdk613eNPafNHFyD+q1yMLSrzxunO1cN3N0bKlJZXodrFqZu6t9bm28cR6+wd10B/JhaA99V2q6481x+CLqCBGIpAauPdNrsBKOlGPt1aRP0KIIh5yhbt1Dd49d3odoH+HVIrpeDFSKLA6toGKAmbzSN1R8DLCZ0ZbCtDTJah8VjX/mClNq+VRzJ1GtY/00s0VPKHeoOPhPu2AeTVaBcMXat8TvXYN86Xg/Xm108AXhvqURDWEifpbRgKaL8UrbsYcW1ZIlJxuG/nvTvqdFN3lxz1gXb7fQ43bYGF1pfh4NhRs1cndUdc5e9YMohatDDP2TC+/ggG5iJwMF7nOq+snj6/dKNF+gGsgZS2g93r/VeGnMOrIom3vFucsqC4SjpbxuqxmBOvic1FJsgadWUYxsRgHTP6+aZTS7DNCvJETb5e21XNxJkQfx+hapuTwC/wz8IZEah//fgAspQUWVO890siN/VE0pdeUbt7f63VaJQgWkU2tOOqs2/y65v7wMGbILhG4A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 04:27:15.9437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c4602e-ca4d-4424-4d53-08dc4e162ecc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6430
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

