Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E79C98310
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E20310F37E;
	Thu, 24 Sep 2026 07:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N0K+g7eX";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4AA10F378
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX/xymCnKWz7PTBrMzh18MhBNl5WPGR92T/0S9TTbdLwZFdK9427k4a329q90/QNIaS9llN/4DSl5u64MsqXg0kn/GoQcKA6tmzFeGGflnoVdEd79wrRZ4oapKqUGiZ8K0lP+3lsPSvlZFTkmnxaqZdEJhsKBtZYhejuDA8tADNr+3B3qvaTnPJLFWAerv6lTBcwgPGvOuibuJPy3EqQGoFntsv583GWQJ+vrijvvDY4yI1b0FEWcHVSB7zskpbI/PThKH7A/DRvxsbWVwtGY/Vm2kVfOzBugoaah7611m0a3eTiiDh/aoT6jm86dWOLXxFOeX9IqzzeLwCqFuHmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfYp6LD84S+6OI7+zJbpd8ize8pYvvRFdPnww1RpOpI=;
 b=CQtXqYJnS0v5A+eYhgQYlPrb9dOlNj9+gD6rX5kE8cVhnM1YvagpQrmJOkx7SQVW2xRcazFbH5I1tRKoCQ3LR0TUQtuA/nF2M1QaaSAUtHmVe57nR4pjrT0YKW+JpEdkKiPGo+DOd3NRMP0oOO6p4SW6K+JwW6lse/xmrc6W4rbxNb94VpBXmax4U5T+5QX0j+7/x48xjRvMofXRIQyhtgNpODRS4+MwrREfyGZu0wlA6+/JzhGZ7DWjdrpY3IVUg/le8NqTQw+g0SoT9PhP6Jz0x3JoMPxl5XbgSt7xkda+NHi2qL1b9fYGWyBrxQN1Mgp1SdycQD2h5sCkmSRyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfYp6LD84S+6OI7+zJbpd8ize8pYvvRFdPnww1RpOpI=;
 b=N0K+g7eXWOH47un9B4UoF0SWTvBN3kIjl5rVXbffVkyG2MbsQp/aFSmYKVGf7Mm5D8vwoUx5l0HjRKI17qPNcDaR6sH7mZcsMuY9/lM+r4DcpXW/fnyawCFmAz1x3DQcciFAH3udL+lBm/2Qw0PaG4oCNZK09qDInGyyJnT3YVI=
