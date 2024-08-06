Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FAEC49EA1
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 23:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874D810E13A;
	Tue,  6 Aug 2024 23:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JbmAiCk9";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA7110E13A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 23:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iwh3txFTPFLEJvWhZeofHRYBJkJ+EjTU1p5OMVcsScU0XQH6TmKmDK5kYm2TsqKITKy1dCW1ueTEgFUmqJ12xF3z+oGGlHgq2+UyJlwMT2iqyTyqmCaTZ6wTZJ3ZFYO2YSdQKbGIQxzMmiFHcQvBFxhFgt9rpW1Vp6HQuXfSODUUhENs6tXcPemNeAM25VEF5gRN0+Un+IeNiQ+fDa3S1kP1rxboQuvWxyb6O8EfBSxw9NPhK0cjb7hCxiqHYdlNdoBMYS60g081vEJKazltQQR4lHqtCW1wjMVz9uM1x7K5XYb+11PlYV0vWssvnE4SoxWLh+WyFUPVSJopXDDF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJrtxQHbonRULpwVjemu2+RJ/L4fhk7RiudnUGyw5iQ=;
 b=fjxyT/MiQLvpVfWhfjq+UNekB+nhkfUNExk71ILafpJaaYGdP4Chd8oMSgf3D+WEYYW4GE9fMaXH+U5uhi2J2Clnu0LCoUWmiPVxUxpMmvi5XwYcGhPUfCFv2Tx1YgH1NJDFrRBNX12UG7WCI3axXp+tEOwwdyCSRSbu+LvCYj1r+ZuM/JeY06DzV/5im3QrDId4c0PAMR1xF4tauF3Wv3GpFwu6aKmIrl1VL98wDNnHicaliuMjE7ix1tg36vcMyAGVgEVbTcIsxcUGSwdckxnZ7+UKpnP4g7Imk8mwYDOR67uZ2TAB+4JNxMj0VAYDpo1+uyBGT5hMybCsir0CdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJrtxQHbonRULpwVjemu2+RJ/L4fhk7RiudnUGyw5iQ=;
 b=JbmAiCk9UydYtTlknCVPSOGDEqfmA82sIBUhmlMBvLdvk1/xslhqGIZGDaoVzdkr91e04eg+Myi/haXnte5VF1YzYaIcpHmxF3h85KJtsuy+Guyz6AyjRdY6ArXohAzKS5/Tmoc4x72zGO9XMv0r6xDjfhdrv51AcRvyyefv6Jc=
Received: from BL1PR13CA0382.namprd13.prod.outlook.com (2603:10b6:208:2c0::27)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 23:39:33 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::7e) by BL1PR13CA0382.outlook.office365.com
 (2603:10b6:208:2c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.11 via Frontend
 Transport; Tue, 6 Aug 2024 23:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 6 Aug 2024 23:39:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 18:39:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 18:39:32 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 18:39:32 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse Zhang <jesse.zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 1/3] tests/amdgpu: Add queue reset test
Date: Tue, 6 Aug 2024 19:39:28 -0400
Message-ID: <20240806233930.344130-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d884c55-ea15-4434-2941-08dcb6710688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rJRKiGQxsjR7xalNPf5sdbqhMZyOCR0AzWnPeh+byKjQp9F7wW4xjpbD4J0T?=
 =?us-ascii?Q?S4FkBhj7s/62KJgDa2qayr/Egk9G29OfXZtt3zFOFuPUsOzCVhAdoxRcLyo6?=
 =?us-ascii?Q?GHQUPTIlHv1/zTLequoEE9EkRB4Ya1t8nXMH9YhKhsou8LnPkRb47UV/6bnq?=
 =?us-ascii?Q?xRlG68+jCZLSgZeUgZjwN9DLPYa0ljZMq0EN5VT8VK8bYla8AdT5k1BqrWQz?=
 =?us-ascii?Q?3XLHk4SdFnr2zOFA2Tpw+EuqcL9wCg/bxYPWJVi0aMBecp7v5Eoabq8eabeB?=
 =?us-ascii?Q?NYTvxFxgrZcWXOpnhuMebEnOEWY7rkKk7EAvOaWn1UlUL2d4x5R6haDIpxQo?=
 =?us-ascii?Q?fYQAtO5hZYRO3rgDsFtGhhRlBpX7GMdSM6WhXwKB2HtW14YDGYjDO3FrYBQp?=
 =?us-ascii?Q?hZVn+eD1Eqko08RFnVdpo1kmPhuTq0vvE4kSfxV/l+uxtOotVRYOn6lIzyky?=
 =?us-ascii?Q?0O3qOVM2frlRrHgnPjQwEp/Q3RZMZUUppyIyOBB6EhfxwjCzVhgUC0kstubF?=
 =?us-ascii?Q?IcIav1tewiwKWSOZLXpbII59XrC5Ks/K9e8U7Cy3dNMJlGCQVuTXNksdCkRr?=
 =?us-ascii?Q?Mon/zvAdPSPQKUDzz4JVMazsL8i/uw/qFQ3bCXfe9rYg2Tl2QxfDmXBbXEE4?=
 =?us-ascii?Q?w+BiaNeake0MirshUsEMrp4u8GG16upmn9Mb0JsIFJu7/5ddd1ojVLi7tv+O?=
 =?us-ascii?Q?PXK5+uIdEchdxRnZK9t1d+xH1+S6qEeWA5HMz0PfRa+vD8OySdS9V2wY6FMG?=
 =?us-ascii?Q?mJmyNu5zQmsOssXlPeDLBc3CZHffyjexS4/xWFHnCv6Epq31GBEjv6YeEMXw?=
 =?us-ascii?Q?/WGmBKmfo+1sa5pxq57Tp4whl7PIqIbekUW/wTrVmaBY7yFhkcACA5QIXkj0?=
 =?us-ascii?Q?6hw1zSfCznzsL/ef952rMa9gjXGkb2R7Y9a6SF1GH7EoyCb0C7Jw+dOBLjUc?=
 =?us-ascii?Q?d1IW+A04DMh8TEao3QhSVeCa5CT0JmSK18pZRVzj1Xl6Vio8jFbx+4SahjYR?=
 =?us-ascii?Q?PW1RFkdWgQmwcFH6UE6K1AS2UyEWdzn53aLhdPhk/YZyy6683MpOimtyx9aZ?=
 =?us-ascii?Q?OQprk8ukqMKKhNKPHFeJUIAEXuUZy8UHNzobK1NgT9J1rg4fnZF/TKa7qUuf?=
 =?us-ascii?Q?BsYPGlwzIQ5eQW4B+jFQmSdV7h2AO4gI9s7VhbyWMlLztzo7gN4YEMHl2FMG?=
 =?us-ascii?Q?7yceGErWSz7JI3UBGsOKM/N3Ck4eYlvhNv7i8FBsfV6+mPZ0Zqi1iKNOOsly?=
 =?us-ascii?Q?M9f5HmSditmr+OvObGJMnuFu17/D8nWj53kwGUvAHIyiYtRd9euLlO5mqcYC?=
 =?us-ascii?Q?pkLVGw6q1JlkHjt4jRc8mXtb0n0Ac8D2ZYZbzmR0RS7jhKl3WDKdXbwwcm8r?=
 =?us-ascii?Q?9je1jkr81l/8fL8K6lUFJDV1Z7gkKQb+65w/ZgtQNFsPJZAsrS99+f5A8aFW?=
 =?us-ascii?Q?O8/SFHxn+s4DI+hTZzcLYEgCsm7/u7F3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 23:39:33.6289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d884c55-ea15-4434-2941-08dcb6710688
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410
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

