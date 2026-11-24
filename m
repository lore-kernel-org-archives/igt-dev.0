Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F4D606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 04:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UnsPEELg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3682D10E4D5;
	Tue, 24 Nov 2026 04:49:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A50110E198
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 04:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795495637; x=1827031637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dTY6/IY7LdgcBzQIAcGuId4RNfl4qvXOpj7D0aZ4Ujk=;
 b=UnsPEELgTysUMpp8fbwzB71IT5ZhmTTOZgMCVnKObLIvRgc39TRHjVaD
 FSVVL/WiRSsvuGlaJLGIfcNJXwGd+8hDWH/nLCbcAnhKMP6ynbZ45Q1aA
 r6VNrBT2e9NSJas8Ag14eCbYUM/y+ur639OnU6w8HaB5ACwJOY2lGP08A
 vmo42b7bJsWzai+2ZR+gr5JBpXI4WMupUZTmy6aI0K+scS0sXAbIo00Ld
 0wie6K/uyy8JFnWruDatTR24XkA/wZD62K97Twa/3B13G7lG7LPW1cTqT
 0P4BOMmRUW7IiGqnBnhC9JXa05Ve/IvIsYGK1ubyRmi1awJyKmZvRWaSl A==;
X-CSE-ConnectionGUID: GM6DsQnsTCyiHttuTzuCEQ==
X-CSE-MsgGUID: ewH2pGYkT56oWCEj5sGhUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4193622"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4193622"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:17 -0800
X-CSE-ConnectionGUID: 3jRp9ik0RGakzbB2SIh03g==
X-CSE-MsgGUID: Oj+vuF8BQ3WPPOAyYVGRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11444983"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:16 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/i915_module_load: Add intel_display
 module subtests
Date: Tue, 24 Nov 2026 10:15:58 +0530
Message-ID: <20261124044559.897167-4-jeevan.b@intel.com>
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
subtest and add subtests for the module orderings with the dedicated
display module; they skip when the module does not exist:

- load-i915-then-display: loading i915 pulls intel_display in.
- unload-display-with-i915: intel_display loads alone and unused, is
  held once i915 is loaded and cannot be removed then; after i915 is
  removed it stays loaded and unused and can be removed last.
- unload-i915-also-unloads-display: one i915 unload removes both.
- reload-display-only: reload intel_display alone, then i915 on top.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/i915_module_load.c | 108 +++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 68e238646..c5835f195 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -48,6 +48,26 @@
  * Description: Verify that i915 driver can be successfully loaded with disabled display.
  * Feature: core, sriov-core
  *
+ * SUBTEST: load-i915-then-display
+ * Description: Load the i915 driver and check that the intel_display module it
+ *		depends on is loaded as well.
+ * Feature: core
+ *
+ * SUBTEST: unload-display-with-i915
+ * Description: Check that intel_display cannot be removed while i915 holds it,
+ *		then unload both and load i915 again.
+ * Feature: core
+ *
+ * SUBTEST: unload-i915-also-unloads-display
+ * Description: Check that unloading i915 also removes the intel_display module
+ *		once nothing else holds it.
+ * Feature: core
+ *
+ * SUBTEST: reload-display-only
+ * Description: Unload and reload the intel_display module and then bring i915
+ *		back up on top of it.
+ * Feature: core
+ *
  * SUBTEST: resize-bar
  * Description: Check whether lmem bar size can be resized to only supported sizes.
  */
@@ -600,12 +620,25 @@ static void test_fault_injection(void)
 	igt_i915_driver_load(NULL);
 }
 
