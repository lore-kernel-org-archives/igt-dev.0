Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD60C27C50
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FEB10E3EF;
	Fri, 31 May 2024 14:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMw5CJ1W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD98F10E21E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165499; x=1748701499;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+/bAh+ls9d0PG30VmCAwhSHPrYH/5I1sFBwa+LuRIiU=;
 b=QMw5CJ1WKM0oLwMEH+5jpcxXx9M+INZfaK3/cT6vZ0X8xf4AxvIANLsX
 ec5XO4YZ2+wJHeWM5XXfut5lPTgES56F80KUjNpTwjjub6n1qR7KCaTSu
 ZweWPBNN5ktlT3K35jciP4Ip1+ithX4H3wlJSUIA6ZkLUwRGIJ8pCnlin
 5i8/a30nJWe6IT+3NBUkC2O7f2jO6OyKAF/4Yf963aNUvoT15m2Kvlo79
 CWL20yF39uohfZNxuJSUqMq/domEcr3UW28QckAYSQ3kW32/ESR2NUJu8
 viLqZjehioAzPbVHCaqlV5N2S0RbiqV22gy7daBapm/HSvxvCsHXV/rF+ Q==;
X-CSE-ConnectionGUID: GVb1NXa5QrisaLKfs4TiuA==
X-CSE-MsgGUID: vCE2s374RFOog6IPbPKE6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113670"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:08 -0700
X-CSE-ConnectionGUID: 5rgykesdTuynu5IsRVGx2Q==
X-CSE-MsgGUID: p8IVpeg1Qo2E/PJXeEffuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160811"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:05 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/20] tools/intel_vbt_decode: Fix some tabs
Date: Fri, 31 May 2024 17:23:38 +0300
Message-ID: <20240531142354.16528-5-ville.syrjala@linux.intel.com>
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

Remove stray tabs introduced by mistake in commit 5fd3291e45c2
("tools/intel_vbt_decode: Decode all the driver feature bits").

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index aeaee5713472..16a034e6e487 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1604,9 +1604,9 @@ static void dump_driver_feature(struct context *context,
 
 	printf("\tPC Features field validity: %s\n",
 	       YESNO(feature->pc_feature_valid));
-	printf("\t\tHpd Wake: %s\n",
+	printf("\tHpd Wake: %s\n",
 	       YESNO(feature->hpd_wake));
-	printf("\t\tAssertive Display Technology (ADT): %s\n",
+	printf("\tAssertive Display Technology (ADT): %s\n",
 	       YESNO(feature->adt_enabled));
 	printf("\tDynamic Media Refresh Rate Switching (DMRRS): %s\n",
 	       YESNO(feature->dmrrs_enabled));
-- 
2.44.1