From: Jesse Zhang <jesse.zhang@amd.com>

overview of Queue Reset Test Process:
- Launch Child Test Process:
  Executes various tests, such as BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
  BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, etc., to evaluate queue reset
  functionality.
  If the amdgpu driver encounters a job timeout, it attempts recovery in the following sequence:
  - Soft reset: Returns an error of -ENODATA for the given bad job. If unsuccessful, a queue reset is attempted.
  - Queue reset: Returns an error of -ENODATA for the given bad job. If unsuccessful, a full GPU reset is attempted.
  - Entire GPU reset: Returns an error of -ECANCELED or -ETIME for the given bad job.
  After each test, the test waits for the selected recovery process to complete using a monitoring process.

- Launch Child Monitoring Process:
  During each test, this process calls amdgpu_cs_query_reset_state2 and communicates with the test process via
  shared memory to obtain the return code once a job is completed. It uses flags AMDGPU_CTX_QUERY2_FLAGS_RESET and
  AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS, along with the return code, to ensure the correct recovery procedure
  (queue reset or entire GPU reset) is executed as required.

- Launch Background Process:
  Utilizes posix_spawn to submit successful jobs to other rings. Communicates with the test and monitoring
  processes via shared memory to determine when background jobs should be interrupted and the next test should be run.

- Main Test Process:
  Manages the above processes and pushes jobs to shared memory for the test process, sending appropriate signals as needed.

- Synchronization:
  Sync points are established between the four processes at the beginning and end of each the test. Synchronization is
  implemented using shared memory and unnamed semaphores.

This approach ensures thorough testing and validation of the queue reset functionality by actively monitoring and
responding to different stages of the reset process.

