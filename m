Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6EDCCF2C1
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 22:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F48C112A25;
	Fri, 16 Oct 2026 22:37:49 +0000 (UTC)
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com
 [165.173.180.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884C1112A25
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 22:36:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1792190169; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bwUfN2hT4+KdVpYiOhxq8wQH7lZbUUzxliM008lEuZdvyTUUHatHn+lX4JBidGo/udX1BsfAN/Xq8xzfS7e1tNopWvoorLgzpeQgJKoAMeWlBUl+wnZmOKtxFs+N3KiF24hJptbal9WoNaR92WvojZcVKAS67iJQJQJjkD4mg/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1792190169;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tVdqep0YpEOU+cjM56bfGS0HhhRxt3tfK7CJ7FwYnKc=; 
 b=XPAZFBPgclrN45i9t2EKROOiJSCQGI8n5DLb9zJobR/WYawY2gBDRse/HcbsklYRTLAgLtDilwB2syDLOTFBCa36oJPutFjyhy2jP58EfDI5b/nRtYCSO8lxeJouDUBF9mJ00wQeeOYQRh7FXXhP4rt836koqZxxkqUi5YARa1g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792190169; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=tVdqep0YpEOU+cjM56bfGS0HhhRxt3tfK7CJ7FwYnKc=;
 b=NhT8fLhtGAAjYvWxSU669GUgXewYZ/zgLvnGTGZ0odYQWBj4sqKJ7gqlDkzMwHDv
 NTyz9qLmtV3f7irCxtfn1/T/X6PdAUdwQGTo33RIDDvIAhUavH1UcPZ4Lz4Xc+Mm9q/
 7YaV8RpTGB0awp7Ec/cvTehDj9G2ht/qccbDlyDQ=
Received: by smtp.zohomail.com with SMTPS id 17921901677841017.8538593202566; 
 Fri, 16 Oct 2026 15:36:07 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 16 Oct 2026 15:35:46 -0700
Subject: [PATCH i-g-t v2 2/2] panthor: test dev_query buffer size
 variations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-dev_query-v2-2-067661858810@collabora.com>
References: <20261016-b4-dev_query-v2-0-067661858810@collabora.com>
In-Reply-To: <20261016-b4-dev_query-v2-0-067661858810@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, adrian.larumbe@collabora.com, 
 liviu.dudau@arm.com, steven.price@arm.com, daniel.almeida@collabora.com, 
 kamil.konieczny@linux.intel.com, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2835;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=h1dL1ibma7CCafiTcinL30Fh2IZqqe0m7VTBHCMC770=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFmXll1py1/Vp9i4QO2f3t25/9x7DV9UHc3vni2dye/jx
 ePy3LWmo5SFQYyLQVZMkeWsvVGPeNV7I935/5th5rAygQxh4OIUgIkkeTL8j9HYJdGw41PHn1LH
 +0ffXZ9wYHnJo8z4eWwCW9ODw5Y5yTIyLNxwpdwq64ea0O5aneU3LS3qH7ifOvFrpf4eTn9tnap
 GDgA=
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

Add tests to check that the kernel driver will gracefully handle userspace
buffers that are smaller or larger than the kernel driver expected.

Also, add a test to ensure that the kernel driver will provide the size
when the userpointer is null.

This ensures UAPI compliance for DRM_IOCTL_PANTHOR_DEV_QUERY.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 tests/panthor/panthor_query.c | 56 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
index afd58a5bd..30e3a9cf3 100644
--- a/tests/panthor/panthor_query.c
+++ b/tests/panthor/panthor_query.c
@@ -7,6 +7,10 @@
 #include "panthor_drm.h"
 #include <stdint.h>
 
+#define GPU_INFO_MIN_SIZE \
+	(offsetof(struct drm_panthor_gpu_info, tiler_present) + \
+	 sizeof(((struct drm_panthor_gpu_info *)0)->tiler_present))
+
 int igt_main() {
 	int fd = -1;
 
@@ -20,10 +24,60 @@ int igt_main() {
 		struct drm_panthor_gpu_info gpu = {};
 
 		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu, sizeof(gpu), 0);
-
 		igt_assert_neq(gpu.gpu_id, 0);
 	}
 
+	igt_describe("Ensure kernel returns a GPU_INFO size.");
+	igt_subtest("query-size-null-pointer") {
+		uint32_t size;
+
+		size = igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, NULL, 0, 0);
+
+		/*
+		 * The kernel returns its output structure size, which may be out
+		 * of sync with the header used to build these tests, so don't expect
+		 * that the sizes will match necessarily.
+		 */
+		igt_assert(size >= GPU_INFO_MIN_SIZE);
+	}
+
+	igt_describe("Ensure kernel enforces GPU_INFO minimum size.");
+	igt_subtest("query-size-too-small") {
+		struct drm_panthor_gpu_info gpu = {};
+
+		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
+				  &gpu, GPU_INFO_MIN_SIZE - 1, EINVAL);
+	}
+
+	igt_describe("Ensure kernel zeros out unused part of buffer.");
+	igt_subtest("query-too-big") {
+		uint32_t size;
+		size_t buf_size;
+		uint8_t *buf;
+
+		/*
+		 * Create a buffer that is larger than necessary.
+		 * Start with the size returned by the kernel in case it is out of
+		 * sync with these tests. Then add an extra 16 bytes and initialize
+		 * the entire buffer to non-zero values.
+		 */
+		size = igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
+					 NULL, 0, 0);
+		buf_size = (size_t)size + 16;
+		buf = malloc(buf_size);
+		igt_assert(buf);
+		memset(buf, 0xff, buf_size);
+
+		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
+				  buf, buf_size, 0);
+
+		/* Check that the extra bytes were zeroed. */
+		for (size_t i = size; i < buf_size; i++)
+			igt_assert_eq(buf[i], 0);
+
+		free(buf);
+	}
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}

-- 
2.56.0

