Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065C8C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 16 Sep 2024 01:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4851210E033;
	Mon, 16 Sep 2024 01:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gja/Zd50";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5FC10E033
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Sep 2024 01:32:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du3yUNSKdOuWW0P9PUjie61fUyVcrH5/KrbPpzpCaOFryGcyIh7VOCodb8PMP3d6hUAGXdtKEUzjwmBTxxkF4r5LFrhuxaBjIgfr7MpN9ahttHXIgwV18jPRYMnT9y/c0mFbLKblk6SqvLfcUvsJ8exxTNu/Sk3XyrbdUbQ1z2dHapvpsNaXTx29YsurgUgArJmR+nnV30tmLdHSEoAEbWdFeirc/KqK1BZHwykCdQUZgu2UDO3+6DXZiJdOejV6vsO5pz6/xElb9wH48fXK7VapHBOF5uroVOb179bztRG0fNZyvi+Rm3MmVgS820twgkk1AtXZyT81B2VpqdmLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFZdk3d1p+X+8Rnuop1AYz+MQwQdRqvpfmTQKMXkclU=;
 b=lrYI9MhC35qiO/iDStqejpJYq06ZmQTi3nS6uYzCqpUwUGnAxVe46Dobr7OVXklN/ZZUiHlnwev694tGMSbe+Pbl1U3KmbFiAUHrw2jKt1GJj454uTHa6Fu5XeeyIAyjAx6OC6ec2c/tnr3nai3BN7OiZEMNm3DfNAJsJz4gDAejtuLS9eAmRZwRqmvxGGsJ7aeNctximn2h3rz+c8epZ0cvkpty9Vwnwmx16SXcQY++3c0euFzSRAllTIBi+u5mgAvAqTUUd6D+qWNo0EfBflYmisLtwAWgvhZZ3DW/zuRYu9+cV6Y7ZB8lCJzC8sUEALvtLR7ozSnsxLBC5hJ8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFZdk3d1p+X+8Rnuop1AYz+MQwQdRqvpfmTQKMXkclU=;
 b=Gja/Zd50bBOY+01WZMMrLvmQjCTHpbbSndc1uAkY9jV1WFFqTfFBzMKTEEvTWqSl1Nsbpf8aaPHJATh+ySLNdu7o7HpvbR0h0KkbpVXCWqGTpyuJSzMu24Huscz9mnepE2P3S9R0g5CycEidyMrtAf0FruXVE94VfFwXr8xEOtY=
