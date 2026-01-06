Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC24BCD0437
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 06:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C49810E477;
	Tue,  6 Jan 2026 06:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gmi7TbUV";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0978010E477
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 06:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stEsFSlIu/q15+9N+Z2RhHC1oFF96uzk775bpOtJPcXupN+lK2FttwZhHSsklumrFKCUK7knVMH2LTmrvlGtkpdUvPxCVhPFQ6SthABVXblgzVasa6o/7tKSmD8tdpfjI70Tigui8O7hV9tO+0z3Uo6/bTph1l37PVwOHx64UqhMTxS6Mygw+U7LbNVBoHbNzkF0UMHS6TRQmtW/GqjljH8ShXRyYC3T7uIqf8niTIFJASfEHZ2E0cO7kW6k/inyjuhLvEo5JQx0VR7IGwN4wutPlnCRMeyv4DFh2MTF4NAl7SR5HZelC5neOoJTagFICf1ggD4JpuTPAJZ44Ncu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8nXtjdUVpMPDZ4uoCgd+WElUIVIVgxKKjemEfEzBNs=;
 b=Sh2qR43sr3ovHVvCAASwLc9yPSiLsbTaG4kSsKchF+I35UlypuH3XhqWVjIXqMD0t/Xd8QF1sqNPvw8luskT39hXnW0xrO06qtpzYMG5r4hrcD9i0tM21XltrP0ZMXAWvQY+/n8eIAySnV+r7NhHGxoTl8iYAsmY5ky5h6f1iThIQSC/CZbtqznTyxBXAoYcOWsOspvC6e52OZ3ROYdhZqkOscMa/eQP8hSwPhySZIHrvekLaTv4nnuVqDA6Oq7kmOFPrik4neL/F9uzVDWioHu0ycFSsMAYYam9iOl1u1BPpLrDH864UjUrf3cPuzzEXTp13mARrVecngE8HowG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8nXtjdUVpMPDZ4uoCgd+WElUIVIVgxKKjemEfEzBNs=;
 b=gmi7TbUVCWwxMTpL0lW25ThuODHA+PcM9WuYIQrJKkv8v6FE23aaR7EQmdu6bA3kgLzcl5wmdFvsCk595UGVv/vOsg8t5pqJeKlXb838S3NReA07iFVYZbLfBzTm2M2ntJmlkNNzKdrhFTyurM8qZ6KnHHUJvhpoo7D7AnHV0ZA=
