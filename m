Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FF4C5DF7A
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED9610E10E;
	Sat, 21 Feb 2026 03:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h01Z5pqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE0C10E10E
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644010; x=1803180010;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UF/ePiwK9N3ES7HG3EEJptCHKuDrMjxxuB/qfVESKqg=;
 b=h01Z5pqTQSkvqCd5FJgm3JVL/10x5HGC40QIIFI7UI7D4BOymR61PhRW
 zqHKqaV91hPq/iOCD4wUnABTwHjGWFZrz2llTEPzSgXfxv7C07ANmNacG
 K8LizgN7g3uwjUsmsAk0Mmy6YSEWnMEgVSHXKWgnVTv4cdxna/PK1LZMh
 lCmEJFlfL11B49QjzI5FOeF0B5SkXZOoU32OepA3I2v+QYFF4YjehafRm
 bs0OJx6K9yjLutZA2wzsnp+m6cxDRIRZhhIPbb6uvb0PbT+9erSecAtzJ
 DjMOj2g/I7lY5Gy+GQgPdT8ymTf0YlAILwXnlt3lHtUN9KkoPP0kTmQoD g==;
X-CSE-ConnectionGUID: Dp+jnga4SY6gGkhmAO5mEQ==
X-CSE-MsgGUID: J1ryMUxMRteqLkUIg5cEEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="75345745"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="75345745"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:10 -0800
X-CSE-ConnectionGUID: oCcuJcsMRMO+PUa8DSyEnA==
X-CSE-MsgGUID: XPePrOrwSqOrvZOlWjpyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252720216"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:09 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 01/23] tests/intel/kms_psr: Don't pass uninitialized
 'pipe' to intel_fbc_supported_on_chipset()
Date: Sat, 21 Feb 2026 05:19:40 +0200
Message-ID: <20260221032003.30936-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index c411981c0104..c730a6f23944 100644
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
+	bool fbc_chipset_support = true;
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
+			if (!intel_fbc_supported_on_chipset(data.drm_fd, crtc->pipe))
+				fbc_chipset_support = false;
+		}
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
-- 
2.52.0

