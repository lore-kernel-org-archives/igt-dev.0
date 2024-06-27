Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A129C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 19:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2910EB22;
	Thu, 27 Jun 2024 19:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="bdipEiJA";
	dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A368B10E29C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 19:56:24 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-79c03dbddb8so360419385a.1
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719518183; x=1720122983;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykevY9ZwbmfXcstHmBO72Uet1TqT6yDkSYRn90uS/Wc=;
 b=bdipEiJAQ8XoUu/ujGAlcT2LWOXXBNg7qAJAN9mLFxkeX0HVguJlwpsTl3CJwHG0R7
 YUYIlcW5beD0l1ZNvnt4zNvZvttErlRduLON6+vXjgW7gcZziaCgQkGHxVN2QYein5y5
 xJDjJwQbN846pKd9/kpplQNFUs63eijvp5zN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719518183; x=1720122983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykevY9ZwbmfXcstHmBO72Uet1TqT6yDkSYRn90uS/Wc=;
 b=OjTTNhH5SlFhPJCVTlPfeXP/7F78giL+UA4O1aa4WglW7Vo/GbXAwX9ieWKWH/D2YM
 nG7Hh24g5zwfIr/KWL6TaKNV730J4gyCPfHnjgDjMW6qcolTbvJvNDu8/T4CF+jRMK9J
 0lSpfPfx1Z6nclcJnwGlSwxz+98ON5Q2VOXVZxHzUJktwMyiaDLg3FlvX5VRCoysGsSU
 TVebmYGP4nQ8NHcs7VhvKXx5VKT7ze/ncKFYvJYeFpCZ1rJ4NOox7sgk08UH2VjnJPLw
 dwzIu9fLtK8RlhOEANLXxfI1lW6Fbtg47+/qcN2xSofFg4elyctDjFO/GDH8vvZG872q
 YfTg==
X-Gm-Message-State: AOJu0YwHn7Ce7FrLRye/hnrmDaS5jBE7c1AE9GVRfg+zoe7EV3ZTvrFM
 /Ai+rloAXgbQ8siMF4QoykX+TbMDNdW1ny+e1uduqiJeWeyzIxPE+mhQYtTmPo2vXmlw6THKbtH
 Gfcmi2SMvfdG06GdfWj97cakNTkYvhU0o8i6wVrwgPHTdnL86z28Hz3m+TW9GstcH467yjeqzgA
 1vYIzGtse4QPsyzQyQs4SZymai9URNE9NHzVzQNWF7Vf55Y3FjSg==
X-Google-Smtp-Source: AGHT+IHMCOC4NFedtOzmlgdqkwBlqq3GtJ4Lgo1zoc9L2mbWn2nSwBofDUAyC221IIPVeHhaTge/kw==
X-Received: by 2002:a05:620a:2717:b0:795:ca3d:8f43 with SMTP id
 af79cd13be357-79be47125a4mr1700114685a.35.1719518183332; 
 Thu, 27 Jun 2024 12:56:23 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d692f0b19sm9231885a.98.2024.06.27.12.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 12:56:23 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t 5/5] tests/dumb_buffer: Add subtests for mixing dumb
 buffers with prime
Date: Thu, 27 Jun 2024 15:56:15 -0400
Message-Id: <20240627195615.3695848-6-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240627195615.3695848-1-zack.rusin@broadcom.com>
References: <20240627195615.3695848-1-zack.rusin@broadcom.com>
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

New versions of KWin are extensively using dumb buffers with prime. Add
some basic tests to verify that mixing the dumb buffer interface
with prime ends up with a well formed buffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 tests/dumb_buffer.c | 96 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 8e243459c..0651f5d83 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -69,6 +69,20 @@
  * SUBTEST: map-uaf
  *
  * SUBTEST: map-valid
+ *
+ * SUBTEST: dmabuf-read
+ * Description: Make a dumb buffer, map it using the dumb buffer interface,
+ *              export it via prime, mmap the prime buffer and check
+ *              that its contents matches what we wrote to the dumb
+ *              buffer.
+ * Functionality: dumb_buffers, prime, dmabuf, mmap
+ *
+ * SUBTEST: dmabuf-write
+ * Description: Make a dumb buffer, map and write to it using the prime
+ *              interface, than map it using the dumb buffer interface
+ *              and check whether its contents matches what we wrote using
+ * 		the prime interface.
+ * Functionality: dumb_buffers, prime, dmabuf, mmap
  */
 
 IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
@@ -388,6 +402,82 @@ static void always_clear(int fd, int timeout)
 	igt_info("Checked %'lu page allocations\n", checked);
 }
 
+static const uint32_t pattern[] = {
+	0xff000000, 0x00ff0000, 0x0000ff00, 0x000000ff,
+	0x000000ff, 0x0000ff00, 0x00ff0000, 0xff000000,
+	0x00ffff00, 0xff0000ff, 0x00ff00ff, 0xff00ff00,
+	0xff0000ff, 0x00ff00ff, 0x00ffff00, 0xff00ff00
+};
+
+static void dmabuf_read(int fd)
+{
+	struct drm_mode_create_dumb create = {
+		.width = 64,
+		.height = 64,
+		.bpp = 32,
+	};
+	int dma_buf_fd;
+	uint32_t *ptr;
+
+	dumb_create(fd, &create);
+	ptr = dumb_map(fd, create.handle, create.size, PROT_WRITE);
+	igt_assert(ptr != MAP_FAILED);
+	igt_assert(ptr != NULL);
+	igt_assert(create.size > sizeof(pattern));
+	memcpy(ptr, pattern, sizeof(pattern));
+	munmap(ptr, create.size);
+
+	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, create.handle);
+
+	/* Skip if DRM_RDWR is not supported */
+	igt_skip_on(errno == EINVAL);
+
+	ptr = mmap(NULL, create.size, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
+	igt_assert(ptr != MAP_FAILED);
+
+	/* Check pattern correctness */
+	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
+
+	munmap(ptr, create.size);
+	close(dma_buf_fd);
+
+	dumb_destroy(fd, create.handle);
+}
+
+static void dmabuf_write(int fd)
+{
+	struct drm_mode_create_dumb create = {
+		.width = 64,
+		.height = 64,
+		.bpp = 32,
+	};
+	int dma_buf_fd;
+	uint32_t *ptr;
+
+	dumb_create(fd, &create);
+
+	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, create.handle);
+	/* Skip if DRM_RDWR is not supported */
+	igt_skip_on(errno == EINVAL);
+
+	ptr = mmap(NULL, create.size, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
+	igt_assert(ptr != MAP_FAILED);
+	memcpy(ptr, pattern, sizeof(pattern));
+	munmap(ptr, create.size);
+
+
+	ptr = dumb_map(fd, create.handle, create.size, PROT_READ);
+	igt_assert(ptr != MAP_FAILED);
+	igt_assert(ptr != NULL);
+	igt_assert(create.size > sizeof(pattern));
+	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
+	munmap(ptr, create.size);
+
+	close(dma_buf_fd);
+
+	dumb_destroy(fd, create.handle);
+}
+
 igt_main
 {
 	int fd = -1;
@@ -414,6 +504,12 @@ igt_main
 	igt_subtest("create-clear")
 		always_clear(fd, 30);
 
+	igt_subtest("dmabuf-read")
+		dmabuf_read(fd);
+
+	igt_subtest("dmabuf-write")
+		dmabuf_write(fd);
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.40.1

