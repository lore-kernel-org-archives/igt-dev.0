Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D355CCA490
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 22:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC4A112A25;
	Fri, 16 Oct 2026 22:37:03 +0000 (UTC)
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com
 [165.173.180.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2CC112A25
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 22:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1792190167; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=E4IwNl9Cqz/E+DwGdteT0WgxhgEe70JOU72Fc0gszOMLoC/Q6ueZE9dOQz3ZjHMEgEkyXRsMAK+Rb9b+V3dZojismkXdc7TlOm7oYBGeJ/Hgn2NzqQqj0rVhKUke605/8590jwj0e5Xwi7yRq+Fc4FDV0h9HYyXjeZpgG/KZ6cE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1792190167;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=n14Z8UvyiqANbWSk3uWaWwpZGTAvyS1VDbYSCL/atXs=; 
 b=EUirejaM7tQ1YoQVOcUPVd0DAj3y4d27hEetrgrP6r39u7O8wDeP1GKUy1N2NgOh1yRwk6WFRmnHiRkin5WizjU3BIkg8PzIvt6miN7SLGTceO7qAEUjQwhpfdn4TUSY0XL0a8zICCv4gJ4CqzGAC9WMSjBUer03yuYfA5QjuBg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792190167; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=n14Z8UvyiqANbWSk3uWaWwpZGTAvyS1VDbYSCL/atXs=;
 b=XoUtZt24zca+fWxbhGWvGvKvnje1vuicmNgWQq4jDdYbFea4jU5fpI/UUNoWbJio
 0e0v7Ho3WZJz+brKXMByQor5uJqr2RQfzdscF92OiDCoXb6xatz1ujndBzRCkj0JufP
 O/C0WwnNT8ltAB4QXRNpZKYk+dQV9MEdcGMrOeCw=
Received: by smtp.zohomail.com with SMTPS id 1792190166567956.5838830229422;
 Fri, 16 Oct 2026 15:36:06 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 16 Oct 2026 15:35:45 -0700
Subject: [PATCH i-g-t v2 1/2] panthor: Return size from PANTHOR_DEV_QUERY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-dev_query-v2-1-067661858810@collabora.com>
References: <20261016-b4-dev_query-v2-0-067661858810@collabora.com>
In-Reply-To: <20261016-b4-dev_query-v2-0-067661858810@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, adrian.larumbe@collabora.com, 
 liviu.dudau@arm.com, steven.price@arm.com, daniel.almeida@collabora.com, 
 kamil.konieczny@linux.intel.com, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=LPk9oNGI2jDWb6F9K1GIdpt6BKgi/V3D7xIkx2Ho4x4=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFmXll2Ru1JUu++osVGkRn2R9YLIhJey70R85TyMNGbeu
 eFkafuyo5SFQYyLQVZMkeWsvVGPeNV7I935/5th5rAygQxh4OIUgIlYhTMy3N09kVlvgo3SDeUn
 Kd4/M/aJXBa6+N+OLTdvdu2jyt4ZixgZNn4rLZkvc3tqXbDz+pdJx97kZx681zTNuGLqtZLEJuP
 7XAA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB
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

The size of the type being queried will be updated by the kernel driver
when the user pointer is null. Return the query size so that we can check
that it was correctly calculated.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 lib/igt_panthor.c | 6 +++++-
 lib/igt_panthor.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 11d8ec342..5aca0a020 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -178,8 +178,10 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
  * @err: expected error code, or 0 for success
  *
  * Query GPU information.
+ *
+ * Returns: the size of the type being queried.
  */
-void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
+uint32_t igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
 {
 	struct drm_panthor_dev_query query = {
 		.type = type,
@@ -191,6 +193,8 @@ void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
 		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query, err);
 	else
 		do_ioctl(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query);
+
+	return query.size;
 }
 
 /**
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index ba4a9bf1e..2ecce57de 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -16,7 +16,7 @@ struct panthor_bo {
 	void *map;
 };
 
-void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
+uint32_t igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
 void igt_panthor_vm_create_userva_range(int fd, uint32_t *vm_id, int err, uint64_t *uva_range);
 void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
 void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,

-- 
2.56.0