v2: Enable queue reset test for drmlib v > 2.4.104.
v3: Fix subtest name duplication issue, found by Bhanuprakash Modem <bhanuprakash.modem@intel.com>
v4: Replace igt_subtest_with_dynamic with igt_subtest and remove igt_dynamic_f, as suggested by Kamil.
    Also, reorganize the includes alphabetically as recommended by Kamil.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 1039 ++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build       |    5 +
 2 files changed, 1044 insertions(+)
 create mode 100644 tests/amdgpu/amd_queue_reset.c

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
new file mode 100644
index 000000000..b63bced0f
--- /dev/null
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -0,0 +1,1039 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <signal.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <spawn.h>
+#include <semaphore.h>
+#include <errno.h>
+#include <assert.h>
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+#include "igt.h"
+#include "drmtest.h"
+
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_deadlock_helpers.h"
+#include "lib/amdgpu/amd_dispatch.h"
+
+#define NUM_CHILD_PROCESSES 4
+#define SHARED_CHILD_DESCRIPTOR 3
+
+#define SHARED_MEM_NAME  "/queue_reset_shm"
+
+enum  process_type {
+	PROCESS_UNKNOWN,
+	PROCESS_TEST,
+	PROCESS_BACKGROUND,
+};
+
+struct job_struct {
+	unsigned int error;
+	enum amd_ip_block_type ip;
+	unsigned int ring_id;
+	/* additional data if necessary */
+};
+
+enum error_code_bits {
+	ERROR_CODE_SET_BIT,
+};
+
+enum reset_code_bits {
+	QUEUE_RESET_SET_BIT,
+	GPU_RESET_BEGIN_SET_BIT,
+	GPU_RESET_END_SUCCESS_SET_BIT,
+	GPU_RESET_END_FAILURE_SET_BIT,
+
+	ALL_RESET_BITS = 0xf,
+};
+
+struct shmbuf {
+	sem_t sem_mutex;
+	sem_t sem_state_mutex;
+	sem_t sync_sem_enter;
+	sem_t sync_sem_exit;
+	int count;
+	bool test_completed;
+	unsigned int test_flags;
+	int test_error_code;
+	bool reset_completed;
+	unsigned int reset_flags;
+	struct job_struct bad_job;
+	struct job_struct good_job;
+
+};
+
+static inline
+void set_bit(int nr, uint32_t *addr)
+{
+	*addr |= (1U << nr);
+}
+
+static inline
+void clear_bit(int nr, uint32_t *addr)
+{
+	*addr &= ~(1U << nr);
+}
+
+static inline
+int test_bit(int nr, const uint32_t *addr)
+{
+	return ((*addr >> nr) & 1U) != 0;
+}
+
+static void
+sync_point_signal(sem_t *psem, int num_signals)
+{
+	int i;
+
+	for (i = 0; i < num_signals; i++)
+		sem_post(psem);
+}
+
+static void
+set_reset_state(struct shmbuf *sh_mem, bool reset_state, enum reset_code_bits bit)
+{
+	sem_wait(&sh_mem->sem_state_mutex);
+	sh_mem->reset_completed = reset_state;
+	if (reset_state)
+		set_bit(bit, &sh_mem->reset_flags);
+	else
+		clear_bit(bit, &sh_mem->reset_flags);
+
+	sem_post(&sh_mem->sem_state_mutex);
+}
+
+static bool
+get_reset_state(struct shmbuf *sh_mem, unsigned int *flags)
+{
+	bool reset_state;
+
+	sem_wait(&sh_mem->sem_state_mutex);
+	reset_state = sh_mem->reset_completed;
+	*flags = sh_mem->reset_flags;
+	sem_post(&sh_mem->sem_state_mutex);
+	return reset_state;
+}
+
+static void
+set_test_state(struct shmbuf *sh_mem, bool test_state,
+		int error_code, enum error_code_bits bit)
+{
+	sem_wait(&sh_mem->sem_state_mutex);
+	sh_mem->test_completed = test_state;
+	sh_mem->test_error_code = error_code;
+	if (test_state)
+		set_bit(bit, &sh_mem->test_flags);
+	else
+		clear_bit(bit, &sh_mem->test_flags);
+	sem_post(&sh_mem->sem_state_mutex);
+}
+
+
+
+static bool
+get_test_state(struct shmbuf *sh_mem, int *error_code, unsigned int *flags)
+{
+	bool test_state;
+
+	sem_wait(&sh_mem->sem_state_mutex);
+	test_state = sh_mem->test_completed;
+	*error_code = sh_mem->test_error_code;
+	*flags = sh_mem->test_flags;
+	sem_post(&sh_mem->sem_state_mutex);
+	return test_state;
+}
+
+static void
+sync_point_enter(struct shmbuf *sh_mem)
+{
+
+	sem_wait(&sh_mem->sem_mutex);
+	sh_mem->count++;
+	sem_post(&sh_mem->sem_mutex);
+
+	if (sh_mem->count == NUM_CHILD_PROCESSES)
+		sync_point_signal(&sh_mem->sync_sem_enter, NUM_CHILD_PROCESSES);
+
+	sem_wait(&sh_mem->sync_sem_enter);
+}
+
+static void
+sync_point_exit(struct shmbuf *sh_mem)
+{
+	sem_wait(&sh_mem->sem_mutex);
+	sh_mem->count--;
+	sem_post(&sh_mem->sem_mutex);
+
+	if (sh_mem->count == 0)
+		sync_point_signal(&sh_mem->sync_sem_exit, NUM_CHILD_PROCESSES);
+
+	sem_wait(&sh_mem->sync_sem_exit);
+}
+
+static bool
+is_dispatch_shader_test(unsigned int err, char error_str[128], bool *is_dispatch)
+{
+	static const struct error_struct {
+		enum cmd_error_type err;
+		bool is_shader_err;
+		const char *err_str;
+	} arr_err[] = {
+		{ CMD_STREAM_EXEC_SUCCESS,                   false, "CMD_STREAM_EXEC_SUCCESS" },
+		{ CMD_STREAM_EXEC_INVALID_OPCODE,            false, "CMD_STREAM_EXEC_INVALID_OPCODE" },
+		{ CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,     false, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH" },
+		{ CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE,  false, "CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE" },
+		{ CMD_STREAM_TRANS_BAD_REG_ADDRESS,          false, "CMD_STREAM_TRANS_BAD_REG_ADDRESS" },
+		{ CMD_STREAM_TRANS_BAD_MEM_ADDRESS,          false, "CMD_STREAM_TRANS_BAD_MEM_ADDRESS" },
+		{ CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,  false, "CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC" },
+		{ BACKEND_SE_GC_SHADER_EXEC_SUCCESS,         true,  "BACKEND_SE_GC_SHADER_EXEC_SUCCESS" },
+		{ BACKEND_SE_GC_SHADER_INVALID_SHADER,       true,  "BACKEND_SE_GC_SHADER_INVALID_SHADER" },
+		{ BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, true,  "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR" },
+		{ BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, true, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING" },
+		{ BACKEND_SE_GC_SHADER_INVALID_USER_DATA,    true,  "BACKEND_SE_GC_SHADER_INVALID_USER_DATA" }
+	};
+
+	const int arr_size = ARRAY_SIZE(arr_err);
+	const struct error_struct *p;
+	bool ret = false;
+
+	for (p = &arr_err[0]; p < &arr_err[arr_size]; p++) {
+		if (p->err == err) {
+			*is_dispatch = p->is_shader_err;
+			strcpy(error_str, p->err_str);
+			ret = true;
+			break;
+		}
+	}
+	return ret;
+}
+
+
+static bool
+get_ip_type(unsigned int ip, char ip_str[64])
+{
+	static const struct ip_struct {
+		enum amd_ip_block_type ip;
+		const char *ip_str;
+	} arr_ip[] = {
+		{ AMD_IP_GFX,       "AMD_IP_GFX" },
+		{ AMD_IP_COMPUTE,   "AMD_IP_COMPUTE" },
+		{ AMD_IP_DMA,       "AMD_IP_DMA" },
+		{ AMD_IP_UVD,       "AMD_IP_UVD" },
+		{ AMD_IP_VCE,       "AMD_IP_VCE" },
+		{ AMD_IP_UVD_ENC,   "AMD_IP_UVD_ENC" },
+		{ AMD_IP_VCN_DEC,   "AMD_IP_VCN_DEC" },
+		{ AMD_IP_VCN_ENC,   "AMD_IP_VCN_ENC" },
+		{ AMD_IP_VCN_JPEG,  "AMD_IP_VCN_JPEG" },
+		{ AMD_IP_VPE,       "AMD_IP_VPE" }
+	};
+
+	const int arr_size = ARRAY_SIZE(arr_ip);
+	const struct ip_struct *p;
+	bool ret = false;
+
+	for (p = &arr_ip[0]; p < &arr_ip[arr_size]; p++) {
+		if (p->ip == ip) {
+			strcpy(ip_str, p->ip_str);
+			ret = true;
+			break;
+		}
+	}
+	return ret;
+}
+
+static int
+read_next_job(struct shmbuf *sh_mem, struct job_struct *job, bool is_good)
+{
+	sem_wait(&sh_mem->sem_state_mutex);
+	if (is_good)
+		*job = sh_mem->good_job;
+	else
+		*job = sh_mem->bad_job;
+	sem_post(&sh_mem->sem_state_mutex);
+	return 0;
+}
+
+static void wait_for_complete_iteration(struct shmbuf *sh_mem)
+{
+	int error_code;
+	unsigned int flags;
+	unsigned int reset_flags;
+
+	while (1) {
+		if (get_test_state(sh_mem, &error_code, &flags) &&
+			get_reset_state(sh_mem, &reset_flags))
+			break;
+		sleep(1);
+	}
+
+}
+
+static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
+		enum amd_ip_block_type ip_good, enum amd_ip_block_type ip_bad,
+		unsigned int ring_id_good, unsigned int ring_id_bad)
+{
+	char error_str[128];
+	char ip_good_str[64];
+	char ip_bad_str[64];
+
+	bool is_dispatch;
+
+	is_dispatch_shader_test(error, error_str, &is_dispatch);
+	get_ip_type(ip_good, ip_good_str);
+	get_ip_type(ip_bad, ip_bad_str);
+
+	//set jobs
+	sem_wait(&sh_mem->sem_state_mutex);
+	sh_mem->bad_job.error = error;
+	sh_mem->bad_job.ip = ip_bad;
+	sh_mem->bad_job.ring_id = ring_id_bad;
+	sh_mem->good_job.error = CMD_STREAM_EXEC_SUCCESS;
+	sh_mem->good_job.ip = ip_good;
+	sh_mem->good_job.ring_id = ring_id_good;
+	sem_post(&sh_mem->sem_state_mutex);
+
+	//sync and wait for complete
+	sync_point_enter(sh_mem);
+	wait_for_complete_iteration(sh_mem);
+	sync_point_exit(sh_mem);
+}
+
+static int
+shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
+{
+	int ret = 0;
+
+	if (shmp && unmap) {
+		munmap(shmp, sizeof(struct shmbuf));
+		sem_destroy(&shmp->sem_mutex);
+		sem_destroy(&shmp->sem_state_mutex);
+		sem_destroy(&shmp->sync_sem_enter);
+		sem_destroy(&shmp->sync_sem_exit);
+	}
+	if (shm_fd > 0)
+		close(shm_fd);
+
+	shm_unlink(SHARED_MEM_NAME);
+
+	return ret;
+}
+
+static int
+shared_mem_create(struct shmbuf **ppbuf)
+{
+	int shm_fd = -1;
+	struct shmbuf *shmp = NULL;
+	bool unmap = false;
+
+	// Create a shared memory object
+	shm_fd = shm_open(SHARED_MEM_NAME, O_CREAT | O_RDWR, 0666);
+	if (shm_fd == -1)
+		goto error;
+
+
+	// Configure the size of the shared memory object
+	if (ftruncate(shm_fd, sizeof(struct shmbuf)) == -1)
+		goto error;
+
+	// Map the shared memory object
+	shmp = mmap(0, sizeof(struct shmbuf), PROT_WRITE, MAP_SHARED, shm_fd, 0);
+	if (shmp == MAP_FAILED)
+		goto error;
+
+	unmap = true;
+	if (sem_init(&shmp->sem_mutex, 1, 1) == -1) {
+		unmap = true;
+		goto error;
+	}
+	if (sem_init(&shmp->sem_state_mutex, 1, 1) == -1)
+		goto error;
+
+	if (sem_init(&shmp->sync_sem_enter, 1, 0) == -1)
+		goto error;
+
+	if (sem_init(&shmp->sync_sem_exit, 1, 0) == -1)
+		goto error;
+
+	shmp->count = 0;
+	shmp->test_completed = false;
+	shmp->reset_completed = false;
+
+	*ppbuf = shmp;
+	return shm_fd;
+
+error:
+	shared_mem_destroy(shmp,  shm_fd,  unmap);
+	return shm_fd;
+}
+
+static int
+shared_mem_open(struct shmbuf **ppbuf)
+{
+	int shm_fd = -1;
+	struct shmbuf *shmp = NULL;
+
+	shmp = mmap(NULL, sizeof(*shmp), PROT_READ | PROT_WRITE, MAP_SHARED,
+			SHARED_CHILD_DESCRIPTOR, 0);
+	if (shmp == MAP_FAILED)
+		goto error;
+	else
+		shm_fd = SHARED_CHILD_DESCRIPTOR;
+
+	*ppbuf = shmp;
+
+	return shm_fd;
+error:
+	return shm_fd;
+}
+
+static bool
+is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info)
+{
+	bool enable = true;
+	// TO DO
+
+	return enable;
+}
+
+static int
+amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_handle,
+		const struct amdgpu_ip_block_version *ip_block,
+		struct job_struct *job)
+{
+	const int pm4_dw = 256;
+	struct amdgpu_ring_context *ring_context;
+	int write_length, expect_failure;
+	int r;
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	/* The firmware triggers a badop interrupt to prevent CP/ME from hanging.
+	 * And it needs to be VIMID reset when receiving the interrupt.
+	 * But for a long badop packet, fw still hangs, which is a fw bug.
+	 * So please use a smaller size packet for temporary testing.
+	 */
+	if ((job->ip == AMD_IP_GFX) && (job->error == CMD_STREAM_EXEC_INVALID_OPCODE)) {
+		write_length = 10;
+		expect_failure = 0;
+	} else {
+		write_length = 128;
+		expect_failure = job->error == CMD_STREAM_EXEC_SUCCESS ? 0 : 1;
+	}
+	/* setup parameters */
+	ring_context->write_length =  write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 1;
+	ring_context->ring_id = job->ring_id;
+	igt_assert(ring_context->pm4);
+	ring_context->context_handle = context_handle;
+	r = amdgpu_bo_alloc_and_map(device,
+					ring_context->write_length * sizeof(uint32_t),
+					4096, AMDGPU_GEM_DOMAIN_GTT,
+					AMDGPU_GEM_CREATE_CPU_GTT_USWC, &ring_context->bo,
+					(void **)&ring_context->bo_cpu,
+					&ring_context->bo_mc,
+					&ring_context->va_handle);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
+	ring_context->resources[0] = ring_context->bo;
+	ip_block->funcs->bad_write_linear(ip_block->funcs, ring_context,
+			&ring_context->pm4_dw, job->error);
+
+	r = amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context,
+			expect_failure);
+
+	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
+			ring_context->bo_mc, ring_context->write_length * sizeof(uint32_t));
+	free(ring_context->pm4);
+	free(ring_context);
+	return r;
+}
+
+static int
+run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
+			   struct shmbuf *sh_mem, int num_of_tests)
+{
+	int ret;
+	int test_counter = 0;
+	uint64_t init_flags, in_process_flags;
+	uint32_t after_reset_state, after_reset_hangs;
+	int state_machine = 0;
+	int error_code;
+	unsigned int flags;
+
+	after_reset_state = after_reset_hangs = 0;
+	init_flags = in_process_flags = 0;
+
+	ret = amdgpu_cs_query_reset_state2(arr_context[0], &init_flags);
+	if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)
+		igt_assert_eq(init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS, 0);
+
+	while (num_of_tests > 0) {
+		sync_point_enter(sh_mem);
+		state_machine = 0;
+		error_code = 0;
+		flags = 0;
+		set_reset_state(sh_mem, false, ALL_RESET_BITS);
+		while (1) {
+			if (state_machine == 0) {
+				amdgpu_cs_query_reset_state2(arr_context[test_counter], &init_flags);
+
+				if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET)
+					state_machine = 1;
+
+				if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)
+					state_machine = 2;
+
+			} else if (state_machine == 1) {
+				amdgpu_cs_query_reset_state(arr_context[test_counter],
+						&after_reset_state, &after_reset_hangs);
+				amdgpu_cs_query_reset_state2(arr_context[test_counter],
+						&in_process_flags);
+
+				//TODO refactor this block !
+				igt_assert_eq(in_process_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET, 1);
+				if (get_test_state(sh_mem, &error_code, &flags) &&
+						test_bit(ERROR_CODE_SET_BIT, &flags)) {
+					if (error_code == -ENODATA) {
+						set_reset_state(sh_mem, true, QUEUE_RESET_SET_BIT);
+						break;
+					} else {
+						if (error_code != -ECANCELED && error_code == -ETIME) {
+							set_reset_state(sh_mem, true, GPU_RESET_END_FAILURE_SET_BIT);
+							break;
+						} else {
+							set_reset_state(sh_mem, true, GPU_RESET_BEGIN_SET_BIT);
+							state_machine = 2; //gpu reset stage
+						}
+					}
+				}
+			} else if (state_machine == 2) {
+				amdgpu_cs_query_reset_state(arr_context[test_counter],
+						&after_reset_state, &after_reset_hangs);
+				amdgpu_cs_query_reset_state2(arr_context[test_counter],
+						&in_process_flags);
+				/* here we should start timer and wait for some time until
+				 * the flag AMDGPU_CTX_QUERY2_FLAGS_RESET disappear
+				 */
+				if (!(in_process_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
+					set_reset_state(sh_mem, true, GPU_RESET_END_SUCCESS_SET_BIT);
+					break;
+				}
+			}
+		}
+		sync_point_exit(sh_mem);
+		num_of_tests--;
+		test_counter++;
+	}
+	return ret;
+}
+
+
+
+static int
+run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
+				struct shmbuf *sh_mem, int num_of_tests, uint32_t version)
+{
+	int ret;
+	bool bool_ret;
+	int test_counter = 0;
+	char error_str[128];
+	bool is_dispatch = false;
+	unsigned int reset_flags;
+
+	struct job_struct job;
+	const struct amdgpu_ip_block_version *ip_block_test = NULL;
+
+	while (num_of_tests > 0) {
+		sync_point_enter(sh_mem);
+		set_test_state(sh_mem, false, 0, ERROR_CODE_SET_BIT);
+		read_next_job(sh_mem, &job, false);
+		bool_ret = is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
+		igt_assert_eq(bool_ret, 1);
+		ip_block_test = get_ip_block(device, job.ip);
+		if (is_dispatch) {
+			ret = amdgpu_memcpy_dispatch_test(device, job.ip, job.ring_id, version,
+					job.error);
+		} else {
+			ret = amdgpu_write_linear(device, arr_context[test_counter],
+					ip_block_test, &job);
+		}
+
+		num_of_tests--;
+		set_test_state(sh_mem, true, ret, ERROR_CODE_SET_BIT);
+		while (1) {
+			/*we may have GPU reset vs queue reset */
+			if (get_reset_state(sh_mem, &reset_flags))
+				break;
+			sleep(1);
+		}
+		sync_point_exit(sh_mem);
+		test_counter++;
+	}
+	return ret;
+}
+
+static int
+run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
+					int num_of_tests)
+{
+#define NUM_ITERATION 10000
+	char error_str[128];
+	bool is_dispatch = false;
+	unsigned int reset_flags;
+
+	int r, counter = 0;
+	amdgpu_context_handle context_handle = NULL;
+	struct job_struct job;
+	const struct amdgpu_ip_block_version *ip_block_test = NULL;
+	int error_code;
+	unsigned int flags;
+
+	r = amdgpu_cs_ctx_create(device, &context_handle);
+	igt_assert_eq(r, 0);
+
+
+	while (num_of_tests > 0) {
+		sync_point_enter(sh_mem);
+		read_next_job(sh_mem, &job, true);
+		ip_block_test = get_ip_block(device, job.ip);
+		is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
+		while (1) {
+			r = amdgpu_write_linear(device, context_handle,  ip_block_test, &job);
+			if (get_test_state(sh_mem, &error_code, &flags) &&
+				get_reset_state(sh_mem, &reset_flags)) {
+				//if entire gpu reset then stop back ground jobs
+				break;
+			}
+			if (r != -ECANCELED && r != -ETIME && r != -ENODATA)
+				igt_assert_eq(r, 0);
+			/*
+			 * TODO we have issue during gpu reset the return code assert we put after we check the
+			 * test is completed othewise the job is failed due to
+			 * amdgpu_job_run Skip job if VRAM is lost
+			 * if (job->generation != amdgpu_vm_generation(adev, job->vm)
+			 */
+			counter++;
+
+		}
+		sync_point_exit(sh_mem);
+		num_of_tests--;
+	}
+	r = amdgpu_cs_ctx_free(context_handle);
+	return r;
+}
+
+
+
+
+static int
+run_all(amdgpu_device_handle device, amdgpu_context_handle *arr_context_handle,
+		enum process_type process, struct shmbuf *sh_mem,  int num_of_tests,
+		uint32_t version, pid_t *monitor_child, pid_t *test_child)
+{
+	if (process == PROCESS_TEST) {
+		*monitor_child = fork();
+		if (*monitor_child == -1) {
+			igt_fail(IGT_EXIT_FAILURE);
+		} else if (*monitor_child == 0) {
+			*monitor_child = getppid();
+			run_monitor_child(device, arr_context_handle, sh_mem, num_of_tests);
+				igt_success();
+				igt_exit();
+		}
+		*test_child = fork();
+		if (*test_child == -1) {
+			igt_fail(IGT_EXIT_FAILURE);
+		} else if (*test_child == 0) {
+			*test_child = getppid();
+			run_test_child(device, arr_context_handle, sh_mem, num_of_tests, version);
+			igt_success();
+			igt_exit();
+
+		}
+	} else if (process == PROCESS_BACKGROUND) {
+		run_background(device, sh_mem, num_of_tests);
+		igt_success();
+		igt_exit();
+	}
+	return 0;
+}
+
+static bool
+get_command_line(char cmdline[2048], int *pargc, char ***pppargv, char **ppath)
+{
+	ssize_t total_length = 0;
+	char *tmpline;
+	char **argv = NULL;
+	char *path  = NULL;
+	int length_cmd[16] = {0};
+	int i, argc = 0;
+	ssize_t num_read;
+
+	int fd = open("/proc/self/cmdline", O_RDONLY);
+
+	if (fd == -1) {
+		igt_info("**** Error opening /proc/self/cmdline");
+		return false;
+	}
+
+	num_read = read(fd, cmdline, 2048 - 1);
+	close(fd);
+
+	if (num_read == -1) {
+		igt_info("Error reading /proc/self/cmdline");
+		return false;
+	}
+	cmdline[num_read] = '\0';
+
+	tmpline = cmdline;
+	memset(length_cmd, 0, sizeof(length_cmd));
+
+	/*assumption that last parameter has 2 '\0' at the end*/
+	for (i = 0; total_length < num_read - 2; i++) {
+		length_cmd[i] = strlen(tmpline);
+		total_length += length_cmd[i];
+		tmpline += length_cmd[i] + 1;
+		argc++;
+	}
+	*pargc = argc;
+	if (argc == 0 || argc > 20) {
+		/* not support yet fancy things */
+		return false;
+	}
+	/* always do 2 extra for additional parameter */
+	argv = (char **)malloc(sizeof(argv) * (argc + 2));
+	memset(argv, 0, sizeof(argv) * (argc + 2));
+	tmpline = cmdline;
+	for (i = 0; i < argc; i++) {
+		argv[i] = (char *)malloc(sizeof(char) * length_cmd[i] + 1);
+		memcpy(argv[i], tmpline, length_cmd[i]);
+		argv[i][length_cmd[i]] = 0;
+		if (i == 0) {
+			path = (char *)malloc(sizeof(char) * length_cmd[0] + 1);
+			memcpy(path, tmpline, length_cmd[0]);
+			path[length_cmd[0]] = 0;
+		}
+		argv[i][length_cmd[i]] = 0;
+		tmpline += length_cmd[i] + 1;
+	}
+	*pppargv = argv;
+	*ppath = path;
+
+	return true;
+}
+
+#define BACKGROUND	"background"
+
+static bool
+is_background_parameter_found(int argc, char **argv)
+{
+	bool ret = false;
+	int i;
+
+	for (i = 1; i < argc; i++) {
+		if (strcmp(BACKGROUND, argv[i]) == 0) {
+			ret = true;
+			break;
+		}
+	}
+	return ret;
+}
+
+#define RUNSUBTEST	"--run-subtest"
+static bool
+is_run_subtest_parameter_found(int argc, char **argv)
+{
+	bool ret = false;
+	int i;
+
+	for (i = 1; i < argc; i++) {
+		if (strcmp(RUNSUBTEST, argv[i]) == 0) {
+			ret = true;
+			break;
+		}
+	}
+	return ret;
+}
+
+static bool
+add_background_parameter(int *pargc, char **argv)
+{
+	int argc = *pargc;
+	int len = strlen(BACKGROUND);
+
+	argv[argc] = (char *)malloc(sizeof(char) * len + 1);
+	memcpy(argv[argc], BACKGROUND, len);
+	argv[argc][len] = 0;
+	*pargc = argc + 1;
+	return true;
+}
+
+static void
+free_command_line(int argc, char **argv, char *path)
+{
+	int i;
+
+	for (i = 0; i <= argc; i++)
+		free(argv[i]);
+
+	free(argv);
+	free(path);
+
+}
+
+static int
+launch_background_process(int argc, char **argv, char *path, pid_t *ppid, int shm_fd)
+{
+	int status;
+	posix_spawn_file_actions_t action;
+
+	for(int i = 0; i < argc; i++) {
+		/* The background process only runs when a queue reset is actually triggered. */
+		if(strstr(argv[i], "list-subtests") != NULL)
+			return 0;
+	}
+	posix_spawn_file_actions_init(&action);
+	posix_spawn_file_actions_adddup2(&action, shm_fd, SHARED_CHILD_DESCRIPTOR);
+	status = posix_spawn(ppid, path, &action, NULL, argv, NULL);
+	posix_spawn_file_actions_destroy(&action);
+	if (status != 0)
+		igt_fail(IGT_EXIT_FAILURE);
+	return status;
+}
+
+static void
+create_contexts(amdgpu_device_handle device, amdgpu_context_handle **pp_contexts,
+		int num_of_contexts)
+{
+	amdgpu_context_handle *p_contexts = NULL;
+	int i, r;
+
+	p_contexts = (amdgpu_context_handle *)malloc(sizeof(amdgpu_context_handle)
+			*num_of_contexts);
+
+	for (i = 0; i < num_of_contexts; i++) {
+		r = amdgpu_cs_ctx_create(device, &p_contexts[i]);
+		igt_assert_eq(r, 0);
+	}
+	*pp_contexts = p_contexts;
+
+}
+static void
+free_contexts(amdgpu_device_handle device, amdgpu_context_handle *p_contexts,
+		int num_of_contexts)
+{
+	int i;
+
+	if (p_contexts) {
+		for (i = 0; i < num_of_contexts; i++)
+			amdgpu_cs_ctx_free(p_contexts[i]);
+	}
+}
+
+/* TODO add logic to iterate for all */
+static bool
+get_next_rings(unsigned int ring_begin, unsigned int available_rings,
+		unsigned int *next_ring, unsigned int *next_next_ring)
+{
+	bool ret = false;
+	unsigned int ring_id;
+
+	for (ring_id = ring_begin; (1 << ring_id) & available_rings; ring_id++) {
+		*next_ring = ring_id;
+		*next_next_ring = ring_id + 1;
+
+		if ((*next_ring  & available_rings) && (*next_next_ring & available_rings)) {
+			ret = true;
+			break;
+		}
+	}
+	return ret;
+}
+igt_main
+{
+	char cmdline[2048];
+	int argc = 0;
+	char **argv = NULL;
+	char *path = NULL;
+	enum  process_type process = PROCESS_UNKNOWN;
+	pid_t pid_background;
+	pid_t monitor_child, test_child;
+	int testExitMethod, monitorExitMethod, backgrounExitMethod;
+	posix_spawn_file_actions_t action;
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	struct drm_amdgpu_info_hw_ip info = {0};
+	int fd = -1;
+	int fd_shm = -1;
+	struct shmbuf *sh_mem = NULL;
+
+	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
+	unsigned int ring_id_good = 0;
+	unsigned int ring_id_bad = 1;
+
+	enum amd_ip_block_type ip_test = AMD_IP_COMPUTE;
+	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
+
+	amdgpu_context_handle *arr_context_handle = NULL;
+
+	/* TODO remove this , it is used only to create array of contexts
+	 * which are shared between child processes ( test/monitor/main and
+	 *  separate for background
+	 */
+	unsigned int arr_err[] = {
+			CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
+			CMD_STREAM_EXEC_INVALID_OPCODE,
+			CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+			//CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,TODO  not job timeout, debug why for n31
+			//CMD_STREAM_TRANS_BAD_REG_ADDRESS, TODO  amdgpu: device lost from bus! for n31
+			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
+			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
+			BACKEND_SE_GC_SHADER_INVALID_USER_DATA
+	};
+
+	int const_num_of_tests;
+
+	posix_spawn_file_actions_init(&action);
+
+	if (!get_command_line(cmdline, &argc, &argv, &path))
+		igt_fail(IGT_EXIT_FAILURE);
+
+	if (is_run_subtest_parameter_found(argc, argv))
+		const_num_of_tests = 1;
+	else
+		const_num_of_tests = ARRAY_SIZE(arr_err);
+
+	if (!is_background_parameter_found(argc, argv)) {
+		add_background_parameter(&argc, argv);
+		fd_shm = shared_mem_create(&sh_mem);
+		igt_require(fd_shm != -1);
+		launch_background_process(argc, argv, path, &pid_background, fd_shm);
+		process = PROCESS_TEST;
+	} else {
+		process = PROCESS_BACKGROUND;
+	}
+
+	igt_fixture {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		 r = amdgpu_query_hw_ip_info(device, ip_test, 0, &info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(r, 0);
+
+		asic_rings_readness(device, 1, arr_cap);
+		igt_skip_on(!is_queue_reset_tests_enable(&gpu_info));
+		if (process == PROCESS_TEST)
+			create_contexts(device, &arr_context_handle, const_num_of_tests);
+		else if (process == PROCESS_BACKGROUND)
+			fd_shm = shared_mem_open(&sh_mem);
+
+		igt_require(fd_shm != -1);
+		igt_require(sh_mem != NULL);
+
+		run_all(device, arr_context_handle,
+			process, sh_mem, const_num_of_tests, info.hw_ip_version_major,
+			&monitor_child, &test_child);
+	}
+
+	igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
+	igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH") {
+		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
+				set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
+						ip_background, ip_test, ring_id_good, ring_id_bad);
+		}
+	}
+
+	igt_describe("Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes");
+	igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_OPCODE") {
+		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
+				set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_OPCODE,
+						ip_background, ip_test, ring_id_good, ring_id_bad);
+		}
+	}
+
+	/* TODO  not job timeout, debug why for nv32
+	 *igt_describe("Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes");
+	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC") {
+	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
+	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
+	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,
+	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
+	 *	}
+	 */
+
+	/* TODO  amdgpu: device lost from bus! for nv32
+	 *igt_describe("Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes");
+	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_REG_ADDRESS") {
+	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
+	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
+	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
+	 *	}
+	 */
+
+	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
+	igt_subtest("Handful-by-soft-recovery-amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR") { 
+		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
+				//amdgpu_ring_soft_recovery
+				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
+						ip_background, ip_test, ring_id_good, ring_id_bad);
+		}
+	}
+
+	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
+	igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING") {
+		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
+				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
+						ip_background, ip_test, ring_id_good, ring_id_bad);
+		}
+	}
+
+	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
+	igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_USER_DATA") {
+		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
+				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_USER_DATA,
+						ip_background, ip_test, ring_id_good, ring_id_bad);
+		}
+	}
+
+	igt_fixture {
+		if (process == PROCESS_TEST) {
+			waitpid(monitor_child, &monitorExitMethod, 0);
+			waitpid(test_child, &testExitMethod, 0);
+		}
+		waitpid(pid_background, &backgrounExitMethod, 0);
+		free_contexts(device, arr_context_handle, const_num_of_tests);
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+		shared_mem_destroy(sh_mem, fd_shm, true);
+		posix_spawn_file_actions_destroy(&action);
+	}
+	free_command_line(argc, argv, path);
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 3982a665f..36d65f44b 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -57,6 +57,11 @@ if libdrm_amdgpu.found()
 	else
 		warning('libdrm <= 2.4.109 found, amd_pstate test not applicable')
 	endif
+	if libdrm_amdgpu.version().version_compare('> 2.4.104')
+		amdgpu_progs +=[ 'amd_queue_reset',]
+	else
+		warning('libdrm <= 2.4.104 found, amd_queue_reset test not applicable')
+	endif
 	amdgpu_deps += libdrm_amdgpu
 endif
 
-- 
2.25.1

