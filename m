Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE7C61DB2
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D03D10E784;
	Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mbk9RvyQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A5A10E76E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057571; x=1780593571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hx1e/bNHYYg/23ZSbx8A3wOtEMhgzi/SnefS4TIlE6M=;
 b=Mbk9RvyQyC1arXuXeF2cIXM5FC58zd4C/GjrUTC8URwqqaKgEgwsU54j
 dA+9vo6NzqS/6DyP8rfEfJC3yluhrlMa5oVojQEFXjFUlYALflbzjTnP3
 M6w+lny0xgh0YfJfCqfSg2DPta5XgM9ny9CL/uFxI6zEApQU8Gsa+6+1f
 os2qjs6Y/A1dBivR3IK3gKVnvcIA5LQwj06zeoFNSSC23izje0okk2aOB
 pGsnMCq0P3VHticc/ofh8jLSafQa5Ol1aMv+Ha1nXPQHSk26PIOuG0v3M
 fLXTBO+uTZw7b9BD9mq/6bVLRPkqKAKlbA/f9CBAPdNAGyuzquNqtx5C/ A==;
X-CSE-ConnectionGUID: otwsUc0US526FjhbpcVr8w==
X-CSE-MsgGUID: Yazgemh2Tt2zNMdgO//MwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595936"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595936"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:31 -0700
X-CSE-ConnectionGUID: gOx2LGhBQneOU8Sa+289HQ==
X-CSE-MsgGUID: ak1xLd/4TH+KpZf6m5t0GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203253"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:29 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v15 2/9] lib: Include local igt glib header for Android
Date: Wed,  4 Jun 2025 17:16:49 +0000
Message-ID: <20250604171656.31559-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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

