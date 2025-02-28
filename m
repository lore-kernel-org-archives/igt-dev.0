Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D991C282C6
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 19:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E582A10E33E;
	Fri, 28 Feb 2025 19:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IICcH6tE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A8A10E33E
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740771764; x=1772307764;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iZdGTbtwKPtBdrRLdQvMX1gqe5jwpMswzVlX74ooXr8=;
 b=IICcH6tE8kVhSP+EGZgYs3OeUMEpoJaIEpgiarCno0U8m9zZfgX6/KPI
 m9OMmPRgoHF6vaRJZLXGmy4h7Q8mF++YiOhcwGOqk/uuplStAlh0LhxDD
 NKmRGqE1wTLnSoZEmsmzeBF9YnLYuaNLot2zgi2hPnX1/pCxaMkXv2xQQ
 T0K6FFFE7/Ab3RBarAK0wTJmpe7XA0ZCCxLmeVTP9+rOTpmEp3RJQjz0x
 vw8E+I74yAASTHytGhUVuF3myode1T3aIHEx/4eR9H477R3zoDlpFOrtX
 ipVQPzjvc9pJAA3LP+VYVrT7NdnPwhfQMP2V/4QZFfhUs0TPBa6p7ku2v Q==;
X-CSE-ConnectionGUID: Gd3VfDAtQFioKiUsY1fA8Q==
X-CSE-MsgGUID: YMBcczTkQq2ivkkecEUQjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="53100699"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="53100699"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:42:43 -0800
X-CSE-ConnectionGUID: gN27UQG4QlWZwUAFMU15fA==
X-CSE-MsgGUID: yi9eZeCoQhy2qoiNNJ4t+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122658745"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 11:42:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 21:42:40 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_flip: Add flip-vs-dpms-on-nop subtest
Date: Fri, 28 Feb 2025 21:42:40 +0200
Message-ID: <20250228194240.20023-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
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

Verify that redundant DPMS ON requests don't result in
actual commits (and thus frame drops). This behaviour
is guaranteed by the kernel for atomic drivers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_flip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 3ad4d0afb1f6..59740aca25bd 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -176,6 +176,7 @@
  * @single-buffer-flip-vs-dpms-off-vs-modeset: pageflip of same buffer along with
  *                                             the modeset and dpms off
  * @dpms-vs-vblank-race:                       vblank along with the dpms & modeset
+ * @flip-vs-dpms-on-nop:                       pageflip and issue nop DPMS ON
  */
 
 /**
@@ -240,6 +241,7 @@
  */
 
 #define TEST_DPMS		(1 << 0)
+#define TEST_DPMS_ON_NOP	(1 << 1)
 
 #define TEST_PAN		(1 << 3)
 #define TEST_MODESET		(1 << 4)
@@ -957,7 +959,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 	if (o->flags & TEST_MODESET)
 		igt_assert(set_mode(o, o->fb_ids[o->current_fb_id], 0, 0) == 0);
 
-	if (o->flags & TEST_DPMS)
+	if (o->flags & (TEST_DPMS | TEST_DPMS_ON_NOP))
 		set_dpms(o, DRM_MODE_DPMS_ON);
 
 	if (o->flags & TEST_VBLANK_RACE) {
@@ -2020,6 +2022,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			"plain-flip-fb-recreate" },
 		{ 30, TEST_FLIP | TEST_RMFB | TEST_MODESET , "flip-vs-rmfb" },
 		{ 2, TEST_FLIP | TEST_DPMS | TEST_EINVAL | TEST_BASIC, "flip-vs-dpms" },
+		{ 2, TEST_FLIP | TEST_DPMS_ON_NOP | TEST_CHECK_TS, "flip-vs-dpms-on-nop" },
 		{ 30,  TEST_FLIP | TEST_PAN, "flip-vs-panning" },
 		{ 2, TEST_FLIP | TEST_MODESET | TEST_EINVAL | TEST_BASIC, "flip-vs-modeset" },
 		{ 30,  TEST_FLIP | TEST_VBLANK_EXPIRED_SEQ,
-- 
2.45.3

