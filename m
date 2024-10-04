Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A20ACFA763
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2475010E2B0;
	Fri,  4 Oct 2024 10:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCHJWxOi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B3610E9D1
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038514; x=1759574514;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DrAKP3sHp9z4AKCTWV9PIgwO0DAUWYs8wM8MFGYtw08=;
 b=QCHJWxOiHvxjD9VtBfijmafSGICAopLtg42ANr/6NbymxqD3I63k3wlo
 9D8kqiMc/juupg+RixzqKJ+lVvOFCLHSk1JUDrSCN1gwzY+SV4oTNrLn+
 rIMz4SfKOkBde+CQgAMCoat39MXc6FVzRdaDzYnKzVyZOnQqhFdsIhLd2
 qFJnSpJuEnGnWKOwHl5w0QkFRN0J4RWOTHP1+XNEZH7In+4uB6P8sqm1h
 mVawuwZr9pXfFaBUiC4LJAek9cKYkr1hjlkirOonW+UcMTAqKmPWorp2q
 aAhMjsbXoFPLhu1HPl6XKk6dU3kiKLolUTk/A4qn8Ycyuo6X0juqg8+XJ Q==;
X-CSE-ConnectionGUID: YeuIdTZlSKCzjQfGdU+xAA==
X-CSE-MsgGUID: HVKbkiUtTMSA5RmpknGyrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140556"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140556"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:54 -0700
X-CSE-ConnectionGUID: 29M0cdGgSyGTFU1slrr3+g==
X-CSE-MsgGUID: NISO/veLRQ2FVGL8XWSLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778411"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/14] lib/rendercopy: Use igt_require() to validate
 gen2/3 surface size
Date: Fri,  4 Oct 2024 13:41:18 +0300
Message-ID: <20241004104121.32750-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

gen2/3 render engine has a max surface size 2kx2k. That is
pretty easy to hit accidentally. Rather than exploding with
an assert it seems better to just gracefully skip the test.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_i830.c | 8 ++++----
 lib/rendercopy_i915.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/rendercopy_i830.c b/lib/rendercopy_i830.c
index 4b0ea3b859e2..ced4a84a23e8 100644
--- a/lib/rendercopy_i830.c
+++ b/lib/rendercopy_i830.c
@@ -139,8 +139,8 @@ static void gen2_emit_target(struct intel_bb *ibb,
 	uint32_t format;
 
 	igt_assert_lte(dst->surface[0].stride, 8192);
-	igt_assert_lte(intel_buf_width(dst), 2048);
-	igt_assert_lte(intel_buf_height(dst), 2048);
+	igt_require(intel_buf_width(dst) <= 2048);
+	igt_require(intel_buf_height(dst) <= 2048);
 
 	switch (dst->bpp) {
 		case 8: format = COLR_BUF_8BIT; break;
@@ -184,8 +184,8 @@ static void gen2_emit_texture(struct intel_bb *ibb,
 	uint32_t format;
 
 	igt_assert_lte(src->surface[0].stride, 8192);
-	igt_assert_lte(intel_buf_width(src), 2048);
-	igt_assert_lte(intel_buf_height(src), 2048);
+	igt_require(intel_buf_width(src) <= 2048);
+	igt_require(intel_buf_height(src) <= 2048);
 
 	switch (src->bpp) {
 		case 8: format = MAPSURF_8BIT | MT_8BIT_L8; break;
diff --git a/lib/rendercopy_i915.c b/lib/rendercopy_i915.c
index 94cdfb99af9a..2095a7c14b26 100644
--- a/lib/rendercopy_i915.c
+++ b/lib/rendercopy_i915.c
@@ -93,8 +93,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
 		uint32_t format_bits, tiling_bits = 0;
 
 		igt_assert_lte(src->surface[0].stride, 8192);
-		igt_assert_lte(intel_buf_width(src), 2048);
-		igt_assert_lte(intel_buf_height(src), 2048);
+		igt_require(intel_buf_width(src) <= 2048);
+		igt_require(intel_buf_height(src) <= 2048);
 
 		if (src->tiling != I915_TILING_NONE)
 			tiling_bits = MS3_TILED_SURFACE;
@@ -136,8 +136,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
 		uint32_t format_bits;
 
 		igt_assert_lte(dst->surface[0].stride, 8192);
-		igt_assert_lte(intel_buf_width(dst), 2048);
-		igt_assert_lte(intel_buf_height(dst), 2048);
+		igt_require(intel_buf_width(dst) <= 2048);
+		igt_require(intel_buf_height(dst) <= 2048);
 
 		switch (dst->bpp) {
 			case 8: format_bits = COLR_BUF_8BIT; break;
-- 
2.45.2

