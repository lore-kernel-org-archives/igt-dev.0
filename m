Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80C6D2CDF7
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6484510E6AE;
	Tue, 22 Oct 2024 15:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCkppg+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF6C10E6AE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729612362; x=1761148362;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2Rkq+EaormZJR5OOa26r6Z0xPFmDfJM2Uhg3IeLVwLA=;
 b=CCkppg+OwIsSn1/YcCuT6q6SD48Sw4lASF6GdkaMLrL7lhKKfzdF4Qws
 MQ2/8JBdkYqdg7YE2TqMPjhPpxk75t9I0L6CUHwF9tND/IPkC2lb4RXUI
 rwKicTjOmyZCcvDeM4T6/LWQ7rwQWa+UzP4cKMsdxYtZWSlXHvF0vAiWl
 /DIPxTYbvxdwEO91yhQclPdPwcnmH+8Je8CKLLL8OJX3GGPm00WJ45cAG
 n63290ZFInH+Q12fUQJXsYiQYoA9/58b8htnZAXxBkBNUUl5QsNvOrkeA
 pMdm+MKej0ufDg3rgwD9wQ0qHtf9qZc3mF/W0tkNtMEPP8PYzeHS49GBZ A==;
X-CSE-ConnectionGUID: nE0LU/ozR9iRRrwLvrzQnQ==
X-CSE-MsgGUID: sPVP0oH5R4qNMK+FDXlSrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29268528"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29268528"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:42 -0700
X-CSE-ConnectionGUID: l74/JvvfT6ykIWRB2qdGDg==
X-CSE-MsgGUID: zDrNa7YZQtS+81l9AP5K8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80248397"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:41 -0700
From: Imre Deak <imre.deak@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 2/3] lib/igt_kms: Add kmstest_wait_for_pageflip_timeout()
Date: Tue, 22 Oct 2024 18:53:10 +0300
Message-ID: <20241022155311.2797257-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241022155311.2797257-1-imre.deak@intel.com>
References: <20241022155311.2797257-1-imre.deak@intel.com>
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

Add a function to wait for a page flip completion providing the timeout
duration. This is required by the next patch, using an Intel HW specific
pageflip timeout.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 21 +++++++++++++++++----
 lib/igt_kms.h |  1 +
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99231d6e7..81a9930a2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2377,15 +2377,16 @@ unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags)
 }
 
 /**
- * kmstest_wait_for_pageflip:
+ * kmstest_wait_for_pageflip_timeout:
  * @fd: Opened drm file descriptor
+ * @timeout_us: timeout used for waiting
  *
  * Blocks until pageflip is completed
  */
-void kmstest_wait_for_pageflip(int fd)
+void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us)
 {
 	drmEventContext evctx = { .version = 2 };
-	struct timeval timeout = { .tv_sec = 0, .tv_usec = 50000 };
+	struct timeval timeout = { .tv_sec = 0, .tv_usec = timeout_us };
 	fd_set fds;
 	int ret;
 
@@ -2398,7 +2399,8 @@ void kmstest_wait_for_pageflip(int fd)
 	} while (ret < 0 && errno == EINTR);
 
 	igt_fail_on_f(ret == 0,
-		     "Exceeded timeout (50ms) while waiting for a pageflip\n");
+		     "Exceeded timeout (%" PRIu64 " us) while waiting for a pageflip\n",
+		     timeout_us);
 
 	igt_assert_f(ret == 1,
 		     "Waiting for pageflip failed with %d from select(drmfd)\n",
@@ -2407,6 +2409,17 @@ void kmstest_wait_for_pageflip(int fd)
 	igt_assert(drmHandleEvent(fd, &evctx) == 0);
 }
 
+/**
+ * kmstest_wait_for_pageflip:
+ * @fd: Opened drm file descriptor
+ *
+ * Blocks until pageflip is completed using a 50 ms timeout.
+ */
+void kmstest_wait_for_pageflip(int fd)
+{
+	kmstest_wait_for_pageflip_timeout(fd, 50000);
+}
+
 /**
  * kms_has_vblank:
  * @fd: DRM fd
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index fc7e4cda1..57e62d86c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -310,6 +310,7 @@ void *kmstest_dumb_map_buffer(int fd, uint32_t handle, uint64_t size,
 			      unsigned prot);
 void kmstest_dumb_destroy(int fd, uint32_t handle);
 void kmstest_wait_for_pageflip(int fd);
+void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
 unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
 
 bool kms_has_vblank(int fd);
-- 
2.44.2

