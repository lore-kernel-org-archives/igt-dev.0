Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8089AC36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 16:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ABE10E3EE;
	Mon, 24 Mar 2025 16:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="friJYlqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A03710E3EE
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742833141; x=1774369141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tssUkkmmqQJWnZ7cIaU+6wiVyhMcLQSibm4EADfqLuQ=;
 b=friJYlqFF65o+vbKPU5CN/Tdm+TCJqLLl5KTxINIXcBKIMWTaoT7z8nt
 gd1jKdvZSnnbI+dxZTjfVLdmfMs+oTu8P9/zej3nZlnM6MoYC8ym5TVTQ
 72fJmoLk6iyVYb6aFJdXuL+SavYh/uP41uZg1ApiP54C/FS0s/fibCVBX
 yJhN7mweIB3xci/NGPhrwNSMXaFct05ewad2746EziF1D/XpPotVy5rGy
 GBxOM8E8oc0zXl+QKheu00ZPMt3HD27c4vqOPA3pvKc+5jOvppw59W9N/
 KPiWCuXo4NkDp6JIHO0LLT3PbnK8FVEagtDm9JD249LL1zhBirzXgewrk w==;
X-CSE-ConnectionGUID: gBcwRhqETmWMymT7KLJZ6A==
X-CSE-MsgGUID: 2YV7vUrNSY2T9pBn511GzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="46793493"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="46793493"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:19:01 -0700
X-CSE-ConnectionGUID: HJk7KP2uT1OjsaVNv7+kMQ==
X-CSE-MsgGUID: qTavwgqyQk2gCVP3roUk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="125046445"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:18:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subtest
Date: Mon, 24 Mar 2025 21:43:19 +0530
Message-Id: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a new subtest to verify async flips does not cause PSR exit.
Enable PSR and execute async flips to verify system remains in
PSR mode after async flips.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index da426f753..cf6b63b3e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -85,6 +85,9 @@
  *
  * SUBTEST: async-flip-suspend-resume
  * Description: Verify the async flip functionality with suspend and resume cycle
+ *
+ * SUBTEST: psr-async-flip
+ * Description: Verify that async flips do not cause PSR exit
  */
 
 #define CURSOR_POS 128
@@ -102,6 +105,7 @@ IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
 
 typedef struct {
 	int drm_fd;
+	int debugfs_fd;
 	uint32_t crtc_id;
 	uint32_t refresh_rate;
 	struct igt_fb bufs[NUM_FBS];
@@ -740,6 +744,33 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 	}
 }
 
+static bool psr_wait_entry_if_enabled(data_t *data)
+{
+	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, PSR_MODE_1),
+		      "enable_psr modparam doesn't allow PSR mode 1\n");
+
+	return psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data->output);
+}
+
+static void test_psr_async_flip(data_t *data)
+{
+	if (!psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, data->output))
+		igt_skip("PSR mode 1 is not supported on this output\n");
+
+	psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
+	igt_display_commit(&data->display);
+
+	/* Confirm PSR entry before starting async flips */
+	igt_assert_f(psr_wait_entry_if_enabled(data),
+			 "PSR is not enabled before async flip test\n");
+
+	test_async_flip(data);
+
+	/* Confirm PSR is still active after async flips */
+	igt_assert_f(psr_wait_entry_if_enabled(data),
+			 "PSR is not enabled after async flip test\n");
+}
+
 static data_t data;
 
 igt_main
@@ -748,6 +779,7 @@ igt_main
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
@@ -896,6 +928,12 @@ igt_main
 		run_test(&data, test_async_flip);
 	}
 
+	igt_describe("Verify that async flips do not cause PSR exit");
+	igt_subtest_with_dynamic("psr-async-flip") {
+		data.atomic_path = false;
+		run_test(&data, test_psr_async_flip);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.34.1

