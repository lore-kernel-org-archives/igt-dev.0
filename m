Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF05CE7AA5
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 02:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7138110E165;
	Fri,  6 Sep 2024 02:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="elBU3uCL";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D12610E165
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 02:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlrDctM5LE6Y8pYhDamvu031TISlK1LsIbU9AFeIU24sSbyoj4TgwT33xW5Ovzi5ZWaBX9EPGbcSqudYMM4TcfKujbRIkGSrJM+RbyUwV5ESuKhlLdY3F87LI+MSFaVOU7GJlOuU9w568rx/mRkCmV9HFMCvsOL67b3n05u9wUpPPgPQOAQT6RHGoeuVR7luZKpp6yOBHbrwbY78Z21z/svby2O3HSGMOYgSx0YRdIBvHIvgMD62WYtNC9R+g/JIFhYCsa4Lc2bgqxWrA/ITesgYzZKrOEFSHYR0578owfv7ffweV4xk/IzvSbVuPGfYy9Mii6rrlQc+IEcx8POZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E64z0Ww8tlN9l1TcxVK/e47RFoZUFxGsXkm/NcnGF4I=;
 b=SaKa4Z0+p9/Rh3QAP2Nz2nC5WCJxCb5WO4RpB02m5rSvTG5VZR/XMP8yT8xKF9CO7pyeETHyCgAcPHG20S09TdRvWeCbkRBV6AnpAsd+5G72zTh1d7olSDtm4yG1SIVVf2/AE3xkb164UZKiyJ5UtVoFoG+YmRvy85T2GOJJEWtrjX4c2msR285geHSNrdj8corth+/6MDzIps4XLqoYpUx1Y91hj3fUH5hkTxogLKanoZU/oujOwK1GHoHJ6/1F5zHWJ4GTP1mcf1R2a87wbsMs0fTIMx4Gai2OndpaAz/AiYu/X0EsrNuZUNnkNHMgQsBeyzm73WRyJgLJc/Uvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E64z0Ww8tlN9l1TcxVK/e47RFoZUFxGsXkm/NcnGF4I=;
 b=elBU3uCLxGIa49YorNs8jq6xfCMM+EikwJIacoDbg6thVbL9FgY5L3pmPsCCMvV/+72XAv0sXTh1fHgpPuVHGQlpf47GoH9BGXWKpV8bi/3JDr/k7RyVbIQBE+SRVDguAXgyLznKx09o/SZC0FrOpr/8lAkkRT5CSqFLYguNEgs=
