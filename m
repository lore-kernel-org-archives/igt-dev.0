Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0568FC49EA1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 01:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE4210E0DB;
	Wed,  7 Aug 2024 01:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FoLhx8ts";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C928310E13A
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 01:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1O4xEhwFsy72MZ5oAuzJJ8eFsjzkGU3wbNbbz57+qBDU3Zak5pm7u0FW+pd3h42I3UUG4bgSAW83nQ5xosoq+5QUzTEv8NsDBmGZYZkh5f86EWxKwNRfX9H+Cjs5JNpHYLHhSuf2EGlcTZU8+9rHW5/IsZ9i6hOWHtIoIDPI/ezrGMBFZG+5CkW3/RjIHXIS7kCfZqrrmUfcwDzqjtaW0fxeFLhAZCY8OObofILDujqgIRxvso7VYyOtdyyDxObGYdJQ5aCupqkPbbGEOPyWYKAp5YS72v5AsXZAVVdxlcpt1ro8GvH8D47TYFLgKioqsZkBAHM81tSfOgdha0Erg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYtFZKnFE7iSyt0nDbdnX7TKwsSICPVJHik43mRfsTo=;
 b=ofJBSBRFGWnbOhpvtyRqKmiKhiw6L/qE5Co8SLDx7E0jqX+MiELQUV3razd5tPfy7TQPtCEk6eJRJcAnAk4rrqRoPSyDVzVXqraRTZ2kIIhZsTi5rQKAjCrQ2mqFJ4xMua7k4N0B+WHwXFtzXhugF7uWiiIcS9tW6DEtmwzH1lseJd2vZpz+Xjz+Wis+6IBJHJGzf9gT2QvYn4ITF5/+U8Qp7lZf+k79t6+I3G5Q7k2PvoXZFqK6urGxaFIPr06cHqROmfhYd8NeLEVHTbwxC1aT8QyyVVIlcH0IBVNOrZl0pE6MFOosEzNg5lGTXVX/WDgtA5IqAvnJrQ/alrxB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYtFZKnFE7iSyt0nDbdnX7TKwsSICPVJHik43mRfsTo=;
 b=FoLhx8tsHoGS0hc4ATsy5PharULShi2n45JphG0/rs7hi/XcpUF9w3YNfnc+nqqFnGNxRvgoDAWr2NyBYfr+HkgE5srCAUZMZ4pz3eOg/7FPqCLsK1hGeQ+yME5+i6UP2BHZp9ZXex04z40BET4QWQe5DcYLm1Nikmd+cmW/liU=
Received: from CH0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:b0::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 01:59:44 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:610:b0:cafe::e6) by CH0PR03CA0026.outlook.office365.com
 (2603:10b6:610:b0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Wed, 7 Aug 2024 01:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 01:59:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 20:59:43 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 20:59:42 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH] amdgpu/queue_reset_test: fix list-subtests command failure
 from script