Received: from BN9P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::29)
 by PH8PR12MB6698.namprd12.prod.outlook.com (2603:10b6:510:1cd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 07:45:11 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::98) by BN9P221CA0030.outlook.office365.com
 (2603:10b6:408:10a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 24 Sep 2026 07:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 07:45:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:45:07 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:45:06 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 02:45:05 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Claude <noreply@anthropic.com>
Subject: [PATCH i-g-t 3/3] tests/amdgpu: add userq wptr-offset checks to
 amd_fuzzing
Date: Thu, 24 Sep 2026 15:44:41 +0800
Message-ID: <20260924074500.169386-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260924074500.169386-1-Jesse.Zhang@amd.com>
References: <20260924074500.169386-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|PH8PR12MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d45cd8-26ff-46ba-5360-08df1a0fc351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|6133799003|22082099003|18002099003|56012099006|10067099003|6123799006|11063799006;
X-Microsoft-Antispam-Message-Info: JBuNhT0EY9ElJ8tbpm35ExuB2UbtOOXUYscnj3ljChqF0LH1coS/mtCzSsrXOoGl8AnAObEKBYjjpYIuXD3CK+hHmO6kGxussR/Ryzw6XFzTpQ9IJrdX28l21KEMA1AbvMA/QFluzvtVClzoAwA9F1/zfYy3eJ25LWyOkcIZAoK+DHcf5/4Gv6lfK5vlbEo6VdatEdcWgZ72sT1EQCVg7DjeJCc7v3UgSBo+ofTCWwNpFaWzsYLYNYq+kERAsVHjGopTnSQbvTLDwmRVyiJMBG4fsx2uc9/i2OdhTqxAaNb0rG0hRO4/eVjB0mUJzi6Q/0dAxrpN0Vcmv3Wxi3MLwuKtv3uRIEsPzhoTx0iISMpkYsswgTmme81BTDrZTw4LPCDA/LGYDvdRKcPFCFsvKElwNaRxLw5K/bLNHLNzMe4R8bDzuPCcZTKMxBZGhdwe3/vQod0jKv/0PgqUwE+vjQ941v6XPlLB+aP2I62F+0XrSM1bZHnQllrlPBobxDT5l83Dy7Am/3Hpb4k/gXX3wXgxlcrKK+OztbctOrlhBicpq09KKH38jAUciFeJ4hWMAqO8IFarITS2vrGRygPAZRRmpIhEr7jooIAqre/1zIe4H1W9cNigRKtsYLe7UQajVJSQG633KbDnAb3IfHeOhdDETE+QpsN5gVVHrq9aOZrD7UlZzpfUyP9Q+YKFZZJeaDgey9HFMOW1MamZNyltWA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003)(6123799006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: No/bTdW4GoDuP8Kkv3DaVHbSdUJ+zDT8n728UWbIUwBaX6letgZYzc+p78QYU/4azhkZn497FZhkxoilEMVTerqwtd1HrcNbvrSpRmI733fMKwL7/MpJu4k8t+Edj8A7O4IBRplxmg28ykavTRf/40jT18gTSvfujkRG4scV15XBx2+YHb3yR06odluVx+llH20sGNPqy0bqRG9XdItAwDJVL96an7zqlsBMAQffrnrXTHgVy1asWZyivsUQ8BvYYs5ZotfrRc3UQqGzwOqlnRpzbHpiqAwZB+6nP0Xj19IXiY68pQG0oGwJs5QBpUBV1MAaNSv/16+HX+IV+yv8nHkVDgkWYctXNdTYCA6DhCMKmXNO+M5isgKMJSQe4Wz5mUly57KXqPAENUk3EnDYn3y+EH4BOHzJVgqWUGVRZXi7r8RW75NEHFMhl+jhpHgA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 07:45:11.3191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d45cd8-26ff-46ba-5360-08df1a0fc351
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6698
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

Add three subtests exercising the userq wptr read path with the wptr
placed at a non-zero offset inside its BO:

- userq-wptr-offset-fence-sdma: discriminating check. Places the wptr at
  a non-zero BO offset, writes a known value there and poisons offset 0,
  then issues USERQ_SIGNAL + USERQ_WAIT and asserts the returned fence
  value equals the value at the wptr offset. A kernel that reads BO
  offset 0 returns the poison value and fails. Does not depend on the
  queue executing an IB.
- userq-wptr-offset-{gfx,sdma}: end-to-end submit with the wptr at a
  non-zero offset; requires firmware that can schedule the queue.

Uses the ip_block userq_create/submit/destroy indirection and the
wptr_offset knob on struct amdgpu_ring_context.

Co-Authored-By: Claude <noreply@anthropic.com>
Change-Id: Ie4f7f4928d077d2c42cf2d5337bf2878c33df58b
---
 tests/amdgpu/amd_fuzzing.c | 204 +++++++++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index 9d7468ea4..36dd5d388 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -8,6 +8,7 @@
 #include "lib/amdgpu/amd_ip_blocks.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_command_submission.h"
 #include "lib/ioctl_wrappers.h"
 
 #include <errno.h>
@@ -23,6 +24,17 @@
 #define AMD_CONC_THREADS 4
 #define AMD_CONC_ITERS   128
 
+/* Bounded wait so a buggy kernel fails instead of hanging into a GPU reset. */
+#define WPTR_SUBMIT_TIMEOUT_NS (5ULL * 1000 * 1000 * 1000)
+/* 8-byte aligned, < PAGE_SIZE: wptr lands in the middle of its BO. */
+#define WPTR_TEST_OFFSET       2048
+/* Known wptr value placed at WPTR_TEST_OFFSET; distinct from the offset-0
+ * poison so a kernel that ignores the offset returns the wrong value. */
+#define WPTR_TEST_VALUE        32
+/* Poison at BO offset 0, distinct from WPTR_TEST_VALUE: a kernel that ignores
+ * the wptr offset reads this instead of WPTR_TEST_VALUE. */
+#define WPTR_POISON_VALUE      8
+
 #ifdef AMDGPU_USERQ_ENABLED
 struct amd_test_userq_ctx;
 
@@ -2712,6 +2724,180 @@ amd_userq_concurrent_fuzzing(int fd, amdgpu_device_handle dev,
 			 amd_userq_ip_name(ip_type));
 	}
 }
