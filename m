Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09207CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA710EA89;
	Tue, 12 May 2026 12:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jd80h3bk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAD910E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588599; x=1810124599;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fAU2CNO6xlsbeW8d/LVs0wuUbHQIwqMMHsaLCSvt5hc=;
 b=Jd80h3bkUl6pTPHGPqzFLUrmCq060ENeljNnt7OaLSDksfIsl8ITw2i3
 H2WWWqswa7y1a5Mxpw4P1djdlgVOAo3w+2D0vQS1vwo6XNEczQgvIS4gK
 C6pYzbAfRiMHG+3cx1Jkj2WAglSB/7R6Gz6VM0vzQDa55+W0cBTrK0/jY
 9MBQpEPuBB4vEUcAx5c/iW25puU3sI99L7x9VnNklTHfxSd+7QhP15QFD
 UZLRRnlJbcGMnZjmK7nBl/8eY6xi+UOwehEumussC3e5lsBY9l0sdMb3Y
 wAY3ANzOD97WkByfcfPj4jbPRbOGLfVwMCRd93byDUEFgm8aRzJT3flOe g==;
X-CSE-ConnectionGUID: 6V0BDcxaSCqzKjKNZwXUOQ==
X-CSE-MsgGUID: CfakWxNZTRakjP8Wxe4HcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950063"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104950063"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:18 -0700
X-CSE-ConnectionGUID: M3eTxYAfQO+bIRQSHWiK3w==
X-CSE-MsgGUID: Tod2W5k6RVWfOnDKH5JgKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234691224"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:17 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 23/25] tests/kms_async_flips: Use
 for_each_format_and_modifier() and for_each_modifier_with_format()
Date: Tue, 12 May 2026 15:21:41 +0300
Message-ID: <20260512122143.11013-24-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
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

Replace the open coded copies of for_each_format_and_modifier()
and for_each_modifier_with_format() with the real things.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index e8c9979bd06d..ef4b28eb5258 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -949,18 +949,16 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 	igt_vec_init(&tested_formats, sizeof(struct format_mod));
 
 	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+		struct format_mod f = {};
+
 		data->crtc = crtc;
 		test_init(data);
 
 		igt_assert_f(data->plane->format_mods_async.count > 0,
 			     "No async format/modifier supported\n");
 
-		for (int i = 0; i < data->plane->format_mods_async.count; i++) {
-			struct format_mod f = {
-				.format = data->plane->format_mods_async.formats[i],
-				.modifier = data->plane->format_mods_async.modifiers[i],
-			};
-
+		for_each_format_and_modifier(&data->plane->format_mods_async,
+					     f.format, f.modifier) {
 			if (skip_async_format_mod(data, f.format, f.modifier, &tested_formats)) {
 				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
 					   IGT_MODIFIER_FMT " on %s.%u\n",
@@ -1003,19 +1001,16 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 		require_atomic_async_cap(data);
 
 	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+		uint64_t modifier;
+
 		data->crtc = crtc;
 		test_init(data);
 
 		igt_require_f(data->plane->format_mods_async.count > 0,
 			     "No async format/modifier supported\n");
 
-		for (int i = 0; i < data->plane->format_mods_async.count; i++) {
-			uint64_t modifier = data->plane->format_mods_async.modifiers[i];
-			uint32_t format = data->plane->format_mods_async.formats[i];
-
-			if (format != DRM_FORMAT_XRGB8888)
-				continue;
-
+		for_each_modifier_with_format(&data->plane->format_mods_async,
+					      DRM_FORMAT_XRGB8888, modifier) {
 			if (modifier == DRM_FORMAT_MOD_LINEAR)
 				continue;
 
-- 
2.52.0

