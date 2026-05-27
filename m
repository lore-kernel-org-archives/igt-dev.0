Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F9CD5BD2
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 03:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1BD10E229;
	Wed, 27 May 2026 03:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MBZeE8hW";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012045.outbound.protection.outlook.com
 [40.93.195.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A43D10E229
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 03:24:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTCMRrAajLH1iUzrxZdTPXekphrP+yYhNrawtV9i3IlnmQKoNCjcf4Su6v3Vtcv9/v//QSIBUsDjrIWJ8f1itFHmSPNIXKLdgTiqaUSZuycZjRD/pyCzltegjCJw9bbR/23c35rgsTq1gDC8ygPSV8aAWs4H6z0hq6NGT8NN5B2CSVHuHJEspmdEs9O1vFxW5biLwGSULoK/Y21HDu/HJWRWAyH5KMhFbWTDye3WmpRK0p/rv+RMiFoq+oolg/CSHKFDOgpl+St36i+89lye+M0TWNoNwt3l1u1zWTPuMtVyiGbVg0WdcSlRqt9LA3t1asZG0M6FBo64HqqMMAoMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFZZwwVAVpmB8JMGwVk1AxELRgXvPBoeyS41r+qikBs=;
 b=fcxe5DpllvW3HQkkR9Zxgif+1yRDo9vVJ6/N771ToTX30UhbHURq5Wd/9RHlX19fst72PlIc/LKthJz1gnvpJybVWLEQEE1MRkcPUfTtqXJUqMl9EV+MhvtRseTYnhozaGVY1DooOelB8/de3Fr7HMYeAMxtmsXWJ/AS4JUBW6dLgKa9oeA4deZQfwxOdqQc1UNBeA+PP4AVyydMX0LUzAxRmCjDsyTh5bvw9k+nd/1g121nGyB4TqVwECACUFTkvXUPjlq9gv7wQv9O7tNqynDsU41uUjbCW4x/b/N4//BXdOXgeeo1hO0aE2Kt7PUsufk53pb/mRV806kJF98AIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFZZwwVAVpmB8JMGwVk1AxELRgXvPBoeyS41r+qikBs=;
 b=MBZeE8hWxU24DemxNwOM6zlpPpRGiEXmPIbXdBSujYEy/juj15z6ATmG+VUUh09iTFLnm/XsBWV2SEdiLd1jIX1obu+oWPKr8BHGfqE1wQHzpm9ptZgke8VhcJLgkW88Vt1h1K1YO6Pqhn6yzkZ1PlENgcbJNTGgwcAQAXJwUys=
Received: from CH2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:610:57::16)
 by CY8PR12MB7490.namprd12.prod.outlook.com (2603:10b6:930:91::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 03:24:47 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::58) by CH2PR12CA0006.outlook.office365.com
 (2603:10b6:610:57::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 03:24:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 03:24:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 22:24:46 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 22:24:46 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 26 May 2026 22:24:46 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add amd_close_race GPU submission vs fd close
 test
Date: Tue, 26 May 2026 23:23:47 -0400
Message-ID: <20260527032438.137907-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CY8PR12MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ec632e-b559-4cd6-980b-08debb9f811d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: XUUL9vSgJjYmBz6Qc60Hvh7X2mge+bYETMKu9HcIqgSP9jN2sIjHtQ4gtlXj/nFeMZtuiWkygMCIliGtfcj93udO0CZAP6EeJLpf1yq5Bi5idbagg2bh28R0my8EAqFMsCXeD0fnQPFcQrKZ2Qeo7XeiPYgiIPvbzQ7eCJWOn4S/wOSUb3rB5nsV8NNzTRqzDGimbiRz/VmdgWyN8IrlMrM2ELyZ1SPmV6EvQeZmwoYgLo/AJTuEA5iV7YXgrZe8Kyz4k1OHS6KepAT7H8yM15m2WyUzhXb73xEJv2BxXQ4zD0Wt8QpRIzYdVkjKHOjPNyyKHcWDwvVUdF9rikP1VFbj9VvgydrH9uDo0Lqmdaow7syDkrEoxjY8VWuYVlKKJ3UGYen7K3KCv6Vfr4YlOsTKgIE1VQ8h0C9N3dysR/z0HrWxQ6tRwWsoF+/Hgc/iGXt3NoYx9NYzDuvrFs2I6UV1x1sbO+CkXBpa2Sl66YqxAnP7HXJi+cuqJVgw2ME3tZ2hZTYF5et74vuFibAVw8qLLP5wqfCz91VBrCHj1j3gQ5QElOpGBq4y8QsYggeO1Rcv8Vk8uNjrltwkqpXXyqK3j9+uNTgtisul5hqCFnPk474Q0Am2Mkf7FMf5kO18TdXQUoxyeaLaaokxfJQe27nEUZLo/YvUAaY3pWTELru/EPLrtVXutvyIBAPxG8EaDQ84IEkafQtQ93cpfMMv2s1XhBZyzX0+e70UvrVZc/4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: y06hHa1VVn4NnDUFTb2ucXYhQgAwFkU659/1f426xrKKnnPDvNQnsiNa0k+uRaYYmmOcsSeN7r9Q6Ax40MnZVs6xiT3VPJFzQSf6CZYrVzqZZgAWSzrB3UAmvhrrT3E+nZQlw7SR9l6Mask6Fyl3R3NaEuGzdtfeYCCPRFyedw3sM7N5yuo+G3MYbPAmzm2CbMxNY6IQgwXccXlNimK5gWhz1j0zFd7b8x7v95HCTHnLPwJ5tpfUcyxwinI3tlRzyBEeS4N33mBx0mCylxwlYHKX6gRnVd6KzVEZxnS5R1KendLSeFUlusXbJvtuy7rIeabbMapfP48jrVEeqyIEu9T/DVWJx7gkhxgVWHBdOSBJlQXZHAq1USm5NcTUePsrn1R0QzBPnFrXaRfYKTjYQ97PwME9hCZHCTLunjX+bK6qz9+KROoqKqnp1NeCdAGy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 03:24:47.3045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ec632e-b559-4cd6-980b-08debb9f811d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7490
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

Add an IGT test that exercises the race between active GPU command
submission and DRM file descriptor close. When a process closes
its DRM fd (or is terminated) while GPU jobs are still in-flight,
the kernel must ensure all hardware fences signal before tearing
down virtual memory mappings used by the GPU.

The test uses raw DRM ioctls intentionally — libdrm internally
duplicates the file descriptor, which prevents close() from being
the final file reference and thus never triggers drm_release().
With raw ioctls, close(fd) directly initiates VM teardown.

Four subtests with increasing stress levels:

  close-race-low:     2 racer threads, 4 contexts, 20 rounds
  close-race-medium: 10 racer threads, 4 contexts, 20 rounds
  close-race-high:   15 racer threads, 8 contexts, 20 rounds
  close-race-sigkill: 4 child processes killed with SIGKILL

Each racer thread opens a DRM fd, creates GPU contexts, fills an
IB with NOP packets, submits work in a loop, then munmaps the BO
and closes the fd while the GPU is still executing. The test
asserts that the system remains responsive and the GPU recovers
within the timeout.

The sigkill subtest forks child processes that submit GPU work
continuously, then delivers SIGKILL to interrupt any killable
waits in the flush path. This verifies that the release path
correctly waits for hardware completion (uninterruptible) before
proceeding with page table teardown, regardless of signal state.

Failures manifest as IOMMU faults (DMA to freed pages), GPU
page faults (VM_L2_PROTECTION_FAULT), or permanent GPU hangs
on MES-based hardware (GFX11+/GFX12) requiring a power cycle.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_close_race.c | 648 ++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build      |   1 +
 2 files changed, 649 insertions(+)
 create mode 100644 tests/amdgpu/amd_close_race.c

diff --git a/tests/amdgpu/amd_close_race.c b/tests/amdgpu/amd_close_race.c
new file mode 100644
index 000000000..84c2edea3
--- /dev/null
+++ b/tests/amdgpu/amd_close_race.c
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * Test: Race GPU command submission vs DRM fd close.
+ *
+ * Uses RAW DRM ioctls (no libdrm) so that close(fd) is the ONLY file
+ * reference and directly triggers drm_release/PTE teardown.
+ * libdrm internally dups the fd, preventing the race from manifesting.
+ */
+#include "igt.h"
+#include "drmtest.h"
+
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdatomic.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <unistd.h>
+
+/* ---- Raw ioctl structures (union in/out, matches kernel layout) ---- */
+
+union gem_create {
+        struct { uint64_t bo_size, alignment, domains, domain_flags; } in;
+        struct { uint32_t handle, _pad; } out;
+};
+
+struct gem_va {
+        uint32_t handle, _pad, operation, flags;
+        uint64_t va_address, offset_in_bo, map_size;
+};
+
+union gem_mmap {
+        struct { uint32_t handle, _pad; } in;
+        struct { uint64_t addr_ptr; } out;
+};
+
+union gpu_ctx {
+        struct { uint32_t op, flags, ctx_id, priority; } in;
+        struct { uint32_t ctx_id, _pad; } out;
+};
+
+struct cs_chunk {
+        uint32_t chunk_id, length_dw;
+        uint64_t chunk_data;
+};
+
+struct cs_ib {
+        uint32_t _pad, flags;
+        uint64_t va_start;
+        uint32_t ib_bytes, ip_type, ip_instance, ring;
+};
+
+union cs_submit {
+        struct { uint32_t ctx_id, bo_list_handle, num_chunks, flags; uint64_t chunks; } in;
+        struct { uint64_t handle; } out;
+};
+
+struct bo_entry {
+        uint32_t bo_handle, bo_priority;
+};
+
+union bo_list {
+        struct { uint32_t operation, list_handle, bo_number, bo_info_size; uint64_t bo_info_ptr; } in;
+        struct { uint32_t list_handle; } out;
+};
+
+#define IOCTL_GEM_CREATE  _IOWR('d', 0x40, union gem_create)
+#define IOCTL_GEM_MMAP    _IOWR('d', 0x41, union gem_mmap)
+#define IOCTL_CTX         _IOWR('d', 0x42, union gpu_ctx)
+#define IOCTL_BO_LIST     _IOWR('d', 0x43, union bo_list)
+#define IOCTL_CS          _IOWR('d', 0x44, union cs_submit)
+#define IOCTL_GEM_VA      _IOW('d', 0x48, struct gem_va)
+
+#define MAX_CTX       32
+#define IB_SIZE       65536
+#define IB_DWORDS     (IB_SIZE / 4)
+#define NOP_PACKET    0xC0001000  /* PACKET3_NOP - valid on all rings */
+#define VRAM_BO_SIZE  (2 << 20)
+#define VRAM_BO_COUNT 64
+#define VA_GAP        0x10000
+#define GTT_DOMAIN    0x4
+#define VRAM_DOMAIN   0x2
+
+struct racer {
+        int fd;
+        int id;
+        int n_ctx;
+        uint32_t ctx[MAX_CTX];
+        uint32_t ib_h;
+        uint64_t ib_va;
+        uint32_t *ib_p;
+        atomic_int closed;
+        atomic_uint_fast64_t subs;
+        pthread_barrier_t *bar;
+        pthread_t sub_tid;
+        double close_s;
+};
+
+struct test_config {
+        int n_racers;
+        int n_ctx;
+        int rounds;
+        int warmup_ms;
+};
+
+static double now_s(void)
+{
+        struct timespec t;
+
+        clock_gettime(CLOCK_MONOTONIC, &t);
+        return t.tv_sec + t.tv_nsec * 1e-9;
+}
+
+static int submit_nop(int fd, uint32_t ctx_id, uint32_t ib_h,
+                      uint64_t va, int ip)
+{
+        struct bo_entry entry = { .bo_handle = ib_h };
+        union bo_list bl;
+        struct cs_ib ib;
+        struct cs_chunk ck;
+        uint64_t chunk_ptr;
+        union cs_submit cs;
+        union bo_list destroy;
+        int ret;
+
+        memset(&bl, 0, sizeof(bl));
+        bl.in.bo_number = 1;
+        bl.in.bo_info_size = sizeof(entry);
+        bl.in.bo_info_ptr = (uint64_t)(uintptr_t)&entry;
+        if (ioctl(fd, IOCTL_BO_LIST, &bl))
+                return -1;
+
+        memset(&ib, 0, sizeof(ib));
+        ib.va_start = va;
+        ib.ib_bytes = IB_SIZE;
+        ib.ip_type = ip;
+
+        memset(&ck, 0, sizeof(ck));
+        ck.chunk_id = 1; /* AMDGPU_CHUNK_ID_IB */
+        ck.length_dw = sizeof(ib) / 4;
+        ck.chunk_data = (uint64_t)(uintptr_t)&ib;
+        chunk_ptr = (uint64_t)(uintptr_t)&ck;
+
+        memset(&cs, 0, sizeof(cs));
+        cs.in.ctx_id = ctx_id;
+        cs.in.bo_list_handle = bl.out.list_handle;
+        cs.in.num_chunks = 1;
+        cs.in.chunks = (uint64_t)(uintptr_t)&chunk_ptr;
+        ret = ioctl(fd, IOCTL_CS, &cs);
+
+        /* Destroy bo list */
+        memset(&destroy, 0, sizeof(destroy));
+        destroy.in.operation = 1;
+        destroy.in.list_handle = bl.out.list_handle;
+        ioctl(fd, IOCTL_BO_LIST, &destroy);
+
+        return ret;
+}
+
+static void *submit_loop(void *arg)
+{
+        struct racer *r = arg;
+        int i, c;
+
+        for (i = 0; i < IB_DWORDS; i++)
+                r->ib_p[i] = NOP_PACKET;
+
+        while (!atomic_load(&r->closed)) {
+                for (c = 0; c < r->n_ctx && !atomic_load(&r->closed); c++) {
+                        if (submit_nop(r->fd, r->ctx[c], r->ib_h,
+                                       r->ib_va, c & 1) == 0)
+                                atomic_fetch_add(&r->subs, 1);
+                }
+        }
+        return NULL;
+}
+
+static void *close_thread(void *arg)
+{
+        struct racer *r = arg;
+        double t;
+
+        pthread_barrier_wait(r->bar);
+        t = now_s();
+        /*
+         * Set closed THEN close - submit_loop may still have an ioctl
+         * in-flight when close() tears down page tables.
+         */
+        atomic_store(&r->closed, 1);
+        /*
+         * munmap BEFORE close so the VMA file reference is dropped.
+         * Without this, close(fd) may not trigger amdgpu_drm_release()
+         * because the mmap VMA holds an extra file reference, preventing
+         * the release path from being exercised.
+         */
+        munmap(r->ib_p, IB_SIZE);
+        close(r->fd);
+        r->close_s = now_s() - t;
+        return NULL;
+}
+
+static int setup_racer(struct racer *r, int id, int n_ctx,
+                       pthread_barrier_t *bar)
+{
+        union gem_create gc;
+        struct gem_va gv;
+        union gem_mmap gm;
+        uint64_t va;
+        int i;
+
+        memset(r, 0, sizeof(*r));
+        r->id = id;
+        r->bar = bar;
+        r->fd = -1;
+
+        r->fd = open("/dev/dri/renderD128", O_RDWR);
+        if (r->fd < 0)
+                return -1;
+
+        for (i = 0; i < n_ctx && i < MAX_CTX; i++) {
+                union gpu_ctx c;
+
+                memset(&c, 0, sizeof(c));
+                c.in.op = 1; /* create */
+                if (ioctl(r->fd, IOCTL_CTX, &c) == 0)
+                        r->ctx[r->n_ctx++] = c.out.ctx_id;
+        }
+
+        va = (uint64_t)(1 + id) << 30;
+        r->ib_va = va;
+
+        memset(&gc, 0, sizeof(gc));
+        gc.in.bo_size = IB_SIZE;
+        gc.in.alignment = IB_SIZE;
+        gc.in.domains = GTT_DOMAIN;
+        if (ioctl(r->fd, IOCTL_GEM_CREATE, &gc)) {
+                close(r->fd);
+                r->fd = -1;
+                return -1;
+        }
+        r->ib_h = gc.out.handle;
+
+        memset(&gv, 0, sizeof(gv));
+        gv.handle = gc.out.handle;
+        gv.operation = 1; /* MAP */
+        gv.flags = 6;     /* readable | writeable */
+        gv.va_address = va;
+        gv.map_size = IB_SIZE;
+        ioctl(r->fd, IOCTL_GEM_VA, &gv);
+
+        memset(&gm, 0, sizeof(gm));
+        gm.in.handle = gc.out.handle;
+        if (ioctl(r->fd, IOCTL_GEM_MMAP, &gm)) {
+                close(r->fd);
+                r->fd = -1;
+                return -1;
+        }
+        r->ib_p = mmap(NULL, IB_SIZE, PROT_READ | PROT_WRITE,
+                        MAP_SHARED, r->fd, gm.out.addr_ptr);
+        if (r->ib_p == MAP_FAILED) {
+                close(r->fd);
+                r->fd = -1;
+                return -1;
+        }
+
+        /* Allocate VRAM BOs to create page table depth (wider race window) */
+        va += VA_GAP;
+        for (i = 0; i < VRAM_BO_COUNT; i++) {
+                union gem_create bo;
+                struct gem_va v;
+
+                memset(&bo, 0, sizeof(bo));
+                bo.in.bo_size = VRAM_BO_SIZE;
+                bo.in.alignment = 4096;
+                bo.in.domains = VRAM_DOMAIN;
+                if (ioctl(r->fd, IOCTL_GEM_CREATE, &bo))
+                        continue;
+
+                memset(&v, 0, sizeof(v));
+                v.handle = bo.out.handle;
+                v.operation = 1;
+                v.flags = 6;
+                v.va_address = va;
+                v.map_size = VRAM_BO_SIZE;
+                ioctl(r->fd, IOCTL_GEM_VA, &v);
+                va += VRAM_BO_SIZE + VA_GAP;
+        }
+
+        return 0;
+}
+
+static void run_close_race(struct test_config *cfg)
+{
+        int round, i;
+
+        for (round = 0; round < cfg->rounds; round++) {
+                pthread_barrier_t bar;
+                struct racer *rs;
+                pthread_t *close_tids;
+                int alive = 0;
+                uint64_t pre;
+                double worst;
+
+                rs = calloc(cfg->n_racers, sizeof(*rs));
+                close_tids = calloc(cfg->n_racers, sizeof(*close_tids));
+                igt_assert(rs && close_tids);
+
+                pthread_barrier_init(&bar, NULL, cfg->n_racers + 1);
+
+                for (i = 0; i < cfg->n_racers; i++) {
+                        if (setup_racer(&rs[i], i, cfg->n_ctx, &bar) == 0)
+                                alive++;
+                }
+                igt_info("round %d/%d: %d alive, ", round + 1,
+                         cfg->rounds, alive);
+                if (!alive) {
+                        pthread_barrier_destroy(&bar);
+                        free(rs);
+                        free(close_tids);
+                        continue;
+                }
+
+                for (i = 0; i < cfg->n_racers; i++) {
+                        if (rs[i].fd >= 0)
+                                pthread_create(&rs[i].sub_tid, NULL,
+                                               submit_loop, &rs[i]);
+                }
+
+                usleep(cfg->warmup_ms * 1000);
+
+                pre = 0;
+                for (i = 0; i < cfg->n_racers; i++)
+                        pre += atomic_load(&rs[i].subs);
+                igt_info("%lu subs, ", (unsigned long)pre);
+
+                for (i = 0; i < cfg->n_racers; i++) {
+                        if (rs[i].fd >= 0)
+                                pthread_create(&close_tids[i], NULL,
+                                               close_thread, &rs[i]);
+                }
+
+                /* Release all close threads simultaneously */
+                pthread_barrier_wait(&bar);
+
+                for (i = 0; i < cfg->n_racers; i++) {
+                        if (rs[i].fd >= 0)
+                                pthread_join(close_tids[i], NULL);
+                }
+                for (i = 0; i < cfg->n_racers; i++) {
+                        if (rs[i].sub_tid)
+                                pthread_join(rs[i].sub_tid, NULL);
+                }
+
+                worst = 0;
+                for (i = 0; i < cfg->n_racers; i++) {
+                        if (rs[i].close_s > worst)
+                                worst = rs[i].close_s;
+                }
+                igt_info("worst_close=%.1fs\n", worst);
+
+                igt_assert_f(worst < 60.0,
+                             "close() took %.1fs - GPU appears hung\n", worst);
+
+                pthread_barrier_destroy(&bar);
+                free(rs);
+                free(close_tids);
+
+                /* Brief pause between rounds for GPU recovery */
+                usleep(500000);
+        }
+}
+
+/*
+ * SIGKILL test: Exercise fd close under fatal signal during GPU execution.
+ *
+ * Fork child processes that submit GPU work in a tight loop, then kill
+ * them with SIGKILL while jobs are in-flight on the hardware.
+ *
+ * Kernel behavior on SIGKILL:
+ *   1. flush callback: drm_sched_entity_flush() uses wait_event_killable()
+ *      which returns immediately when a fatal signal is pending.
+ *   2. release callback: amdgpu_drm_release() must still ensure all HW
+ *      fences have signaled before tearing down page tables.
+ *
+ * Expected behavior:
+ *   - waitpid() takes a few seconds (release waits for HW fences)
+ *   - Zero page faults in dmesg
+ *
+ * Failure indicators:
+ *   - waitpid() returns instantly (no wait for HW completion)
+ *   - VM_L2_PROTECTION_FAULT or IOMMU faults in dmesg
+ *   - Permanent GPU hang on MES-based hardware (GFX11+/GFX12)
+ */
+
+static void __attribute__((noreturn))
+sigkill_child(int child_id, int n_ctx, int pipe_wr)
+{
+        union gem_create gc;
+        struct gem_va gv;
+        union gem_mmap gm;
+        uint32_t ctx[MAX_CTX];
+        uint32_t ib_h;
+        uint64_t va;
+        uint32_t *ib_p;
+        int fd, i, n = 0;
+        char rdy = 'R';
+
+        fd = open("/dev/dri/renderD128", O_RDWR);
+        if (fd < 0)
+                _exit(1);
+
+        /* Create contexts */
+        for (i = 0; i < n_ctx && i < MAX_CTX; i++) {
+                union gpu_ctx c;
+
+                memset(&c, 0, sizeof(c));
+                c.in.op = 1;
+                if (ioctl(fd, IOCTL_CTX, &c) == 0)
+                        ctx[n++] = c.out.ctx_id;
+        }
+        if (n == 0)
+                _exit(1);
+
+        va = (uint64_t)(1 + child_id) << 30;
+
+        /* Create IB buffer in GTT */
+        memset(&gc, 0, sizeof(gc));
+        gc.in.bo_size = IB_SIZE;
+        gc.in.alignment = IB_SIZE;
+        gc.in.domains = GTT_DOMAIN;
+        if (ioctl(fd, IOCTL_GEM_CREATE, &gc))
+                _exit(1);
+        ib_h = gc.out.handle;
+
+        /* Map to GPU VA */
+        memset(&gv, 0, sizeof(gv));
+        gv.handle = ib_h;
+        gv.operation = 1;
+        gv.flags = 6;
+        gv.va_address = va;
+        gv.map_size = IB_SIZE;
+        ioctl(fd, IOCTL_GEM_VA, &gv);
+
+        /* CPU mmap to fill IB with NOPs */
+        memset(&gm, 0, sizeof(gm));
+        gm.in.handle = ib_h;
+        if (ioctl(fd, IOCTL_GEM_MMAP, &gm))
+                _exit(1);
+        ib_p = mmap(NULL, IB_SIZE, PROT_READ | PROT_WRITE,
+                    MAP_SHARED, fd, gm.out.addr_ptr);
+        if (ib_p == MAP_FAILED)
+                _exit(1);
+
+        for (i = 0; i < IB_DWORDS; i++)
+                ib_p[i] = NOP_PACKET;
+
+        /*
+         * CRITICAL: munmap before entering submit loop.
+         * This ensures fd is the ONLY file reference. When we get
+         * SIGKILL'd, the kernel's release() will run immediately
+         * (not deferred until exit_mm tears down VMAs).
+         */
+        munmap(ib_p, IB_SIZE);
+
+        /* Also allocate VRAM BOs for deeper page tables */
+        {
+                uint64_t vram_va = va + VA_GAP;
+
+                for (i = 0; i < VRAM_BO_COUNT; i++) {
+                        union gem_create bo;
+                        struct gem_va v;
+
+                        memset(&bo, 0, sizeof(bo));
+                        bo.in.bo_size = VRAM_BO_SIZE;
+                        bo.in.alignment = 4096;
+                        bo.in.domains = VRAM_DOMAIN;
+                        if (ioctl(fd, IOCTL_GEM_CREATE, &bo))
+                                continue;
+
+                        memset(&v, 0, sizeof(v));
+                        v.handle = bo.out.handle;
+                        v.operation = 1;
+                        v.flags = 6;
+                        v.va_address = vram_va;
+                        v.map_size = VRAM_BO_SIZE;
+                        ioctl(fd, IOCTL_GEM_VA, &v);
+                        vram_va += VRAM_BO_SIZE + VA_GAP;
+                }
+        }
+
+        /* Signal parent: ready to be killed */
+        write(pipe_wr, &rdy, 1);
+        close(pipe_wr);
+
+        /* Submit NOPs forever until SIGKILL arrives */
+        for (;;) {
+                for (i = 0; i < n; i++)
+                        submit_nop(fd, ctx[i], ib_h, va, i & 1);
+        }
+}
+
+static void run_sigkill_race(int n_children, int n_ctx,
+                             int warmup_ms, int rounds)
+{
+        int round, i;
+
+        for (round = 0; round < rounds; round++) {
+                pid_t *pids;
+                int (*pipes)[2];
+                double t0, reap_time;
+
+                pids = calloc(n_children, sizeof(*pids));
+                pipes = calloc(n_children, sizeof(*pipes));
+                igt_assert(pids && pipes);
+
+                /* Fork children */
+                for (i = 0; i < n_children; i++) {
+                        igt_assert(pipe(pipes[i]) == 0);
+                        pids[i] = fork();
+                        igt_assert(pids[i] >= 0);
+
+                        if (pids[i] == 0) {
+                                /* Child */
+                                close(pipes[i][0]);
+                                sigkill_child(i, n_ctx, pipes[i][1]);
+                                /* noreturn */
+                        }
+                        close(pipes[i][1]);
+                }
+
+                /* Wait for all children to signal ready */
+                for (i = 0; i < n_children; i++) {
+                        char rdy;
+                        int r;
+
+                        r = read(pipes[i][0], &rdy, 1);
+                        close(pipes[i][0]);
+                        igt_assert_f(r == 1,
+                                     "child %d failed to start\n", i);
+                }
+
+                /* Let children submit for warmup period */
+                usleep(warmup_ms * 1000);
+
+                /* SIGKILL all children simultaneously */
+                for (i = 0; i < n_children; i++)
+                        kill(pids[i], SIGKILL);
+
+                /* Measure how long it takes to reap */
+                t0 = now_s();
+                for (i = 0; i < n_children; i++) {
+                        int status;
+
+                        waitpid(pids[i], &status, 0);
+                        igt_assert(WIFSIGNALED(status) &&
+                                   WTERMSIG(status) == SIGKILL);
+                }
+                reap_time = now_s() - t0;
+
+                igt_info("round %d/%d: killed %d children, "
+                         "reap=%.2fs\n",
+                         round + 1, rounds, n_children, reap_time);
+
+                /*
+                 * Reap takes a few seconds when the release path
+                 * correctly waits for HW fences (timeout + reset).
+                 * Assert GPU did not permanently hang (reap < 120s).
+                 */
+                igt_assert_f(reap_time < 120.0,
+                             "reap took %.1fs - GPU permanently hung\n",
+                             reap_time);
+
+                free(pids);
+                free(pipes);
+
+                /* Brief pause for GPU recovery between rounds */
+                usleep(1000000);
+        }
+}
+
+int igt_main()
+{
+        int master_fd = -1;
+
+        igt_fixture() {
+                master_fd = drm_open_driver(DRIVER_AMDGPU);
+                igt_require(master_fd >= 0);
+        }
+
+        igt_describe("Race fd close vs GPU execution - low concurrency");
+        igt_subtest("close-race-low") {
+                struct test_config cfg = {
+                        .n_racers = 2,
+                        .n_ctx = 4,
+                        .rounds = 20,
+                        .warmup_ms = 300,
+                };
+                run_close_race(&cfg);
+        }
+
+        igt_describe("Race fd close vs GPU execution - medium concurrency");
+        igt_subtest("close-race-medium") {
+                struct test_config cfg = {
+                        .n_racers = 10,
+                        .n_ctx = 4,
+                        .rounds = 20,
+                        .warmup_ms = 300,
+                };
+                run_close_race(&cfg);
+        }
+
+        igt_describe("Race fd close vs GPU execution - high concurrency");
+        igt_subtest("close-race-high") {
+                struct test_config cfg = {
+                        .n_racers = 15,
+                        .n_ctx = 8,
+                        .rounds = 20,
+                        .warmup_ms = 500,
+                };
+                run_close_race(&cfg);
+        }
+
+        igt_describe("SIGKILL during GPU execution - tests release path under fatal signal.\n"
+                     "Kills processes with SIGKILL while GPU jobs are in-flight.\n"
+                     "When SIGKILL is delivered, the killable flush is interrupted\n"
+                     "and the release path must still wait for HW completion.\n"
+                     "Check dmesg for VM_L2_PROTECTION_FAULT after running.");
+        igt_subtest("close-race-sigkill") {
+                run_sigkill_race(/* n_children */ 4,
+                                 /* n_ctx */ 4,
+                                 /* warmup_ms */ 500,
+                                 /* rounds */ 10);
+        }
+
+        igt_fixture() {
+                if (master_fd >= 0)
+                        drm_close_driver(master_fd);
+        }
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 801239547..d6fe7e909 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -54,6 +54,7 @@ if libdrm_amdgpu.found()
 			  'amd_mem',
 			  'amd_remote_mem',
                           'amd_userptr_invalidation',
+                          'amd_close_race',
 			]
 	if libdrm_amdgpu.version().version_compare('> 2.4.97')
 		amdgpu_progs +=[ 'amd_syncobj', ]
-- 
2.54.0

