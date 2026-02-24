Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74E1EFB816
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6741510E50D;
	Tue, 24 Feb 2026 08:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BL5WD0ap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6783610E50D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771922991; x=1803458991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dr+gnV1QaAJMFXNZlk2mjyOwWG19EI2n8Y+iCG9aA9o=;
 b=BL5WD0apXJ/reXY71ihzAryfw4wz4OXj5PICoLX4K7uNqNHeHkIrNL0G
 1gVmtd3dAHQhgdObm7RA4srfZmEl5eb5nBoX3OlX4IWDrIWt0IlCt/X8M
 9/g+5ZvOiAn/e7sxGEqSJVaVUJU7k5+hnPqouLODvLtRlHJCREe5hcwXy
 w1IvzsqmeV3hcsld2u2jgmcn8hu0ZSAJ0WH//NQjH3QAE/Lfp3TiIiAtU
 QIsfhx5/W7AiXUf7ldSO+knKYnI+wsjjgpYXjNOmzZUh96SpJ2QOx+uzJ
 BPHd6eAJaejIvyHwq9jVH+Bk+Zzxqwjs/xitxHAH0rTIFHDrgNjJu7n9O A==;
X-CSE-ConnectionGUID: pTfK2GF6RR++1waoYTsvHA==
X-CSE-MsgGUID: xQjW6B/3TUK2UsbdLzaOgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83554136"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83554136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:49:51 -0800
X-CSE-ConnectionGUID: j55jEAQ4QBGo540S3EAeaQ==
X-CSE-MsgGUID: c1q9G6gpRw6WmOx/S2/IGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220357933"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:49:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v3 01/23] tests/intel/kms_psr: Don't pass uninitialized
 'pipe' to intel_fbc_supported_on_chipset()
Date: Tue, 24 Feb 2026 10:49:47 +0200
Message-ID: <20260224084947.12493-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-2-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-2-ville.syrjala@linux.intel.com>
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
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Instead passing stack garbage in 'pipe' to
intel_fbc_supported_on_chipset() iterate over all the CRTCs
and properly check if any of them supports FBC.

v2: Reverse the logic to not require every CRTC to support FBC,
    which is indeed not the case on gen2/gen3/hsw+ (Jani)

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index c411981c0104..0ffe4c92b25b 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -774,7 +774,6 @@ int igt_main()
 {
 	int z, y;
 	enum operations op;
-	enum pipe pipe;
 	const char *append_subtest_name[3] = {
 		"psr-",
 		"psr2-",
@@ -787,10 +786,12 @@ int igt_main()
 	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
 	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 	igt_output_t *output;
-	bool fbc_chipset_support;
+	bool fbc_chipset_support = false;
 	int disp_ver;
 
 	igt_fixture() {
+		igt_crtc_t *crtc;
+
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
@@ -799,7 +800,11 @@ int igt_main()
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
 		disp_ver = intel_display_ver(data.devid);
-		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, pipe);
+
+		for_each_crtc(&data.display, crtc) {
+			if (intel_fbc_supported_on_chipset(data.drm_fd, crtc->pipe))
+				fbc_chipset_support = true;
+		}
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
-- 
2.52.0

