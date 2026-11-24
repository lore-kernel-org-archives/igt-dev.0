Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51253606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 04:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R5OSGhDr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439810E198;
	Tue, 24 Nov 2026 04:50:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F5B10E4D5
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 04:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795495639; x=1827031639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bs0d8Hr2/iG6ECt8SLPzVsP9m6sRbNJmk/7/owFR1fs=;
 b=R5OSGhDrsgZmTX05yO6l7aDDU9yiEWaAUVNlcJWA0C0X+aVn0PllC2zd
 D1vgmSSk2TFIN28A0XO5WUOTykWQ3QkkPt60r4TYW/pBLDY96Dd3FntV3
 GsenlBpJYibnzyGhFvf3OjthWIWTG+yOC250TzAbU6LEtDpWK04/IsXSE
 kNxC7Rb4+nyhcLMy1shPzKEMSZ3S4GjjV3skZiCynayvLW7dt3/e13Dvs
 +VKWQKV0D7pu8BzDYBt5HkArfrqWqMNlmrS3jKIm2SkKzvbWZXQjI38DH
 MWdD6KixhrlCqhrdCQki5fFoVrqLVQBKrjW4VBhcw8jWlj7gnf86Wq/zX w==;
X-CSE-ConnectionGUID: FogYgQ41Se6eCtzD3a/6gg==
X-CSE-MsgGUID: +gNKQTsWSHepgbYRUA44aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4193623"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4193623"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:19 -0800
X-CSE-ConnectionGUID: fOeETJfnR5ajyRTvBZ+QTw==
X-CSE-MsgGUID: MwPX8ezWSJ6WVRPgXTWitQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11444995"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:18 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_module_load: Add intel_display
 module subtests
Date: Tue, 24 Nov 2026 10:15:59 +0530
Message-ID: <20261124044559.897167-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124044559.897167-1-jeevan.b@intel.com>
References: <20261124044559.897167-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Treat a leftover intel_display as an unwanted driver for the "load"
subtest and add the same intel_display ordering subtests as for i915
(load-xe-then-display, unload-display-with-xe,
unload-xe-also-unloads-display, reload-display-only). They skip when the
module does not exist.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/xe_module_load.c | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 0c75c4ebc..4cefba09d 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -94,9 +94,18 @@ static void load_and_check_xe(const char *opts)
 static const char * const unwanted_drivers[] = {
 	"xe",
 	"i915",
+	"intel_display",
 	NULL
 };
 
+/* Start from a clean slate and skip if there is no dedicated display module */
+static void display_module_setup(void)
+{
+	igt_require_f(!igt_xe_driver_unload(), "Could not unload xe\n");
+
+	igt_intel_display_prepare_alone();
+}
+
 /**
  * SUBTEST: force-load
  * Description: Load the Xe driver passing ``force_probe=*`` parameter
@@ -115,6 +124,22 @@ static const char * const unwanted_drivers[] = {
  *
  * SUBTEST: many-reload
  * Description: Reload the Xe driver many times
+ *
+ * SUBTEST: load-xe-then-display
+ * Description: Load the Xe driver and check that the intel_display module it
+ *		depends on is loaded as well.
+ *
+ * SUBTEST: unload-display-with-xe
+ * Description: Check that intel_display cannot be removed while Xe holds it,
+ *		then unload both and load Xe again.
+ *
+ * SUBTEST: unload-xe-also-unloads-display
+ * Description: Check that unloading Xe also removes the intel_display module
+ *		once nothing else holds it.
+ *
+ * SUBTEST: reload-display-only
+ * Description: Unload and reload the intel_display module and then bring Xe
+ *		back up on top of it.
  */
 int igt_main()
 {
@@ -165,5 +190,80 @@ int igt_main()
 		/* only default modparams, can leave module loaded */
 	}
 
+	igt_describe("Load xe and check that intel_display is pulled in as a dependency.");
+	igt_subtest("load-xe-then-display") {
+		display_module_setup();
+		igt_assert_eq(igt_intel_display_unload(), 0);
+		igt_assert_intel_driver_and_display_unloaded("xe");
+
+		load_and_check_xe(NULL);
+		igt_assert(igt_kmod_is_loaded("intel_display"));
+	}
+
+	igt_describe("Check intel_display is held by xe, then unload both and reload xe.");
+	igt_subtest("unload-display-with-xe") {
+		int ret;
+
+		/* modprobe intel_display: loads alone, nothing uses it yet */
+		display_module_setup();
+		igt_assert(igt_kmod_is_loaded("intel_display"));
+		igt_assert_f(!igt_kmod_is_loaded("xe"), "xe loaded with display only\n");
+		igt_assert_f(!igt_intel_display_has_holders(),
+			     "intel_display held before xe was loaded\n");
+
+		/* modprobe xe: display is now used by it */
+		load_and_check_xe(NULL);
+		igt_assert(igt_kmod_is_loaded("xe"));
+		igt_assert_f(igt_intel_display_has_holders(),
+			     "intel_display not held by xe\n");
+
+		/*
+		 * rmmod intel_display: refused, xe calls into display. The
+		 * kernel reports -EWOULDBLOCK while other modules depend on the
+		 * target (libkmod removes non-blocking), -EBUSY otherwise.
+		 */
+		ret = igt_intel_display_try_unload();
+		igt_assert_f(ret == -EWOULDBLOCK || ret == -EBUSY,
+			     "intel_display removed or unexpected error while xe holds it: %d\n", ret);
+		igt_assert(igt_kmod_is_loaded("xe"));
+		igt_assert(igt_kmod_is_loaded("intel_display"));
+
+		/* rmmod xe: goes first, intel_display stays behind, unused */
+		igt_assert_eq(igt_intel_driver_unload_keep_display("xe"), 0);
+		igt_assert_f(!igt_kmod_is_loaded("xe"), "xe still loaded\n");
+		igt_assert_f(igt_kmod_is_loaded("intel_display"),
+			     "intel_display disappeared with xe\n");
+		igt_assert_f(!igt_intel_display_has_holders(),
+			     "intel_display still held after xe was removed\n");
+
+		/* rmmod intel_display: now it works */
+		igt_assert_eq(igt_intel_display_unload(), 0);
+		igt_assert_intel_driver_and_display_unloaded("xe");
+
+		load_and_check_xe(NULL);
+	}
+
+	igt_describe("Check that unloading xe also removes the intel_display it no longer uses.");
+	igt_subtest("unload-xe-also-unloads-display") {
+		display_module_setup();
+		load_and_check_xe(NULL);
+		igt_assert(igt_kmod_is_loaded("intel_display"));
+
+		igt_assert_eq(igt_xe_driver_unload(), 0);
+		igt_assert_intel_driver_and_display_unloaded("xe");
+
+		load_and_check_xe(NULL);
+	}
+
+	igt_describe("Reload only the display module, then reload xe on top of it.");
+	igt_subtest("reload-display-only") {
+		display_module_setup();
+		igt_assert_eq(igt_intel_display_unload(), 0);
+		igt_assert_intel_driver_and_display_unloaded("xe");
+
+		igt_assert_eq(igt_intel_display_load(NULL), 0);
+		load_and_check_xe(NULL);
+	}
+
 	/* Subtests should unload the module themselves if they use modparams */
 }
-- 
2.43.0

