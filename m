Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F3606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 18:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V6N8poDx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA49D10E99E;
	Thu,  5 Nov 2026 18:46:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7418A10E970
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793904170; x=1825440170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VBaVUo7SDA07ABsOatVvkMF9hvO9pvsP0M0mp2wnFqw=;
 b=V6N8poDxXSEJKkGOrK9y8OepN8ReFC6ykywfGoVEbrtlRkdVqIw49nd9
 v6kmN94+ce8POfPaxTAPu95esAKXjz111zYsHLqy/3/1IMhOtqEyapJ48
 5qa+/7ldjleGyCwtIJpQkaEBYYprquUL9qtRKYc1/5w7IsFuF9qq5C0bz
 8L2Y5qDd69scGbzedQzgDY5PhDjBAaTkDxSj4Fy+01iYethW3OBXYVvUb
 P0beEYTjfFj6lYe/3F61PJN0IR8XrJwu46/AqyT+936Dd1dOCEIAHfV4M
 Hbe3y9P5CK81wdNDv4KWWwGDHBb9KOIZpR6sw55Dl5KKrrsPs3dtfdJYk Q==;
X-CSE-ConnectionGUID: Xag0MQJ5SCWrZEtitSyB5A==
X-CSE-MsgGUID: f9f3/IQVQySvls6tDd391g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2578797"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2578797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:42:49 -0800
X-CSE-ConnectionGUID: z0UTiKGfT5OQoSz14x6hZA==
X-CSE-MsgGUID: c++2uwlMT8KZE808AG5ETA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7400081"
Received: from dut4040nvlp.fm.intel.com (HELO DUT4040NVLP) ([10.105.10.98])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:42:50 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t v5 2/3] tests/intel/xe_exec_threads: Allocate the exec
 queue arrays dynamically
Date: Thu,  5 Nov 2026 18:42:41 +0000
Message-ID: <20261105184242.14910-3-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105184242.14910-1-jagmeet.randhawa@intel.com>
References: <20261105184242.14910-1-jagmeet.randhawa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

test_legacy_mode() and test_compute_mode() keep their exec queue, syncobj
and sync arrays on the stack, sized to MAX_N_EXEC_QUEUES. A caller that
wants more queues than that can only be served by raising the limit, which
would grow the arrays for every caller that does not need them.

Allocate the arrays to the requested queue count instead and drop the
limit check.

No functional change.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_threads.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 773627140..6f46781d8 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -379,7 +379,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		.syncs = to_user_pointer(sync),
 	};
 	int64_t fence_timeout;
-	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t *exec_queues;
 	size_t bo_size, sync_size;
 	uint32_t bo = 0;
 	struct {
@@ -393,7 +393,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	int map_fd = -1;
 	bool owns_vm = false, owns_fd = false;
 
-	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
+	exec_queues = calloc(n_exec_queues, sizeof(*exec_queues));
+	igt_assert(exec_queues);
 
 	if (flags & FD) {
 		fd = drm_reopen_driver(fd);
@@ -609,6 +610,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	if (owns_fd) {
 		drm_close_driver(fd);
 	}
+
+	free(exec_queues);
 }
 
 static void
@@ -620,15 +623,13 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
-	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
+	struct drm_xe_sync *sync_all;
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
-	uint32_t exec_queues[MAX_N_EXEC_QUEUES] = {};
-	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
-	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
+	uint32_t *exec_queues, *bind_exec_queues, *syncobjs;
 	size_t bo_size;
 	uint32_t bo = 0;
 	struct {
@@ -641,7 +642,11 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	int i, j, b, hang_exec_queue = n_exec_queues / 2;
 	bool owns_vm = false, owns_fd = false;
 
-	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
+	sync_all = calloc(n_exec_queues, sizeof(*sync_all));
+	exec_queues = calloc(n_exec_queues, sizeof(*exec_queues));
+	bind_exec_queues = calloc(n_exec_queues, sizeof(*bind_exec_queues));
+	syncobjs = calloc(n_exec_queues, sizeof(*syncobjs));
+	igt_assert(sync_all && exec_queues && bind_exec_queues && syncobjs);
 
 	if (flags & FD) {
 		fd = drm_reopen_driver(fd);
@@ -676,7 +681,6 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 	memset(data, 0, bo_size);
 
-	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
 		if (flags & MULTI_QUEUE) {
 			struct drm_xe_ext_set_property multi_queue = {
@@ -942,6 +946,11 @@ wq_stress_cleanup:
 		xe_vm_destroy(fd, vm);
 	if (owns_fd)
 		drm_close_driver(fd);
+
+	free(sync_all);
+	free(exec_queues);
+	free(bind_exec_queues);
+	free(syncobjs);
 }
 
 struct thread_data {
-- 
2.53.0

