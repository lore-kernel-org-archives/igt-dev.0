Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB26CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 06:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6A510EC4F;
	Tue,  2 Jun 2026 06:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yt+E5gT7";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD99110EC4F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 06:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgdbqL0I02xccia+YeKNRckAm69rZ21Ku8QppB+FX9KhBG6beoPCXSWQHf1er8EvHHGrILAUTQeWK6Bv/YNhMTwwEzLso1a4oQ5mEiGgMHzfwVGC7MWkgHJsru7kQ0TvnYSDyBACGe3JLVeqPCgF4dxXD4c2otvJ24PdWbKQPqCsHuvxCL2AE6a/DVx6b0ngmCT9GTA/Ct27JZWU6GXwMf+8CMmSqcD2H3W4X1b+Q+CihUF8QvCX7YOq/3pi+uisv4m5AK6qrdbEZfnuU7D2akr3mpzsyI6qxBExdinvYRS7zKeK8X7UuyXNVnHZSXYyg4MbAS6yJ4z3+xY/i2PURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNxF+drQWq6PL+YLtLHq4bFuQWc0QGBL9aIfeyDgffc=;
 b=xoLvWfGiiCFVN8slyN9fhepKtdzqA439PU+uABxNaxTjqPj1jHcBqO/honeqaf3MMnbvp24Z5YfvgdH4l8lEyJ0wpypthYcbWXwXmR1xO6DwgHkH+ZcNsnXxN8ebDSvaMocIeUyrg5muuIzPfBEjMMUVJeSveurtLMKGOTdVN51pS2t8PWMARM0X0aA9KmtBU+EvNYQysw+AnfvI5UyXoUxY666XRQ0n85zOy2ZzUxsYrUMH3oxuy5NCUoH55hGlZHiV5p7BBbEebKv/OFAF08fw7zyi6Y7t7PJYeD9j35dnPFVBEPZUQ3zNzqsRUZPMsE+h5ENgUiW1uouDkIWsQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNxF+drQWq6PL+YLtLHq4bFuQWc0QGBL9aIfeyDgffc=;
 b=yt+E5gT7VUl2IHGTRyuRGWO79VyX/ud0PUMnb4o8dJNX1YAU77kABL79XsZPDe2Vj5Lhi30x4YlErTEcuScz3ANJWJayBSslLAUYQLYVt+6mTn2KNa8RdQwoMBKJqzd6uZIk1udSTl2Pp0pAh+nh7JUeCF2mEGLSq4v3JGGjCQU=
Received: from BL1PR13CA0417.namprd13.prod.outlook.com (2603:10b6:208:2c2::32)
 by LV5PR12MB9801.namprd12.prod.outlook.com (2603:10b6:408:2fc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 06:45:55 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c2:cafe::46) by BL1PR13CA0417.outlook.office365.com
 (2603:10b6:208:2c2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Tue, 2
 Jun 2026 06:45:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 06:45:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 01:45:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 01:45:54 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 2 Jun 2026 01:45:52 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t 2/2] tests/kms_cursor_legacy: disable AMD Panel Replay
 during test
