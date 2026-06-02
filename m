Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7363CD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A6610E039;
	Tue,  2 Jun 2026 14:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuY4dcBW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0282113AA6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780411152; x=1811947152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FKq4/TbEb6feVCaLrBITXWSKM7zt4kIlzoIo293Mjcc=;
 b=JuY4dcBW59oAHDR8NLc+AiQlVMxJfQeORF++f74/TcLvUGnysblGKJ8x
 UnzEacccSOS/mZ/Qqh74AIO4OdWci8hE1wWYYrFJjDAZhrO7pbP1aGv+K
 AP78Iizsq+CRHdMz+dm2Bc/2xxt9cboNEUxvNBcN4wjhMxaghXvPZ1TSz
 P9/1ZamU9v+FMDc2v4Z5DDAPhKG/PIn5MI0vvyFdCOwY40L27S3m2lvh3
 cTzcK4vF2WBbmL0kZMRLKUDck7O0dsSQMAdBCnSuoOQ01J7Pnp6yzwYos
 tU0GZD7o3eOj212gpxcdobUO3LaWLooNtjSrzoRBPK5fNkfnThObcaIr1 w==;
X-CSE-ConnectionGUID: paqHzFPRREah2IH9wfOu5w==
X-CSE-MsgGUID: quJnFPwLRbSYAZAoAUj+UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81226808"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81226808"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:39:11 -0700
X-CSE-ConnectionGUID: z0Z0WOk8S0ixpFGYqnssig==
X-CSE-MsgGUID: xNDDhSXOQPip+jmuvbFaew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="239751557"
Received: from shawnle1-i9-build-machine.itwn.intel.com ([10.225.64.200])
 by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 07:39:10 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Subject: [PATCH i-g-t v8 1/2] Revert "tests/kms_vrr: Start virtual RR test
 above midpoint to avoid mode fallback"
Date: Tue,  2 Jun 2026 14:30:05 +0000
Message-Id: <20260602143006.2416260-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602143006.2416260-1-shawn.c.lee@intel.com>
References: <20260602143006.2416260-1-shawn.c.lee@intel.com>
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

This reverts commit 862eb176244feac8ee711f381fe1be1fdc6a7ede.

The following patch will do full range testing. So no need to start at midpoint.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1d74..8f5c4a7c1501 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -786,16 +786,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	/* Switch to Virtual RR */
 	virtual_mode = *igt_output_get_mode(output);
 
-	/*
-	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
-	 * modes are available. This avoids the driver mode adjustment. which can cause an
-	 * unintended clock change.
-	 */
-	vrefresh = (output->config.connector->count_modes > 1) ?
-		   (((data->range.max + data->range.min) / 2) + step_size) :
-		   data->range.min + step_size;
-
-	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
+	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
 		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-- 
2.34.1

