Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BFEC3ABA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 19:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA8510E1B2;
	Tue, 29 Apr 2025 19:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGuSd/Un";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2430310E464
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 19:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745956747; x=1777492747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MJBuxRnPBvv4Ju9ZuXTyB1NB9djkVfAoAoQjSHIqmeM=;
 b=RGuSd/Un4Q47okPOF4DB+p1IoQz3vqlKWYCmt7UVVC8aMi5oLYdJfEhZ
 4Yv53BnvoXoeFMEaSxZPzTTQ/jZavj3bjxny/lEjWEhAvLRrIhOAE6PLI
 iQGXx3HOXD9tY0Wlo78bxAbQew3YuYyHBReiYVLXZ2JAVBq8DWVNwFrQF
 DAwMh4Uiv9hI9j1/irIETsqJPtmQ4ZQn76H2+DifBOw5uHfRuNvxcQ3fN
 BCv/flw8lESeRl6prGLVLaFXwuD5X+YM2MIm1QbsA5ijAahRSl7s1jifT
 BD7SmgTa/b3n683oNCjFYXyAA7E3uApWuHjGGRGU8XR9S3K8OKIvDa38a A==;
X-CSE-ConnectionGUID: 5ZDBFtoZTGqkIRQ8AHEf8Q==
X-CSE-MsgGUID: QrNpXDz8QX+VJuvqXljtTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46843150"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="46843150"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:59:06 -0700
X-CSE-ConnectionGUID: d60g6hnRRw+YjXPL74rsCg==
X-CSE-MsgGUID: oDKFLH8WRVyqQv3FbVPrrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133831346"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 12:59:05 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH 5/5] igt-gpu-tools: Changes to compile for Android
Date: Tue, 29 Apr 2025 19:57:45 +0000
Message-ID: <20250429195745.40982-6-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429195745.40982-1-jeevaka.badrappan@intel.com>
References: <20250429195745.40982-1-jeevaka.badrappan@intel.com>
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

Changes done to compile for android:
-  __noreturn and PAGE_SIZE are already defined in Android,
undef and then define it.
- define strchrnul for Android
- Replace index with strchr

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_core.c          |  4 ++++
 lib/igt_core.h          |  1 +
 lib/igt_kmod.c          | 10 ++++++++++
 tests/intel/xe_create.c |  1 +
 tools/intel_gpu_top.c   |  2 +-
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index e1061a2ed..519600dfa 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -373,6 +373,9 @@ static bool stderr_needs_sentinel = false;
 
 static int _igt_dynamic_tests_executed = -1;
 
+#ifdef ANDROID
+static void print_backtrace(void) {}
+#else
 static void print_backtrace(void)
 {
 	unw_cursor_t cursor;
@@ -433,6 +436,7 @@ static void print_backtrace(void)
 	if (dwfl)
 		dwfl_end(dwfl);
 }
+#endif // ANDROID
 
 __attribute__((format(printf, 2, 3)))
 static void internal_assert(bool cond, const char *format, ...)
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 45170e215..7add65938 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -86,6 +86,7 @@
 #define igt_assume(e) BUILD_BUG_ON_INVALID(e)
 #endif
 
+#undef __noreturn
 #define __noreturn __attribute__((noreturn))
 #define __maybe_unused __attribute__((unused))
 
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 14b6b957a..d0a7372b8 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -765,6 +765,16 @@ igt_amdgpu_driver_unload(void)
 	return IGT_EXIT_SUCCESS;
 }
 
+#ifdef ANDROID
+char *strchrnul(const char *s, int c)
+{
+	while (*s && *s != (char)c) {
+		s++;
+	}
+	return (char *)s;
+}
+#endif
+
 static void kmsg_dump(int fd)
 {
 	char record[4096 + 1];
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index b22084c84..264b2ae37 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -18,6 +18,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#undef PAGE_SIZE
 #define PAGE_SIZE 0x1000
 
 static struct param {
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 68d27089b..54e71e559 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -290,7 +290,7 @@ get_pmu_config(int dirfd, const char *name, const char *counter)
 	if (ret <= 0)
 		return -1;
 
-	p = index(buf, '0');
+	p = strchr(buf, '0');
 	if (!p)
 		return -1;
 
-- 
2.49.0

