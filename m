Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E98C67861
	for <igt-dev@archiver.kernel.org>; Sun,  7 Apr 2024 03:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB9B10F759;
	Sun,  7 Apr 2024 03:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HmDPJhYJ";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A70210F759
 for <igt-dev@lists.freedesktop.org>; Sun,  7 Apr 2024 03:22:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YF+x2VFP3umaUgKz1Y7PEzmYa+lQfOQEe4Rc+vvsxrTO0NZYuMgk0iAOSihDJT+SnD84idb4d7Py7ddVbxBOEAP3Vq43jhn/2cn2I6BxA6C6yo7nyCTazfGcHOjo+RMW30KwD1NJp6BnK5jeRFCrg3AIgeRHlhmh29mmqccEy79+9hnuXQ04Qq8AoC5XmQ/Zl+W3omkamqkfwq4fDmthSTx16xU4THiNkWQ7Ow2KeAbDnp3eoFh9i0qwOSYqROqdxhA+Ebqx75B52UQ3Xhlu0ZXARpz5EBVbFBhoiEV8Vmel7jg1dTyLCNck0yQTlcqwLZiPX7iDwyWY0kjJh2oDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFzngFdWygKtNSJpVBWKcNOsDfnN2Xd+SmXxxAmH+mM=;
 b=XbeLihg7I3T/3HERuqZdxtwbKecrnTARhmuTVouBacVxmUHr6pPmo6QkC/g+NHItCDAjq7kvVyLnOz20fkiobr+ZHQO/ywtyGXutLGAam0zyebcRBYoDyvedAk5n83HV1TM2FNcnf39qg/KKXsncLjXxMUaS7FjIFVSsAZB9V8IgtLS2MQqKZVzK6iEdmCD9os/o1uqqx8r73quvoNHs0a6tgxIEaAXW39DpJAXiIFXY7F8n345LcM/BvPTQY2rmRKM6ksTnewkNcv2ShVot9m06aYcePLRLtCzS7R+OXsobpLkJU1UNgsXhFc43mix7AqSy2Vi6aEhaFq843dbPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFzngFdWygKtNSJpVBWKcNOsDfnN2Xd+SmXxxAmH+mM=;
 b=HmDPJhYJ4tIZfkFxhFD3EG9IWPlBclrWXFZqPTgWZI6r7ek90FCzYnn03DZFbg2wVTc2ZZLbquqcX8FLqas24evF62SG6SujE0XA1hBADiXGDPJyn09EfkRcswTgFsxFj7KlWUJ4P/Wxc2h3rEWMUDOOigqH6TvHOxCZJwHZEvs=
Received: from BLAPR03CA0036.namprd03.prod.outlook.com (2603:10b6:208:32d::11)
 by SA1PR12MB6727.namprd12.prod.outlook.com (2603:10b6:806:256::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sun, 7 Apr
 2024 03:22:51 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::c7) by BLAPR03CA0036.outlook.office365.com
 (2603:10b6:208:32d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Sun, 7 Apr 2024 03:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Sun, 7 Apr 2024 03:22:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 6 Apr
 2024 22:22:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 6 Apr
 2024 22:22:29 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sat, 6 Apr 2024 22:22:26 -0500
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse Zhang <Jesse.Zhang@amd.com>, "Tvrtko
 Ursulin" <tursulin@igalia.com>
Subject: [PATCH i-g-t V2] tests/amdgpu: add gem create fuzzing test
Date: Sun, 7 Apr 2024 11:22:26 +0800
Message-ID: <20240407032226.3732495-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SA1PR12MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 139dc67e-4245-4134-ff87-08dc56b201b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GmL3dYdQfU+J8W8Ys9wkg49gIGkqhEHJKkoDEHX0S6IpFHTrhYJPXFul31FYtaDIfEz3B3FzlssFg20x0rM2O0mHBuZ3ujyi3WCdF66PhbFRkwjRXnXMB6Jb0+Cmzt4z8TB1vMoQR/sQUG4fqxrkfVUvMbMuForMfBq2IM7MUsE3ds23tf9t1oTfNMsFc+NS9MfAAzDk2iGg/1DvUlpj7oR6uKFBg1ZROd92mfil0voTFkpQI/pW0Yq0FQfosFh5SG/42H7d4HUdZ+knwilU+pS8OF70GUzlqxep5fC5U74OHolMah/VV9Me2BFHki7GrIbhjSUTOc4jjUW7zdnYInbjNDpY6Si0+quBrv0wuBqFf3C/+XOMOLVr82O83KSJQV1rXRkEPvpPtfb124GuiaOf+JYaUCqOE9B9G6qk0XlpuD+8mtIBxpURvDFKEmaBh6OZcCrpqhuJqxva8t3oEs1wk0LEfQUw62HLMtl3AYeqg20Ct8lllKhbFv+MSs42c2fAupXOegdAQ5fFheJVVhQinKrQyqqstkDrGuxT//tNN281x0PsZFVbdZyT1R4TqlHPy1PngHwiPSKygjrN465qHZCOSzmXxKxy8t4kmknlMqhYP1s/xLRd7LSQGT6wqvSSHyfY6wZxfZWYlA7+aoE6k3EYRFMva3vz8BQNbVOClhRmGriPjG0tAdxPGJM0c64RJ4mfFCo9IWRPXqcLyg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2024 03:22:51.2524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 139dc67e-4245-4134-ff87-08dc56b201b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6727
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

The bug in amdgpu was found using customized Syzkaller and with Kazan enabled.
Report a slab-use-after-free bug in the AMDGPU DRM driver.
Ftrace enablement is mandatory precondition to reproduce the error once after boot.
The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.

The following scenario is a different reproduction of same issue:
BUG: KFENCE: use-after-free read in amdgpu_bo_move+0x1ce/0x710 [amdgpu] https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646

Fix Christian König ckoenig.leichtzumerken at gmail.com https://lists.freedesktop.org/archives/amd-gfx/2024-March/105680.html

The issue is visible only when Kazan enables and dumps to the kernel log:
BUG: KASAN: slab-use-after-free in amdgpu_bo_move+0x974/0xd90.

We accessed the freed memory during the ftrace enablement in a amdgpu_bo_move_notify.
The test amd_gem_create_fuzzing does amdgpu_bo_reserve 2 times.

v2: Fix the code style (Kamil)

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reported-by: Christian König <ckoenig.leichtzumerken@gmail.com>
Reported-by: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>
---
 tests/amdgpu/amd_fuzzing.c | 65 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index 69c9e8dad..b47b26cf0 100644
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
@@ -114,6 +175,10 @@ igt_main
 	igt_subtest("cs-wait-fuzzing")
 		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
 
+	igt_describe("Check gem create fuzzing");
+	igt_subtest("gem-create-fuzzing")
+		amd_gem_create_fuzzing(fd);
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.25.1

