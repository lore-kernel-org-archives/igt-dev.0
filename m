Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4752CC36017
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB96010E9B1;
	Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DED10E2F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:34 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OUnb1469990; Fri, 28 Mar 2025 13:54:30 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OU6S1469989;
 Fri, 28 Mar 2025 13:54:30 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 10/19] lib/amdgpu: add macro for adding cmds in user queue
Date: Fri, 28 Mar 2025 13:54:07 +0530
Message-Id: <20250328082416.1469810-10-sunil.khatri@amd.com>
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

Add macros which enable adding cmds in user queue
for size more than ring size. Ring is treate as
a circular buffer and ovewrite from beginning
when write ptr reaches the end of queue.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_user_queue.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_user_queue.h b/lib/amdgpu/amd_user_queue.h
index 355f16f19..539a78819 100644
--- a/lib/amdgpu/amd_user_queue.h
+++ b/lib/amdgpu/amd_user_queue.h
@@ -15,9 +15,24 @@
 #define PAGE_SIZE 4096
 #endif
 
-#define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes
+#define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
 #define ALIGNMENT			4096
 #define DOORBELL_INDEX			4
+#define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
+#define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
+
+#define amdgpu_pkt_begin() uint32_t __num_dw_written = 0; \
+	uint32_t __ring_start = *ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK;
+
+#define amdgpu_pkt_add_dw(value) do { \
+	*(ring_context->queue_cpu + \
+	((__ring_start + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK)) \
+	= value; \
+	__num_dw_written++;\
+} while (0)
+
+#define amdgpu_pkt_end() \
+	*ring_context->wptr_cpu += __num_dw_written
 
 void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
 			   unsigned int size, unsigned int domain);
-- 
2.43.0

