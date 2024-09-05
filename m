Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582A0CD4F5B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 08:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1583410E759;
	Thu,  5 Sep 2024 08:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ztfyVrNo";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18E810E759
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 08:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VssTXe9eqgWuXJpWHVERYUB27pa32P4ZnOQLDFVNi7vddKOWjrkybQm2uxSfMo93z3LG9RDkKjBl9aw1wZ8hoC3k0cMIGpOjP+ZuCqINdyxl5i1j2phN72NMCnPQtCkquClFZ0S6jBWtb2P/UCVSiKGxhbu9KHD969re8gdDH1nQB+t57pk2q2YvnD1Zhv6KSSS0NZLGFiSJ+vBPAYfmPpSD46zNe4NfWUtPwy2yr7Yg1M3NBD3BnxBq35xUlU3ZAfVpEBbRfdvvS+j62OvRK4rHII6lBFw3pO/SdXsbEIG9EL8N2Jh8xSRwRlFexl37HDEj04EsinF0Hr8/7A2T/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XpNPfmobtt/6hkdZP9frdeBlSDtJHQ4qNhcUAsYE2M=;
 b=D1Qm5kMuEhuNfPZm8dAN4NrDz6g2NepH9VEJ/ZFeGCtgIiDZOOT62HJ2GRvR6xKPHz7uhZObmYf8S7SwXKcDP48FD0TF/COXdnCsYvZvSP8I9xZIY3U4y+px0lxbSd/J3PczKd/RJF4HEEDGNK0H9PqDKE12nAuGUCl+kb7p/WGUn8Oe9xtxVrEdbO72BwSeIRc6G3XVvJ5qPBJRMcGveMKXUuqxSQ25kzqkU6HFsePYUX/Sm0grJ32bBJ4QFRoDbFHn2AGs2EpOtvs60TDgVPN3UJpfxtyvNhPEjWUmrpCtFYlrGapxHYPN83q5REoZq5LxKW5MzLlNer2q/MxrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XpNPfmobtt/6hkdZP9frdeBlSDtJHQ4qNhcUAsYE2M=;
 b=ztfyVrNo1mdZIbYxZwQUtgZEAU0dg3XEYMIfPy1wdi0lTHHLsv6ddG37iky1EXKCnMOtHOAKTZ95ZnpuMiDKFlm85eTGDuM/23uyqxVeDtmqSOZkJaCRP25nGEW3ws2IJ/vEKvRsslArXa5WxkJapTyYLkA9CWhDB0h07nd+59E=
