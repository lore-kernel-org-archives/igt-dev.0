Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2382DCCF9F8
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 12:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6D410EB1D;
	Fri, 31 Oct 2025 12:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxGpHs1T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D6110EB1D
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761912503; x=1793448503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T3Jv4Y31M0kd1mJ5eJx1y33xFUBDgpMPDsrPfBkleTI=;
 b=PxGpHs1TWtwNBQz3lk381HZNPg80/EwAr97hbFtkEeg0maFCHRgvb8Iz
 noDvngnA2izpJm1U6+SF4WZiy95z3QIDsZpdNL74jenAalhfMUfzs2RoS
 oEdh6Mo+KxYemrwO/izbAyx7SgA7EO+r7nlMxNSerWeUnb2fs9ZGDFXoq
 7bsO2JKG/+Jt0aEo25weVqj8uPE999csgQbK9f/m9Qo1373oHyIgZFWwQ
 a9SjyVR3tjYV8b19qTEknlvQayowl7lC6N9Pib3XT/Qr+/1iGVNnQWMjq
 si2YeZjcrcz7ywhkPCP7tDeyW01VicBdxUDLpy/9ss/sAbKpikKmCnxKx w==;
X-CSE-ConnectionGUID: iSxHnt/GRYCw8TIXP8+dZg==
X-CSE-MsgGUID: x0XokZt3QTyWjuzJewAj+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63999524"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63999524"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:08:22 -0700
X-CSE-ConnectionGUID: zHUmQKxWRli1Eu2K5/+Ihw==
X-CSE-MsgGUID: /eWd69JdSoW61zqzyY716w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="209786926"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:08:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
Date: Fri, 31 Oct 2025 12:08:14 +0000
Message-ID: <20251031120813.269203-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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
which allows to caller to handle the error.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/ioctl_wrappers.c | 29 +++++++++++++++++++++++++++++
 lib/ioctl_wrappers.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 176cbdacc..fe93d36f6 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1139,6 +1139,35 @@ int prime_handle_to_fd_for_mmap(int fd, uint32_t handle)
 	return args.fd;
 }
 
+/**
+ * __prime_fd_to_handle:
+ * @fd: open i915 drm file descriptor
+ * @dma_buf_fd: dma-buf fd handle
+ * @handle: output handle
+ *
+ * This wraps the PRIME_FD_TO_HANDLE ioctl, which is used to import a dma-buf
+ * file-descriptor into a gem buffer object.
+ *
+ * Returns: Zero one succeess, error code otherwise
+ */
+int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle)
+{
+	struct drm_prime_handle args;
+	int err;
+
+	memset(&args, 0, sizeof(args));
+	args.fd = dma_buf_fd;
+	args.flags = 0;
+	args.handle = 0;
+
+	err = igt_ioctl(fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &args);
+	if (err)
+		return err;
+
+	*handle = args.handle;
+	return 0;
+}
+
 /**
  * prime_fd_to_handle:
  * @fd: open i915 drm file descriptor
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
2.51.0

