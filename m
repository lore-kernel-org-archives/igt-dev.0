Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A0CCC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D80010EBB0;
	Thu, 15 Oct 2026 13:12:17 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E73610EBBE
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1792069720;
 bh=Vf+69CtJsJcHNYJ/KpsMGfauoWnGrNwIpkZSF7/+1EE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=giVRoX9drSh2LlgfcSMaqEJbrHlOeX5OozN1OVEmvBm7xDH++6XvTzLwxvgtjBd9H
 Rhxhw8gl9bIAdWPa+6cyOBZZuO7+pEJPoaAS6Yhz01qwO16gqRwzYWAoB5fdwyZL+f
 vgVfTo724OFUmqR+1V/EqQLLue74ZBMUNMZAeD9vDrIYRpConPTnDT+TjBNGCx/S8P
 +tvxLXcbAOez17UFLd2L1yly/0YEmwqcgskfKGzGAOGLaTVHKR71M98npzHczVNPx4
 /IUPzwmWViXnVCRglfjTfDJIWYo3XecgEd5VB6aP835Qr6upu3h5sTdqZUdwJOvy0a
 nwKGihZy0BdmA==
Received: from reinforced (unknown [100.64.0.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D090117E0654;
 Thu, 15 Oct 2026 15:08:39 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, laura.nao@collabora.com,
 adrian.larumbe@collabora.com, daniel.almeida@collabora.com,
 liviu.dudau@arm.com
Subject: [PATCH 2/4] panthor: Add igt_panthor_get_arch() helper
Date: Thu, 15 Oct 2026 14:05:47 +0100
Message-ID: <20261015130837.710795-3-daniels@collabora.com>
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

This will identify the major architecture revision.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 lib/igt_panthor.c | 17 +++++++++++++++++
 lib/igt_panthor.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index cd6b6b7fd..f5c6859e2 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -370,3 +370,20 @@ void igt_panthor_free_bo(int fd, struct panthor_bo *bo)
 
 	gem_close(fd, bo->handle);
 }
+
+/**
+ * igt_panthor_get_arch:
+ * @fd: panthor device file descriptor
+ *
+ * Get the architecture major version for this device.
+ *
+ * Returns: The Mali architecture major version
+ */
+int igt_panthor_get_arch(int fd)
+{
+	struct drm_panthor_gpu_info gpu_info = { 0 };
+
+	igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
+			  &gpu_info, sizeof(gpu_info), 0);
+	return DRM_PANTHOR_ARCH_MAJOR(gpu_info.gpu_id);
+}
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index 63c4f2bf4..3056ebd75 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -36,6 +36,7 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
 				     uint32_t queue_index, uint64_t stream_addr,
 				     uint32_t stream_size, uint32_t syncobj_handle,
 				     int err);
+int igt_panthor_get_arch(int fd);
 
 static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
 				       uint64_t va, uint64_t size, uint32_t flags, int err)
-- 
2.47.3