Received: from SA9PR11CA0020.namprd11.prod.outlook.com (2603:10b6:806:6e::25)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 06:19:10 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:6e:cafe::da) by SA9PR11CA0020.outlook.office365.com
 (2603:10b6:806:6e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 06:18:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 06:19:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 6 Jan
 2026 00:19:08 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Jan
 2026 00:19:08 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 6 Jan 2026 00:19:02 -0600
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: implement selective sync skipping for error
 injection tests
Date: Tue, 6 Jan 2026 14:18:54 +0800
Message-ID: <20260106061901.3928018-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SA3PR12MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9863fd27-efa4-4a1e-8efd-08de4ceb80ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fJ0eueqlprLOtmtJzHyuJYE559VxF9O1lNVrxlWff9V4pQ3COBZZqyPDfF2f?=
 =?us-ascii?Q?j+H1ifu0CIFcqasNLANypAML+KmlruCHl/VoRGfYGFfb0yfKg2ftQ9eyoVju?=
 =?us-ascii?Q?IzMfPWRV0yvti9LEs2dCkv5wEz7PBjw0sM+H8DaOK5myEowIXcciL8Ka3GjZ?=
 =?us-ascii?Q?kdCgkV9n5CrXA5cSAQCKl+yHWhqQrbuaYLH4NQc183XKE6qKtxptWfJo8DQ3?=
 =?us-ascii?Q?6R+fVaAtEjR4bMS7+lsnWzq1uwV62bu1WInx9HmpwSHMPD+bWq4Zz76ImABJ?=
 =?us-ascii?Q?4juybRIVpuiXcjE5DTMHt1p4jf1VTgfklHAkgHsuQeHWvcPfK23Cu88NGbDl?=
 =?us-ascii?Q?0H4mdW/0FjFhtUrjpr/HPuFdPSuLTITyw9rHTr61YfLY7+X/lZovaic0CBZ2?=
 =?us-ascii?Q?G/PLea3BZl4FmgRbh2YgS9QiVpF+tw1UVjtPKKGtDfWTQ4LLsVyXeYFlYcf8?=
 =?us-ascii?Q?SaP+moid8JiyJBSRA//Zi9mbQxPzKJK4rnmMUoPb8/oLUIEegDWhM8ZZ0huT?=
 =?us-ascii?Q?uuPdr+zkmNrz6GYq9aHl1EkdYM/mtAZgWbQf9aVl3MTvMvLWRNcyhqls2NHX?=
 =?us-ascii?Q?zQEUvOkikPcUfZOoSpXjE2pyt8kl6qIT21iR1ffcmi4tQsQkr201qy0EZguU?=
 =?us-ascii?Q?7CjAGZltd9bhmA16PG+XSlnfRp9uRa0hN8hdi5k0GrJbL+hcmj2sbROVPpcG?=
 =?us-ascii?Q?x4sfP2VSDSQz8W7PiB26AL5K7hkKOF8gW0qQ7nlr8VybfPsyqOM9CEpcMQDq?=
 =?us-ascii?Q?VDWYPwAQO75drpewNpJp577wnCO/ci7qW0m7g7IrsQLZ+Qi4lKHadQMxjDNj?=
 =?us-ascii?Q?Whs8AckRcGDPPfl3izZ+53u2QKVTIlzcFB7nelPLnQkSLyDgXhoZ3xIQPZLa?=
 =?us-ascii?Q?E51oRaz5jNBJlO6fxROpo771wF+JWA/dFn8XL/7BPomS5ClwZyxEMZUsJW5/?=
 =?us-ascii?Q?juDeqOyisJAuy99JQLR5NiKsAmQ5vgODSteWvOmgjUVEabIRaTh40DUoULA2?=
 =?us-ascii?Q?QZ9DzLDTqounPAJUJU3qoMuv12h1r7K3k9ri16mlpwkSi2nNiR1BH816D6cZ?=
 =?us-ascii?Q?dlsDc0UWuMzeg4USwk7o1iLFx9hWCOPF/nWaLo+A7MHxZW1FCYKKmbBz4y1b?=
 =?us-ascii?Q?T1ZQVSeWBfrq0e9/e/nC/JpcvipjTIPAPq/9mHiyw6BZcT3Z2nKqUC0vuvta?=
 =?us-ascii?Q?jb8wcwOzqg0x0yhJikkvdC+duSltBaF31QoU5PDbVW/20XbzNvAifrgXp9u7?=
 =?us-ascii?Q?7dsNyCh9O52HXLhRGODOcEXCq02hdSUNEz99IcvVVjglE2lo1SFeA3GB1qTZ?=
 =?us-ascii?Q?Bq6YeFVxoWSFmjkqmLlMi/b1F+djFeU0I2OOXvbdkj398igAZpRyKVEDJqPq?=
 =?us-ascii?Q?XEDwKGnmQbvO0g4u+FkDBH54rQ7M2S6wlkdpQLFFRP+DPn4QnMlfHBj+m4tn?=
 =?us-ascii?Q?ouEDo+48f7fsz+wQPFhu5pj+nfZSCID0dD3sR8vi+aoTJR4YsZ5NTMBkyg27?=
 =?us-ascii?Q?jCHCcGquqygZZ9qxm/Oxl7y6eNLjyQJegaCTtDN9hwhPJMn3f/Vx8XIuqTQV?=
 =?us-ascii?Q?tq06LscW7iULcEGKDiQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 06:19:09.2216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9863fd27-efa4-4a1e-8efd-08de4ceb80ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801
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

Refactor user queue submission to handle error injection cases where
GPU commands are intentionally invalid and would cause syncobj waits
to hang indefinitely.

Key changes:
1. Introduce `enum uq_submission_mode` with two modes:
   - UQ_SUBMIT_NORMAL: Full synchronization (default)
   - UQ_SUBMIT_NO_SYNC: Skip sync for error injection

2. Add helper functions:
   - `wait_for_packet_consumption()`: Busy-waits with timeout for GPU
     to process commands without synchronization
   - `create_sync_signal()`: Extracts signal creation and wait logic
     for normal submissions

3. Update `user_queue_submit()` to switch between modes:
   - NO_SYNC mode: Waits for command consumption via rptr/wptr polling
   - NORMAL mode: Creates sync signal and waits for completion

4. Modify `bad_access_helper()` to use UQ_SUBMIT_NO_SYNC mode for
   error injection tests, replacing the hardcoded timeout value

Benefits:
- Prevents permanent hangs when submitting invalid commands in tests
- Maintains full synchronization for normal operation
- Provides timeout protection for error injection cases
- Improves code organization with clear separation of concerns
- Enables future expansion of submission modes

The fix specifically addresses deadlock test scenarios where invalid
GPU commands would cause `amdgpu_cs_syncobj_wait()` to block forever,
preventing proper resource cleanup in `user_queue_destroy()`.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c |  2 +-
 lib/amdgpu/amd_ip_blocks.c        | 67 ++++++++++++++++++++++++-------
 lib/amdgpu/amd_ip_blocks.h        |  7 ++++
 3 files changed, 60 insertions(+), 16 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 5efb5e73d..c951450ce 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -347,7 +347,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	ring_context->res_cnt = 1;
 	ring_context->ring_id = 0;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0x7ffff;
+	ring_context->submit_mode = UQ_SUBMIT_NO_SYNC;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_bo_alloc_and_map_sync(device_handle,
 				    ring_context->write_length * sizeof(uint32_t),
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 73bdace5a..a6841e539 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -582,6 +582,47 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 	return r;
 }
 
+static
+int wait_for_packet_consumption(struct amdgpu_ring_context *ring_context)
+{
+	uint64_t timeout = get_current_time_ms() + 1000;
+
+	while (*ring_context->rptr_cpu == *ring_context->wptr_cpu) {
+		if (get_current_time_ms() > timeout) {
+			igt_warn("Timeout waiting for bad packet consumption\n");
+			return -ETIMEDOUT;
+		}
+		usleep(100);
+	}
+	return 0;
+}
+
+static
+int create_sync_signal(amdgpu_device_handle device,
+                             struct amdgpu_ring_context *ring_context,
+                             uint64_t timeout)
+{
+	uint32_t syncarray[1];
+	struct drm_amdgpu_userq_signal signal_data;
+	int r;
+
+	syncarray[0] = ring_context->timeline_syncobj_handle;
+	signal_data.queue_id = ring_context->queue_id;
+	signal_data.syncobj_handles = (uintptr_t)syncarray;
+	signal_data.num_syncobj_handles = 1;
+	signal_data.bo_read_handles = 0;
+	signal_data.bo_write_handles = 0;
+	signal_data.num_bo_read_handles = 0;
+	signal_data.num_bo_write_handles = 0;
+
+	r = amdgpu_userq_signal(device, &signal_data);
+	if (r)
+		return r;
+
+	return amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle,
+				  1, timeout, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
+}
+
 static int
 user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
 			      unsigned int ip_type, uint64_t mc_address)
