Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19962606A336
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mmCOxaZM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF20010E8F0;
	Fri, 20 Nov 2026 13:40:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B9D112A68
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 13:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795181692; x=1826717692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hgOao9NxAFFvPJkadISQmNb98cU752E7jW3izND6rSM=;
 b=mmCOxaZMzdMn5iBYHLg/3H9xM98wwlHCWojno4G16wgg9EfHLEgvuuUl
 dQvfGJb5bWdKawoY5GO4n0+2BtiwXCxVsrf0pZPiKwvLbBMkGK0oeeJNM
 EQ8uj8XjEzUjnPDGlBe035HsZSBdKlyqZeEhEFJSWSqUM4wzbdW6TWezu
 kxZFf+Im71a1bRE6Xd6UwXFzMvRd7PyHsLdpz+yURMA4/qKJ5jjYtH//C
 Dqgb0eSyDmT9sSHUiTumNMcqbnpiHC+PFcQKCvN+MvP9bQOOGhofXvOvS
 kAtyKrhBtyqXxRw8tJCeQMGU4wR25hY/elm7Ktr70Pn7xdZzePRNuvsbq g==;
X-CSE-ConnectionGUID: nlDeAYUfQSCQPE6K+w/dZg==
X-CSE-MsgGUID: x/q+Kr9ZQRaWTqcrO/ezmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3943167"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3943167"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:34:51 -0800
X-CSE-ConnectionGUID: iBZB0TivTZmRbbE/bemJdw==
X-CSE-MsgGUID: jvu9niV5RdKuChsFROLS8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12412027"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:34:49 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_hdmi_audio_bw: Gate hibernate test
Date: Fri, 20 Nov 2026 19:14:00 +0530
Message-Id: <20261120134400.1888895-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261120134400.1888895-1-swati2.sharma@intel.com>
References: <20261120134400.1888895-1-swati2.sharma@intel.com>
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

Require the -r option to run the suspend-to-disk audio recovery test.
This keeps the full hibernate cycle opt-in while leaving other recovery
tests unchanged.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_hdmi_audio_bw.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_hdmi_audio_bw.c b/tests/intel/kms_hdmi_audio_bw.c
index 31a7f2949..eb34acd04 100644
--- a/tests/intel/kms_hdmi_audio_bw.c
+++ b/tests/intel/kms_hdmi_audio_bw.c
@@ -40,7 +40,7 @@
  * arg[1]:
  *
  * @mem: Suspend to memory, respecting the system's mem_sleep default
- * @disk: Suspend to disk (hibernate)
+ * @disk: Suspend to disk (hibernate), enabled with -r
  *
  * SUBTEST: dpms-audio-recovery
  * Description: Validate audio state restoration after a DPMS off/on cycle
@@ -58,6 +58,7 @@ typedef struct {
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	struct igt_fb fb;
+	bool do_hibernate;
 } data_t;
 
 /* All sample rates declared in the EDID SAD */
@@ -552,10 +553,29 @@ static void test_audio_recovery(data_t *data, enum igt_suspend_state state,
 	cleanup_connector(data);
 }
 
-int igt_main()
+static int opt_handler(int opt, int opt_index, void *opt_data)
 {
-	data_t data = {};
+	data_t *data = opt_data;
 
+	switch (opt) {
+	case 'r':
+		data->do_hibernate = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static data_t data;
+
+static const char *help_str =
+"  -r\t\tEnable the full suspend-to-disk audio recovery test\n"
+;
+
+int igt_main_args("r", NULL, help_str, opt_handler, &data)
+{
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		igt_require(is_intel_device(data.drm_fd));
@@ -586,8 +606,11 @@ int igt_main()
 
 	igt_describe("Validate audio recovery after suspend to disk "
 		     "(hibernate) with constrained hblank.");
-	igt_subtest("suspend-disk-audio-recovery")
+	igt_subtest("suspend-disk-audio-recovery") {
+		igt_require_f(data.do_hibernate,
+			      "Run with -r to enable full hibernate\n");
 		test_audio_recovery(&data, SUSPEND_STATE_DISK, false);
+	}
 
 	igt_describe("Validate audio recovery after a DPMS off/on cycle "
 		     "with constrained hblank.");
-- 
2.25.1

