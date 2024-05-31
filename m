Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E59C25B7E
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF6D10E21E;
	Fri, 31 May 2024 14:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VezNql4o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9FF10E21E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165499; x=1748701499;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=p2wJN/SwBrPXDRqJnDc1A/m0BTmCJ8Xd8IEIKeYT2H0=;
 b=VezNql4oRb6AAHw2EWIROQ/Yb6+lE1s4WdJmHeYtUOwQt+w5AFO5rlf2
 85oGgUFO/Ycj03eKY6f3jTkS0zDf35o1MfkcQz8ghkUw6yCTUivN4lnDo
 4fF5wQILOJCTGc1EV5Msy4mifY3VOWV3CbKvCXclgjNfhrp+TeLOSu1Pe
 6WZGI1FgaKI7gLWyETd3tzrX5FM4VmVECiZHttLNdJhGtTTlJYUehtaB3
 bB5Lc+DW4EVEmqDeu0kWLSt15lZ3VG35CoVG4mOKsqFqZas2sDSZCEWOQ
 P1jb28XwKd7Rd4JWWuBXgf8CAjAbCeNcYE9qgMzzRfcmAfbDd4823nKbO Q==;
X-CSE-ConnectionGUID: AN0BqIPPR/aBsM8paeDZGA==
X-CSE-MsgGUID: YBhbrn2ZSWyKoYG3Q8znpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113680"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:13 -0700
X-CSE-ConnectionGUID: md19dEF/TEOMg2ssQx1hIQ==
X-CSE-MsgGUID: iMmBglDQTCOtJSdVloudDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160821"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/20] tools/intel_vbt_decode: Indent ALS dump
Date: Fri, 31 May 2024 17:23:40 +0300
Message-ID: <20240531142354.16528-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add an extra indent level to the ALS table dump to make it nicer
to look at.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f9bc1deb906c..318069ee948e 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1853,9 +1853,10 @@ static void dump_lfp_power(struct context *context,
 	       YESNO(lfp_block->features.dpst_support));
 
 	for (i = 0; i < 5; i++) {
-		printf("\tALS backlight adjust: %d\n",
+		printf("\tALS entry #%d\n", i + 1);
+		printf("\t\tALS backlight adjust: %d\n",
 		       lfp_block->als[i].backlight_adjust);
-		printf("\tALS Lux: %d\n",
+		printf("\t\tALS Lux: %d\n",
 		       lfp_block->als[i].lux);
 	}
 
-- 
2.44.1

