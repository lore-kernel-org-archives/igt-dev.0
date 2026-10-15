Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D678CCA462
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 23:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CE210E08E;
	Thu, 15 Oct 2026 23:46:47 +0000 (UTC)
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com
 [165.173.182.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5753810E0F7
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 23:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1792107909; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SDqQEdPLd0V10FQ6J9VhzKT5jeIDkd8seAxyOAoVqj6CXGfPn3OZgSYaVj5sq6Odk7n1dZsVTJrofH9zyBMH9GvP2PL/PUA248yVZC0ebfrenrCVtdZj1KwJOv1pKnR+TC9rTFiwXCwTvHbswZFTjQy6ldnVB1iLejhb9SyIAjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1792107909;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ml3XwiRaFw7QEX3h9sr66+eHbVXRyw8ClH60t/UIh+M=; 
 b=PJkHNA4f8++MkmRtzQn5Nv0sN+JonFWC9e1pA6HU0z9unoTjVEYamObRI6zUSa3cKjcpwBg7nZUaT3/YwHds2FUq2LWO6CmaXbL/H9V+KkXWnLEo1El8EcX7TE4OomDGWidpzoYGb2KBjdM3NZh+pBqS80LUZWUZSs/l3UwYnjA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792107909; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=ml3XwiRaFw7QEX3h9sr66+eHbVXRyw8ClH60t/UIh+M=;
 b=Y1fY4ZaoF5bNf7+vy9P9fhn0ItS1l+kxqUOEOnhGUh3geXWCRFNK/ReihB84LmII
 cRaxdMHS/Q2DtdiLtNoQ4f6DeqlcHJxaUaCfIAq2XXET0wI8cePXKen2yQ9UmOo4kLc
 cw3Z3mMOnQdyuSaoKNT/ddQUu8nAfxGTCKwuPtgY=
Received: by smtp.zohomail.com with SMTPS id 1792107906849929.7897151345737;
 Thu, 15 Oct 2026 16:45:06 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 15 Oct 2026 16:44:58 -0700
Subject: [PATCH i-g-t 2/2] panthor: test dev_query buffer size variations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-dev_query-v1-2-70ffafa4131e@collabora.com>
References: <20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com>
In-Reply-To: <20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, adrian.larumbe@collabora.com, 
 liviu.dudau@arm.com, steven.price@arm.com, daniel.almeida@collabora.com, 
 kamil.konieczny@linux.intel.com, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3168;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=GKcLOQ/JwsNUrIClwcVnSIUSxiAbUH8zWgmt2AY3OY8=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFkXU+vWyP08V79jj3dm8XO5OY3ftdINLy4v3/3bcMKph
 qjFVsqXOkpZGMS4GGTFFFnO2hv1iFe9N9Kd/78ZZg4rE8gQBi5OAZiIJS8jw1HrOOku967DH4V/
 xabvPe7Qf/9mx3ue1/eaja4vZXaRf8/IcLV04qSY09/DapS05q5Xu+l/POb4u1M2Inu2nuGYYKS
 wlh8A
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

Also, add a test to ensure that the kernel driver is enforcing the
minimum buffer size and that the kernel driver will provide the size
when the userpointer is null.

This ensures UAPI compliance for DRM_IOCTL_PANTHOR_DEV_QUERY.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 tests/panthor/panthor_query.c | 64 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
index afd58a5bd..8ff2e9652 100644
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
 
@@ -20,10 +24,70 @@ int igt_main() {
 		struct drm_panthor_gpu_info gpu = {};
 
 		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu, sizeof(gpu), 0);
+		igt_assert_neq(gpu.gpu_id, 0);
+	}
+
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
+	igt_describe("Ensure kernel accepts GPU_INFO minimum size.");
+	igt_subtest("query-min-size") {
+		struct drm_panthor_gpu_info gpu = {};
+
+		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
+				  &gpu, GPU_INFO_MIN_SIZE, 0);
 
 		igt_assert_neq(gpu.gpu_id, 0);
 	}
 
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