Date: Tue, 2 Jun 2026 14:41:22 +0800
Message-ID: <20260602064543.58586-3-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602064543.58586-1-ray.wu@amd.com>
References: <20260602064543.58586-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|LV5PR12MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: 697a49b1-f3b2-4a00-d1f5-08dec0729868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XP6eQe3Ym9YMC1jOEj2xnWXy7UxqyyDzplEDDQA8k/z1m/3aEioXtFQ12w/Ubs4+L3O+jslGfmxqtnF3dRk5Hy1OS6iSm/GS0dIkt2wscgUR0J+uczi08dSsUQFevYQJAooMoU+D0pmUYEDNB12OA4kTvtUuIZsvA0+xHL4Q32A0jyKkaXRgUX6OEtaipo3SxnS39xIXkzF2f3yB0vxf5bmkWFwfWPw6MY/iyMKc5lPBK/Sz5y5q6deyolrVxdpYdhhIxKexT3eoZavebZiRqnAzAe2Dc9nlYopzhDPl1+CnymFpk8bEf+8++DQ7RE/RI8J1eMas4TjbQ04qO7fqOnOSbVdxr7aJVa7uiK+L2hptOsPRyFZkZbtHgOiMO46O8lscNim6nbRV2KgO/5JJPQJ8QWCXjbtgROyGDvbsG4u8NweQuZbACUPg2L0wUdVZHtXErGYJn2q2NsrNkuwO2aorYmkNG+Fj/wdIxscW7CxUKkfhfG5vJjHBttELIm9+NOVluVKC9lraGHFLnT9Y5ggNufrm0NkrRhey+BhGGZ+dTyZbVqS6mz6jP2bPaQ5VJIhMsxiGnE+SV5uzkrYAbtnChOsVJRk5nU52kT/ZMQhinmXwU4djNz+66DiRH5MltnwpMxHQJo+l9MW2pBv8XjehJo297aoothZUH8wOljFR7k0uYUtSmHNIdJBLHxOlpZ58HWkvLtJDaJoxya2raY3/q/FFE3M25Y91bBf5gUQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0AdYZG2a6o1y5uSnbv7En487k3gZqqv/fTOe3Ow2b9OCRaJdcoJikaBSjZSJzO+2dJSqZqlqOxaXIIgVj5NTD4dyf2AmvzJe9Z5BnUdIaQPZRNLWgHCApyvBlcwKdZ1frZx3EHNjMz/QP/Zk+csV5QdgOvsnMY8gzTs+iW9NV86iHINUCYeGrh6c5hMZ7tmMDMzm1Uhd/SINI6u4vTi3f/vJCQ1aLcvLCNO5Iqw8t90tNVcaizruF5tPJYgpNJX/JvGU9jQdPz0U1ppbDsM/0l2Uy9x+IcblDhG//zlRsA/H7+/NPwUN8O9TgCV8eSpLt/Z/k4hencE21m74szywuiccv+a2wfFnMnOkEjY26ZFoLKTcZbYgwmqrA6LVISXw7JFUGlKiLq0dJY6m+xWqC7IUhYY7ETTICd7iaEMMInrq43R8Zv9ho8/Pmc8BvfXr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:45:54.8559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 697a49b1-f3b2-4a00-d1f5-08dec0729868
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9801
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

[Why]
On AMD, cursor updates can occasionally be delayed when Panel
Replay is active, causing intermittent timeouts in the cursor
legacy subtests.

[How]
Call igt_amd_disallow_replay_on_all_edp() in the setup fixture to
disable Panel Replay entry on any eDP that currently has it
enabled, and restore it in the teardown fixture.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/kms_cursor_legacy.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 4d597af79..62339855e 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -35,6 +35,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_amd.h"
 #include "igt_psr.h"
 #include "igt_rand.h"
 #include "igt_stats.h"
@@ -1875,6 +1876,7 @@ int igt_main()
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	igt_display_t display = { .drm_fd = -1 };
 	bool intel_psr2_restore = false;
+	bool amd_replay_restore = false;
 	int i;
 	const char *modes[flip_test_last+1] = {
 		"legacy",
@@ -1898,6 +1900,14 @@ int igt_main()
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
+		/*
+		 * On AMD, when Panel Replay is enabled the HW cannot guarantee
+		 * that all required cursor updates land within a single vblank,
+		 * so disable Panel Replay (if any eDP output has it on) for the
+		 * duration of this test and restore it on teardown.
+		 */
+		amd_replay_restore = igt_amd_disallow_replay_on_all_edp(display.drm_fd, &display, true);
+
 		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
@@ -2128,6 +2138,8 @@ int igt_main()
 	}
 
 	igt_fixture() {
+		if (amd_replay_restore)
+			igt_amd_disallow_replay_on_all_edp(display.drm_fd, &display, false);
 		if (intel_psr2_restore)
 			i915_psr2_sel_fetch_restore(display.drm_fd, NULL);
 		igt_display_fini(&display);
-- 
2.43.0