Received: from CH2PR07CA0040.namprd07.prod.outlook.com (2603:10b6:610:5b::14)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 02:13:38 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:5b:cafe::f4) by CH2PR07CA0040.outlook.office365.com
 (2603:10b6:610:5b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Fri, 6 Sep 2024 02:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7962.2 via Frontend Transport; Fri, 6 Sep 2024 02:13:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep
 2024 21:13:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep
 2024 21:13:36 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 5 Sep 2024 21:13:35 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: fix concurrent queue test issue
Date: Fri, 6 Sep 2024 10:13:34 +0800
Message-ID: <20240906021334.1085959-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: f4325930-62a5-43e2-fb88-08dcce1984d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HIcKcNT/exC6gFVWom2C1mN0JppFpxWyeTPeIDs96DGT5JoOPd62yDtq3dyI?=
 =?us-ascii?Q?xDUskVzaqZixFqEzX2W3U4ls+O6OjcfFobL6iOYYmwfBTrqcegZT04zPaZwR?=
 =?us-ascii?Q?S1nAadugawvH4poLaVFC83hMyNr4SxoBivwA4qQ3kYOzO/kz305kfgzUaTaS?=
 =?us-ascii?Q?F5u8tF8y0rdax681PEGXh3AZWjmay1ZF3b4NE9gYIULUe6QOVgb6RwvK1Fs2?=
 =?us-ascii?Q?2Yhxu8AqRrs4VoJgLAQ2wqnqV/eWgLlnVh2qCEJa+Z5AXcoh+CXur5PVFquZ?=
 =?us-ascii?Q?JY1FmEAobFJ9unUD63clJdtb0GJGsGHJt7iOUOXh3eZkUgdfQZQ0IFIk5S6s?=
 =?us-ascii?Q?xD0tBpxb+/GEk/vH6vbiA9+Y/7FnCJTNbwIOeR0e8Z9z8qgEu3UdYlhnnkRd?=
 =?us-ascii?Q?P68tGWjrbrSxDgZZDM10q0DOsVvllZRRisvqfo2r9kECDFBoTBtsU9doYUMY?=
 =?us-ascii?Q?TFLQqY/ZOCBk6HtVks5tJMdDkjTvTeEckRjkNo9h53fGpivsBotoodfXuCen?=
 =?us-ascii?Q?8UhRr2MNNmGMPmfjf/kMcwFUAWCYqc7eqrKiAQsixfzc+ZOuOt+cwcrLz1ds?=
 =?us-ascii?Q?LCvDvUTn7AOESAg5GxSZCY8+LJIss1sDnSd8a/rDLzVRMd+x3R3MgB7BIYbR?=
 =?us-ascii?Q?CeYm8CUwEBkFPlWgofcuE5xLnLFD2I5Rv/HM75ZJ+9DU/UJ/19VD/SCof/wE?=
 =?us-ascii?Q?5gTk2J/pkeRa6km0/u/LSYOSG/q/uAduiERd4A9rzoTF3WQDBXjAzKzfVUki?=
 =?us-ascii?Q?wc0VG3RkoX1kcQDALK0188St+lWn+L01CXsESivwHplX2j8jJaDkc7Qgxe5d?=
 =?us-ascii?Q?fSnj6Or9xQWMdSxc76I3JBilumiDMYrAAyUO36L443vaM464hMbJEW1/AJ6e?=
 =?us-ascii?Q?KY16t8sKgJ9Ls+ilqc0UKp8GJXwmJCl2HqFATKk7emauUjyrDUdhrCKIidpK?=
 =?us-ascii?Q?MgVU3xTeq5vQhzaC2h8AFP6D0MadnYRQ+F5Nkq5fOTmAINftGMBFE7TgpN+3?=
 =?us-ascii?Q?iWdPqEaD0Q3JPaDp/oU4HDuuZJtUsXSut2fEpDDeIXrRMq0rVXWGGlmH9O93?=
 =?us-ascii?Q?4DxDvYpbUOKAz0XkuHQjvlGOefse2qcJ1U5Z3ee+efhUaV+6cTraXtw0X3Wb?=
 =?us-ascii?Q?rTmMdjDtmawRVOCcCuXePN+h+V3DS1Dck5FF1r3MCaldvKn5Pu4duTupqWoP?=
 =?us-ascii?Q?HSBuckwzOXYD/mu7Sjti+fgKwGWlCp+wXIwsHfdMN386pIzFEUObHTqfPZLP?=
 =?us-ascii?Q?5JwMWfMKlrp89WUYIPNEW7mWstd5UFPGDM8hfcQy9ApNPeocoahDeHjc419O?=
 =?us-ascii?Q?rts5MMEILCKBsW/qgViTRcO1WehEq5TSQTlV0VKyQeTG/TYNLDbJ8s+/MYqM?=
 =?us-ascii?Q?H+zZPswMGgz2aObaSTfx4I9t8QLR2Jrntr3QyqhdncpG2E6Yga0ADZdjVcUg?=
 =?us-ascii?Q?wNhqAw/pVlVfwjmohJGrhyrn/9DoUmdS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 02:13:37.7106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4325930-62a5-43e2-fb88-08dcce1984d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349
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
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 42 +++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 537f653f9..8f5c7d4b8 100644
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
@@ -1041,6 +1063,7 @@ igt_main
 	struct shmbuf *sh_mem = NULL;
 
 	int r;
+	char shm_name[256] = {0};
 	bool arr_cap[AMD_IP_MAX] = {0};
 	unsigned int ring_id_good;
 	unsigned int ring_id_bad;
@@ -1100,6 +1123,9 @@ igt_main
 		else
 			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
 
+		r = is_run_device_parameter_found(argc, argv);
+		snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r);
+
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -1121,7 +1147,7 @@ igt_main
 
 		if (!is_background_parameter_found(argc, argv)) {
 			add_background_parameter(&argc, argv);
-			fd_shm = shared_mem_create(&sh_mem);
+			fd_shm = shared_mem_create(&sh_mem, shm_name);
 			igt_require(fd_shm != -1);
 			launch_background_process(argc, argv, path, &pid_background, fd_shm);
 			process = PROCESS_TEST;
@@ -1169,7 +1195,7 @@ igt_main
 		free_contexts(device, arr_context_handle, const_num_of_tests);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-		shared_mem_destroy(sh_mem, fd_shm, true);
+		shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
 		posix_spawn_file_actions_destroy(&action);
 
 		free_command_line(argc, argv, path);
-- 
2.25.1