Received: from SJ0PR05CA0200.namprd05.prod.outlook.com (2603:10b6:a03:330::25)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 01:32:53 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:330:cafe::db) by SJ0PR05CA0200.outlook.office365.com
 (2603:10b6:a03:330::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 16 Sep 2024 01:32:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.1 via Frontend Transport; Mon, 16 Sep 2024 01:32:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 15 Sep
 2024 20:32:52 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 15 Sep 2024 20:32:51 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: refactor monitoring child process into
 a worker thread
Date: Sun, 15 Sep 2024 21:32:45 -0400
Message-ID: <20240916013245.125751-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|DM6PR12MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: c6439a9c-d3f7-4a0e-b832-08dcd5ef7c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dZWH4EmvK7MvQIK2XLDbm9gTe1DPBztb/gHKbLLxzc5+9wTalnHWGrpOnT4i?=
 =?us-ascii?Q?q3btKliEWd1TSa8a+5JgRxuuJlopJymPigJY2asuFJxSJQ6m9YM9896YHm7l?=
 =?us-ascii?Q?unOG7xklZ0uYLe3UYYt58fUTIqAY7bIxAtr1aVr/rfkV87gzFQhHgnXWJbbB?=
 =?us-ascii?Q?fbzXuylCfaCgHAdXyfAEQw+Zk9AIPxWu5eD9DRVAwMX1yCS9zGwHjgt2F1XS?=
 =?us-ascii?Q?L5agEK4R72z9qs1U1+Dsk17L3HJKqsL2B+4cu9obkp6o+hlgrvOdv9h9wv7x?=
 =?us-ascii?Q?vaJV9pDWIBEUdN1jDkcro1pN5XO4hVedFICI2elwV9mX0dCmxoJgywWyEKcQ?=
 =?us-ascii?Q?+g5AkdCwlcqmDURpjyeXsf5e30S80oKfqUnGFBvDqd+3bL8X7J1CR5FLXWOb?=
 =?us-ascii?Q?XtqV8ubpI7LGlavkqjJvup1PNcI1HqNHlDDs+2IpzirOnhW/QGvjPWaR9KLn?=
 =?us-ascii?Q?ILLVSkpeid9dTfb+5YNhpShTmA23c6wxioabV6w33VtUpQUVF04x2zzFj5Gq?=
 =?us-ascii?Q?+Z6MCzIxolzah/+bkknU1RtgLAwJBUVpg5HkGF2cZp4Vt8Mg14tAC9zmt4Nn?=
 =?us-ascii?Q?D5gwplJ2oXewE6ialniza4bia9PT9yXmMj/GMfALtXyLQ9GF7gA4Y5bvRD4Q?=
 =?us-ascii?Q?3Q6BjLRYW4ZsFF2TWE/iUmEF2COd81JEOvkUpa3yK+y1CCrhgzunWPYx3CS7?=
 =?us-ascii?Q?9+Q8bt+qk9MpO9Sbhbc+VvvDF9CtX8tMSNYEX97V67RVZ2T4X7Ix6Kz0CMwr?=
 =?us-ascii?Q?VxNhlaqlsN27XBdoGzQudFGWDyl434WDYc4EmZ8qHnhzdK8MmO27Kky2b3Zd?=
 =?us-ascii?Q?FFTUlylR0p+X4ZM5KNbyd145tTIzyi2EDCRwKIq196PS018vEpFtvD9L8Qpu?=
 =?us-ascii?Q?oV98MgTNDzuMM65YUhq5kiBaFeaGT0D7oC5lTlXyVaGqUJ88ZQdimuAnADwh?=
 =?us-ascii?Q?G3yGUUOrRcTHx1wntNt4A22Hsvhu/P4EfXSEh5cVhj0aXJIwZIJtKCLi+bTW?=
 =?us-ascii?Q?/l24/eCOu1MutRhv6NSSeJ86twKoSaaxsZSxlHJPq9A1Hr88NM+d7PZ2Xw8S?=
 =?us-ascii?Q?iX5B3+EeQPt57WDD2DeYXIxodx3HZg34vX0gBW45liGtJ8P8gi5yNqTykHlz?=
 =?us-ascii?Q?N4LKTdpAwYoS9+oHpF6ePX62zGCRrW2ZIGn6l4v+WHwREqEe0tlhYNb638Yf?=
 =?us-ascii?Q?8bDfB4iQV7wtUFggHrUtY7pHbHvXKp/+nCioIQ+u0gqB/7Rm3gSMgAued6IP?=
 =?us-ascii?Q?LIYjkl3z4a6N/tAGtV3gUq96A0qDxNLNNkcAVDiKP6EhEM2o+bKlWUplMFYb?=
 =?us-ascii?Q?ygnenP7CYPJfYOYa174ZO/77yuAL57BkDevKq3laDY7IZ6GUdNjA0G6BJxd1?=
 =?us-ascii?Q?CmOrDKXCS7D2FPQ6jeqLIPAeZZo8m3XVeO+uvP8A+I0xzKwiNfqr4uO6ymHD?=
 =?us-ascii?Q?jWRTbjlhShqQ4G2g/GA/ORKInAJszPd7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 01:32:53.3444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6439a9c-d3f7-4a0e-b832-08dcd5ef7c0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201
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

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 224 +++++++++++++++++++--------------
 1 file changed, 133 insertions(+), 91 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 8162e2186..d130c16a6 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -32,7 +32,7 @@
 
 #define SHARED_CHILD_DESCRIPTOR 3
 
-#define TEST_TIMEOUT 100 //100 seconds
+#define TEST_TIMEOUT 20 //100 seconds
 
 enum  process_type {
 	PROCESS_UNKNOWN,
@@ -80,6 +80,56 @@ struct shmbuf {
 
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
+	amdgpu_context_handle *arr_context;
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
+		if (param->arr_context)
+			free(param->arr_context);
+
+		pthread_cond_destroy(&param->local_mem.cond_var);
+		pthread_mutex_destroy(&param->local_mem.mutex);
+		free(param);
+	}
+}
+
 static inline
 void set_bit(int nr, uint32_t *addr)
 {
@@ -548,8 +598,8 @@ amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_h
 }
 
 static int
-run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
-			   struct shmbuf *sh_mem, int num_of_tests)
+run_monitor_child(amdgpu_device_handle device, struct shmbuf *sh_mem,
+		int num_of_tests, struct thread_params *param)
 {
 	int ret;
 	int test_counter = 0;
@@ -561,27 +611,32 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
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
@@ -590,9 +645,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 					state_machine = 2;
 
 			} else if (state_machine == 1) {
-				amdgpu_cs_query_reset_state(arr_context[test_counter],
+				amdgpu_cs_query_reset_state(local_context,
 						&after_reset_state, &after_reset_hangs);
-				amdgpu_cs_query_reset_state2(arr_context[test_counter],
+				amdgpu_cs_query_reset_state2(local_context,
 						&in_process_flags);
 
 				//TODO refactor this block !
@@ -613,9 +668,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
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
@@ -643,13 +698,22 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 	return ret;
 }
 
+static void *
+worker_thread(void *arg)
+{
+	struct thread_params *param = (struct thread_params *)arg;
+
+	run_monitor_child(param->device, param->sh_mem, param->num_of_tests, param);
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
@@ -659,6 +723,7 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
 	struct job_struct job;
 	const struct amdgpu_ip_block_version *ip_block_test = NULL;
 	struct amdgpu_cs_err_codes err_codes;
+	amdgpu_context_handle local_context = NULL;
 
 	while (num_of_tests > 0) {
 		sync_point_enter(sh_mem);
@@ -676,11 +741,19 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
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
 
@@ -692,11 +765,21 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
 				break;
 			sleep(1);
 		}
-		/* validate expected result */
-		//igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_err_result);
+
 
 		sync_point_exit(sh_mem);
+		pthread_mutex_lock(&param->local_mem.mutex);
+		param->local_mem.context_ready = 0;
+		param->local_mem.amdgpu_context = NULL;
+		amdgpu_cs_ctx_free(local_context);
+		pthread_mutex_unlock(&param->local_mem.mutex);
+
 		test_counter++;
+		igt_assert_eq(err_codes.err_code_cs_submit, 0);
+		igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_err_result);
+		//igt_info("====Test %s ip %s wait_for_fence %d==============\n", error_str,
+		//		job.ip == AMD_IP_GFX? "AMD_IP_GFX" : "AMD_IP_COMPUTE",
+		//		err_codes.err_code_wait_for_fence);
 	}
 	return ret;
 }
