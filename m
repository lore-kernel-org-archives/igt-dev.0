Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8457CCA462
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B6710E08E;
	Thu, 15 Oct 2026 23:47:34 +0000 (UTC)
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com
 [165.173.182.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB88B10E0E6
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 23:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1792107907; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=npUa7XkMXj88JRxntSZCFgbcFcQjZIC6IipgJF/4gtfkV++EHdCz44zuHL6zWbIMOH+nhGqp/UD1kA2/ohYQLIx9CuhVkQBivsMYOXc8pAX0fRTm4WnkZoTR1Wp8kEuS6O+p41Pv8ErghWXEOQTpJ/5+hd4Src+swTWqBNPwbos=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1792107907;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6I0nCfR9bL4ycMhq2xzYjSjfDgiYVhqQQHt84uypjWQ=; 
 b=O01+BJ80/mOlA5P5U787eMNjnfO4+QYjAoOex7Vws2h7dLlZwRYVVCDgJZwV7QQollvEvzyHwHPKFHcZB7iU9yyZ6KiJfUtjkXm647MyXWjQBEE0RpLQCNCBmIWGfc+98v5oSujjkh3dnxka+3L5LFpcuXTMOUK2bkRi3HW9Kbc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792107907; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=6I0nCfR9bL4ycMhq2xzYjSjfDgiYVhqQQHt84uypjWQ=;
 b=MGZ0jGqo5FPw1oKzDeHYtIaa97QEYYl09oQaPwnk13/861CpWwqZKJiXh1F9X+aE
 FyGP1sF3vieu5UHI27TQ9rPegyCk+yLR0Gg0/sGq0U6OIWLzc++keKaoNYnxNH5zgCd
 h8FSb9gzujnioXahwwCSV6UAmdKK1SZqS6Q6qkNQ=
Received: by smtp.zohomail.com with SMTPS id 1792107905437341.2642492229587;
 Thu, 15 Oct 2026 16:45:05 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 15 Oct 2026 16:44:57 -0700
Subject: [PATCH i-g-t 1/2] panthor: Return size from PANTHOR_DEV_QUERY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-dev_query-v1-1-70ffafa4131e@collabora.com>
References: <20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com>
In-Reply-To: <20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, adrian.larumbe@collabora.com, 
 liviu.dudau@arm.com, steven.price@arm.com, daniel.almeida@collabora.com, 
 kamil.konieczny@linux.intel.com, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1864;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=nGsoq7SV1aErhxcPiv1yZUZPvwvdyE5MD/PQ6/acKIw=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFkXU+vq5ywLXqE0tzT/1G+mz++1Eq6GvSi0UFD2K17Hn
 dh69cH5jlIWBjEuBlkxRZaz9kY94lXvjXTn/2+GmcPKBDKEgYtTACay4DrDX7Hzx545Oc6d0x7z
 g2Vti+D+toeujOJPLu1MSKzYm6zhtJaR4fRlq4t+ya/vlCf7HZQVL2eVWMB+q8Jyi9Mm7/f3tQ0
 FWQE=
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