Received: from SN7PR04CA0045.namprd04.prod.outlook.com (2603:10b6:806:120::20)
 by PH7PR12MB7164.namprd12.prod.outlook.com (2603:10b6:510:203::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 08:20:31 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::e7) by SN7PR04CA0045.outlook.office365.com
 (2603:10b6:806:120::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Thu, 5 Sep 2024 08:20:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 5 Sep 2024 08:20:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep
 2024 03:20:29 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 5 Sep 2024 03:20:28 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: fix concurrent queue test issue
Date: Thu, 5 Sep 2024 16:20:27 +0800
Message-ID: <20240905082027.1052054-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 486ff13f-4688-4cdc-f9b5-08dccd839b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ua4M2ElgtA9XmNSF0xHLF4zsIGQ078lIhS15i1IZ6ejS2aP1yEJmp4RxeAIs?=
 =?us-ascii?Q?vB7CHE0Pzwyqs7ZqWv5T6g8c4wOqV8G4RJw240kWPIbiMW57zJkCineQB6vr?=
 =?us-ascii?Q?sZ7FR3ImI6VXIAkW5fEz/ETkh+7lbd8gnjgEim7ICob8C4gL4oefAE78Ak2Q?=
 =?us-ascii?Q?t4YHzK+fGeQQSkDc4bLxQVTkVYpTroaeiuKqgLGooZZzmweATp6peQiAaVps?=
 =?us-ascii?Q?oOEn4/ZOI86p31SmZRGzvsBv1+9WFoqW+B8DhNILyD8U7MBECgxXfuUkmS6y?=
 =?us-ascii?Q?85L6uLFCtFT9r7SYaA2yFY5nEpZ3iHCl0FdAWct0ke//VkS8wlbTSm98ttO1?=
 =?us-ascii?Q?nSmks/xbXwd6AFbpsoqzmKxXPD5amRT7U/WVbfpRsy4b1QDpttnhi4yg2Ng6?=
 =?us-ascii?Q?19204iWTgBoJsMQcmRM9L95xVgfipA4p+9JBKqZ4neUjfifb1CJglJaB6y89?=
 =?us-ascii?Q?CRTdjE0O3hNZ57bvwnA7UrVMjobKXB5iALYov20TyYiItz/KmIwyTCj1tE2d?=
 =?us-ascii?Q?WXs1CNEIfuW7aMRBtm08Yzc0YT13GYE+QfGU+O6dADI1rNqOwP2+lMcTbh4w?=
 =?us-ascii?Q?JfIVYP2AOSgWmQQobtmK8C3nutJhE76IF34ctIKYdajKq2HitmhV3R6243fc?=
 =?us-ascii?Q?MYTGLP3DQDy4tyz0I+Byy79zTyqECVQoYHa4/1/b8lFLmAiqfsVFCrTPaRfJ?=
 =?us-ascii?Q?Ha0W923GbtX/1VhVY0dXu1X022dyqNyZJr9oAp9nIYIE/z6dPHIC3jXgbvES?=
 =?us-ascii?Q?Yl4u+CIjvQikEk/1zrYwcOhI1UflUno2honcVQoUawfiUtXIOcQpBD8/B25a?=
 =?us-ascii?Q?i2GgVOFJ8jknnTs/MqnvtYm8ZOXjkjRJtAI4MsW/AAADQKd/jJg7Dl6VJa+w?=
 =?us-ascii?Q?iuxRKWFfMsqw0Bafopy0kmEVIOkZu7fdVrZb3Nv876Kgt04bgsdVjo294nvt?=
 =?us-ascii?Q?QiSw/fIXj5aQDT9NQowgir6R9ySfS9yuZ/os1kHxe5p190Klyyl1MwCM67Da?=
 =?us-ascii?Q?7+NkF7hTE8JTR2MOhDHN3zA04aXnr1FH14v73necfY1Zfs6J0VYERDzvY8Tg?=
 =?us-ascii?Q?AwbKb+I4JJJbYUl924S79Ok330B5SAZ60gp0Z28md2jCl37A7XaePECg16UT?=
 =?us-ascii?Q?Qi/qLr7slfoMZz0ikp0fj9sjCv1X5Yh2/KYVXB3e3OFcZ0ttF+Gs0PJc+v/o?=
 =?us-ascii?Q?qUE2NrRiz3SN/Ys05qNtFBrgbOovyir2cM3trQuwJ1PkHsSf67RkWF9hkXll?=
 =?us-ascii?Q?a4bDIte4rrL7xy5Q2j8jZl04KyFrZ/5wVcbktEnjYezZDzfkzCSaLPFPJ8fg?=
 =?us-ascii?Q?O2IghinrtPfnFsnssNH9UsxczrGCLvUgffi4H6vCnzM+G94Kawrer08zkf5n?=
 =?us-ascii?Q?NVziF7pfjD1HWu/29wKzpvKJVWIYbDG+kjKyjz+YH8dnEbZTVDi3QPQ0u7J4?=
 =?us-ascii?Q?QrHh0pZ7I7fV+orhRjhgwcX8gejWXYZf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 08:20:30.6877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486ff13f-4688-4cdc-f9b5-08dccd839b2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7164
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

When running with parameter --device on multiple cards simultaneously.
All queue test processes will share "/queue_reset_shm",which will create conflicts.
such as:
sudo ./tests/amdgpu/amd_queue_reset --device drm:/dev/dri/card0
sudo ./tests/amdgpu/amd_queue_reset --device drm:/dev/dri/card1

To solve this problem. It should open a unique shared memory for different devices.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 44 +++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index b257ec3c0..4b26b86dc 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -32,7 +32,6 @@
 
 #define SHARED_CHILD_DESCRIPTOR 3
 
-#define SHARED_MEM_NAME  "/queue_reset_shm"
 #define TEST_TIMEOUT 100 //100 seconds
 
 enum  process_type {
@@ -349,7 +348,7 @@ static void set_next_test_to_skip(struct shmbuf *sh_mem)
 }
 
 static int
-shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
+shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap, char shm_name[256])
 {
 	int ret = 0;
 
@@ -363,20 +362,20 @@ shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
 	if (shm_fd > 0)
 		close(shm_fd);
 
-	shm_unlink(SHARED_MEM_NAME);
+	shm_unlink(shm_name);
 
 	return ret;
 }
 
 static int
