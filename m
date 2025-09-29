Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D077FCAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C7410E48C;
	Mon, 29 Sep 2025 19:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LubAGf9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5365310E48C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173711; x=1790709711;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=L2mpHZSU1BqZ3j4sasUxjqv61tGGsGq+kwlnDLPAsMw=;
 b=LubAGf9PLNLwd7wSNYNp/Na9mToSQfjY3MYFVTPsXRo/ShAV4rX6iW/P
 h5Y38EaBbH+b67enaYaeaf7gDWo0a+2LVFhae6pLHt1cQmxSrIbiagQ3q
 TJ4mBzpvQ9Oiw73cUZNzV5Lq41vzUZ8ZScZqTyLwWkZfRfJz44peKRKFj
 k4vU8R/iFOaZ28CCRm46es2WAzCpmbbZmVElqLcowCIs+oq8YsQwF4sgY
 eIslyrAahPNrDSGUj3sbBW3fuwMlkNEixfsIkT+KmwTvB4zeslnDctDGo
 pylw7+R+FfYr8t2XELo6Lgdj3vS+YoxEj/mqh6eFEpkLNTEujX0wVzsNO w==;
X-CSE-ConnectionGUID: Zbal8+AIQJeZtlK4gzwobw==
X-CSE-MsgGUID: VAOXgTBYRaOM72Lr51Ulew==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61589850"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61589850"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:51 -0700
X-CSE-ConnectionGUID: qOB+5g8tS9Omhb94WNKeIg==
X-CSE-MsgGUID: LIu+iESoTvutn1Q4ILubkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178250213"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:50 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/6] tools/intel_vbt_decode: Decode the backlight
 control method type
Date: Mon, 29 Sep 2025 22:21:26 +0300
Message-ID: <20250929192127.5865-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Decode the backlight control method type to a human readable form.

TODO: looks like the we might not be handling some of this
      correctly on the kernel side...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 68d02aee9f5a..e42aed542612 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -734,6 +734,17 @@ static const char * const i2c_speed_str[] = {
 	[3] = "1 MHz",
 };
 
+static const char * const control_type_str[] = {
+	[0] = "PMIC pin",
+	[1] = "LPSS PWM",
+	[2] = "PWM from Display Engine/Aux Default",
+	[3] = "CABC/PWM From LCD Panel",
+	[4] = "Panel driver interface",
+	[5] = "Legacy VESA eDP AUX Interface",
+	[6] = "PWM from Display Engine/VESA eDP1.5 SCR AUX Interface",
+	[7] = "PWM from Display Engine/Custom eDP AUX Interface",
+};
+
 static void dump_backlight_info(struct context *context,
 				const struct bdb_block *block)
 {
@@ -782,7 +793,8 @@ static void dump_backlight_info(struct context *context,
 
 		control = &backlight->backlight_control[i];
 
-		printf("\t\tControl type: %u\n", control->type);
+		printf("\t\tControl type: %s (%u)\n",
+		       to_str(control_type_str, control->type), control->type);
 		printf("\t\tController: %u\n", control->controller);
 
 		if (context->bdb->version < 234)
-- 
2.49.1

