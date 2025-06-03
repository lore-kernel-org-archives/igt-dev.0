Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2BCC5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B5A10E60C;
	Tue,  3 Jun 2025 16:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBxUxuOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91DB10E5C9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748968676; x=1780504676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hx1e/bNHYYg/23ZSbx8A3wOtEMhgzi/SnefS4TIlE6M=;
 b=MBxUxuOVrVWP5lODjjKRjvL5k3GRy4CPDeI36yTJxfs6Ra7VAhWI/9KH
 G63umaq1tuTEPtWgwLEOD7qtUPhqiMsCPut88mS9uq8324pSPFMztP7p/
 RONJNkFQvgQesMvGnL+Smm9jJcJIgjsQXk/HgisGgJNPVjGy3PGesCUgM
 m+iqkMohEFc7L0Q7VUflcg5UoFKO50IQyUi4l4O8IbNDMHW/jb48MRJjZ
 n8PHU61zbMcHQyoNFZ7Rqfrbxd6X+8OzoLNMGrDq6wTlARbyor895ZUP/
 P/6SLO7hPAygE+sGlcpT0SCofkjS7bmhxe/n9UUuLSBRaAlmY1tdgIOq4 w==;
X-CSE-ConnectionGUID: zI58JsM1QPKbLixgPWYojw==
X-CSE-MsgGUID: TiGJpkwATtuTt8HHzyeYAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68573251"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68573251"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:37:56 -0700
X-CSE-ConnectionGUID: +h+n8NL/SBifdumHY8ijGA==
X-CSE-MsgGUID: +iIb2hY/TxKxe4GMxXDWsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182090297"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2025 09:37:53 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 04/11] lib: Include local igt glib header for Android
Date: Tue,  3 Jun 2025 16:37:07 +0000
Message-ID: <20250603163715.70774-5-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
References: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local igt glib header to
build igt for Android.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_chamelium.c     | 4 ++++
 lib/igt_core.c          | 4 ++++
 lib/igt_rc.h            | 4 ++++
 lib/intel_batchbuffer.c | 4 ++++
 4 files changed, 16 insertions(+)

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
index a0c3fe340..4bc1cf5b6 100644
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

