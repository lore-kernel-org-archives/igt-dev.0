Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36468C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9910E952;
	Thu, 15 May 2025 19:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9T4F6JM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217D210E94E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338756; x=1778874756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bblvI8vOFJ4eYxwm4HKyOzxgEMrh86WR7DScTlBor8w=;
 b=A9T4F6JMUXmq2SfRy2hO8AytzkXpZ8UymqNZLELDlXHjKp4QwfS65fqP
 tYvyJdrsqVB3XvEfRr6Z7cTfoj00tjyP3us1oEdGxoEN1B9lWusbxrjOm
 ZHEyoirspE1xI2Gzsr38MNW4edXqNCZOzb5+iEN+8mDCrMrtKEoJMHzdB
 rPIFhc5tFoQr/NUGe1JMh+tNZsxBT562eIB2OK1sSu8XS1FK+gKeM/9Y1
 e6OABQskIDT6Cf6yuuPC2QsnbBDBxKwPiFEtOyN9pvpCAt6BgAwTdzalN
 l4+zfwFG+z3aANJeDIgySpZBHcs2fZA4sOC6X4ZqaMfItJFus0rVjxsE5 Q==;
X-CSE-ConnectionGUID: Z4IfsGyXSXCLLMrol/YoXg==
X-CSE-MsgGUID: bKWUeovYRpKyfT66nmoQLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454450"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:52:35 -0700
X-CSE-ConnectionGUID: jwnUPTx+TdGT2p05CPkOog==
X-CSE-MsgGUID: E87C1sczSIu52tOVcnJb/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347343"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:33 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 02/14] lib: Include local igt procps,
 glib and unwind header for Android
Date: Thu, 15 May 2025 19:51:55 +0000
Message-ID: <20250515195207.106414-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_aux.c           | 4 ++++
 lib/igt_chamelium.c     | 4 ++++
 lib/igt_core.c          | 8 ++++++++
 lib/igt_rc.h            | 4 ++++
 lib/intel_batchbuffer.c | 4 ++++
 5 files changed, 24 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index f5bf48da6..3eca09cd9 100644
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
index e1061a2ed..1d7402cb7 100644
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
@@ -82,7 +86,11 @@
 #include "runnercomms.h"
 
 #define UNW_LOCAL_ONLY
+#ifndef ANDROID
 #include <libunwind.h>
+#else
+#include "android/unwind.h"
+#endif
 #include <elfutils/libdwfl.h>
 
 #ifdef HAVE_LIBGEN_H
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
2.34.1

