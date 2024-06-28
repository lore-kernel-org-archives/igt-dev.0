Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DFDC2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 19:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C472D10ED30;
	Fri, 28 Jun 2024 19:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Vxs4Wjj9";
	dkim-atps=neutral
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587D510ED30
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 19:03:28 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6b5834b3a95so4598266d6.2
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719601407; x=1720206207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eE2zwcUR0JoOPGNnXs9CbrqNpPm/DIqILekXLYrLVQU=;
 b=Vxs4Wjj9Yl17Bw8hPMVBiVpifP7MewzRtAltdj4qg2Q0cndxxzcuyU7RERxlx7BX78
 ME9LCUTdC1DY69DdOvZhD7p6UuEMs2oChSJdkcv/tKVeG03kcYiD8Tr7JXYslBnxcfxH
 cBA8eX5tcivuOeqsvxWzZjv/rRgLp37uBIX/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719601407; x=1720206207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eE2zwcUR0JoOPGNnXs9CbrqNpPm/DIqILekXLYrLVQU=;
 b=gvQXXV/0zPin6mTjYuRFK37GxCaF53vTkBTrZJuUXUSAAn/33SzhVGPSwV7O4q3C0S
 MoGjlOSI5M0msedgpP5tP7TjmIusL6Tqf6S6QIoTukGMUHsMjJ1dNBk7te7bfoj5Dc4k
 txqUDJ0oABw54qfQjsXZrpNY+TJQpJi9+GWnpD9rSkoS7ZFoi3am/XZBQMoGiat6IPpM
 cY1fCdh/+dH7yruFmD3Kkh4paRcHR9KCE6dKAcPN0oKGuJixRJX3X3okmR2rh3Giv17N
 mA7EQRGubTt1ewt2FQgdnCTlrKFe8DNhcqTJWJSyZxiz+19NVA6VDvFKZFNkYe7JPG6X
 cJDg==
X-Gm-Message-State: AOJu0Yw2nY9HIB2ZRA/6WvaAfe2tBVHMRL93BgdazN4YEeTpxAkYiWLc
 xRTno+DbnXt6JAFaLpmNBX3WQ7qvRmd2IPm4smvs+up/B9S7XUU4gGaWDltM/OXgok7sZRe1UpO
 fnUm0b17LaMPr9qcZQMXwHigCjFwXlzr3p2jZjnkqJvUpVZtKormTCrSjRQGJKn7sD+fAld072w
 jNvbhwJ1eYEDfTydtZ8s0v8YZ9hdcmQ3YV1tGdXBWDbAci0H3Lgg==
X-Google-Smtp-Source: AGHT+IH9YFT/uRglHBPf+X8CPmggmnLsMgtPtmGtIYNUheuXMCJXPiXh4g33L3/v3slgmLkLwpWhNQ==
X-Received: by 2002:a05:6214:a87:b0:6b0:6dba:c947 with SMTP id
 6a1803df08f44-6b5409c70b6mr147143886d6.18.1719601406983; 
 Fri, 28 Jun 2024 12:03:26 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e74144bsm10100016d6.141.2024.06.28.12.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 12:03:26 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t] tests/dumb_buffer: Add subtests for mixing dumb buffers
 with prime
Date: Fri, 28 Jun 2024 15:03:18 -0400
Message-Id: <20240628190318.700537-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
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
 tests/dumb_buffer.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 8e243459c..62e9b419d 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -69,6 +69,18 @@
  * SUBTEST: map-uaf
  *
  * SUBTEST: map-valid
+ *
+ * SUBTEST: dmabuf-read
+ * Description: Make a dumb buffer, map it using the dumb buffer interface,
+ *              export it via prime, mmap the prime buffer and check
+ *              that its contents matches what we wrote to the dumb
+ *              buffer.
+ *
+ * SUBTEST: dmabuf-write
+ * Description: Make a dumb buffer, map and write to it using the prime
+ *              interface, than map it using the dumb buffer interface
+ *              and check whether its contents matches what we wrote using
+ * 		the prime interface.
  */
 
 IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
@@ -388,6 +400,82 @@ static void always_clear(int fd, int timeout)
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
@@ -414,6 +502,12 @@ igt_main
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

