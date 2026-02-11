Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D3DECD6C8
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B74210E62C;
	Wed, 11 Feb 2026 16:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGPtYePT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FF610E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827661; x=1802363661;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ntu/afxi77OeloU1pLTiJtSgGRh5vj6bDI10Thd+h38=;
 b=mGPtYePT/By6ja9nvLABKv9Nk/2UtmFqYHtQAEDSbKIbyz+lKhhSA3/l
 iONUK0PYOxOmmaTVxb+FAVwPvCkPrO5T0iLobYSsd6EWySkvsQhi2lyxB
 0Z5PiOcE+nWZ78hdIRFAozpZoRHOJ+CSfPA7Of/LUBOdZJgZ5wwvcebRl
 jrl1xCcJADp2ldAJu+0F3L3R4Itfscc2ohEfl7w3RRZZsdpRx4Tw/WPUn
 IYbP/1t3w5bgYyfpyKDukI5EL9JDu2jfBsVIulJ/5y/D3MCITfC5awV4D
 TewN45oKki5MlEQogJaUuiyyDNocxofJ+O8MDg4pQEt9wROrXP7ozB5Kj g==;
X-CSE-ConnectionGUID: WkMtRALbSGGL9BEm853t0Q==
X-CSE-MsgGUID: z0p+HVw4QzqeHgnAqTfhKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83082161"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83082161"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:21 -0800
X-CSE-ConnectionGUID: LbzsiC63QOyTKgPv9pO1NA==
X-CSE-MsgGUID: l9dknatgT4i5soo3WtwVyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211405358"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:20 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/17] tests/kms: Remove const qualifier from 'pipe'
 function parameters
Date: Wed, 11 Feb 2026 18:33:50 +0200
Message-ID: <20260211163404.2018-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
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

Some functions have a const qualifier on a 'pipe' function
paramter. This ends up complicating cocci based efforts to
convert from 'pipe' to 'crtc'. Get rid of the extra qualifiers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_panel_fitting.c | 4 ++--
 tests/kms_scaling_modes.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 296f09405e4e..723336c7ba35 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -105,7 +105,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 
 static void
 test_panel_fitting_legacy(data_t *d, igt_display_t *display,
-			  const enum pipe pipe, igt_output_t *output)
+			  enum pipe pipe, igt_output_t *output)
 {
 	drmModeModeInfo *mode, native_mode;
 	bool is_plane_scaling_active = true;
@@ -195,7 +195,7 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *display,
 }
 
 static void
-test_panel_fitting_fastset(igt_display_t *display, const enum pipe pipe, igt_output_t *output)
+test_panel_fitting_fastset(igt_display_t *display, enum pipe pipe, igt_output_t *output)
 {
 	igt_plane_t *primary, *sprite;
 	drmModeModeInfo mode;
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 7f9a031ddcc4..5b0d6485ebb3 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -54,7 +54,7 @@ typedef struct data {
 	int drm_fd;
 } data_t;
 
-static void test_scaling_mode_on_output(igt_display_t *display, const enum pipe pipe,
+static void test_scaling_mode_on_output(igt_display_t *display, enum pipe pipe,
 					igt_output_t *output, uint32_t flags)
 {
 	igt_plane_t *primary, *sprite;
-- 
2.52.0