-shared_mem_create(struct shmbuf **ppbuf)
+shared_mem_create(struct shmbuf **ppbuf, char shm_name[256])
 {
 	int shm_fd = -1;
 	struct shmbuf *shmp = NULL;
 	bool unmap = false;
 
 	// Create a shared memory object
-	shm_fd = shm_open(SHARED_MEM_NAME, O_CREAT | O_RDWR, 0666);
+	shm_fd = shm_open(shm_name, O_CREAT | O_RDWR, 0666);
 	if (shm_fd == -1)
 		goto error;
 
@@ -414,7 +413,7 @@ shared_mem_create(struct shmbuf **ppbuf)
 	return shm_fd;
 
 error:
-	shared_mem_destroy(shmp,  shm_fd,  unmap);
+	shared_mem_destroy(shmp,  shm_fd,  unmap, shm_name);
 	return shm_fd;
 }
 
@@ -877,6 +876,29 @@ is_run_subtest_parameter_found(int argc, char **argv)
 	return ret;
 }
 
+#define ONDEVICE	"--device"
+static int
+is_run_device_parameter_found(int argc, char **argv)
+{
+	int i;
+	int res = 0;
+	char *p = NULL;
+
+	for (i = 1; i < argc; i++) {
+		if (strcmp(ONDEVICE, argv[i]) == 0) {
+			/* Get the sum for a specific device as a unique identifier */
+			p = argv[i+1];
+			while(*p){
+			  res += *p;
+			  p++;
+			}
+			break;
+		}
+	}
+
+	return res;
+}
+
 
 static bool
 add_background_parameter(int *pargc, char **argv)
@@ -1057,6 +1079,7 @@ igt_main
 	struct shmbuf *sh_mem = NULL;
 
 	int r;
+	char shm_name[256] = {0};
 	bool arr_cap[AMD_IP_MAX] = {0};
 	unsigned int ring_id_good;
 	unsigned int ring_id_bad;
@@ -1116,8 +1139,11 @@ igt_main
 			const_num_of_tests = 1;
 		else
 			const_num_of_tests =  get_num_of_tests(&arr_err[0], &ip_tests[0], ARRAY_SIZE(ip_tests));
-		fd = drm_open_driver(DRIVER_AMDGPU);
 
+		r = is_run_device_parameter_found(argc, argv);
+		snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r);
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
 		igt_require(err == 0);
 
@@ -1137,7 +1163,7 @@ igt_main
 
 		if (!is_background_parameter_found(argc, argv)) {
 			add_background_parameter(&argc, argv);
-			fd_shm = shared_mem_create(&sh_mem);
+			fd_shm = shared_mem_create(&sh_mem, shm_name);
 			igt_require(fd_shm != -1);
 			launch_background_process(argc, argv, path, &pid_background, fd_shm);
 			process = PROCESS_TEST;
@@ -1190,7 +1216,7 @@ igt_main
 		free_contexts(device, arr_context_handle, const_num_of_tests);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-		shared_mem_destroy(sh_mem, fd_shm, true);
+		shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
 		posix_spawn_file_actions_destroy(&action);
 
 		free_command_line(argc, argv, path);
-- 
2.25.1

