Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BB0C3601E
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 00:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D089210E58E;
	Tue,  8 Apr 2025 00:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U+bO1aaO";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD2410E58E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 00:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=49K04wmpgrbUZimGEu7eqII+A6wT5ockNg47oowVXfU=; b=U+bO1aaOBshUq/szZ6nmzx7QTU
 wQy0fSpv925RreJc3YPCVMJlWE2ZBBttQ2FMb+BycVLV81NpwxQDVqj/YKxCI3zxEqSCrf9ZHajoq
 u1M5y1+k0f6A9ryNK2EZxnwq2wQ8PZ6kRiRCCorEUBj7hgUPBq0xaUA5woKbpD2buDdJgGWEPF9pc
 SAOrXM6fBq3tpFlMbTD3U/ZbfIzZuR9ZIaFoQzp3yIb7tH9fCusP4XuDQQecRi3ePv2CmAniXV0n/
 3DqJOgbWP5fQ3tiW1Di0UKzb4G3sgqJyw1MTDN1+1eNE/MbsLri5SceyO0rrJtkW2g2wpX4A7VaZ4
 gxc/PnZQ==;
Received: from [187.57.129.172] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u1wQE-00D5aL-1B; Tue, 08 Apr 2025 02:02:34 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v6 1/4] lib/ioctl_wrappers: let the caller handle capability
 check result
Date: Mon,  7 Apr 2025 21:02:18 -0300
Message-ID: <20250408000221.140459-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408000221.140459-1-andrealmeid@igalia.com>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Melissa Wen <mwen@igalia.com>

Rework igt_has_drm_cap to just check if a DRM capability is supported
and let the called decide what to do from this check. It prevents the
test fails because of an assert done when it's called in
igt_subtest_with_dynamics.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 lib/ioctl_wrappers.c    | 13 ++++++++-----
 lib/ioctl_wrappers.h    |  2 +-
 tests/kms_async_flips.c | 13 +++++++++----
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 146973f0d..33f593295 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1288,14 +1288,17 @@ int __kms_addfb(int fd, uint32_t handle,
  * This helper verifies if the passed capability is
  * supported by the kernel
  *
- * Returns: Whether the capability is supported or not.
+ * Returns: negative value if error, 0 if cap is not supported, 1 if cap is
+ * supported.
  */
-bool igt_has_drm_cap(int fd, uint64_t capability)
+int igt_has_drm_cap(int fd, uint64_t capability)
 {
-	struct drm_get_cap cap = { .capability = capability };
+	uint64_t value = 0;
+
+	if (drmGetCap(fd, capability, &value))
+		return -errno;
 
-	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
-	return cap.value;
+	return value ? 1 : 0;
 }
 
 /**
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index b7d7c2ad9..7cf05e626 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -144,7 +144,7 @@ void prime_sync_end(int dma_buf_fd, bool write);
 
 bool igt_has_fb_modifiers(int fd);
 void igt_require_fb_modifiers(int fd);
-bool igt_has_drm_cap(int fd, uint64_t capability);
+int igt_has_drm_cap(int fd, uint64_t capability);
 bool igt_has_set_caching(uint32_t devid);
 
 /**
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index da426f753..126b96d6b 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -203,8 +203,10 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 static void require_monotonic_timestamp(int fd)
 {
-	igt_require_f(igt_has_drm_cap(fd, DRM_CAP_TIMESTAMP_MONOTONIC),
-		      "Monotonic timestamps not supported\n");
+	int ret = igt_has_drm_cap(fd, DRM_CAP_TIMESTAMP_MONOTONIC);
+
+	igt_assert(ret >= 0);
+	igt_require_f(ret, "Monotonic timestamps not supported\n");
 }
 
 static void test_init(data_t *data)
@@ -747,13 +749,16 @@ igt_main
 	int i;
 
 	igt_fixture {
+		int ret;
+
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 
-		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP),
-			      "Async Flip is not supported\n");
+		ret = igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP);
+		igt_assert(ret >= 0);
+		igt_require_f(ret, "Async Flip is not supported\n");
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
-- 
2.49.0

