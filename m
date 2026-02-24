Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E267EEFB816
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8BA10E514;
	Tue, 24 Feb 2026 08:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPgu2i29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FC910E514
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923068; x=1803459068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2YAsq6fBGi1opc3V0AribYjImnnnA8oMILBnTMAv26g=;
 b=JPgu2i29G9qVg8jKlbrgEr79O6tkGGm2AVwljRPCt6r1JVfg/kXTEobX
 TzYUFqhVC9QerHa3ck2EEzC/c6SBqEi9uicF5+QmZO/rp6nJQI8sEoy/Q
 SwznKyJPbx/tqSahelKcodkfKtbjxWaYOUVXSnuC5S1Ljl33FdMsmr2Rq
 grFNRXRKPgI22evXXTqiZ0bI6LRqTAdy0lq7k7CYiiClS5pfx+Fqggigx
 Kwus2mdf4zmiqybRzRlEY7IIoSTtfg2QrqRNETXqtDghOqyyDwoRJWexb
 htobh3kQvx0ZtEVvY1UDIpF9Njy0m9ge8/Pyd+4n3aNFPxmfgBBhlFWmL A==;
X-CSE-ConnectionGUID: 426Fq3KIRqKQEzR2NqTLGg==
X-CSE-MsgGUID: ud9izw++QimA7T0ov0iyFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83554211"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83554211"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:51:07 -0800
X-CSE-ConnectionGUID: Vl1mSBq8QUWxQHUFCOt3ew==
X-CSE-MsgGUID: KwNY/VmUSZOTWxPvq/Vdow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246419024"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:51:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v3 02/23] tests/intel/kms_psr2_sf: Don't pass zero
 initialized 'data.pipe' to intel_fbc_supported_on_chipset()
Date: Tue, 24 Feb 2026 10:51:03 +0200
Message-ID: <20260224085103.12646-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-3-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-3-ville.syrjala@linux.intel.com>
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

Instead of alwas passing the zero initalized data.pipe
(== PIPE_A) to intel_fbc_supported_on_chipset() iterate
over all the CRTCs and properly check if any of them
supports FBC.

v2: Reverse the logic to not require every CRTC to support FBC,
    which is indeed not the case on gen2/gen3/hsw+ (Jani)

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr2_sf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 31db6760c73e..466d1ed876d8 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1171,7 +1171,7 @@ int igt_main()
 		"pr-"
 	};
 	int psr_status[] = {PSR_MODE_2, PR_MODE_SEL_FETCH};
-	bool fbc_chipset_support;
+	bool fbc_chipset_support = false;
 	int disp_ver;
 
 	igt_fixture() {
@@ -1185,7 +1185,6 @@ int igt_main()
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		disp_ver = intel_display_ver(data.devid);
-		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, data.pipe);
 
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
@@ -1199,6 +1198,10 @@ int igt_main()
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
 			data.pipe = crtc->pipe;
+
+			if (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))
+				fbc_chipset_support = true;
+
 			for (i = 0; i < ARRAY_SIZE(psr_status); i++) {
 				data.psr_mode = psr_status[i];
 				output_supports_pr_psr2_sel_fetch = pipe_output_combo_valid(&data);
-- 
2.52.0