Date: Tue, 6 Aug 2024 21:59:29 -0400
Message-ID: <20240807015929.426551-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd89afc-8f41-4f44-586e-08dcb6849b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?huJUa5JfbNOIBDB7mnUPqoknYvYJc3k4mV36Eg/o3LZHld/qC8iibGaDL/wr?=
 =?us-ascii?Q?SaHB59UXcNLpnudwdV98gzSx9Cb/ZhVGlikK+tlg26SvR/BDpmua3LsVe/co?=
 =?us-ascii?Q?rlewJbA66G1c7b0H6tv8uzqamBFZnl39UxJTITceIjsJGeFZ14aLfds4UsfG?=
 =?us-ascii?Q?Kj2KRjq+wFeSdVM4NhvxAlFLawmSGIhS+s74tBOJqmuihijVR0lLJ2VPlD7d?=
 =?us-ascii?Q?B9OWWejN6F8gAiDgCy6FgM9GEUIOX1TSh/mjOfVs0bpzSwvE3Ua96gyP5LOP?=
 =?us-ascii?Q?6Sx/iL/j7a3VfbngepaPtLO2xtVu+RMl3ojC6mKtZ62qaoja8rIS56RgZDZ0?=
 =?us-ascii?Q?2LL7R6iYjRdPh9YeEsqYguA8LyudxGeMRAQ7BFznMFq8hklvQ0WOQ48t663Y?=
 =?us-ascii?Q?cs7Zdr0mzpUlImkW9uCXkcy0Itz3iZlC6jmzORnGuPoeTAAWcu9HY8TSfR3D?=
 =?us-ascii?Q?WGG4DawviPT67FPhgmgggBZQIqQ324usEijVTV4FJZeUAwDZllfJn52ZGunW?=
 =?us-ascii?Q?mJlFUJtQVkik+Ggrs9bsKCUSzg1Rmg4oIjUbDASZQNGjNRycRCnUU1kiided?=
 =?us-ascii?Q?k1R/vqSwxFripf709qRcy7ts9QgTermg1wKXKgdr4FmdK2D0F/NeQuVcfEjg?=
 =?us-ascii?Q?3SqTm83wP5Nq0cA/8/qfwcM2g2m6QEDvWYYZX1lIJB2YfcFVnIAKN2eKwR6W?=
 =?us-ascii?Q?2m12IhAJAmxnLLOEYibVScLsE1eYeWy8G08fGzTrMlvedu8WgQelmKlIDsRN?=
 =?us-ascii?Q?tkclS5BNxHkFx7WU9+GAM6GDc59NJcywi/ypAw0rSfz7eo3Sw00GcfI0JeL6?=
 =?us-ascii?Q?ayfz+KwVAqxcVazwlVx1kxTBbWLaMaAlQDhN4Yqz1RDIqfF35K2tCArQRQ34?=
 =?us-ascii?Q?MNbx9cBT/cerdrrMAv+vBCgs8JOufAgYE2uq+7zX8LSo7BWB1FA8ZRODHEg1?=
 =?us-ascii?Q?l6AsC2Mu5Bd4l+xQtMsnIf/JosnVJ/YnB9WaSdt1TKQDHCEo5Wu86leTSwNw?=
 =?us-ascii?Q?Eh7VBf33tdhYpF0jo6Sr0+7DhF8WB8gMM5czbjfT5esUuZKv/RvbMyjulUDm?=
 =?us-ascii?Q?JMWw6abYP2J1dZol5QjIf0otGjYS8Uuwi31Ox5c2wz8EZZ/EtdVZUbC0IiHO?=
 =?us-ascii?Q?uUvVfep/KtS3wrury/lApOiwIoOtpqcHw1W9lr6fUGcQEmfqV5oacIL7jb6Z?=
 =?us-ascii?Q?Zwf/Xc/FCKoYRnpulxwwpQs/JZJShR82+XLSFRkPGhNkB4Ub5o7DRL11tYRS?=
 =?us-ascii?Q?EcQW0bbi9LKYVe6pdonlJnXdsueoiGfrktnKasPMcFfuJ0PDqAdJrV0oP0e6?=
 =?us-ascii?Q?/vc+WIzfsb57XEV2BX8yM5nQR+f8BTisr6vKa/ANmLiiu2+wQsotgkPmmp9W?=
 =?us-ascii?Q?e5sbmpLUx/jkkiL1TAHMxEryxarUI2K4hI52ouvgYOOwT0brD3zubppjzWW0?=
 =?us-ascii?Q?lK4Mes22DOhBVPdajdjq7cZnJNeNDurs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 01:59:43.9754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd89afc-8f41-4f44-586e-08dcb6849b84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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

If run command: ninja -C build test then the following is occured:
the process amd_queue_reset is terminated with error code 134 (assert),
i found this editing script in igt-command_line.sh
The following is the result of execution:

393/427 testcase check amdgpu/amd_queue_reset                   FAIL             0.23s   exit status 1
>>> UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 MALLOC_PERTURB_=255
ASAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1
/home/vprosyak/src/igt-gpu-tools/tests/igt_command_line.sh amdgpu/amd_queue_reset

stdout:
tests/amdgpu/amd_queue_reset:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does not exit with 0 or 79 with --list-subtests!
    test does exits with 134
