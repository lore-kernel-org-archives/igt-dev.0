Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343D9FEA83B
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 10:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D567310E84A;
	Wed, 25 Mar 2026 10:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIXNkL03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA6810E84A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774432880; x=1805968880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bpkS25R/kVcS0AfdTPUPCtwHLc7mwsBMXID6hr5aMMw=;
 b=CIXNkL037RBzxBui/Zo7tm68Tx9UmYEJHJyRSvbSB5zH6OnUaeB9P2rm
 Qd9uSry285XwfoGrfio52jIqwUp6GnVcYefj+dvInPE+RaD0eBW7AjDmi
 gZ3herUlY9v2JFoAneEFym6wu2hosK0jFj62+BWsbaOSIcKHZo67TKu3X
 /PRfmyohhtOZVVEVcqZZtLtf8k3HszYRHahjaUbZfg/XJkY8OMn0AkZ1K
 RcCtCvuMLgkEl6UiruY3iezLUkQ0NXpk7HTgDGlZ5fpnOktF3ky7EMy+9
 3Evtxs1B96nkM1YwKO+Z96pF4wAyocfItTR4z1guLWvXcZXK3rj09miEO g==;
X-CSE-ConnectionGUID: XJ3NdSMHSw6NsgcY4Xw5lw==
X-CSE-MsgGUID: VzyuaHmUQwqWSjnXh/PzcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86942288"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86942288"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:01:19 -0700
X-CSE-ConnectionGUID: t1Qgt37ZSxa0AGtZrEBDVA==
X-CSE-MsgGUID: rw3VyM6rRBCKycdw///lDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="221741893"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:01:17 -0700
From: Sumit Kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	sumit kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_alpha_blend: Print reason for test skips
Date: Wed, 25 Mar 2026 15:29:52 +0530
Message-ID: <20260325095952.316174-1-sumit.kishore@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: sumit kishore <sumit.kishore@intel.com>

Print debug message when tests are skipping on headless display systems.

v2: Add igt_display_require_output. [Karthik]

Signed-off-by: sumit kishore <sumit.kishore@intel.com>
---
 tests/kms_plane_alpha_blend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 3a67dd8cd..3a2649833 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -764,6 +764,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_display_require(&data.display, data.gfx_fd);
 		igt_require(data.display.is_atomic);
 
+		/* Check if at least one active display connected */
+		igt_display_require_output(&data.display);
+
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc)
 			active_crtcs[last_crtc_index++] = crtc->crtc_index;
-- 
2.43.0