@@ -718,10 +801,6 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 	unsigned int flags;
 	struct amdgpu_cs_err_codes err_codes;
 
-	r = amdgpu_cs_ctx_create(device, &context_handle);
-	igt_assert_eq(r, 0);
-
-
 	while (num_of_tests > 0) {
 		sync_point_enter(sh_mem);
 		if (is_subtest_skipped(sh_mem)) {
@@ -732,6 +811,8 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 		read_next_job(sh_mem, &job, true);
 		ip_block_test = get_ip_block(device, job.ip);
 		is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
+		r = amdgpu_cs_ctx_create(device, &context_handle);
+		igt_assert_eq(r, 0);
 		while (1) {
 			r = amdgpu_write_linear(device, context_handle,  ip_block_test, &job, &err_codes);
 
@@ -756,37 +837,36 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
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
+	struct thread_params *param;
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
 
@@ -909,9 +989,9 @@ is_run_device_parameter_found(int argc, char **argv)
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
@@ -967,35 +1047,6 @@ launch_background_process(int argc, char **argv, char *path, pid_t *ppid, int sh
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
@@ -1095,19 +1146,13 @@ igt_main
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
+				{ {FAMILY_GFX1100, 0x1, 0xFF }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED } },
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } , { 0, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } }, {-ECANCELED, -ECANCELED, -ECANCELED } },
 			//TODO  not job timeout, debug why for n31.
 			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
 			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
@@ -1116,16 +1161,16 @@ igt_main
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
 			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
 			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
 			{}
 	};
 
@@ -1146,7 +1191,7 @@ igt_main
 			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
 
 		r = is_run_device_parameter_found(argc, argv);
-		snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r);
+		snprintf(shm_name, sizeof(shm_name), "/queue_reset_shm_%d", r);
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -1175,19 +1220,17 @@ igt_main
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
@@ -1224,7 +1267,6 @@ igt_main
 			waitpid(test_child, &testExitMethod, 0);
 		}
 		waitpid(pid_background, &backgrounExitMethod, 0);
-		free_contexts(device, arr_context_handle, const_num_of_tests);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 		shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
-- 
2.25.1

