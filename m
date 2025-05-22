Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C234BC54EDA
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 14:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662BA10ECD8;
	Thu, 22 May 2025 14:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGWul8BD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFC910ED14
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747924487; x=1779460487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=43RmwBjYme87GwKJK2De+1KUo+9IwqpPYWk61vHc9AU=;
 b=CGWul8BDgBqH+W7aRihsYTkT2/+0A0kDxi4oCXKfAphIJNkHgH3KwA6w
 crrBftIs/jF/PfStJDI6KXHPjoxw21hDsaPu6Ohp28KKCOAQ/umdeepZk
 Dlpm6NV7GXEsZX9cwYQ7+txCR/ieprZAYwPGSy9v6EifLr/t8erB3PHF0
 TWfCzty3N2bHdWlGHtP+oRVbKwVfo20sJ0B3R9Mo94SljvvH4jqs8uPGo
 QxpYe9iKe7OwA48YuzecHy01VZkKfFX+UQv05lwx33d6iWh+9ZAZti47G
 pcfXLAElDBH9NHZNq05c8lhid83S66YiA/rPrZPu3/Vlc4oEmP7HKxCrW g==;
X-CSE-ConnectionGUID: xz1Y5bU0TweYG/DskzsKiA==
X-CSE-MsgGUID: 6I8qjO79TGCRqYDxrwYZ5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75351160"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="75351160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:34:46 -0700
X-CSE-ConnectionGUID: 9FiX7f+TSjufjC/hEb4qUQ==
X-CSE-MsgGUID: gfA9I+6mRMeHiFPW8FtsQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140495549"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 22 May 2025 07:34:44 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v10 2/7] lib: Include local igt procps,
 glib header for Android
Date: Thu, 22 May 2025 14:34:14 +0000
Message-ID: <20250522143419.28888-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
References: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
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

As procps, glib are not available in Android, added local stub
procps, glib headers to build igt for Android.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_aux.c           | 4 ++++
 lib/igt_chamelium.c     | 4 ++++
 lib/igt_core.c          | 4 ++++
 lib/igt_rc.h            | 4 ++++
 lib/intel_batchbuffer.c | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 2905824a5..9ea37ebc6 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -53,11 +53,15 @@
 #include <assert.h>
 #include <grp.h>
 
+#ifndef ANDROID
 #ifdef HAVE_LIBPROCPS
 #  include <proc/readproc.h>
 #else
 #  include <libproc2/pids.h>
 #endif
+#else
+#include "android/procps.h"
+#endif
 
 #include <dirent.h>
 #ifdef __linux__
diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index a96e36b5b..d19a78ffa 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -33,7 +33,11 @@
 #include <xmlrpc-c/base.h>
 #include <xmlrpc-c/client.h>
 #include <pthread.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "android/glib.h"
+#endif
 #include <pixman.h>
 #include <cairo.h>
 
diff --git a/lib/igt_core.c b/lib/igt_core.c
index b06cdfd89..c2674a272 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -55,7 +55,11 @@
 #include <limits.h>
 #include <locale.h>
 #include <uwildmat/uwildmat.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "android/glib.h"
+#endif
 
 #include "drmtest.h"
 #include "i915/gem_create.h"
diff --git a/lib/igt_rc.h b/lib/igt_rc.h
index 53e5ce669..d871b3b26 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -25,7 +25,11 @@
 #ifndef IGT_RC_H
 #define IGT_RC_H
 
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "android/glib.h"
+#endif
 
 extern GKeyFile *igt_key_file;
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f7569e768..caf142949 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -26,7 +26,11 @@
  **************************************************************************/
 
 #include <search.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "android/glib.h"
+#endif
 
 #include "gpgpu_fill.h"
 #include "huc_copy.h"
-- 
2.49.0

