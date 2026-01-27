Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63F9D2FEF5
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 22:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DAE10E210;
	Tue, 27 Jan 2026 22:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HPRoOkan";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010044.outbound.protection.outlook.com [52.101.85.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4D010E210
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 22:29:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/6gWROpoAVktuaVkdkQE1KVbIipNj3MYKDSbua48DP5YWiyVXDw5bxLptEJKMy2A/6g6XEvNX0V20ZEWlu2REGfV702KJ6XNmiK8sOQ5diA1xzbY8+4iPkOpW1+WeCaiyMXI2gr33A+roPFoqMNzjbRWFHTm8j6VdHQd6+FU4HylQQnPx/ZD9eHx0AEnY6/AjDeefI4NMMBDmSM50Mx4d1/ydCagRI2uiv6Y4s5M5hzF+Ew6hiXVGvCA9Y0ArLZ7xB3HlIg5TuKI/n7rE75zrU0rNnpnZGEiSk6w5WAEAdbZOYmLfPbzs9clUFN+SGw1tQM1vo/atI7I5tzJF2p0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yplE0540f0pbksYEXAyfgNRG9lhVC+MXhJv/ExlkTJU=;
 b=OoVoYf+LhloJS2z99Jro6G6Ud3bwLew55SeJ1MzHkH2TRN4LgAhBj1caCfJ2u+sDC/ZHJzKMI86AEMRFaqeiPat9PckgzTdKV2FejCI89tGY7JPB3z8it0IEWBZfB9YCpmwQAncqRNUcrBHdWyo5uuVhIx68mH9n/IrdRLNZzpsS4tm2NXsy2Niy5ReMHcD6GP97H6ON/dL/75feNQBeK0NZAmPBVlInbbGwqQV21V5ikkPcMiafPvq4HovglLTQBUBAIghrMAy9IbeY0I08Bx8MLgP/t9lvmMMKG+mowwOkVinh3qtG7ja8UKZqJh3/fEitNAQ/jfDWWrB3MC3vXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yplE0540f0pbksYEXAyfgNRG9lhVC+MXhJv/ExlkTJU=;
 b=HPRoOkanpTU2jUwvSzSFRJBo7DFEZDKpuJtoOqjgXinFDCpy8yQ6yhLATu1xauGQaPbNnzuuDKAJN5XbHIRkEl1RSpVIp85uF5CGVPSktk0fd0/llhhfmM8f8uDfuoJA/DvXGXhhFvnEu72tuV/SpkP7xycgUYrDVktBJMYcyMo=
Received: from BYAPR11CA0060.namprd11.prod.outlook.com (2603:10b6:a03:80::37)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 22:29:12 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::f8) by BYAPR11CA0060.outlook.office365.com
 (2603:10b6:a03:80::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 22:29:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 22:29:11 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 16:29:08 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <aurabindo.pillai@amd.com>, <Ethan.Cheung@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH] tests/amdgpu: Add a driver-unload memory leak test
