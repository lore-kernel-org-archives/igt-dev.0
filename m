Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85A6F531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F8510E072;
	Tue, 14 Apr 2026 07:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PF2omFO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5A910E28D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150899; x=1807686899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=In2p/+gAN1GJN6L/0Z+beW7R/Xkhw6SZ+d1oFlFfHys=;
 b=PF2omFO2r+OfaGALnEorl0P2t31M9gXQoWsE4gnXpo86F+zhNixIKrK7
 LoBS6qWnsDFGXXL+PTDwj8zng6OFmKoz1x6fjeonYbBsIrfVpkPfYcQuX
 Qfa9jFJfyMckdVfxJeTV03cwZFZ+/LqUwuCchq6oCRt61lW9lusgXAMvq
 NGhrXgLsS/UGBd3vRJXRjLXuXwje/JM1irGawLmUJuHicEwMw4vtnnXot
 lw8Wlh0YD0uuikH3xuYKqpgeAd390x8+fPQD3/pBITPk/8mijp+vfTObE
 mL/IguwDC/QhrQ7PCuRYWu+m9qPGrZkKEK2tRkF3sgHpYqsBrmDlDtTzP Q==;
X-CSE-ConnectionGUID: qHO8dQxbST274AGCt+MLAw==
X-CSE-MsgGUID: jwFxZowESrqT0qG/rZYNdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102555746"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102555746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:14:59 -0700
X-CSE-ConnectionGUID: +lZGM2s2T2qGXOvbAi2Q1w==
X-CSE-MsgGUID: DqJTxYtERYmKl1I+ZrSYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234046851"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:14:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 03/16] tests: prefer igt_display_t over struct
 igt_display
Date: Tue, 14 Apr 2026 10:14:23 +0300
Message-ID: <e70a3bad698012a95c36c9d50e968885c25c47f4.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

The typedefs are meant to be used instead of the plain structs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_getfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 5b0eea161163..7ceca73f3997 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -129,7 +129,7 @@ static bool has_getfb_iface(int fd)
 /**
  * Find and return an arbitrary valid property ID.
  */
-static uint32_t get_any_prop_id(struct igt_display *display)
+static uint32_t get_any_prop_id(igt_display_t *display)
 {
 	for (int i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];
@@ -140,7 +140,7 @@ static uint32_t get_any_prop_id(struct igt_display *display)
 	return 0;
 }
 
-static void test_handle_input(struct igt_display *display)
+static void test_handle_input(igt_display_t *display)
 {
 	struct igt_fb fb;
 
@@ -196,7 +196,7 @@ static void test_handle_input(struct igt_display *display)
 		igt_remove_fb(display->drm_fd, &fb);
 }
 
-static void test_duplicate_handles(struct igt_display *display)
+static void test_duplicate_handles(igt_display_t *display)
 {
 	struct igt_fb fb;
 
@@ -256,7 +256,7 @@ static void test_duplicate_handles(struct igt_display *display)
 		igt_remove_fb(display->drm_fd, &fb);
 }
 
-static void test_getfb2(struct igt_display *display)
+static void test_getfb2(igt_display_t *display)
 {
 	struct igt_fb fb;
 
-- 
2.47.3

