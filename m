Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2551606A32F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ab7z32IH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7068610EC1E;
	Mon, 16 Nov 2026 14:35:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DE210EA48
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794839695; x=1826375695;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QzjMCJ2o+flxKwNjLSKfDwrZNU7m1/9ypdMiOm+2s/M=;
 b=Ab7z32IHU4oCP4wiJMN2u5HpmyH3sfIn/jXBp7y5gDagVsVIVeHbeKRw
 NG0jEZ4XixGVXurMn0owjyKRZo9lSKET55GOG3K/FLllLgJAT1U1eKXJy
 ZrFamb2a1pcaQkLRJTQ/Kx0M3sY+T+SkGNsU5O7E/4C/0bTJCyN4PJ2oa
 r9Qx7iOxGyZw2ridXnrGZD2NZQHD7I30TvTORMQgq7ydOAjdU3dls6GWe
 jntQb4GFMJMzAnIBksT1oVGGRPFHXcIeGcx3OOEEAoWlLj3tBnCpboZcc
 UDURFYRj12bq8auxmtYIWTBOaMe0Q5qUW6lWoaW4Vs7PpF4sU1ZjUnroX Q==;
X-CSE-ConnectionGUID: 25wraQIbRnq249uECnxuTA==
X-CSE-MsgGUID: s67MS0mfTniJ3esywFlMYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3611511"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3611511"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:34:53 -0800
X-CSE-ConnectionGUID: 3MqnUeimSsOy5dAgRYgJZQ==
X-CSE-MsgGUID: npCTQWDjSCSPc3MBh94prw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="11353948"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:34:52 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/i915_pm_rpm: Stop setting the
 i915.mmio_debug modparam
Date: Mon, 16 Nov 2026 16:34:48 +0200
Message-ID: <20261116143448.29338-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The i915.mmio_debug modparam is going first change from an
int to a boolean, and then move to the display mode (once
that split finally happens). The kernel will reject a -1
value for a boolean modparam, so the test would start to
fail when the type changes. Stop setting the modparam on
the i915 module in the test to avoid that. With the modparam
removed the test will work on any version of the driver.

The modparam will anyway default to -1 (as in mmio_debug is
always enabled) if the kernel was built with DRM_I915_DEBUG_MMIO=y,
or I915_DEBUG (which selects the former). So explicitly setting
the modparam in the test would only benefit someone running the
test on a non-debug build of the driver. I915_DEBUG should
be enabled in the i915 CI builds.

If someone really wants to set modparams in the test perhaps igt
should grow a more generic mechanism for doing that eg. via
environment variables...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/i915_pm_rpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index b4da27b21b20..ca4f645c18eb 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -1432,7 +1432,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_i915_driver_unload();
 
 		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");
-		igt_assert_eq(igt_i915_driver_load("disable_display=1 mmio_debug=-1"), 0);
+		igt_assert_eq(igt_i915_driver_load("disable_display=1"), 0);
 
 		igt_assert(setup_environment(false));
 		pci_dev = igt_device_get_pci_device(drm_fd);
@@ -1443,7 +1443,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_i915_driver_unload();
 
 		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
-		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
+		igt_assert_eq(igt_i915_driver_load(""), 0);
 
 		igt_assert(setup_environment(true));
 		pci_dev = igt_device_get_pci_device(drm_fd);
-- 
2.56.0

