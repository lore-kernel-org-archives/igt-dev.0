Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4458CC36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09A410E9A0;
	Fri, 28 Mar 2025 08:24:31 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C78610E2F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:30 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OP8X1469930; Fri, 28 Mar 2025 13:54:25 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OPl81469929;
 Fri, 28 Mar 2025 13:54:25 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 03/19] lib/amdgpu: Add user mode queue support in ring
 context
Date: Fri, 28 Mar 2025 13:54:00 +0530
Message-Id: <20250328082416.1469810-3-sunil.khatri@amd.com>
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

Add the meta data to support the user mode command
submission in the ring_context.

User mode command submission methods needs these
resources to be initialized and to create/destroy queues.

Also once we have the queue created the queue id is
used to submit the work load to the h/w.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index fc9df6c78..577b38387 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -86,6 +86,14 @@ struct dynamic_test{
 	bool support_sdma;
 };
 
+struct amdgpu_userq_bo {
+	amdgpu_bo_handle handle;
+	amdgpu_va_handle va_handle;
+	uint64_t mc_addr;
+	uint64_t size;
+	void *ptr;
+};
+
 #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
 
 /* set during execution */
@@ -141,6 +149,29 @@ struct amdgpu_ring_context {
 	struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
 	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
 	struct amdgpu_cs_err_codes err_codes;
+
+	/* User queue resources */
+	struct  amdgpu_userq_bo queue;
+	struct  amdgpu_userq_bo shadow;
+	struct  amdgpu_userq_bo doorbell;
+	struct  amdgpu_userq_bo rptr;
+	struct  amdgpu_userq_bo wptr;
+	struct  amdgpu_userq_bo csa;
+	struct  amdgpu_userq_bo eop;
+
+	uint32_t *queue_cpu;
+	uint64_t *wptr_cpu;
+	uint64_t *doorbell_cpu;
+
+	uint32_t db_handle;
+	uint32_t queue_id;
+	uint32_t npkt;
+
+	uint32_t timeline_syncobj_handle;
+	uint64_t point;
+	bool user_queue;
+
+	struct drm_amdgpu_info_device dev_info;
 };
 
 
-- 
2.43.0

