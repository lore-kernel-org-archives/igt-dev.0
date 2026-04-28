Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3EDFF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31B110E2C4;
	Tue, 28 Apr 2026 04:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COalzAGa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AC110E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351644; x=1808887644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YbmoNPkBUSk1rEyMCwWQxXuyUSSW8XImmb56W6xmSHI=;
 b=COalzAGa6+gQJM/nVl1/PhZUBNhUJYdZ8HqJ3cvrf2qoCp3HfK2HRL46
 8d5fN1Dn33n8QamfHWqws5sIUCcSTE75ERr/+W8EqW3eb/vQhA6PumbkK
 6UEPSN6AdjUJ1tmsPcMrsQjEGmlFTIENEHnfJkfGR+h9PjcEesJl0ssuF
 ZPArJtPFwsBfPAHgjZw6GBpWnop2J47nTFp/lX309zvRkUm5hmYwvWhLm
 5+uXtWMFsEkcIYaMljrfgBPD19/TPFa0z5AtGvV0xCpDWUiiXFTRHE1QC
 aQi2Cm6s3HGOi7NjyrLlRKdIhnCZLYq3tBWKxMPRD6kfpL96bIdd0O4eE w==;
X-CSE-ConnectionGUID: Je7mnKwFS0GWriMZzYEBvg==
X-CSE-MsgGUID: G9J/TSSjRiKAcrHneSJr3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167830"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167830"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:24 -0700
X-CSE-ConnectionGUID: u1cFZe9OQTe1AxuBFhG1aQ==
X-CSE-MsgGUID: T5VzV7fYSn+kq3zGOuzgew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706699"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:23 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 14/25] lib/chamelium/v2: Rename HAVE_CHAMELIUM to
 HAVE_CHAMELIUM_V2
Date: Tue, 28 Apr 2026 10:16:23 +0530
Message-ID: <20260428044644.257001-15-mohammed.bilal@intel.com>
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

To avoid confusion in source file between the two chamelium version,
rename the HAVE_CHAMELIUM define to HAVE_CHAMELIUM_V2.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt.h                     | 2 +-
 lib/igt_kms.c                 | 4 ++--
 meson.build                   | 2 +-
 tests/kms_color_helper.h      | 2 +-
 tests/kms_feature_discovery.c | 4 ++--
 tests/kms_tiled_display.c     | 6 +++---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/igt.h b/lib/igt.h
index 9802f44cb..b0758b610 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -42,7 +42,7 @@
 #include "igt_sizes.h"
 #include "igt_stats.h"
 #include "igt_dsc.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "igt_alsa.h"
 #include "igt_audio.h"
 #include "chamelium/v2/igt_chamelium.h"
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d7c40622..928de2a10 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -63,7 +63,7 @@
 #include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "chamelium/v2/igt_chamelium.h"
 #endif
 
@@ -3155,7 +3155,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (!resources)
 		goto out;
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	{
 		struct chamelium *chamelium;
 
diff --git a/meson.build b/meson.build
index 6816c2ee1..1bb5595f8 100644
--- a/meson.build
+++ b/meson.build
@@ -192,7 +192,7 @@ alsa = dependency('alsa', required : build_chamelium_v2)
 libcurl = dependency('libcurl', required : build_chamelium_v2)
 
 if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and gsl.found() and alsa.found() and libcurl.found()
-	config.set('HAVE_CHAMELIUM', 1)
+	config.set('HAVE_CHAMELIUM_V2', 1)
 	chamelium_v2 = declare_dependency(dependencies : [
 		xmlrpc,
 		xmlrpc_util,
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index e2b3da61e..ec2431ee9 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -56,7 +56,7 @@ typedef struct {
 	uint32_t color_depth;
 	uint64_t degamma_lut_size;
 	uint64_t gamma_lut_size;
-	#ifdef HAVE_CHAMELIUM
+	#ifdef HAVE_CHAMELIUM_V2
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
 	int port_count;
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index ba934abbf..0efa6c7b2d 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -33,7 +33,7 @@
  */
 
 #include "igt.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "chamelium/v2/igt_chamelium.h"
 #endif
 #include "igt_kms.h"
@@ -137,7 +137,7 @@ int igt_main() {
 			}
 		}
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 		igt_describe("Make sure that Chamelium is configured and reachable.");
 		igt_subtest("chamelium") {
 			struct chamelium *chamelium =
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 7c1074709..1c7ae83d1 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -79,7 +79,7 @@ typedef struct {
 	struct timeval first_ts;
 	int linetime_us;
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
 	int port_count;
@@ -390,7 +390,7 @@ static bool got_all_page_flips(data_t *data)
 	return true;
 }
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 static void test_with_chamelium(data_t *data)
 {
 	int i, count = 0;
@@ -603,7 +603,7 @@ int igt_main()
 		test_cleanup(&data);
 	}
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
 		     "page flips for all tiled CRTCs in one vblank (executes on chamelium).");
 	igt_subtest_f("basic-test-pattern-with-chamelium") {
-- 
2.48.1

