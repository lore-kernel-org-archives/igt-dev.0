Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7972ACE8D60
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 08:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A75410E258;
	Thu, 19 Sep 2024 08:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QU1IoTfc";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509D10E258
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 08:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ml+LGSMGFMkd2ISn53kT5n+hdhVo2d6JgU//qiL4lEHRvBfeSbMGrSagFOUYVRIBa5Cw7PCdM71CWiW54dxYInoLEmDkZdIUNZQBRSWHV7k8AVHiYHl9MpICYuiJ5TsC9Fkb1C7uOIVXo4J0vtYKSAOVCDc+5eTPZ0w4qWrRY8xeXP1AzOBA0uKHKBealVonmP9loLyuYGOTB3KLI0FeZTIzvRgULQpmXScrDJpiq4tDofVf64scwMEVNv/xwKOUJMByxU3EAvkXeD4wQYsRmHogmtr+9qVUACF1hCcjt7kK0C3ohtz8kFcGtpSwqFNsYpPM2D5V0aRv87dmLp5FnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gepnZsEUQvmzL9TjbdC8MCJwA2DBhrsaHShzKy5c0ps=;
 b=AQyzx91q6c5by91IkBsB6+acSwDa7QpFpxFvcC9Ex2q/wz1w+QcuD8de+BEeDGsrxMpW+bdISGApBN6GdtrKe16EonbUekAuGbeAqB20PNNDcO4ivHjcuaR3y0nM72RSYGchM4xzZ9KXNK6OlLryIimRx1fTYv5HSN1gmwivY+vglIFasAGGZnymGOxPDiXNKIqvRBqh6mg4MPHsDmsEl5lh2sz2cCnof1vfVXGxjcQs3fY5/JXGnM+bp9J32hL5EHKLqQk2ocyFRn0ulw3crl8wYXDbzP20z1bq+B8+5z0N5crUcakm/R4rcbG+UGiTzekNbUPdgAp+WF1Nmn7zhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gepnZsEUQvmzL9TjbdC8MCJwA2DBhrsaHShzKy5c0ps=;
 b=QU1IoTfcShptMWH1YklYaVe2YN/TlGH7xlk1vnWSgeX1mwDMNXJMUvIwVs62nO/JsVZuQxBZAK4abnrqxv87jFTFtTtaZwC6iyM4bs5aL3wL7g7vfgtkUPWD8jJ8MojRI9mbmmZQtrFVJjhKk0eo74xEeQrSmh5JlEkUbi8BnM4=
Received: from SJ0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:33b::17)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 08:58:54 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::d1) by SJ0PR05CA0012.outlook.office365.com
 (2603:10b6:a03:33b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.10 via Frontend
 Transport; Thu, 19 Sep 2024 08:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 08:58:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 03:58:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 03:58:53 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 19 Sep 2024 03:58:51 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH 1/2] tests/amd_queue_reset: refactor monitoring child process
 into a worker thread