+
+/*
+ * Directly exercise the wptr read path: the userq wptr may sit at a non-zero
+ * offset inside its BO. USERQ_SIGNAL reads that wptr and uses it as the seqno
+ * of the exported userq fence, which USERQ_WAIT returns as the fence value.
+ * With the wptr at a non-zero BO offset, a kernel that reads BO offset 0 gets
+ * the poison value instead of WPTR_TEST_VALUE, so the returned fence value is
+ * wrong and this test fails.
+ *
+ * The queue is only signalled, never activated (its doorbell is never rung),
+ * so no IB executes. On teardown the kernel finds the queue was never mapped
+ * to a HW slot and force-completes its fence, so destroy does not block. This
+ * checks the wptr read path directly and does not depend on the firmware being
+ * able to schedule the queue.
+ */
+static void
+amd_userq_wptr_offset_fence(amdgpu_device_handle device, unsigned int ip_type)
+{
+	struct amdgpu_ring_context *ring_context;
+	const struct amdgpu_ip_block_version *ip_block;
+	struct drm_amdgpu_userq_fence_info fence_info = { 0 };
+	struct drm_amdgpu_userq_signal signal_data = { 0 };
+	struct drm_amdgpu_userq_wait wait_data = { 0 };
+	uint32_t syncobj;
+	int r;
+
+	ip_block = get_ip_block(device, ip_type);
+	igt_require(ip_block);
+	igt_require(ip_block->funcs->userq_create);
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	ring_context->user_queue = true;
+	/* Place the wptr away from BO offset 0; the lib poisons offset 0. */
+	ring_context->wptr_offset = WPTR_TEST_OFFSET;
+
+	ip_block->funcs->userq_create(device, ring_context, ip_type);
+
+	r = amdgpu_cs_create_syncobj(device, &syncobj);
+	igt_assert_eq(r, 0);
+
+	/*
+	 * Seed offset 0 with a poison value distinct from WPTR_TEST_VALUE and
+	 * place the real wptr at WPTR_TEST_OFFSET. A kernel that ignores the
+	 * offset reads the poison instead of WPTR_TEST_VALUE.
+	 */
+	*(volatile uint64_t *)((uint8_t *)ring_context->wptr_cpu -
+			       WPTR_TEST_OFFSET) = WPTR_POISON_VALUE;
+	*ring_context->wptr_cpu = WPTR_TEST_VALUE;
+	__sync_synchronize();
+
+	/* USERQ_SIGNAL reads the wptr and uses it as the fence seqno. */
+	signal_data.queue_id = ring_context->queue_id;
+	signal_data.syncobj_handles = (uintptr_t)&syncobj;
+	signal_data.num_syncobj_handles = 1;
+	r = amdgpu_userq_signal(device, &signal_data);
+	igt_assert_eq(r, 0);
+
+	/* USERQ_WAIT returns the fence va/value pair for the syncobj. */
+	wait_data.waitq_id = ring_context->queue_id;
+	wait_data.syncobj_handles = (uintptr_t)&syncobj;
+	wait_data.num_syncobj_handles = 1;
+	wait_data.num_fences = 1;
+	wait_data.out_fences = (uintptr_t)&fence_info;
+	r = amdgpu_userq_wait(device, &wait_data);
+	igt_assert_eq(r, 0);
+
+	igt_assert_eq_u32(wait_data.num_fences, 1);
+
+	amdgpu_cs_destroy_syncobj(device, syncobj);
+
+	/*
+	 * Do not call the explicit USERQ_DESTROY ioctl here: it cancels the
+	 * queue's hang-detect worker and then waits for the last fence, which
+	 * never completes because the queue was never executed. The queue (and
+	 * its fence) are reclaimed when the device fd is closed at the end of
+	 * the test, where the teardown path force-completes the fence. Leak the
+	 * small ring_context allocation to keep the wptr BO mapping alive until
+	 * then.
+	 */
+
+	/*
+	 * The core assertion: the fence value must equal the wptr written at
+	 * WPTR_TEST_OFFSET. A kernel that ignores the offset reads BO offset 0
+	 * and returns the poison value instead.
+	 */
+	igt_assert_eq_u64(fence_info.value, WPTR_TEST_VALUE);
+}
+
+/*
+ * End-to-end variant: submit a real IB with the wptr at a non-zero offset and
+ * wait for completion. Requires firmware that can schedule the user queue. On
+ * a kernel that mishandles the wptr offset the completion fence never signals;
+ * the bounded wait inside submit then fails its igt_assert, failing this test.
+ */
+static void
+amd_userq_wptr_offset_submit(amdgpu_device_handle device, unsigned int ip_type)
+{
+	const int write_length = 128;
+	const int pm4_dw = 256;
+	struct amdgpu_ring_context *ring_context;
+	const struct amdgpu_ip_block_version *ip_block;
+	struct timespec ts = {};
+	int r;
+
+	ip_block = get_ip_block(device, ip_type);
+	igt_require(ip_block);
+	igt_require(ip_block->funcs->userq_create);
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	ring_context->write_length = write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	igt_assert(ring_context->pm4);
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 1;
+	ring_context->user_queue = true;
+	/* The knob under test: place the wptr away from BO offset 0. */
+	ring_context->wptr_offset = WPTR_TEST_OFFSET;
+	/*
+	 * Bound the submit wait so a broken kernel fails deterministically.
+	 * amdgpu_cs_syncobj_wait() takes an absolute CLOCK_MONOTONIC deadline,
+	 * so add the bound to the current time rather than passing a relative
+	 * value (which would be a past timestamp and time out immediately).
+	 */
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	ring_context->time_out = ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec +
+				 WPTR_SUBMIT_TIMEOUT_NS;
+
+	ip_block->funcs->userq_create(device, ring_context, ip_type);
+
+	r = amdgpu_bo_alloc_and_map_sync(device,
+					 write_length * sizeof(uint32_t), 4096,
+					 AMDGPU_GEM_DOMAIN_GTT, 0,
+					 AMDGPU_VM_MTYPE_UC,
+					 &ring_context->bo,
+					 (void **)&ring_context->bo_cpu,
+					 &ring_context->bo_mc,
+					 &ring_context->va_handle,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, true);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_timeline_syncobj_wait(device,
+					 ring_context->timeline_syncobj_handle,
+					 ring_context->point);
+	igt_assert_eq(r, 0);
+
+	memset((void *)ring_context->bo_cpu, 0,
+	       write_length * sizeof(uint32_t));
+	ring_context->resources[0] = ring_context->bo;
+
+	ip_block->funcs->write_linear(ip_block->funcs, ring_context,
+				      &ring_context->pm4_dw);
+
+	amdgpu_test_exec_cs_helper(device, ip_type, ring_context, 0);
+
+	/*
+	 * write_length is in bytes; write_linear emits write_length/4 deadbeef
+	 * DWORDs, so compare with div=4 to check exactly the DWORDs written.
+	 */
+	r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
+	igt_assert_eq(r, 0);
+
+	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
+				 ring_context->bo_mc,
+				 write_length * sizeof(uint32_t));
+
+	free(ring_context->pm4);
+	ip_block->funcs->userq_destroy(device, ring_context, ip_type);
+	free(ring_context);
+}
 #endif /* AMDGPU_USERQ_ENABLED */
 
 int igt_main()