Date: Tue, 27 Jan 2026 15:28:48 -0700
Message-ID: <20260127222848.940163-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b06c62-c446-4eb9-0814-08de5df37eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U/4H7A+xkxpoeFF+GJmDsOewHT9X0NmwqLHgOPpsaiOKEagk1hVgXSvhfzhL?=
 =?us-ascii?Q?5yyNlAXYSY7rb0FhozdZbu6FL7wiPhj7POELJN3BOpgSFzvEvGCWa+7/C83n?=
 =?us-ascii?Q?lo+vFlreGbSH7QhY7NTTnDeAu7yzSUPgltBLd3W3Ae0y5tVE4H5xiABI5Pew?=
 =?us-ascii?Q?aI2pNHcRyVrfJZkuZDYURgO0a7wdKr25XlRu/IbQyIdY+wIx6AIfXIhNbHm+?=
 =?us-ascii?Q?IZbnzk9x2tr/zjh8UiZPYSs9PMBvwkEVmDENVdYWBKkCmesBTXEw+5Xu2M8u?=
 =?us-ascii?Q?DIT5RQy8kW2MoJqkhxksCkMZBVh04B+8c2sGWXKo2rr1DhHymPlxBmEVlDU1?=
 =?us-ascii?Q?tXAjE5ONYONHSEr4bWS2FZZOg54pcp2mHIv9FzFHo6wSwYba2EV7XjIaxZmL?=
 =?us-ascii?Q?X2zCT+Htmfb4SpjxipRXHiUhwcWsQgkiEz/LAjuzfQIPMASWs4WsnkbD+THo?=
 =?us-ascii?Q?KRqS0rOvfTEJnNtqVAttTGSWFWI2GKlKwL9801eYMpgkQ616g/ud7wOzI7Ds?=
 =?us-ascii?Q?O3Y6Ab7EWfGvidWnhi0GidFIlo8CaZsYgMHdx+mEDArUwwiK0Xl+RqJB5KJC?=
 =?us-ascii?Q?VIDEJdCfQbyqFB4stJlufz3sRK5lNZDu2dcnzHUy5kMIMOG04ljj0UNdFcwn?=
 =?us-ascii?Q?0D5Op3MwyXApR6I7327YjNIQ6M+IynQkHE/2IiiYZ/mkDDUn6slCrqMfwAVy?=
 =?us-ascii?Q?9KN24322z1CokMCb6SiielwrQCPU0Bg/d0VXjplUPfqKoxa6pl3H4IKPGIIL?=
 =?us-ascii?Q?E4+fPk/i2FICW54OQpxJcMvfxa7OtfHoonVnvU/nnAIduOC0LKmMvowAdZAd?=
 =?us-ascii?Q?M1HiFp8fqoMy82yl0tncfK3OoBSF4tPBsiBbQ73FMw/iKtHdm7Un51LvP48J?=
 =?us-ascii?Q?ZSa0wbxqR3Xd89pnUI1HrzZn7l0ZuHd3E4YYwBpW4OskXEL8xd95I/ekl5AV?=
 =?us-ascii?Q?oRsqO8uVhtMgN/So5URwcLVZf1a953NABc3bOyJ7HSSNhtkpFWW6jXrTllsL?=
 =?us-ascii?Q?fiI8w4KROMefQQ8I2JXm9l2VETqhPXMLyvPFOPQeUN2dIl6/YlLkWFMzH9jw?=
 =?us-ascii?Q?rNBgbudlfe3Ao+rAaOpMVICUXvlwQlHV4Yv4Bw7rbwFU4+AnQuPvFTuivC5s?=
 =?us-ascii?Q?2Jc+gjIC5J6/CoaGIcy5PHrwCa9dWtLJghoil7CNjK5uSHF/vL2fNPEPeARl?=
 =?us-ascii?Q?ObCwFwH6l1emhLQZE63knhquCtfwaQeWTe6RvuD30OyUwLOSVkte9EqItvpw?=
 =?us-ascii?Q?LPP52OwUcUl71IT4SSTvhlERBjNFL5GIIPT3MwriLsCZxpw3rHTe0YcE8eCy?=
 =?us-ascii?Q?LEvQJ+CbikBfG7xAXxsS3Vr9Xlb3MjK/B1jSOe2V/tZONRBhyb0b7SCIMvjS?=
 =?us-ascii?Q?axrbgv7diEevr8iWF6ZvwjcrX5S/U65IUar5wcIetQCL+5G9VPys4H4HFfq+?=
 =?us-ascii?Q?/oINkDa16f/nPkV9FgTvYyhT8MZG+KMzar/2eWpHYE+G/IaNzKXH9qSm9Apy?=
 =?us-ascii?Q?x7bvY5m9HqXSiH21ZAVzEuOdU3/irYrejuUAuF8LMXQfwPRb4wnY5JAZIgm+?=
 =?us-ascii?Q?iz6abvniVxQ0k75Z6dPzVb34qwqBzRsmuXXyhag/9JnxLGZganGN8xukc0t/?=
 =?us-ascii?Q?4W5qN9iGlehIbWjbltd6JsVHCp6xokjueFRT3przOWzP8AYKLKSnf0HV/ZeE?=
 =?us-ascii?Q?XMH64w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:29:11.5616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b06c62-c446-4eb9-0814-08de5df37eae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

Add a driver-unload subtest that checks for memory leaks when
unloading amdgpu.

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_mem_leak.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index 2897e6d82..f741a39b6 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -22,6 +22,7 @@
 
 #include "igt.h"
 #include "igt_amd.h"
+#include "igt_kmod.h"
 #include <fcntl.h>
 #include "lib/amdgpu/amd_mem_leak.h"
 
@@ -128,6 +129,25 @@ static void test_hotplug(data_t *data)
 	test_fini(data);
 }
 
+static void test_driver_unload(data_t *data)
+{
+	bool unload_leak = false;
+
+	if (!clear_memleak(true))
+		igt_skip("kmemleak is not enabled for this kernel\n");
+
+	drm_close_driver(data->fd);
+
+	/* Scan memory leak for unloading amdgpu */
+	igt_assert_eq(igt_amdgpu_driver_unload(), 0);
+	unload_leak = !is_no_memleak();
+	igt_assert_eq(igt_amdgpu_driver_load(NULL), 0);
+
+	data->fd = drm_open_driver_master(DRIVER_AMDGPU);
+
+	igt_assert_f(!unload_leak, "memory leak detected during driver unload\n");
+}
+
 int igt_main()
 {
 	data_t data;
@@ -151,6 +171,8 @@ int igt_main()
 	igt_subtest("connector-suspend-resume") test_suspend_resume(&data);
 	igt_describe("Test memroy leaks after connector hotplug");
 	igt_subtest("connector-hotplug") test_hotplug(&data);
+	igt_describe("Test memory leaks with driver unload");
+	igt_subtest("driver-unload") test_driver_unload(&data);
 
 	igt_fixture()
 	{
-- 
2.43.0

