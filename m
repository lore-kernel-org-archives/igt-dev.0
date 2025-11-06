Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D12ACCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 12:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313510E048;
	Thu,  6 Nov 2025 12:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzh1nVl1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A0010E048
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762431523; x=1793967523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OAO9TOK/REpfZpMBZKEc6sICbaHpkBHVOW2D883UXy8=;
 b=dzh1nVl160Mdybq7Exa/ADwxrTQALB9/IyL1WHw71HWngweER0unY4in
 0cUnKYT0una6Y3jXKy1ouHNSf7UREIhYmLBCSWlLz27gB6nW/KQ0iEOam
 9876tM/izQs7uPrnSOAbfZ6y9sXlAtbojw5h/SejDFztfTFS/TE46HPXK
 gGYILinP5N94XR+y80Bm6EqShhWQpSUbWc6uX+HN4QnG6cTfHpdQ9AV81
 xvZ2vmlEuihvqm1iJylC2SYhB9NmP7WzpdMyRlsMR7OkfO+9rLCjkkbUg
 vuADJQH3Lk9vuCSBNjylqL5Fa9UjJwgH11Qxcj2m01bTKztdnssrAKL2B g==;
X-CSE-ConnectionGUID: p1J2lls8Q86nhddixil8Nw==
X-CSE-MsgGUID: uERTqZReR2u3FiWmvdFx9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75680585"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75680585"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:18:42 -0800
X-CSE-ConnectionGUID: xyWTKjdzRFqjk8mGaajOTg==
X-CSE-MsgGUID: Eke4JVEvTkOaALkhrQb3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187459105"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.194])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:18:41 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: [PATCH i-g-t v4 1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
Date: Thu,  6 Nov 2025 12:18:32 +0000
Message-ID: <20251106121831.150128-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.1
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

We want to be able to intercept the error, if there is one, instead of
always asserting a non-zero error. Add a version of prime_fd_to_handle()
which allows the caller to handle the error.

v2:
  - Ensure we use errno.
v3 (Kamil & Sanjay):
  - Some spelling fixes
  - s/i915//
v4 (Thomas):
  - Also convert prime_fd_to_handle() to now use __prime_fd_to_handle()

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/ioctl_wrappers.c | 38 ++++++++++++++++++++++++++++++--------
 lib/ioctl_wrappers.h |  1 +
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 176cbdacc..ef7221470 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1139,6 +1139,33 @@ int prime_handle_to_fd_for_mmap(int fd, uint32_t handle)
 	return args.fd;
 }
 
+/**
+ * __prime_fd_to_handle:
+ * @fd: open drm file descriptor
+ * @dma_buf_fd: dma-buf fd handle
+ * @handle: output handle
+ *
+ * This wraps the PRIME_FD_TO_HANDLE ioctl, which is used to import a dma-buf
+ * file-descriptor into a gem buffer object.
+ *
+ * Returns: Zero on success, error code otherwise
+ */
+int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle)
+{
+	struct drm_prime_handle args;
+
+	memset(&args, 0, sizeof(args));
+	args.fd = dma_buf_fd;
+	args.flags = 0;
+	args.handle = 0;
+
+	if (igt_ioctl(fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &args))
+		return -errno;
+
+	*handle = args.handle;
+	return 0;
+}
+
 /**
  * prime_fd_to_handle:
  * @fd: open i915 drm file descriptor
@@ -1151,16 +1178,11 @@ int prime_handle_to_fd_for_mmap(int fd, uint32_t handle)
  */
 uint32_t prime_fd_to_handle(int fd, int dma_buf_fd)
 {
-	struct drm_prime_handle args;
+	uint32_t handle;
 
-	memset(&args, 0, sizeof(args));
-	args.fd = dma_buf_fd;
-	args.flags = 0;
-	args.handle = 0;
+	igt_assert_eq(__prime_fd_to_handle(fd, dma_buf_fd, &handle), 0);
 
-	do_ioctl(fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &args);
-
-	return args.handle;
+	return handle;
 }
 
 /**
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 7cf05e626..5a899f052 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -138,6 +138,7 @@ int prime_handle_to_fd(int fd, uint32_t handle);
 #endif
 int prime_handle_to_fd_for_mmap(int fd, uint32_t handle);
 uint32_t prime_fd_to_handle(int fd, int dma_buf_fd);
+int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle);
 off_t prime_get_size(int dma_buf_fd);
 void prime_sync_start(int dma_buf_fd, bool write);
 void prime_sync_end(int dma_buf_fd, bool write);
-- 
2.51.1

