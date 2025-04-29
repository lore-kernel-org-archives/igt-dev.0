Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8EDC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A281310E464;
	Tue, 29 Apr 2025 20:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRHycdRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ABA10E457
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959243; x=1777495243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MJBuxRnPBvv4Ju9ZuXTyB1NB9djkVfAoAoQjSHIqmeM=;
 b=jRHycdRcLPndXL6EXuPc4vEMSm2pNhnvTN/5/bDfOJSaC2IPbmBMFuhI
 0iku9K7OEKd/VqqssOI4SVf7SL6EBmNhNxo3oGUVo+KZbTarCHVC2/ih1
 gpN6CnKjzbiMngWTBd2m6LVR4444ZIUJ19B0fq41Fk4ADSK0ynnNeMPDS
 FiNbhsnk86MRd9FKXaZmbp3fyHnma/H/he+eNSmG6YS/595NNSQC7Odrd
 SmalT7O1klhC10s3wMTx01rfNA0yA3I5Hc42ZBWCxdBg1RYKpxMT+GuXH
 4aLN7V+T0JV/BYyR8tkQvm2zhUfHTly0RCMWKF418UaRSAi441jZ9y2Jz Q==;
X-CSE-ConnectionGUID: EjGWR8wSRyKRPxem1ZvY3g==
X-CSE-MsgGUID: 6/utcOM+TZGnLA+4poePFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72983469"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="72983469"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:40:42 -0700
X-CSE-ConnectionGUID: O5UA1ptBSvWFiSHHKYzh4Q==
X-CSE-MsgGUID: 3nelruMFQ5WBBSUDJdFz+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="138739991"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 13:40:41 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH 5/5] igt-gpu-tools: Changes to compile for Android
Date: Tue, 29 Apr 2025 20:39:19 +0000
Message-ID: <20250429203919.41503-6-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429203919.41503-1-jeevaka.badrappan@intel.com>
References: <20250429203919.41503-1-jeevaka.badrappan@intel.com>
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

