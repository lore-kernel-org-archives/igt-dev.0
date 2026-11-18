Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF8606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cdLgkooV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4CC10E4BE;
	Wed, 18 Nov 2026 15:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88A10FE0F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016737; x=1826552737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XE7CdLgvqWPw7wTaQ+eBfNyXxOMwTLUlrsgLbn/XjXs=;
 b=cdLgkooVIShTntjZB00dQ0IaDoE6JCiTb+uPgrO3MyPmI9FHqz2jeZYJ
 zGcB2VBQc2uP+tY6vj+JuPOzYF3KDhSwKTlr3snwYBRFynaFFAVbHATK+
 XH3gdAS0wqcMSmFkh8uC+dAMaSxlpYgDWfW24HzI/ws8/X6HwM3V14UQg
 6Z7PkCCe+NYldviYbfRZW68OXFfLZc05pNYHChYR8Cp60QAn6ykQDE5Mv
 oEFm8jny7hE5KHvL5lxA7MtM19/Ed26hbYSypnbhqtJNBbv/HJdrFGh3k
 E9FmAXJCWLwefGbDLoqao6SxteyuvgTieIEg0JIpPfZSOvwLCTA4YxyjR w==;
X-CSE-ConnectionGUID: CFkPuhj7TByNUwqdrWgkIQ==
X-CSE-MsgGUID: gJxuf/KHTYyDNVZ9hG/TlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720354"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720354"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:37 -0800
X-CSE-ConnectionGUID: O/kPVpgYTOCJP+E3beoa9A==
X-CSE-MsgGUID: pATamksFQY+J+qDTbpSIjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319385"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:35 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/8] tests/kms_panel_fitting: Find fastboot param with a
 dedicated display module
Date: Wed, 18 Nov 2026 21:14:17 +0530
Message-ID: <20261118154426.345883-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118154426.345883-1-jeevan.b@intel.com>
References: <20261118154426.345883-1-jeevan.b@intel.com>
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

The test checked for /sys/module/{i915,xe}/parameters/fastboot before
forcing fastboot. With display split into intel_display.ko the parameter
lives in /sys/module/intel_display/parameters, so the check failed and
fastboot was silently not forced.

Look the parameter up through igt_params, which searches the GPU driver
module and then intel_display.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_panel_fitting.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 478e8b5d7..64b992bea 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -254,19 +254,22 @@ static void test_panel_fitting(data_t *data, enum test_type type)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
-	struct stat sb;
 
 	if (type == TEST_ATOMIC) {
-		char path[PATH_MAX];
+		char *fastboot;
 
 		igt_require_f(is_intel_device(display->drm_fd), "not valid for non-intel devices\n");
 
-		/* Until this is force enabled, force modeset evasion. */
-		snprintf(path, PATH_MAX, "/sys/module/%s/parameters/fastboot",
-					 is_i915_device(data->drm_fd) ? "i915" : "xe");
-
-		if (stat(path, &sb) == 0)
+		/*
+		 * Until this is force enabled, force modeset evasion. The parameter
+		 * lives in the GPU driver or, with a dedicated display module, in
+		 * intel_display; igt_params looks in both.
+		 */
+		fastboot = __igt_params_get(data->drm_fd, "fastboot");
+		if (fastboot) {
+			free(fastboot);
 			igt_set_module_param_int(data->drm_fd, "fastboot", 1);
+		}
 
 		igt_require(intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 5);
 
-- 
2.43.0