@@ -2772,6 +2958,24 @@ int igt_main()
 	igt_describe("USERQ concurrency fuzzing: concurrent CREATE/DESTROY, SIGNAL/WAIT racing DESTROY, double-DESTROY");
 	igt_subtest("concurrent-userq-fuzzing")
 		amd_userq_concurrent_fuzzing(fd, amdgpu_dev, userq_arr_cap);
+
+	igt_describe("USERQ SDMA fence value with the wptr at a non-zero BO offset");
+	igt_subtest("userq-wptr-offset-fence-sdma") {
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		amd_userq_wptr_offset_fence(amdgpu_dev, AMD_IP_DMA);
+	}
+
+	igt_describe("USERQ GFX submit with the wptr at a non-zero BO offset");
+	igt_subtest("userq-wptr-offset-gfx") {
+		igt_require(userq_arr_cap[AMD_IP_GFX]);
+		amd_userq_wptr_offset_submit(amdgpu_dev, AMD_IP_GFX);
+	}
+
+	igt_describe("USERQ SDMA submit with the wptr at a non-zero BO offset");
+	igt_subtest("userq-wptr-offset-sdma") {
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		amd_userq_wptr_offset_submit(amdgpu_dev, AMD_IP_DMA);
+	}
 #endif
 
 	igt_fixture() {
-- 
2.49.0