Date: Thu, 19 Sep 2024 16:58:51 +0800
Message-ID: <20240919085851.2544410-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b19e36a-bcb5-4365-f6a1-08dcd8894a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F67e1su+D3LzNp2uKtJdtrEO6rawCq5Uu69nqF1qLj8KidGiNsl0+bhJcwkR?=
 =?us-ascii?Q?3qfsz0wSL9gL8My1P8gAlLiVNWvKz57CaWt27p1ddrOuZoIXN/2X1iAfo7L2?=
 =?us-ascii?Q?rhXCefKSROaKMUZJvrMsIr+KlCWXppYKqyzLluz4WhFVB4LXUfW/o1JwYxsZ?=
 =?us-ascii?Q?KJzz0K9tl1fJ8B93aH8LdNh5eP4W9387vT98FBPVFhfH2POYPbG7KMW/OKcY?=
 =?us-ascii?Q?v7bL9vdFGcWe9rgZ7jjiVvo+YgcwjYB2hdHP1byhkl8e3jkJHPvL5Nx7vl03?=
 =?us-ascii?Q?Rf07mPfdeD5Y0HMra+Fs1RT29JeVaAcU0GEEZSXE0Z4GRqNLxBmG8SqmnrIP?=
 =?us-ascii?Q?d1FmTPcaSbQr5soH4noPIX3Rd2ICek7nRfhzPLY1PQqy+V9F5YTMJ+xvG+UE?=
 =?us-ascii?Q?C4P9Yu2reLXa1BIa5Wa8mSmgGZI7DKM9hhKrV8vcJ/72WpXvETD5THg0jbDF?=
 =?us-ascii?Q?hwvZHSbkJhyjFzPAb94q6P27TgzeiCun0/uPqgClMbILn5CwyvQecZkUhOX2?=
 =?us-ascii?Q?GUyx9xuKhrqii4+SPCXQlEBW657GErjsfNMiirNQRELkjZ2/edjF+baWhqKE?=
 =?us-ascii?Q?inK0kcqS/GHLRCfgKmNRQ/tnFZA0dz9XSUlSlg9GEbf6R6Qe0FxK1NJHOC4J?=
 =?us-ascii?Q?tsDE16qUhReYN9QL2tbUaBR5bBWkXoGrG3Vsif2t+p5RXzLCNQhaL8uTllUh?=
 =?us-ascii?Q?Kb6m/C0rhlxsIZEN93BZ7nUjNhP5BnRBbb9lrmBwJrCeAFQ3dU//efYhcdOn?=
 =?us-ascii?Q?KL+V/p1rIv615Ff5RuBOkdY6kt5Kp8ivarF4ww1FpU4T4hD8tEYMHM4CPE8M?=
 =?us-ascii?Q?DnMhKnmOcKyv7YGNN7jkYJ6CmEs2dDDDbAXZH9289zr28dDeil2tuIa+v9QK?=
 =?us-ascii?Q?2UOkGTbLGPqfQwuia9ss+vCejNFOny7+48gtU4T+Q0A6EhA0nh6E6J+vDYx6?=
 =?us-ascii?Q?fSZiH6uBzbtxFra8MGRoxpMS2exYO7qXK9fr/HkJ+BtfTA5+e/7bNyE6U//o?=
 =?us-ascii?Q?Z/5Nhfj2EvmeUKWwUbOhKGJGBNZQxTJTvxLHI+7sBoLBLhTAEiw8zGED6bAU?=
 =?us-ascii?Q?q4lzsYKEvn4veIPXSWKW+uaUp7DGQSx7okxW9FPJB5ulkrK0DYLbxQHDIHez?=
 =?us-ascii?Q?Yq7aqucJP3ciHzPzRHZnJQ+pouEY9MNZUQcCMR0j9xhgZpwFBT0xoLdl5MWC?=
 =?us-ascii?Q?Yt/6g0KbcHlv1UXSE/Y4s2rImv+KGdLcP52aUDu79gyGm0ayvuxwurzHLrPX?=
 =?us-ascii?Q?7k2E/d//sFLLnJT9bWKv1uLHmEjjMfptVTKzl8ZwsmT2vA3vPZqERLa7tta1?=
 =?us-ascii?Q?PmE9tctYC29gwhvtiCImSI0hjo1JVnDKNhCgqfg3Aw3BkCgF0CfjDookH004?=
 =?us-ascii?Q?swPlbHjrZxE/Zk0AbHQS4GkckcTcstzSoEPXovtW3NZ1ADqXEe6Q1E4T60gj?=
 =?us-ascii?Q?pqB2EfRcWBnfUvCS3S24zw7GaAVEMtsc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 08:58:54.5858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b19e36a-bcb5-4365-f6a1-08dcd8894a3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243
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

This refactor was necessary because AMDGPU contexts cannot be exported or
imported between processes. Previously, we used fork to share the context
between child processes (test and monitoring), which was essential for
querying the context status of failed jobs to validate GPU or queue reset
progression using flags.

However, not all failures result in a queue reset. In cases of a GPU reset,
the entire VRAM is lost, and previously created contexts could not be used
in subsequent tests due to VM generation token mismatches. As a result,
we had two options: eliminate the monitoring process entirely or refactor
its functionality into a worker thread within the test process. We chose
the latter. Now, the worker thread of the test process  handles the
monitoring tasks, ensuring smooth context management and satisfying all
requirements.