@@ -640,21 +681,17 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 #endif
 	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
 
-	/* Add a fence packet for signal */
-	syncarray[0] = ring_context->timeline_syncobj_handle;
-	signal_data.queue_id = ring_context->queue_id;
-	signal_data.syncobj_handles = (uintptr_t)syncarray;
-	signal_data.num_syncobj_handles = 1;
-	signal_data.bo_read_handles = 0;
-	signal_data.bo_write_handles = 0;
-	signal_data.num_bo_read_handles = 0;
-	signal_data.num_bo_write_handles = 0;
-
-	r = amdgpu_userq_signal(device, &signal_data);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
-				DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
+	switch (ring_context->submit_mode) {
+	case UQ_SUBMIT_NO_SYNC:
+		/* Error injection: wait for packet ack without sync */
+		r = wait_for_packet_ack(ring_context);
+		break;
+	case UQ_SUBMIT_NORMAL:
+	default:
+		/* Standard submission with full synchronization */
+		r = create_sync_signal(device, ring_context, timeout);
+		break;
+	}
 	return r;
 }
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 51f492da2..8fd9fde9a 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -194,6 +194,12 @@ struct amdgpu_userq_bo {
 	void *ptr;
 };
 
+/* Submission modes for user queues */
+enum uq_submission_mode {
+	UQ_SUBMIT_NORMAL,        /* Full synchronization */
+	UQ_SUBMIT_NO_SYNC,       /* Skip sync for error injection */
+};
+
 #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
 
 /* set during execution */
@@ -272,6 +278,7 @@ struct amdgpu_ring_context {
 	uint64_t point;
 	bool user_queue;
 	uint64_t time_out;
+	enum uq_submission_mode submit_mode;
 
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
-- 
2.49.0