+/* Start from a clean slate and skip if there is no dedicated display module */
+static void display_module_setup(void)
+{
+	int ret;
+
+	ret = igt_i915_driver_unload();
+	igt_require_f(!ret && !igt_kmod_is_loaded("i915"),
+		      "Could not unload i915 (%d)\n", ret);
+
+	igt_intel_display_prepare_alone();
+}
+
 int igt_main()
 {
 	igt_describe("Check if i915 and friends are not yet loaded, then load them.");
 	igt_subtest("load") {
 		const char * unwanted_drivers[] = {
 			"i915",
+			"intel_display",
 			"intel-gtt",
 			NULL
 		};
@@ -636,6 +669,81 @@ int igt_main()
 		igt_i915_driver_unload();
 	}
 
+	igt_describe("Load i915 and check that intel_display is pulled in as a dependency.");
+	igt_subtest("load-i915-then-display") {
+		display_module_setup();
+		igt_assert_eq(igt_intel_display_unload(), 0);
+		igt_assert_intel_driver_and_display_unloaded("i915");
+
+		load_and_check_i915();
+		igt_assert(igt_kmod_is_loaded("intel_display"));
+	}
+
+	igt_describe("Check intel_display is held by i915, then unload both and reload i915.");
+	igt_subtest("unload-display-with-i915") {
+		int ret;
+
+		/* modprobe intel_display: loads alone, nothing uses it yet */
+		display_module_setup();
+		igt_assert(igt_kmod_is_loaded("intel_display"));
+		igt_assert_f(!igt_kmod_is_loaded("i915"), "i915 loaded with display only\n");
+		igt_assert_f(!igt_intel_display_has_holders(),
+			     "intel_display held before i915 was loaded\n");
+
+		/* modprobe i915: display is now used by it */
+		load_and_check_i915();
+		igt_assert(igt_kmod_is_loaded("i915"));
+		igt_assert_f(igt_intel_display_has_holders(),
+			     "intel_display not held by i915\n");
+
+		/*
+		 * rmmod intel_display: refused, i915 calls into display. The
+		 * kernel reports -EWOULDBLOCK while other modules depend on the
+		 * target (libkmod removes non-blocking), -EBUSY otherwise.
+		 */
+		ret = igt_intel_display_try_unload();
+		igt_assert_f(ret == -EWOULDBLOCK || ret == -EBUSY,
+			     "intel_display removed or unexpected error while i915 holds it: %d\n", ret);
+		igt_assert(igt_kmod_is_loaded("i915"));
+		igt_assert(igt_kmod_is_loaded("intel_display"));
+
+		/* rmmod i915: goes first, intel_display stays behind, unused */
+		igt_assert_eq(igt_intel_driver_unload_keep_display("i915"), 0);
+		igt_assert_f(!igt_kmod_is_loaded("i915"), "i915 still loaded\n");
+		igt_assert_f(igt_kmod_is_loaded("intel_display"),
+			     "intel_display disappeared with i915\n");
+		igt_assert_f(!igt_intel_display_has_holders(),
+			     "intel_display still held after i915 was removed\n");
+
+		/* rmmod intel_display: now it works */
+		igt_assert_eq(igt_intel_display_unload(), 0);
+		igt_assert_intel_driver_and_display_unloaded("i915");
+
+		load_and_check_i915();
+	}
+
+	igt_describe("Check that unloading i915 also removes the intel_display it no longer uses.");
+	igt_subtest("unload-i915-also-unloads-display") {
+		display_module_setup();
+		load_and_check_i915();
+		igt_assert(igt_kmod_is_loaded("intel_display"));
+
+		igt_assert_eq(igt_i915_driver_unload(), 0);
+		igt_assert_intel_driver_and_display_unloaded("i915");
+
+		load_and_check_i915();
+	}
+
+	igt_describe("Reload only the display module, then reload i915 on top of it.");
+	igt_subtest("reload-display-only") {
+		display_module_setup();
+		igt_assert_eq(igt_intel_display_unload(), 0);
+		igt_assert_intel_driver_and_display_unloaded("i915");
+
+		igt_assert_eq(igt_intel_display_load(NULL), 0);
+		load_and_check_i915();
+	}
+
 	igt_describe("Test i915 fault injection");
 	igt_subtest_with_dynamic_f("fault-injection")
 		test_fault_injection();
-- 
2.43.0

