Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1F1CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 11:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C65610E709;
	Wed,  5 Nov 2025 11:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTft/FYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55710E709
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762343504; x=1793879504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RVzSvXCbcWjp0axfseaauBWLni4Ul0Lme0/uN6HpS5E=;
 b=gTft/FYqix/Geqbqwxf/e62jL5zkTF17Qm+JJ57DiAcYwJp39vxJ2prl
 LHNQjtxJkUpVfAPQrzcL5zF1N4TsyIDZCs95jcbJgc5mVJ3ju2JPbbOn7
 ebUoLtHwxyd1IYMMENHaSQVT7HuW3wivV/lqp/vkqpaG1Gi2lEfEZm+XM
 ks7lpfDW3YEi4rFPMYdSQkQoU2epbfRGQhWkMn5DmNEXO283rK/xqMf2w
 DQ4UAlu4jXiHXr663Au75rMejv2bj3zsThVMLzcznbJtB8ZGl2SS25swV
 spOjDsAoHOPNUrEBeY/GNlVPOa0KW9oJZfz0wneurz626L6DOJC7GthLU A==;
X-CSE-ConnectionGUID: Vlz76ozRSBe1yttVBBgvww==
X-CSE-MsgGUID: LIzH/FsPQYiOXQBoGiexAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64382064"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64382064"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:51:44 -0800
X-CSE-ConnectionGUID: /S7oNIEVReWPCk0tp9EcUQ==
X-CSE-MsgGUID: kajAHUBORQ2PnwE4Mr8ppw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="188161716"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.54])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:51:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
Date: Wed,  5 Nov 2025 11:51:33 +0000
Message-ID: <20251105115132.97222-3-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 lib/ioctl_wrappers.c | 27 +++++++++++++++++++++++++++
 lib/ioctl_wrappers.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 176cbdacc..284a502e5 100644
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

