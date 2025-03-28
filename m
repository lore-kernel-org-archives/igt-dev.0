Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6453C36014
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC4D10E9AE;
	Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2951E10E9A6
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:34 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OUd91469995; Fri, 28 Mar 2025 13:54:30 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OU171469994;
 Fri, 28 Mar 2025 13:54:30 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 11/19] lib/amdgpu: use macro to add cmds in the user ring
Date: Fri, 28 Mar 2025 13:54:08 +0530
Message-Id: <20250328082416.1469810-11-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use ring add cmds macros to add the cmds in the user
ring instead of directly using the queue ptr and wptr
ptr.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h  |  1 -
 lib/amdgpu/amd_user_queue.c | 28 +++++++++++++++-------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 85d69f5c6..e085f1618 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -170,7 +170,6 @@ struct amdgpu_ring_context {
 
 	uint32_t db_handle;
 	uint32_t queue_id;
-	uint32_t npkt;
 
 	uint32_t timeline_syncobj_handle;
 	uint64_t point;
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
index 9412a37e8..1bfc86949 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -126,30 +126,32 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 			      unsigned int ip_type, uint64_t mc_address)
 {
 	int r;
-	uint32_t *npkt = &ring_context->npkt;
-	uint32_t *queue_cpu = ring_context->queue_cpu;
 	uint32_t control = ring_context->pm4_dw;
 	uint32_t syncarray[1];
-
 	struct drm_amdgpu_userq_signal signal_data;
 
+
+	amdgpu_pkt_begin();
 	/* Prepare the Indirect IB to submit the IB to user queue */
-	queue_cpu[(*npkt)++] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
-	queue_cpu[(*npkt)++] = lower_32_bits(mc_address);
-	queue_cpu[(*npkt)++] = upper_32_bits(mc_address);
+	amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
+	amdgpu_pkt_add_dw(lower_32_bits(mc_address));
+	amdgpu_pkt_add_dw(upper_32_bits(mc_address));
 
 	if (ip_type == AMD_IP_GFX)
-		queue_cpu[(*npkt)++] = control | S_3F3_INHERIT_VMID_MQD_GFX(1);
+		amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
 	else
-		queue_cpu[(*npkt)++] = control | S_3F3_VALID_COMPUTE(1)
-					       | S_3F3_INHERIT_VMID_MQD_COMPUTE(1);
+		amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
+					       | S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
+
+	amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
 
-	queue_cpu[(*npkt)++] = PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0);
 	/* empty dword is needed for fence signal pm4 */
-	++*npkt;
+	amdgpu_pkt_add_dw(0);
+
+	amdgpu_pkt_end();
 
-	*ring_context->wptr_cpu = *npkt;
-	ring_context->doorbell_cpu[DOORBELL_INDEX] = *npkt;
+	/* Update the door bell */
+	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
 
 	/* Add a fence packet for signal */
 	syncarray[0] = ring_context->timeline_syncobj_handle;
-- 
2.43.0