FAIL: tests/amdgpu/amd_queue_reset
stderr:
skipping is allowed only in fixtures, subtests or igt_simple_main
please refer to lib/igt_core documentation
amd_queue_reset: ../lib/igt_core.c:441: internal_assert: Assertion `0' failed.
Received signal SIGABRT.
Stack trace:
Aborted (core dumped).

To fix the issue move the shared memory creation into igt_fixture block.

v2: Fix formatting errors.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 63 ++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 04366c0bf..9ea0a1f24 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -754,6 +754,7 @@ is_background_parameter_found(int argc, char **argv)
 }
 
 #define RUNSUBTEST	"--run-subtest"
+
 static bool
 is_run_subtest_parameter_found(int argc, char **argv)
 {
@@ -769,6 +770,7 @@ is_run_subtest_parameter_found(int argc, char **argv)
 	return ret;
 }
 
+
 static bool
 add_background_parameter(int *pargc, char **argv)
 {
@@ -801,9 +803,9 @@ launch_background_process(int argc, char **argv, char *path, pid_t *ppid, int sh
 	int status;
 	posix_spawn_file_actions_t action;
 
-	for(int i = 0; i < argc; i++) {
+	for (int i = 0; i < argc; i++) {
 		/* The background process only runs when a queue reset is actually triggered. */
-		if(strstr(argv[i], "list-subtests") != NULL)
+		if (strstr(argv[i], "list-subtests") != NULL)
 			return 0;
 	}
 	posix_spawn_file_actions_init(&action);
@@ -907,30 +909,30 @@ igt_main
 
 	int const_num_of_tests;
 
-	posix_spawn_file_actions_init(&action);
-
-	if (!get_command_line(cmdline, &argc, &argv, &path))
-		igt_fail(IGT_EXIT_FAILURE);
-
-	if (is_run_subtest_parameter_found(argc, argv))
-		const_num_of_tests = 1;
-	else
-		const_num_of_tests = ARRAY_SIZE(arr_err);
-
-	if (!is_background_parameter_found(argc, argv)) {
-		add_background_parameter(&argc, argv);
-		fd_shm = shared_mem_create(&sh_mem);
-		igt_require(fd_shm != -1);
-		launch_background_process(argc, argv, path, &pid_background, fd_shm);
-		process = PROCESS_TEST;
-	} else {
-		process = PROCESS_BACKGROUND;
-	}
-
 	igt_fixture {
 		uint32_t major, minor;
 		int err;
 
+		posix_spawn_file_actions_init(&action);
+
+		if (!get_command_line(cmdline, &argc, &argv, &path))
+			igt_fail(IGT_EXIT_FAILURE);
+
+		if (is_run_subtest_parameter_found(argc, argv))
+			const_num_of_tests = 1;
+		else
+			const_num_of_tests = ARRAY_SIZE(arr_err);
+
+		if (!is_background_parameter_found(argc, argv)) {
+			add_background_parameter(&argc, argv);
+			fd_shm = shared_mem_create(&sh_mem);
+			igt_require(fd_shm != -1);
+			launch_background_process(argc, argv, path, &pid_background, fd_shm);
+			process = PROCESS_TEST;
+		} else {
+			process = PROCESS_BACKGROUND;
+		}
+
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -964,7 +966,7 @@ igt_main
 	igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
 	igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH") {
 		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-				set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
+			set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 						ip_background, ip_test, ring_id_good, ring_id_bad);
 		}
 	}
@@ -972,7 +974,7 @@ igt_main
 	igt_describe("Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes");
 	igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_OPCODE") {
 		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-				set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_OPCODE,
+			set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_OPCODE,
 						ip_background, ip_test, ring_id_good, ring_id_bad);
 		}
 	}
@@ -997,11 +999,11 @@ igt_main
 	 *	}
 	 */
 
+	//amdgpu_ring_soft_recovery
 	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
-	igt_subtest("Handful-by-soft-recovery-amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR") { 
+	igt_subtest("Handful-by-soft-recovery-amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR") {
 		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-				//amdgpu_ring_soft_recovery
-				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
+			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
 						ip_background, ip_test, ring_id_good, ring_id_bad);
 		}
 	}
@@ -1009,7 +1011,7 @@ igt_main
 	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
 	igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING") {
 		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
+			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
 						ip_background, ip_test, ring_id_good, ring_id_bad);
 		}
 	}
@@ -1017,7 +1019,7 @@ igt_main
 	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
 	igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_USER_DATA") {
 		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_USER_DATA,
+			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_USER_DATA,
 						ip_background, ip_test, ring_id_good, ring_id_bad);
 		}
 	}
@@ -1033,6 +1035,7 @@ igt_main
 		drm_close_driver(fd);
 		shared_mem_destroy(sh_mem, fd_shm, true);
 		posix_spawn_file_actions_destroy(&action);
+
+		free_command_line(argc, argv, path);
 	}
-	free_command_line(argc, argv, path);
 }
-- 
2.25.1

