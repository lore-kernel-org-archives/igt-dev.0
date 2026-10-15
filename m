Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E2BCC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B8E10EBB0;
	Thu, 15 Oct 2026 13:09:40 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4083E10EBBA
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1792069719;
 bh=gfj5FlWoZdtGhjmZM36TKOM54tX7sftowHs0mvj0azA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dfkMyWBALlKWKRLPap0leiXfanemn5VnRsMuEpzJZewh+jmUn3DiP2NveX4mllKMd
 ontKsNSPqJA9DV1BgVLw/a2hTpY5LVCSZwRWSeFEchkwgcccPvDpuiQUu6CXkRwyZK
 +6LVfk8ujEGFZDMbh3YbJ07afk7zT4FtCqZtcqQpC5OJqFSyyed9S+Zq3i9XAvKY+a
 sUx3Ka3AVlzRjWH8XWHVYn8OEcujh0MAP/UWsg7dwEgDjRScAa7mkxNILQG1HlF3Ka
 dEVxrvASbQciA97Hg7Icx9HtEUiBxAnIqNZ+5yjGhaQdySmx8RatzXRA4n7Z4RJR2b
 OcP+g/xnA3FPA==
Received: from reinforced (unknown [100.64.0.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CAA017E053D;
 Thu, 15 Oct 2026 15:08:39 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, laura.nao@collabora.com,
 adrian.larumbe@collabora.com, daniel.almeida@collabora.com,
 liviu.dudau@arm.com
Subject: [PATCH 1/4] panthor: Use all available GPU cores
Date: Thu, 15 Oct 2026 14:05:46 +0100
Message-ID: <20261015130837.710795-2-daniels@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015130837.710795-1-daniels@collabora.com>
References: <20261015130837.710795-1-daniels@collabora.com>
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

There's no reason to limit ourselves to one arbitrarily-chosen core.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 lib/igt_panthor.c | 29 +++++++----------------------
 lib/igt_panthor.h |  1 -
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 11d8ec342..cd6b6b7fd 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
 
 #include "drmtest.h"
+#include "igt_aux.h"
 #include "igt_panthor.h"
 #include "ioctl_wrappers.h"
 #include "panthor_drm.h"
@@ -69,22 +70,6 @@ void igt_panthor_group_submit(int fd, struct drm_panthor_group_submit *group_sub
 		do_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_SUBMIT, group_submit);
 }
 
-/**
- * igt_panthor_get_first_core:
- * @cores_present: bitmask of available cores
- *
- * Get a mask with only the first available core bit set.
- *
- * Returns: core mask with first available core, or 0 if no cores available
- */
-uint64_t igt_panthor_get_first_core(uint64_t cores_present)
-{
-	if (cores_present == 0)
-		return 0;
-
-	return 1ULL << (ffs(cores_present) - 1);
-}
-
 /**
  * igt_panthor_group_create_simple:
  * @fd: device file descriptor
@@ -109,13 +94,13 @@ uint32_t igt_panthor_group_create_simple(int fd, uint32_t vm_id, int err)
 	queues = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &queue);
 
 	group_create.queues = queues;
-	group_create.max_compute_cores = 1;
-	group_create.max_fragment_cores = 1;
-	group_create.max_tiler_cores = 1;
+	group_create.max_compute_cores = igt_hweight(gpu_info.shader_present);
+	group_create.max_fragment_cores = igt_hweight(gpu_info.shader_present);
+	group_create.max_tiler_cores = igt_hweight(gpu_info.tiler_present);
 	group_create.priority = PANTHOR_GROUP_PRIORITY_MEDIUM;
-	group_create.compute_core_mask = igt_panthor_get_first_core(gpu_info.shader_present);
-	group_create.fragment_core_mask = igt_panthor_get_first_core(gpu_info.shader_present);
-	group_create.tiler_core_mask = igt_panthor_get_first_core(gpu_info.tiler_present);
+	group_create.compute_core_mask = gpu_info.shader_present;
+	group_create.fragment_core_mask = gpu_info.shader_present;
+	group_create.tiler_core_mask = gpu_info.tiler_present;
 	group_create.vm_id = vm_id;
 
 	igt_panthor_group_create(fd, &group_create, err);
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index ba4a9bf1e..63c4f2bf4 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -36,7 +36,6 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
 				     uint32_t queue_index, uint64_t stream_addr,
 				     uint32_t stream_size, uint32_t syncobj_handle,
 				     int err);
-uint64_t igt_panthor_get_first_core(uint64_t cores_present);
 
 static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
 				       uint64_t va, uint64_t size, uint32_t flags, int err)
-- 
2.47.3