v2: - Fix in monitor thread when test is skipped.
    - Do not use printf , only igt_info due to permisison issue on containers.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>

Depends-On: https://gerrit-git.amd.com/c/osg/ec/infra/zuul-jobs/+/1123783
Change-Id: Iaecd4634b23545fec1c6bc1a133c26469662ca18
---
 tests/amdgpu/amd_queue_reset.c | 239 ++++++++++++++++++++-------------
 1 file changed, 143 insertions(+), 96 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 8162e2186..7526b1c0a 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -32,7 +32,7 @@
 
 #define SHARED_CHILD_DESCRIPTOR 3
 
-#define TEST_TIMEOUT 100 //100 seconds
+#define TEST_TIMEOUT 20 //100 seconds
 
 enum  process_type {
 	PROCESS_UNKNOWN,
@@ -80,6 +80,52 @@ struct shmbuf {
 
 };
 
+// Local memory structure for communication between child process and worker thread
+struct localbuf {
+	pthread_mutex_t mutex;		// Mutex for condition variable
+	pthread_cond_t cond_var;	// Condition variable to signal context availability
+	int context_ready;			// Flag to indicate if the context is ready
+	amdgpu_context_handle amdgpu_context;// Pointer to amdgpu context
+};
+
+struct thread_params {
+	amdgpu_device_handle device;
+	struct shmbuf *sh_mem;
+	int num_of_tests;
+	struct localbuf local_mem;
+
+};
+
+static struct thread_params*
+allocate_thread_param(amdgpu_device_handle device, struct shmbuf *sh_mem,
+					int num_of_tests)
+{
+	struct thread_params	*param = NULL;
+
+	param = malloc(sizeof(struct thread_params));
+	memset(param, 0, sizeof(struct thread_params));
+
+	param->device = device;
+	param->sh_mem = sh_mem;
+	param->num_of_tests = num_of_tests;
+	pthread_mutex_init(&param->local_mem.mutex, NULL);
+	pthread_cond_init(&param->local_mem.cond_var, NULL);
+	param->local_mem.amdgpu_context = NULL;
+	param->local_mem.context_ready = 0;
+
+	return param;
+}
+
+static void
+free_thread_param(struct thread_params *param)
+{
+	if (param) {
+		pthread_cond_destroy(&param->local_mem.cond_var);
+		pthread_mutex_destroy(&param->local_mem.mutex);
+		free(param);
+	}
+}
+
 static inline
 void set_bit(int nr, uint32_t *addr)
 {
@@ -548,8 +594,8 @@ amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_h
 }
 
 static int
-run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
-			   struct shmbuf *sh_mem, int num_of_tests)
+run_monitor_thread(amdgpu_device_handle device, struct shmbuf *sh_mem,
+		int num_of_tests, struct thread_params *param)
 {
 	int ret;
 	int test_counter = 0;
@@ -561,27 +607,38 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 	int64_t cnt = 0;
 	time_t start, end;
 	double elapsed = 0;
+	amdgpu_context_handle local_context = NULL;
 
 	after_reset_state = after_reset_hangs = 0;
 	init_flags = in_process_flags = 0;
 
-	ret = amdgpu_cs_query_reset_state2(arr_context[0], &init_flags);
-	if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)
-		igt_assert_eq(init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS, 0);
-
 	while (num_of_tests > 0) {
 		sync_point_enter(sh_mem);
+		if (is_subtest_skipped(sh_mem)) {
+			sync_point_exit(sh_mem);
+			num_of_tests--;
+			test_counter++;
+			continue;
+		}
 		state_machine = 0;
 		error_code = 0;
 		flags = 0;
 		set_reset_state(sh_mem, false, ALL_RESET_BITS);
+
+		pthread_mutex_lock(&param->local_mem.mutex);
+		while (!param->local_mem.context_ready)
+			pthread_cond_wait(&param->local_mem.cond_var, &param->local_mem.mutex);
+
+		local_context = param->local_mem.amdgpu_context;
+		pthread_mutex_unlock(&param->local_mem.mutex);
+
 		time(&start);
 		while (1) {
 			if (is_subtest_skipped(sh_mem))
 				break;
 
 			if (state_machine == 0) {
-				amdgpu_cs_query_reset_state2(arr_context[test_counter], &init_flags);
+				amdgpu_cs_query_reset_state2(local_context, &init_flags);
 
 				if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET)
 					state_machine = 1;
@@ -590,9 +647,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 					state_machine = 2;
 
 			} else if (state_machine == 1) {
-				amdgpu_cs_query_reset_state(arr_context[test_counter],
+				amdgpu_cs_query_reset_state(local_context,
 						&after_reset_state, &after_reset_hangs);
-				amdgpu_cs_query_reset_state2(arr_context[test_counter],
+				amdgpu_cs_query_reset_state2(local_context,
 						&in_process_flags);
 
 				//TODO refactor this block !
@@ -613,9 +670,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 					}
 				}
 			} else if (state_machine == 2) {
-				amdgpu_cs_query_reset_state(arr_context[test_counter],
+				amdgpu_cs_query_reset_state(local_context,
 						&after_reset_state, &after_reset_hangs);
-				amdgpu_cs_query_reset_state2(arr_context[test_counter],
+				amdgpu_cs_query_reset_state2(local_context,
 						&in_process_flags);
 				/* here we should start timer and wait for some time until
 				 * the flag AMDGPU_CTX_QUERY2_FLAGS_RESET disappear
@@ -643,13 +700,22 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 	return ret;
 }
 
+static void *
+worker_thread(void *arg)
+{
+	struct thread_params *param = (struct thread_params *)arg;
+
+	run_monitor_thread(param->device, param->sh_mem, param->num_of_tests, param);
+
+	return NULL;
+}
 
 
 static int
-run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
-				struct shmbuf *sh_mem, int num_of_tests, uint32_t version)
+run_test_child(amdgpu_device_handle device, struct shmbuf *sh_mem,
+		int num_of_tests, uint32_t version, struct thread_params *param)
 {
-	int ret;
+	int ret, r;
 	bool bool_ret;
 	int test_counter = 0;
 	char error_str[128];
@@ -659,6 +725,7 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
 	struct job_struct job;
 	const struct amdgpu_ip_block_version *ip_block_test = NULL;
 	struct amdgpu_cs_err_codes err_codes;
+	amdgpu_context_handle local_context = NULL;
 
 	while (num_of_tests > 0) {
 		sync_point_enter(sh_mem);
@@ -676,27 +743,50 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
 		err_codes.err_code_cs_submit = 0;
 		err_codes.err_code_wait_for_fence = 0;
 
+		r = amdgpu_cs_ctx_create(device, &local_context);
+		igt_assert_eq(r, 0);
+		pthread_mutex_lock(&param->local_mem.mutex);
+		param->local_mem.amdgpu_context = local_context;
+		param->local_mem.context_ready = 1; // Mark the context as ready
+		pthread_cond_signal(&param->local_mem.cond_var); // Notify the worker thread
+		pthread_mutex_unlock(&param->local_mem.mutex);
+
 		if (is_dispatch) {
-			ret = amdgpu_memcpy_dispatch_test(device, arr_context[test_counter], job.ip, job.ring_id, version,
+			ret = amdgpu_memcpy_dispatch_test(device, local_context, job.ip, job.ring_id, version,
 					job.error, &err_codes);
 		} else {
-			ret = amdgpu_write_linear(device, arr_context[test_counter],
+			ret = amdgpu_write_linear(device, local_context,
 					ip_block_test, &job, &err_codes);
 		}
 
 		num_of_tests--;
 		set_test_state(sh_mem, true, ret, ERROR_CODE_SET_BIT);
+		////////////////////////////////////////////////////////////
+		/// remove me!!!
+		//set_reset_state(sh_mem, true, QUEUE_RESET_SET_BIT);
+		//////////////////////////////////////////////////////////////
 		while (1) {
 			/*we may have GPU reset vs queue reset */
 			if (get_reset_state(sh_mem, &reset_flags))
 				break;
 			sleep(1);
 		}
-		/* validate expected result */
-		//igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_err_result);
+
 
 		sync_point_exit(sh_mem);
+
+		pthread_mutex_lock(&param->local_mem.mutex);
+		param->local_mem.context_ready = 0;
+		param->local_mem.amdgpu_context = NULL;
+		pthread_mutex_unlock(&param->local_mem.mutex);
+
+		amdgpu_cs_ctx_free(local_context);
 		test_counter++;
+		igt_assert_eq(err_codes.err_code_cs_submit, 0);
+		//igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_err_result);
+		igt_info("====Test %s ip %s wait_for_fence %d==============\n", error_str,
+				job.ip == AMD_IP_GFX? "AMD_IP_GFX" : "AMD_IP_COMPUTE",
+				err_codes.err_code_wait_for_fence);
 	}
 	return ret;
 }
@@ -718,10 +808,6 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 	unsigned int flags;
 	struct amdgpu_cs_err_codes err_codes;
 
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
-
-
 	while (num_of_tests > 0) {
 		sync_point_enter(sh_mem);
 		if (is_subtest_skipped(sh_mem)) {
@@ -732,6 +818,8 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 		read_next_job(sh_mem, &job, true);
 		ip_block_test = get_ip_block(device, job.ip);
 		is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
+		r = amdgpu_cs_ctx_create(device, &context_handle);
+		igt_assert_eq(r, 0);
 		while (1) {
 			r = amdgpu_write_linear(device, context_handle,  ip_block_test, &job, &err_codes);
 
@@ -756,37 +844,36 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 			counter++;
 
 		}
+		r = amdgpu_cs_ctx_free(context_handle);
 		sync_point_exit(sh_mem);
 		num_of_tests--;
 	}
-	r = amdgpu_cs_ctx_free(context_handle);
 	return r;
 }
 
 
-
-
 static int
-run_all(amdgpu_device_handle device, amdgpu_context_handle *arr_context_handle,
-		enum process_type process, struct shmbuf *sh_mem,  int num_of_tests,
-		uint32_t version, pid_t *monitor_child, pid_t *test_child)
+run_all(amdgpu_device_handle device, enum process_type process,
+		struct shmbuf *sh_mem,  int num_of_tests, uint32_t version,
+		pid_t *monitor_child, pid_t *test_child)
 {
+	struct thread_params *param = NULL;
+	pthread_t worker;
+
 	if (process == PROCESS_TEST) {
-		*monitor_child = fork();
-		if (*monitor_child == -1) {
-			igt_fail(IGT_EXIT_FAILURE);
-		} else if (*monitor_child == 0) {
-			*monitor_child = getppid();
-			run_monitor_child(device, arr_context_handle, sh_mem, num_of_tests);
-				igt_success();
-				igt_exit();
-		}
 		*test_child = fork();
 		if (*test_child == -1) {
 			igt_fail(IGT_EXIT_FAILURE);
 		} else if (*test_child == 0) {
 			*test_child = getppid();
-			run_test_child(device, arr_context_handle, sh_mem, num_of_tests, version);
+			param = allocate_thread_param(device, sh_mem, num_of_tests);
+			if (pthread_create(&worker, NULL, worker_thread, param) != 0) {
+				igt_info("********Failed to create worker thread");
+				igt_fail(IGT_EXIT_FAILURE);
+			}
+			run_test_child(device, sh_mem, num_of_tests, version, param);
+			pthread_join(worker, NULL);
+			free_thread_param(param);
 			igt_success();
 			igt_exit();
 
@@ -909,9 +996,9 @@ is_run_device_parameter_found(int argc, char **argv)
 		if (strcmp(ONDEVICE, argv[i]) == 0) {
 			/* Get the sum for a specific device as a unique identifier */
 			p = argv[i+1];
-			while(*p){
-			  res += *p;
-			  p++;
+			while (*p) {
+				res += *p;
+				p++;
 			}
 			break;
 		}
@@ -967,35 +1054,6 @@ launch_background_process(int argc, char **argv, char *path, pid_t *ppid, int sh
 	return status;
 }
 
-static void
-create_contexts(amdgpu_device_handle device, amdgpu_context_handle **pp_contexts,
-		int num_of_contexts)
-{
-	amdgpu_context_handle *p_contexts = NULL;
-	int i, r;
-
-	p_contexts = (amdgpu_context_handle *)malloc(sizeof(amdgpu_context_handle)
-			*num_of_contexts);
-
-	for (i = 0; i < num_of_contexts; i++) {
-		r = amdgpu_cs_ctx_create(device, &p_contexts[i]);
-		igt_assert_eq(r, 0);
-	}
-	*pp_contexts = p_contexts;
-
-}
-static void
-free_contexts(amdgpu_device_handle device, amdgpu_context_handle *p_contexts,
-		int num_of_contexts)
-{
-	int i;
-
-	if (p_contexts) {
-		for (i = 0; i < num_of_contexts; i++)
-			amdgpu_cs_ctx_free(p_contexts[i]);
-	}
-}
-
 static bool
 adjust_begin_index(unsigned int *ring_begin, unsigned int available_good_rings)
 {
@@ -1074,7 +1132,7 @@ igt_main
 	enum  process_type process = PROCESS_UNKNOWN;
 	pid_t pid_background = 0;
 	pid_t monitor_child = 0, test_child = 0;
-	int testExitMethod, monitorExitMethod, backgrounExitMethod;
+	int testExitMethod, backgrounExitMethod;
 	posix_spawn_file_actions_t action;
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
@@ -1095,19 +1153,13 @@ igt_main
 	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
 
-	amdgpu_context_handle *arr_context_handle = NULL;
-
-	/* TODO remove this , it is used only to create array of contexts
-	 * which are shared between child processes ( test/monitor/main and
-	 *  separate for background
-	 */
 	struct dynamic_test arr_err[] = {
 			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
 				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
-				{ { FAMILY_GFX1100, 0x1, 0xFF }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } } , {-ECANCELED, -ECANCELED, 0 } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED } },
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } , { 0, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED } },
 			//TODO  not job timeout, debug why for n31.
 			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
 			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
@@ -1116,16 +1168,16 @@ igt_main
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
 			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
 			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
 			{}
 	};
 
@@ -1146,7 +1198,7 @@ igt_main
 			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
 
 		r = is_run_device_parameter_found(argc, argv);
-		snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r);
+		snprintf(shm_name, sizeof(shm_name), "/queue_reset_shm_%d", r);
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -1175,24 +1227,22 @@ igt_main
 		} else {
 			process = PROCESS_BACKGROUND;
 		}
