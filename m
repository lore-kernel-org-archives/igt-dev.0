Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6710F6FBF
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFEB10EE30;
	Wed,  1 Apr 2026 15:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khPilREI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129FB10EE35
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775057226; x=1806593226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HRscozhgbGb9ISOo12cgmJbkX5fwowHPf0y2gwoFkDE=;
 b=khPilREIpW7kOnTxbaFYVqH/65ZayVhMxsCzw+zfmT13rEWkNoIsay76
 jL4hLCE6DBkYWfs8MCksmh5Uueo+Ncbc2FOp/YPWVZU01oEUsQO7qBiQV
 jWc3Mye8Iri4yjrSomiBEPylQ0hvAvm0+rh/irlHipDBIEVsub+BIUSSI
 WACHYYKJcCagLM4iq8l1oH3KBlZFpbLCsjtnJ+5gaf5sRiPKYA85VTo8N
 9KDjRQRCtmue6xqaFCKEd9/qCDUr2QarrJkUmCQgovwBgVUbS7/S3EzPB
 20UMFK6ldzdK9ojIsRu0Y9cG/ueYMFqJ8BJaNhPLA7Os7s8LEUNFsic5d Q==;
X-CSE-ConnectionGUID: CdYpqWPcQWmWw3MfaBfOaA==
X-CSE-MsgGUID: d850ZC7nSMy6NbSjYLxWiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79704705"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79704705"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:27:06 -0700
X-CSE-ConnectionGUID: EpGPDi5tT/i7gh6QYLHbTg==
X-CSE-MsgGUID: eMNmanDoSVOfKjY4Odzg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228324392"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:27:04 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 2/2] DONT_MERGE: Add kms_modifier_list test to verify
 new modifier helper
Date: Wed,  1 Apr 2026 20:55:37 +0530
Message-ID: <20260401152538.632846-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401152538.632846-1-jeevan.b@intel.com>
References: <20260401152538.632846-1-jeevan.b@intel.com>
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

Temporary test to check that the new lib modifier functions work and
print all supported modifiers.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_modifier_list.c | 127 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 tests/kms_modifier_list.c

diff --git a/tests/kms_modifier_list.c b/tests/kms_modifier_list.c
new file mode 100644
index 000000000..2e203855c
--- /dev/null
+++ b/tests/kms_modifier_list.c
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_modifier.h"
+#include <drm_fourcc.h>
+#include <inttypes.h>
+
+IGT_TEST_DESCRIPTION("Validate igt_get_basic_tiling_modifiers() and "
+                     "igt_get_all_supported_modifiers().");
+
+/**
+ * TEST: kms modifier list
+ * Category: Display
+ * Description: Validate the igt_get_basic_tiling_modifiers() and
+ *              igt_get_all_supported_modifiers() helper functions.
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ */
+
+/**
+ * SUBTEST: basic-modifiers-nonempty
+ * Description: Verify that igt_get_basic_tiling_modifiers() returns a
+ *              non-empty list for DRM_FORMAT_XRGB8888.
+ *
+ * SUBTEST: all-modifiers-nonempty
+ * Description: Verify that igt_get_all_supported_modifiers() returns a
+ *              non-empty list for DRM_FORMAT_XRGB8888.
+ *
+ * SUBTEST: basic-subset-of-all
+ * Description: Verify that every modifier in the basic list is also present
+ *              in the all-modifiers list.
+ */
+
+static int drm_fd;
+static igt_display_t display;
+
+int igt_main()
+{
+	igt_fixture() {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_display_require(&display, drm_fd);
+	}
+
+	igt_subtest("basic-modifiers-nonempty") {
+		uint64_t *mods = NULL;
+		int count;
+
+		count = igt_get_basic_tiling_modifiers(drm_fd,
+						       DRM_FORMAT_XRGB8888,
+						       &mods);
+		igt_assert_f(count > 0,
+			     "igt_get_basic_tiling_modifiers() returned empty list\n");
+
+		igt_info("Basic modifiers (%d):\n", count);
+		for (int i = 0; i < count; i++) {
+			const char *name = igt_fb_modifier_name(mods[i]);
+			igt_info("  [basic] 0x%" PRIx64 " (%s)\n", mods[i], name);
+		}
+		free(mods);
+	}
+
+	igt_subtest("all-modifiers-nonempty") {
+		uint64_t *mods = NULL;
+		int count;
+
+		count = igt_get_all_supported_modifiers(drm_fd,
+							DRM_FORMAT_XRGB8888,
+							&mods);
+		igt_assert_f(count > 0,
+			     "igt_get_all_supported_modifiers() returned empty list\n");
+
+		igt_info("All supported modifiers (%d):\n", count);
+		for (int i = 0; i < count; i++) {
+			const char *name = igt_fb_modifier_name(mods[i]);
+			igt_info("  [all] 0x%" PRIx64 " (%s)\n", mods[i], name);
+		}
+
+		free(mods);
+	}
+
+	igt_subtest("basic-subset-of-all") {
+		uint64_t *basic = NULL, *all = NULL;
+		int basic_count, all_count;
+
+		basic_count = igt_get_basic_tiling_modifiers(drm_fd,
+							     DRM_FORMAT_XRGB8888,
+							     &basic);
+		all_count = igt_get_all_supported_modifiers(drm_fd,
+							    DRM_FORMAT_XRGB8888,
+							    &all);
+
+		igt_assert(basic_count > 0);
+		igt_assert(all_count > 0);
+
+		igt_info("Checking: basic-subset-of-all\n");
+		for (int i = 0; i < basic_count; i++) {
+			bool found = false;
+			const char *name = igt_fb_modifier_name(basic[i]);
+
+			for (int j = 0; j < all_count; j++) {
+				if (basic[i] == all[j]) {
+					found = true;
+					break;
+				}
+			}
+
+			igt_info("  [basic] 0x%" PRIx64 " (%s) -> %s\n",
+				 basic[i], name, found ? "FOUND" : "NOT FOUND");
+
+			igt_assert_f(found,
+				     "basic modifier 0x%"PRIx64" not in all-modifiers list\n",
+				     basic[i]);
+		}
+
+		free(basic);
+		free(all);
+	}
+
+	igt_fixture() {
+		igt_display_fini(&display);
+		drm_close_driver(drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae..348cb9c74 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -46,6 +46,7 @@ test_progs = [
 	'kms_hdr',
 	'kms_invalid_mode',
 	'kms_lease',
+        'kms_modifier_list',
 	'kms_multipipe_modeset',
 	'kms_panel_fitting',
 	'kms_pipe_crc_basic',
-- 
2.43.0

