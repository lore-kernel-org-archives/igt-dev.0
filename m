Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0718FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708D710E2C4;
	Tue, 28 Apr 2026 04:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbWu0/OJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE4710E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351641; x=1808887641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Co7OxV857INDprT1u/3snAH1lUpFQKNX4lmwXIxpZBw=;
 b=BbWu0/OJqLZBG0a1iG+ftM5uY2cyR2Et/tZoWj/uVcwgEdaBoI/XXmNP
 /pvKL0Dji0wj3XGH3Qxr7TVPN9FFoIjxasPBoPUsoau7mX4B4eITyMhsO
 pEF23O9XByZnaHiyodQKVJdzlzqG/a4xbFa5rgCreInE6A79s8wsyKrm6
 7puXUbClo8oIRsVvCQQZreUoUtAEB9D01QSUhzUcFB7elenURP1LK8/3K
 5zSNYUf+tWnreq2uBhQ3+OkJswmOEBGuzVtnajARSRZKCje3gmXvOMNgp
 kg93LsW25QfOW7gwlEwVDIm4WJknCus4fBDtYDr54lHh+L7tLjQJH2LJU A==;
X-CSE-ConnectionGUID: rqq7XvNDR3WaavQ98PEBPg==
X-CSE-MsgGUID: XUpH9yQySLaJIr+VVC0Ndg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167822"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:21 -0700
X-CSE-ConnectionGUID: SBx5jKL8RPa5SjV2qcXAxw==
X-CSE-MsgGUID: ivjv3lHLQ4Wr7P+qmVch1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706677"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:20 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 12/25] lib/chamelium/v2: Extract chamelium v2 wrapper
 into its own directory
Date: Tue, 28 Apr 2026 10:16:21 +0530
Message-ID: <20260428044644.257001-13-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

In preparation for the Chamelium v3, the support for Chamelium v2 is being
extracted into its own directory.

The two Chamelium versions have different sets of functionality (audio,
MST, CRC computation, etc.). As the current wrapper is already complex,
extracting the v2 part into its own directory allows for the v3 wrapper to
be written without breaking any existing tests or complicating the
existing code.

The current identified complexities that necessitate a thorough rework of
the existing v2 wrapper are:

 - Not all ports are discoverable in v3 (MST ports are not physical
   ports, but they can have EDID, be plugged, etc.), and they can change
   over time.
 - The v3 is unable to perform CRC computation, so many tests must be
   rewritten or adapted to work.
 - Not all ports can be plugged at once, which is a feature used by the
   existing v2 wrapper to set up the Chamelium.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/{ => chamelium/v2}/igt_chamelium.c        | 2 +-
 lib/{ => chamelium/v2}/igt_chamelium.h        | 0
 lib/{ => chamelium/v2}/igt_chamelium_stream.c | 2 +-
 lib/{ => chamelium/v2}/igt_chamelium_stream.h | 0
 lib/igt.h                                     | 4 ++--
 lib/igt_kms.c                                 | 2 +-
 lib/meson.build                               | 5 ++++-
 lib/monitor_edids/monitor_edids_helper.h      | 2 +-
 tests/chamelium/v2/kms_chamelium_edid.c       | 2 +-
 tests/kms_feature_discovery.c                 | 2 +-
 10 files changed, 12 insertions(+), 9 deletions(-)
 rename lib/{ => chamelium/v2}/igt_chamelium.c (99%)
 rename lib/{ => chamelium/v2}/igt_chamelium.h (100%)
 rename lib/{ => chamelium/v2}/igt_chamelium_stream.c (99%)
 rename lib/{ => chamelium/v2}/igt_chamelium_stream.h (100%)

diff --git a/lib/igt_chamelium.c b/lib/chamelium/v2/igt_chamelium.c
similarity index 99%
rename from lib/igt_chamelium.c
rename to lib/chamelium/v2/igt_chamelium.c
index cb240a7df..3a0d60fc4 100644
--- a/lib/igt_chamelium.c
+++ b/lib/chamelium/v2/igt_chamelium.c
@@ -41,7 +41,7 @@
 #include <pixman.h>
 #include <cairo.h>
 
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #include "igt_core.h"
 #include "igt_aux.h"
 #include "igt_edid.h"
diff --git a/lib/igt_chamelium.h b/lib/chamelium/v2/igt_chamelium.h
similarity index 100%
rename from lib/igt_chamelium.h
rename to lib/chamelium/v2/igt_chamelium.h
diff --git a/lib/igt_chamelium_stream.c b/lib/chamelium/v2/igt_chamelium_stream.c
similarity index 99%
rename from lib/igt_chamelium_stream.c
rename to lib/chamelium/v2/igt_chamelium_stream.c
index a8cd19e51..8d96e6549 100644
--- a/lib/igt_chamelium_stream.c
+++ b/lib/chamelium/v2/igt_chamelium_stream.c
@@ -33,7 +33,7 @@
 #include <sys/types.h>
 #include <sys/socket.h>
 
-#include "igt_chamelium_stream.h"
+#include "chamelium/v2/igt_chamelium_stream.h"
 #include "igt_core.h"
 #include "igt_rc.h"
 
diff --git a/lib/igt_chamelium_stream.h b/lib/chamelium/v2/igt_chamelium_stream.h
similarity index 100%
rename from lib/igt_chamelium_stream.h
rename to lib/chamelium/v2/igt_chamelium_stream.h
diff --git a/lib/igt.h b/lib/igt.h
index 173ca70bf..9802f44cb 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -45,8 +45,8 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_alsa.h"
 #include "igt_audio.h"
-#include "igt_chamelium.h"
-#include "igt_chamelium_stream.h"
+#include "chamelium/v2/igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium_stream.h"
 #endif
 #include "instdone.h"
 #include "intel_batchbuffer.h"
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 73d65f70a..2d7c40622 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -64,7 +64,7 @@
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #endif
 
 /**
diff --git a/lib/meson.build b/lib/meson.build
index 0e7efadf3..0d94db9cd 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -235,7 +235,10 @@ endif
 
 if chamelium.found()
 	lib_deps += chamelium
-	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
+	lib_sources += [
+		'chamelium/v2/igt_chamelium.c',
+		'chamelium/v2/igt_chamelium_stream.c'
+	]
 	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index 7ae0fd40c..c32c0ec47 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -16,7 +16,7 @@
 #include <stdbool.h>
 
 #include "igt_core.h"
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 
 /* Max Length can be increased as needed, when new EDIDs are added. */
 #define EDID_NAME_MAX_LEN 28
diff --git a/tests/chamelium/v2/kms_chamelium_edid.c b/tests/chamelium/v2/kms_chamelium_edid.c
index e014ba3aa..6bece0a26 100644
--- a/tests/chamelium/v2/kms_chamelium_edid.c
+++ b/tests/chamelium/v2/kms_chamelium_edid.c
@@ -41,7 +41,7 @@
 
 #include "config.h"
 #include "igt.h"
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #include "igt_edid.h"
 #include "igt_eld.h"
 #include "igt_vc4.h"
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 28ec89c55..ba934abbf 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -34,7 +34,7 @@
 
 #include "igt.h"
 #ifdef HAVE_CHAMELIUM
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #endif
 #include "igt_kms.h"
 #include "igt_psr.h"
-- 
2.48.1

