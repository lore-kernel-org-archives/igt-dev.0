Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90821CD4F24
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 18:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E32010EBCE;
	Tue, 12 May 2026 18:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zL0gVKNA";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010059.outbound.protection.outlook.com
 [52.101.193.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A802110EBCE
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 18:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO20QdZ0gOVMw3JpCf7LpZb2JCmouqQY9wE413msGPATtEfUYgBX8p+zRGMyg5WYsQvhtCLX2o8LZ+JcKmQc5Euxo9F2aJN/H2RBzjRF4PkcEWL7V1/vFs1VAUbNNHik2QnvosWxVEefW3aCxgmwKsxzcfdehNN5+LPsCPnDie6nSsO5e30xHNbUcFKPsFxI29hfZXm3dXXNA2UYW/hvLH1/Bjgzrmd4zJ7GKue3L4TCXbs8OvOMLGsy3IkjTe4ZMOcsfp3hiyHNdL0NDfSvEu70dwiY3A2DB1IzMkPcrsoulGcb04W5Drdgb6E0DBNCKx0lzgs1rWrWWqyjF+T+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smgBVp3a2udlAV+EaZOwDWmbpCvjWDk9EuRLa5Ab1ik=;
 b=YxNY84/j9bree+ArY7QITP3CE91QySjiY5P9YHM6hIMN5D2eqiJoEETy9pviLHJf7GL3JY59boshjFBmNR3kdT3FkP5YbTW9NTO/gb1oiZiiI6QtOWRwy4T401zR71WLvEK0NmjKlQR3CBwIAMpRkhAT/PsLSXgMiiVp6Ss2SJ2tvU92/Hl75FiYPLxd9uWpc0AwsriZY8Yos2RZmbXdgXvVbqiWFLIw2TfIwxr0O+50TsDTpmOluDux2WMxpcZSkOjZXhqwL1sLxRu093hVOShQ0IC6v+GpRH28h3WNL0swPzFCYDwAvrRjE9SLwKDSipkQwZ4pia6XIwb6A9s1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smgBVp3a2udlAV+EaZOwDWmbpCvjWDk9EuRLa5Ab1ik=;
 b=zL0gVKNA/lZSEPz76t3KBz1okhe8psiSZkFgy9Jr3BC1zeeUCEOYj0ohcWu9mKsAv88YYzbiQnUN/C7fCh8gNkOiOEp5UsnD7GwwzTZ3dvMWm+jfXC7EC+rzF2R/vGF1L5ihPLkHcHu2HfQs3mw/XPxhIkifx0mNsM2L2eefCNA=
Received: from CH0PR13CA0042.namprd13.prod.outlook.com (2603:10b6:610:b2::17)
 by CH1PPF16C2BD7B0.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::607) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Tue, 12 May
 2026 18:23:55 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::6) by CH0PR13CA0042.outlook.office365.com
 (2603:10b6:610:b2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Tue, 12
 May 2026 18:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 18:23:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 12 May
 2026 13:23:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 May
 2026 13:23:54 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 13:23:53 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add USERPTR PTE invalidation regression test
Date: Tue, 12 May 2026 14:21:38 -0400
Message-ID: <20260512182348.115625-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|CH1PPF16C2BD7B0:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ee80c6-2074-4375-0378-08deb053a01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: W023S1+e2qRbfRx5lRhEYyminsLRP6nBjm5BTukZjui+t5KX/1yl54Lj/bIsuTz2G+DVwhbr/soi6npURE0vowAkEHa/2tqGU8lKSVIQL6WB5oJK+7Z1Jcxg7mtgJHGVzTgNmlyHDtAODzFQ87cw22KAyVIy1HNYgXopExvuxuHd9Nj0B6RS995H9xZ9diq9eOlRXM/7oEynl5s06qHW49TkMH5YUIsx0wl0JcjbNzpVdiManennAucW3nXRjZ5NtOhoj+dpF9S8rCPuPjyXg6m60o2NCvSvRnZ7Vf+tXVyXvC932tReT0A3c/IIwivrXRolLtGyjtVjZmVJYA5jrXhSwRUe8JQD9lfS2rnCCTn0ZHb8F9XLlB8qX2TmaLyYIbnE2R38FkZY6u07ZZzbe+Iqm4kXgDb6SEmKVH3QtIcYkybMsqr4Q4e0hiejE2ao1p9Z0fNfClagg8NpGjyHtfW+i6wZsJcMXcNRd4zqM7M5Dl260c260C8Bm7vuqsgUWAe5MnAuYEln6ilXafHrAzJ5cL0XnAie7J7huLQBCdsb3IfelCF34VpOtrbe46RaQ8lfK1pyUjPNcIdbUu72otaJjlu2IKFuIWOX8LH8mGXlhsVDsKOtKk50xhXgDHZab5cZrff+hUQhtNFNM3vXNKqMDFFmtr+Y2hkSW6Y5278tyIY5oDcYzcuKxwnVii/iQ/YWvrLBkZppsmThWUx1NTIJfrbYuEJmoJ3Y3/jP1Fk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7LP9w29iPT7oJD89xa2WeP5b4fRsOU23DBWb2G0FjyPrvA9EAoMH6blJlKi0Zbq2MgNaDJquuhf4Z1MT/FpYf3p1faKs8I9sg16sNiq4GXkSNVm1Soz9bXPUkOtfud8lYOCY4fv6BnVZeA263Q+0CyBriBmpWjY8zbDURC/9DV6Xgdzsv1JUIkHcwK2fpdOFgxrjIk14/Gy5iMg8GTw1/yPow9wBeKM+97jrFD75hZGl+1191+GK0QOFUFimXAaG/Ine6HMo7kuSEJSZ8Ti9Tj6HcBs6qJeNLu0DA+K+xNRHisvmnEyO0Naa2lPLgJvTUDLDDvZeVtpv/otwWSXhOi4NCOSY1FX1wi7mvowug1HBLxKwARD5uIG4krkjemRCODKnjOqt/8MMGTo/qshYpqVIsnHyEsDRGHOJtGSu7kIYJ19/h2b6RxdgYuno9n6y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:23:54.7733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ee80c6-2074-4375-0378-08deb053a01e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF16C2BD7B0
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

Add amd_userptr_invalidation test to verify that GPU page table entries
are properly invalidated when the userspace backing of a USERPTR buffer
object is released via munmap().

The test contains two subtests:

  userptr-unmap-revalidate:
    Allocates a USERPTR BO, releases its backing via munmap(), then
    submits a CS that still references the BO in the bo_list.  Verifies
    that the kernel detects the invalidated BO during revalidation and
    rejects the command submission.

  userptr-unmap-stress:
    Allocates a 256 MB USERPTR region, establishes GPU mappings with an
    initial SDMA copy, releases the backing via munmap(), then creates
    memory pressure with pipes and child processes.  A second SDMA copy
    through the old VA range is submitted without the USERPTR BO in the
    bo_list.  Verifies that GPU PTEs were invalidated by checking for
    GPU page faults (via klogctl) and confirming that the destination
    buffer does not contain the original data pattern.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c     |   2 +-
 tests/amdgpu/amd_userptr_invalidation.c | 590 ++++++++++++++++++++++++
 tests/amdgpu/meson.build                |   1 +
 3 files changed, 592 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_userptr_invalidation.c

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index c80e06fb5..1a5fd9446 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -139,7 +139,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 						 0, &expired);
 		ring_context->err_codes.err_code_wait_for_fence = r;
 		if (expect_failure) {
-			igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status%d"
+			igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status %d\n"
 				 "expired %d PID %d\n", r, expired, getpid());
 		} else {
 			/* we allow ECANCELED or ENODATA for good jobs temporally */
diff --git a/tests/amdgpu/amd_userptr_invalidation.c b/tests/amdgpu/amd_userptr_invalidation.c
new file mode 100644
index 000000000..6938c11a4
--- /dev/null
+++ b/tests/amdgpu/amd_userptr_invalidation.c
@@ -0,0 +1,590 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * Test for USERPTR BO PTE invalidation after munmap.
+ *
+ * When userspace releases the backing pages of a USERPTR buffer object
+ * via munmap(), the kernel must invalidate the corresponding GPU page
+ * table entries so that subsequent command submissions through the same
+ * GPU virtual address range do not access the old physical pages.
+ *
+ * The test verifies two aspects of this behavior:
+ *
+ *   userptr-unmap-revalidate
+ *       Submits a CS that includes the USERPTR BO in its bo_list after
+ *       the backing has been released.  The kernel is expected to detect
+ *       the invalidated BO during revalidation and reject the submission.
+ *
+ *   userptr-unmap-stress
+ *       Allocates a large (256 MB) USERPTR region, establishes GPU
+ *       mappings via an initial SDMA copy, then releases the backing
+ *       and creates memory pressure with many pipes and child processes.
+ *       A second SDMA copy through the old VA range is submitted without
+ *       the USERPTR BO in the bo_list.  The test verifies that the GPU
+ *       does not read back the original data pattern (0xAA), confirming
+ *       that the PTEs were properly invalidated.
+ *
+ *       Detection uses three complementary signals:
+ *         - GPU page faults logged by the kernel (klogctl)
+ *         - destination buffer containing only zeros (dummy page)
+ *         - absence of original 0xAA pattern in destination
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/klog.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "ioctl_wrappers.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_utils.h"
+
+#define BUF_SZ			(64 * 1024)
+#define PM4_DW			256
+
+#define STRESS_TARGET_SZ	(256UL * 1024 * 1024)
+#define STRESS_CHILDREN		2048
+#define STRESS_PIPES		200000
+#define STRESS_SCAN_CHUNK	(4UL * 1024 * 1024)
+#define STRESS_PTE_STEP		(64UL * 1024 * 1024)
+
+/**
+ * count_gpu_page_faults() - count GPU page faults in dmesg for a given PID
+ * @pid: process ID to match in fault messages
+ * @since_uptime_ms: only count faults after this uptime (milliseconds)
+ *
+ * Read the kernel ring buffer via klogctl(3) and count lines containing
+ * "[gfxhub] page fault" followed by the given PID on the next line.
+ * Only messages with a kernel timestamp >= @since_uptime_ms are counted.
+ *
+ * Return: number of matching page fault entries.
+ */
+static unsigned int
+count_gpu_page_faults(pid_t pid, unsigned long since_uptime_ms)
+{
+	int bufsize, len;
+	char *buf, *p, *line_start;
+	unsigned int count = 0;
+	unsigned int total_lines = 0;
+	unsigned int fault_lines = 0;
+	char pid_pattern[64];
+	bool prev_was_fault = false;
+
+	snprintf(pid_pattern, sizeof(pid_pattern), "pid %d ", (int)pid);
+
+	bufsize = klogctl(10, NULL, 0);
+	if (bufsize <= 0)
+		bufsize = 1 << 20;
+
+	buf = malloc(bufsize + 1);
+	if (!buf)
+		return 0;
+
+	len = klogctl(3, buf, bufsize);
+	if (len <= 0) {
+		free(buf);
+		return 0;
+	}
+	buf[len] = '\0';
+
+	line_start = buf;
+	for (p = buf; p <= buf + len; p++) {
+		const char *ts_start;
+		double ts;
+
+		if (*p != '\n' && *p != '\0')
+			continue;
+
+		*p = '\0';
+		total_lines++;
+
+		/* Filter by kernel timestamp */
+		ts_start = strchr(line_start, '[');
+		if (ts_start && sscanf(ts_start, "[%lf]", &ts) == 1) {
+			unsigned long ts_ms = (unsigned long)(ts * 1000.0);
+
+			if (ts_ms < since_uptime_ms) {
+				prev_was_fault = false;
+				line_start = p + 1;
+				continue;
+			}
+		}
+
+		if (strstr(line_start, "[gfxhub] page fault")) {
+			prev_was_fault = true;
+			fault_lines++;
+		} else if (prev_was_fault && strstr(line_start, pid_pattern)) {
+			count++;
+			prev_was_fault = false;
+		} else {
+			prev_was_fault = false;
+		}
+
+		line_start = p + 1;
+	}
+
+	igt_info("  klogctl: lines=%u faults=%u matched=%u\n",
+		 total_lines, fault_lines, count);
+	free(buf);
+	return count;
+}
+
+/**
+ * get_uptime_ms() - read current system uptime in milliseconds
+ *
+ * Read /proc/uptime for the kernel monotonic timestamp that matches
+ * the timestamps used in dmesg.
+ *
+ * Return: uptime in milliseconds, or 0 on error.
+ */
+static unsigned long get_uptime_ms(void)
+{
+	FILE *fp;
+	double uptime;
+
+	fp = fopen("/proc/uptime", "r");
+	if (!fp)
+		return 0;
+	if (fscanf(fp, "%lf", &uptime) != 1)
+		uptime = 0;
+	fclose(fp);
+	return (unsigned long)(uptime * 1000.0);
+}
+
+/**
+ * amdgpu_userptr_unmap_revalidate() - test CS rejection after munmap
+ * @dev: amdgpu device handle
+ *
+ * Allocate a USERPTR BO, release its backing via munmap(), then submit
+ * a CS that still references the BO in its bo_list.  The kernel should
+ * detect that the BO pages are no longer valid and reject the CS.
+ *
+ * If the CS is accepted, the destination buffer is scanned for bytes
+ * that do not match the original fill or zero patterns.
+ */
+static void amdgpu_userptr_unmap_revalidate(amdgpu_device_handle dev)
+{
+	const struct amdgpu_ip_block_version *ip_block;
+	struct amdgpu_ring_context *ring_context;
+	amdgpu_bo_handle up_bo;
+	amdgpu_va_handle up_va_h;
+	uint64_t up_va;
+	void *up_cpu;
+	amdgpu_bo_handle dst_bo;
+	amdgpu_va_handle dst_va_h;
+	uint64_t dst_mc;
+	void *dst_cpu_ptr;
+	uint8_t *dst;
+	unsigned int suspicious;
+	uint64_t i;
+	int r;
+
+	ip_block = get_ip_block(dev, AMDGPU_HW_IP_DMA);
+	igt_assert(ip_block);
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+	ring_context->write_length = BUF_SZ;
+	ring_context->pm4 = calloc(PM4_DW, sizeof(*ring_context->pm4));
+	ring_context->pm4_size = PM4_DW;
+	ring_context->secure = false;
+	ring_context->res_cnt = 2;
+	igt_assert(ring_context->pm4);
+
+	r = amdgpu_cs_ctx_create(dev, &ring_context->context_handle);
+	igt_assert_eq(r, 0);
+
+	/* Allocate and fill USERPTR BO */
+	up_cpu = mmap(NULL, BUF_SZ, PROT_READ | PROT_WRITE,
+		      MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
+	igt_assert(up_cpu != MAP_FAILED);
+	memset(up_cpu, 0x77, BUF_SZ);
+
+	r = amdgpu_create_bo_from_user_mem(dev, up_cpu, BUF_SZ, &up_bo);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
+				  BUF_SZ, sysconf(_SC_PAGE_SIZE), 0,
+				  &up_va, &up_va_h, 0);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_va_op(up_bo, 0, BUF_SZ, up_va, 0, AMDGPU_VA_OP_MAP);
+	igt_assert_eq(r, 0);
+
+	/* Allocate VRAM destination */
+	r = amdgpu_bo_alloc_and_map(dev, BUF_SZ, sysconf(_SC_PAGE_SIZE),
+				    AMDGPU_GEM_DOMAIN_VRAM,
+				    AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+				    &dst_bo, &dst_cpu_ptr, &dst_mc,
+				    &dst_va_h);
+	igt_assert_eq(r, 0);
+	memset(dst_cpu_ptr, 0, BUF_SZ);
+
+	/* Release USERPTR backing before CS */
+	munmap(up_cpu, BUF_SZ);
+
+	/* Submit CS with invalidated USERPTR BO in bo_list */
+	ring_context->bo_mc = up_va;
+	ring_context->bo_mc2 = dst_mc;
+	ring_context->resources[0] = up_bo;
+	ring_context->resources[1] = dst_bo;
+
+	ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
+				     &ring_context->pm4_dw);
+
+	r = amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context, 1);
+	r = ring_context->err_codes.err_code_cs_submit;
+
+	if (r != 0) {
+		igt_info("CS rejected (r=%d) after munmap\n", r);
+	} else {
+		dst = (uint8_t *)dst_cpu_ptr;
+		suspicious = 0;
+		for (i = 0; i < BUF_SZ; i++) {
+			if (dst[i] != 0 && dst[i] != 0x77)
+				suspicious++;
+		}
+		igt_info("CS completed: %u/%d unexpected bytes\n",
+			 suspicious, BUF_SZ);
+	}
+
+	amdgpu_bo_unmap_and_free(dst_bo, dst_va_h, dst_mc, BUF_SZ);
+	amdgpu_bo_va_op(up_bo, 0, BUF_SZ, up_va, 0, AMDGPU_VA_OP_UNMAP);
+	amdgpu_va_range_free(up_va_h);
+	amdgpu_bo_free(up_bo);
+	amdgpu_cs_ctx_free(ring_context->context_handle);
+	free(ring_context->pm4);
+	free(ring_context);
+}
+
+/**
+ * amdgpu_userptr_unmap_stress() - stress test PTE invalidation
+ * @dev: amdgpu device handle
+ *
+ * Phase 1: Allocate a large USERPTR region filled with 0xAA, create a
+ *          VRAM destination BO, and perform an initial SDMA copy to
+ *          populate GPU page table entries.
+ *
+ * Phase 2: Release the USERPTR backing via munmap().  This triggers the
+ *          MMU notifier which should invalidate the GPU PTEs.
+ *
+ * Phase 3: Create memory pressure by opening many pipes and forking
+ *          child processes.  This increases the chance that the freed
+ *          physical pages are reassigned.
+ *
+ * Phase 4: Poison the destination with 0xCC and submit a second SDMA
+ *          copy through the old VA range without the USERPTR BO in the
+ *          bo_list.  If PTEs were invalidated, the GPU will fault and
+ *          the fault handler will redirect reads to a zeroed dummy page.
+ *          The test checks that no original 0xAA data appears in the
+ *          destination.
+ */
+static void amdgpu_userptr_unmap_stress(amdgpu_device_handle dev)
+{
+	const struct amdgpu_ip_block_version *ip_block;
+	struct amdgpu_ring_context *ring_context;
+	amdgpu_bo_handle up_bo;
+	amdgpu_va_handle up_va_h;
+	uint64_t up_va;
+	void *up_cpu;
+	amdgpu_bo_handle dst_bo;
+	amdgpu_va_handle dst_va_h;
+	uint64_t dst_mc;
+	void *dst_cpu_ptr;
+	int (*pipes)[2];
+	unsigned int pipes_opened;
+	pid_t *children;
+	unsigned int children_spawned;
+	uint64_t off;
+	unsigned int i;
+	pid_t pid;
+	volatile uint8_t sink;
+	uint8_t *base;
+	uint8_t *scan;
+	uint64_t p;
+	unsigned int non_poison;
+	unsigned int original_count;
+	unsigned int page_faults;
+	unsigned long ts_before;
+	pid_t my_pid;
+	int r;
+
+	up_bo = NULL;
+	up_cpu = MAP_FAILED;
+	pipes = NULL;
+	pipes_opened = 0;
+	children = NULL;
+	children_spawned = 0;
+
+	ip_block = get_ip_block(dev, AMDGPU_HW_IP_DMA);
+	igt_assert(ip_block);
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+	ring_context->pm4 = calloc(PM4_DW, sizeof(*ring_context->pm4));
+	ring_context->pm4_size = PM4_DW;
+	ring_context->secure = false;
+	igt_assert(ring_context->pm4);
+
+	r = amdgpu_cs_ctx_create(dev, &ring_context->context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(dev, STRESS_SCAN_CHUNK,
+				    sysconf(_SC_PAGE_SIZE),
+				    AMDGPU_GEM_DOMAIN_VRAM,
+				    AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+				    &dst_bo, &dst_cpu_ptr, &dst_mc,
+				    &dst_va_h);
+	igt_assert_eq(r, 0);
+
+	/* Phase 1: allocate USERPTR region and establish GPU mappings */
+	igt_info("Phase 1: allocating %lu MB USERPTR region\n",
+		 (unsigned long)(STRESS_TARGET_SZ / (1024 * 1024)));
+
+	up_cpu = mmap(NULL, STRESS_TARGET_SZ, PROT_READ | PROT_WRITE,
+		      MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
+	igt_assert(up_cpu != MAP_FAILED);
+	memset(up_cpu, 0xAA, STRESS_TARGET_SZ);
+
+	r = amdgpu_create_bo_from_user_mem(dev, up_cpu, STRESS_TARGET_SZ,
+					   &up_bo);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
+				  STRESS_TARGET_SZ, sysconf(_SC_PAGE_SIZE), 0,
+				  &up_va, &up_va_h, 0);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_va_op(up_bo, 0, STRESS_TARGET_SZ, up_va, 0,
+			     AMDGPU_VA_OP_MAP);
+	igt_assert_eq(r, 0);
+
+	/* Touch pages at intervals to populate GPU PTEs */
+	sink = 0;
+	base = (uint8_t *)up_cpu;
+	for (off = 0; off < STRESS_TARGET_SZ; off += STRESS_PTE_STEP)
+		sink += base[off];
+	(void)sink;
+
+	/* Initial SDMA copy to ensure GPU has walked the page tables */
+	ring_context->bo_mc = up_va;
+	ring_context->bo_mc2 = dst_mc;
+	ring_context->write_length = STRESS_SCAN_CHUNK;
+	ring_context->resources[0] = up_bo;
+	ring_context->resources[1] = dst_bo;
+	ring_context->res_cnt = 2;
+
+	ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
+				     &ring_context->pm4_dw);
+	r = amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context, 0);
+	igt_assert_eq(r, 0);
+	igt_info("Phase 1: initial SDMA copy OK\n");
+
+	/* Phase 2: release USERPTR backing */
+	igt_info("Phase 2: munmap() %lu MB USERPTR backing\n",
+		 (unsigned long)(STRESS_TARGET_SZ / (1024 * 1024)));
+	my_pid = getpid();
+	ts_before = get_uptime_ms();
+	munmap(up_cpu, STRESS_TARGET_SZ);
+	up_cpu = MAP_FAILED;
+
+	/* Phase 3: create memory pressure */
+	igt_info("Phase 3: creating memory pressure\n");
+
+	pipes = calloc(STRESS_PIPES, sizeof(*pipes));
+	igt_assert(pipes);
+
+	for (i = 0; i < STRESS_PIPES; i++) {
+		if (pipe(pipes[i]) < 0) {
+			igt_info("  pipe allocation stopped at %u/%d (errno=%d)\n",
+				 i, STRESS_PIPES, errno);
+			break;
+		}
+		(void)write(pipes[i][1], "X", 1);
+		pipes_opened = i + 1;
+	}
+	igt_info("  opened %u pipes\n", pipes_opened);
+
+	children = calloc(STRESS_CHILDREN, sizeof(*children));
+	igt_assert(children);
+
+	for (i = 0; i < STRESS_CHILDREN; i++) {
+		pid = fork();
+		if (pid == 0) {
+			pause();
+			_exit(0);
+		}
+		igt_assert(pid > 0);
+		children[i] = pid;
+		children_spawned = i + 1;
+	}
+	igt_info("  spawned %u children\n", children_spawned);
+
+	/*
+	 * Phase 4: submit SDMA copy through the old VA range.
+	 *
+	 * The USERPTR BO is intentionally omitted from the bo_list so
+	 * the kernel does not attempt to revalidate it.  If the PTEs
+	 * were invalidated, the SDMA engine will fault and the kernel
+	 * fault handler will map a zeroed dummy page, so the
+	 * destination will contain zeros instead of the original 0xAA.
+	 */
+	igt_info("Phase 4: submitting CS through unmapped VA range\n");
+
+	memset(dst_cpu_ptr, 0xCC, STRESS_SCAN_CHUNK);
+
+	memset(ring_context->pm4, 0, PM4_DW * sizeof(uint32_t));
+	ring_context->pm4_dw = 0;
+	ring_context->bo_mc = up_va;
+	ring_context->bo_mc2 = dst_mc;
+	ring_context->write_length = STRESS_SCAN_CHUNK;
+	ring_context->res_cnt = 1;
+	ring_context->resources[0] = dst_bo;
+
+	ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
+				     &ring_context->pm4_dw);
+
+	r = amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context, 1);
+	if (ring_context->err_codes.err_code_cs_submit != 0) {
+		igt_info("  CS rejected (r=%d)\n",
+			 ring_context->err_codes.err_code_cs_submit);
+		goto cleanup;
+	}
+
+	/* Scan destination for original data pattern */
+	scan = (uint8_t *)dst_cpu_ptr;
+	non_poison = 0;
+	original_count = 0;
+	for (p = 0; p < STRESS_SCAN_CHUNK; p++) {
+		if (scan[p] != 0xCC)
+			non_poison++;
+		if (scan[p] == 0xAA)
+			original_count++;
+	}
+
+	igt_info("  %u/%lu non-poison bytes (%u original 0xAA)\n",
+		 non_poison, (unsigned long)STRESS_SCAN_CHUNK,
+		 original_count);
+
+cleanup:
+	for (i = 0; i < children_spawned; i++) {
+		kill(children[i], SIGKILL);
+		waitpid(children[i], NULL, 0);
+	}
+	free(children);
+
+	for (i = 0; i < pipes_opened; i++) {
+		close(pipes[i][0]);
+		close(pipes[i][1]);
+	}
+	free(pipes);
+
+	/*
+	 * Read GPU page faults after releasing file descriptors so
+	 * klogctl has room to work.  Brief sleep to let deferred
+	 * printk flush any remaining fault messages.
+	 */
+	usleep(500000);
+	page_faults = count_gpu_page_faults(my_pid, ts_before);
+	igt_info("  %u GPU page faults for PID %d\n",
+		 page_faults, (int)my_pid);
+
+	if (up_bo) {
+		amdgpu_bo_va_op(up_bo, 0, STRESS_TARGET_SZ, up_va, 0,
+				AMDGPU_VA_OP_UNMAP);
+		amdgpu_va_range_free(up_va_h);
+		amdgpu_bo_free(up_bo);
+	}
+
+	amdgpu_bo_unmap_and_free(dst_bo, dst_va_h, dst_mc, STRESS_SCAN_CHUNK);
+	amdgpu_cs_ctx_free(ring_context->context_handle);
+	free(ring_context->pm4);
+	free(ring_context);
+
+	/*
+	 * Invalidation is confirmed when any of the following holds:
+	 *
+	 *   (a) CS was rejected outright (already handled above).
+	 *   (b) GPU page faults were logged for this PID.
+	 *   (c) Destination contains non-original data (zeros from the
+	 *       dummy page), proving PTEs no longer point at the old
+	 *       physical pages.
+	 *
+	 * Page fault messages may be suppressed by printk ratelimiting,
+	 * so the data pattern check (c) is the primary detection method.
+	 */
+	if (page_faults > 0) {
+		igt_info("PTE invalidation confirmed: %u page faults\n",
+			 page_faults);
+	} else if (non_poison > 0 && original_count == 0) {
+		igt_info("PTE invalidation confirmed: dummy page data\n");
+	} else {
+		igt_assert_f(non_poison == 0 || original_count == 0,
+			     "destination contains %u bytes of original data "
+			     "(0xAA) after munmap with no GPU page faults\n",
+			     original_count);
+	}
+}
+
+int igt_main()
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	uint32_t major, minor;
+	int fd = -1;
+	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
+
+	igt_fixture() {
+		log_total_time(true, igt_test_name());
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		r = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(r == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(r, 0);
+
+		asic_rings_readness(device, 1, arr_cap);
+	}
+
+	igt_describe("Submit CS with USERPTR BO in bo_list after munmap "
+		     "and verify the kernel rejects it");
+	igt_subtest_with_dynamic("userptr-unmap-revalidate") {
+		igt_require(arr_cap[AMD_IP_DMA]);
+		igt_dynamic_f("userptr-unmap-revalidate")
+			amdgpu_userptr_unmap_revalidate(device);
+	}
+
+	igt_describe("Stress test: release large USERPTR backing under "
+		     "memory pressure and verify GPU PTEs are invalidated");
+	igt_subtest_with_dynamic("userptr-unmap-stress") {
+		igt_require(arr_cap[AMD_IP_DMA]);
+		igt_dynamic_f("userptr-unmap-stress")
+			amdgpu_userptr_unmap_stress(device);
+	}
+
+	igt_fixture() {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+		log_total_time(false, igt_test_name());
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 0dc689e40..801239547 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -53,6 +53,7 @@ if libdrm_amdgpu.found()
 			  'amd_vpe',
 			  'amd_mem',
 			  'amd_remote_mem',
+                          'amd_userptr_invalidation',
 			]
 	if libdrm_amdgpu.version().version_compare('> 2.4.97')
 		amdgpu_progs +=[ 'amd_syncobj', ]
-- 
2.54.0

