Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221AAFD375F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B798D10E773;
	Wed, 25 Feb 2026 12:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sf6cwLK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0651F10E773
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023933; x=1803559933;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aeXl66s+SwWJs+MmeAMflp1a7nKUIzguu8vedMTx5Nk=;
 b=Sf6cwLK2j452Ipj2P7Zx2XXpP3zd2qmgF8UUwn+410d/r7d+4NnzMvyQ
 cZuio6Ws24m81SyK3Ab2iYxDtZyGmMXrLm3yxJXHsiKvazUFNeQnKRZ9O
 H2xQwhWMtErNSBU4Y8mxB5tJ/4wpVQAO3D4YQadqc4StzJorYOsiDwCvI
 fpzZN8GyVVR0Dv5r+OImaswCdcNFrGGgvqHIts8vciBS9sNTUjUChTBck
 0mJ/mJOHGpcW3s869a39uME51K2EPdrFNCFXgYjLpJ1lVU0TbIn2GVvb8
 Auy9st8uDkFxDq/gu3Mcd+aNOfAmWZpt0+isqFRh/ypcavZmvIJR7nLvg w==;
X-CSE-ConnectionGUID: 5AOfU3vmQcy27v4tQ6UNwg==
X-CSE-MsgGUID: RtbA/wqHTCuFT5fI/BekKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="98527413"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="98527413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:12 -0800
X-CSE-ConnectionGUID: Hb13Hk71QGOnuRAevGrZ6Q==
X-CSE-MsgGUID: +lRVVcZQRZOvJ8gLg6Zlpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214344555"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:12 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 17/19] tests/intel/kms_frontbuffer_tracking: Use
 for_each_valid_output_on_crtc()
Date: Wed, 25 Feb 2026 14:51:06 +0200
Message-ID: <20260225125108.31119-18-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

Replace the pipe based for_each_valid_output_on_pipe() with
the crtc based for_each_valid_output_on_crtc().

Coccinelle can't handle kms_frontbuffer_tracking so this was done
by hand.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 101ceea1f0bc..08e08c594c0d 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4233,7 +4233,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 				pipe_crc = NULL;
 				setup_crcs();
 
-				for_each_valid_output_on_pipe(&drm.display, crtc->pipe, output) {
+				for_each_valid_output_on_crtc(&drm.display, crtc, output) {
 					init_mode_params(&prim_mode_params, output, crtc);
 					setup_fbc();
 
-- 
2.52.0

