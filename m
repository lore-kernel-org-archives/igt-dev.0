Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE38C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE79010E21E;
	Tue,  3 Jun 2025 19:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMdma4Rt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B773810E02E
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978682; x=1780514682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKgkkT7l1AAjYDiOyMZWCEUrh6ZglkdcT8H+T8Z1RGs=;
 b=BMdma4RtDGTJYiiXfiD/ZjXqnRV+PG8C2L4qYaOoRP9qNUK3sfI0htcE
 l/u+lq7XzZTLexFy0HJr9YFjsGfwKG45isEeFPTY7rM0IjsdaIpaJWALr
 7pKtyINq5NKJsOxrjPun5dJKcNPwqNnUTixil0Qu6GVEQxy4tg9FAhVIA
 Orlost3XDtSJpWvGGlh0H7JmJKcldoYeCUg3zzJaiPjosmGHP9vDPJ5db
 FhtgsHzF8XaUsyWY7Cbc/sIwWpepJaVKa3VhEVqx9cbi4t4b02tKfvhWR
 x+dmAHX87aXeQ4/Gq66KELnfLJT4rL9A3y8cndiemItFSjORsupoJdOn5 Q==;
X-CSE-ConnectionGUID: M+/KDUuITg+lcX+D/dPC8Q==
X-CSE-MsgGUID: kbpMWJIORUu2DvDq2qOpOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76424308"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="76424308"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:24:42 -0700
X-CSE-ConnectionGUID: waWpaQOKQ9e4/ImqEexoGA==
X-CSE-MsgGUID: pkTRZVttTy6Snefv6DnAtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175821290"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2025 12:24:39 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v14 06/11] tests/intel: Include local glib header for
 Android
Date: Tue,  3 Jun 2025 19:23:49 +0000
Message-ID: <20250603192355.77019-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
References: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local stub header to build
igt for Android.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/api_intel_bb.c | 4 ++++
 tests/intel/gem_ccs.c      | 4 ++++
 tests/intel/xe_ccs.c       | 4 ++++
 tests/intel/xe_intel_bb.c  | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 1910690cd..21ed6fc09 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -35,7 +35,11 @@
 #include <errno.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <zlib.h>
 #include "intel_bufops.h"
 #include "i915/gem_vm.h"
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index af1e85f6a..a84a47cc4 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -4,7 +4,11 @@
  */
 
 #include <errno.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <malloc.h>
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index e154bf4dc..bff5b5772 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -4,7 +4,11 @@
  */
 
 #include <errno.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <malloc.h>
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index f0cc17b1a..f2e92a024 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -6,7 +6,11 @@
 #include <cairo.h>
 #include <errno.h>
 #include <fcntl.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
2.49.0

