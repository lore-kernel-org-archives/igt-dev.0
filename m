Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD91606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5bta66w
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E891128DD;
	Fri, 27 Nov 2026 09:41:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16451128DD
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795772319; x=1827308319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k58hyZuf74uKytBKsEN9bjaamKZtuQDPPRHjrdoAZHE=;
 b=T5bta66wLyFtgtioLvaL9UgwdXBIPIZFp+mZSVVR4yfRAUm75eIrugog
 hWXfPSPu/OxYEpJ/dDRfBJS8++WhKkDMpwExQSpKVAe9HFFX691RcbX+n
 G9vrOvuet9BWfvcpbz1Ln76y/Sob2MTWZd8lti+3v7jow/R49E+ubL0E2
 Q1T9/MU47ip6BseB3RRkq1f+UP44eEbErnxtY+kgO0Rupa7A9xefES2TB
 Fe0AIdJkTMbGaUnCpMk38eZE6QplEoTKeJIGSHynjXZE/eADGGieeYDWO
 zD7j0I7YrjrPa+s8IOeNZcy0Pi2wRncBRyprMioAaeqpUTRuBBOlDHxK8 A==;
X-CSE-ConnectionGUID: F7zLZ5ipQ0y7DFNON5nQcw==
X-CSE-MsgGUID: gURbZUUyQSWE/msIrPNclw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4593222"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4593222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:38:38 -0800
X-CSE-ConnectionGUID: KSX0L624Q5uFWAblYHVdMg==
X-CSE-MsgGUID: 6p5yaOjiSga1Nv9OGx9rjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12501345"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:38:37 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>, Jeevan B <jeevan.b@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_joiner: Move kms_joiner_helper to the
 library
Date: Fri, 27 Nov 2026 15:05:09 +0530
Message-ID: <20261127093510.2291076-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127093510.2291076-1-karthik.b.s@intel.com>
References: <20261127093510.2291076-1-karthik.b.s@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The joiner helpers in tests/intel/kms_joiner_helper.[ch] are built into
each test that needs them as an extra source, while the rest of the
Intel joiner code lives in igt_kms.[ch] so that it can also be used by
the library and by generic tests.

Move the helper to lib/igt_joiner.[ch] and build it as part of the
library, as a common place for all the Intel joiner code. No functional
change.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 .../kms_joiner_helper.c => lib/igt_joiner.c      |  2 +-
 .../kms_joiner_helper.h => lib/igt_joiner.h      |  4 ++--
 lib/meson.build                                  |  1 +
 tests/intel/kms_dp_link_training.c               |  2 +-
 tests/intel/kms_dsc_helper.h                     |  2 +-
 tests/intel/kms_joiner.c                         |  2 +-
 tests/intel/kms_mst.c                            |  2 +-
 tests/meson.build                                | 16 +++++-----------
 8 files changed, 13 insertions(+), 18 deletions(-)
 rename tests/intel/kms_joiner_helper.c => lib/igt_joiner.c (99%)
 rename tests/intel/kms_joiner_helper.h => lib/igt_joiner.h (94%)

diff --git a/tests/intel/kms_joiner_helper.c b/lib/igt_joiner.c
similarity index 99%
rename from tests/intel/kms_joiner_helper.c
rename to lib/igt_joiner.c
index 361680304..fc22dd0ed 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/lib/igt_joiner.c
@@ -3,7 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
-#include "kms_joiner_helper.h"
+#include "igt_joiner.h"
 #include "igt.h"
 #include "igt_kms.h"
 #include "intel_chipset.h"
diff --git a/tests/intel/kms_joiner_helper.h b/lib/igt_joiner.h
similarity index 94%
rename from tests/intel/kms_joiner_helper.h
rename to lib/igt_joiner.h
index a0ab75b2c..8fc8dd505 100644
--- a/tests/intel/kms_joiner_helper.h
+++ b/lib/igt_joiner.h
@@ -3,8 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
-#ifndef KMS_JOINER_HELPER_H
-#define KMS_JOINER_HELPER_H
+#ifndef IGT_JOINER_H
+#define IGT_JOINER_H
 
 #include "igt_kms.h"
 #include "xe/xe_query.h"
diff --git a/lib/meson.build b/lib/meson.build
index 3848db03b..becfd8130 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -96,6 +96,7 @@ lib_sources = [
 	'intel_aux_pgtable.c',
 	'intel_reg_map.c',
 	'intel_iosf.c',
+	'igt_joiner.c',
 	'igt_kms.c',
 	'igt_fb.c',
 	'igt_core.c',
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index c1f5d45df..5017af482 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -61,7 +61,7 @@
 #include "igt.h"
 #include "igt_dp.h"
 #include "igt_kms.h"
-#include "intel/kms_joiner_helper.h"
+#include "igt_joiner.h"
 #include "intel/kms_mst_helper.h"
 
 #define RETRAIN_COUNT	1
diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
index 0209cb1ee..6806204b2 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -8,7 +8,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
-#include "kms_joiner_helper.h"
+#include "igt_joiner.h"
 #include <errno.h>
 #include <getopt.h>
 #include <math.h>
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index fce24f2bd..3dcc49d58 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -34,7 +34,7 @@
 
 #include "igt.h"
 #include "kms_dsc_helper.c"
-#include "kms_joiner_helper.h"
+#include "igt_joiner.h"
 
 /**
  * SUBTEST: invalid-modeset-big-joiner
diff --git a/tests/intel/kms_mst.c b/tests/intel/kms_mst.c
index 8b04cd3cf..da3a30186 100644
--- a/tests/intel/kms_mst.c
+++ b/tests/intel/kms_mst.c
@@ -14,7 +14,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "kms_mst_helper.h"
-#include "kms_joiner_helper.h"
+#include "igt_joiner.h"
 #include <limits.h>
 
 /**
diff --git a/tests/meson.build b/tests/meson.build
index 806320a82..4e0f959fc 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -403,21 +403,15 @@ extra_sources = {
 	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dp_linktrain_fallback': [
           join_paths ('intel', 'kms_mst_helper.c'),
-          join_paths ('intel', 'kms_dsc_helper.c'),
-          join_paths ('intel', 'kms_joiner_helper.c') ],
+          join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_dp_link_training': [
-          join_paths ('intel', 'kms_mst_helper.c'),
-          join_paths ('intel', 'kms_joiner_helper.c') ],
+          join_paths ('intel', 'kms_mst_helper.c') ],
 	'kms_dsc': [
-          join_paths ('intel', 'kms_dsc_helper.c'),
-          join_paths ('intel', 'kms_joiner_helper.c') ],
-	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
+          join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_mst': [
-           join_paths ('intel', 'kms_mst_helper.c'),
-           join_paths ('intel', 'kms_joiner_helper.c') ],
+           join_paths ('intel', 'kms_mst_helper.c') ],
 	'kms_psr2_sf': [
-          join_paths ('intel', 'kms_dsc_helper.c'),
-          join_paths ('intel', 'kms_joiner_helper.c') ],
+          join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
 # Extra dependencies used on core and Intel drivers
-- 
2.43.0