-		if (process == PROCESS_TEST)
-			create_contexts(device, &arr_context_handle, const_num_of_tests);
-		else if (process == PROCESS_BACKGROUND)
+		if (process == PROCESS_BACKGROUND)
 			fd_shm = shared_mem_open(&sh_mem);
+
 		igt_require(fd_shm != -1);
 		igt_require(sh_mem != NULL);
 
-		run_all(device, arr_context_handle,
-			process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
-			&monitor_child, &test_child);
+		run_all(device, process, sh_mem, const_num_of_tests,
+				info[0].hw_ip_version_major, &monitor_child, &test_child);
 	}
 	//print expect error table for each test
-	if(!argc)  {// --list-subtests arg is 0
+	if (!argc) {// --list-subtests arg is 0
 		for (int i = 0; i < ARRAY_SIZE(ip_tests); i++)
 			for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
 				expect_error = ip_tests[i] == AMD_IP_COMPUTE ?
 						it->result.compute_reset_result : it->result.gfx_reset_result;
-				printf("test ip: %s,  test: %s,  expected error:%d \n",
+				igt_info("test ip: %s,  test: %s,  expected error:%d \n",
 					ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name, expect_error);
 			}
 	}
@@ -1219,12 +1269,9 @@ igt_main
 		set_next_test_to_skip(sh_mem);
 
 	igt_fixture {
-		if (process == PROCESS_TEST) {
-			waitpid(monitor_child, &monitorExitMethod, 0);
+		if (process == PROCESS_TEST)
 			waitpid(test_child, &testExitMethod, 0);
-		}
 		waitpid(pid_background, &backgrounExitMethod, 0);
-		free_contexts(device, arr_context_handle, const_num_of_tests);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 		shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
-- 
2.25.1

