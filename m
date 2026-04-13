Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13452F531CA
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B432010E031;
	Mon, 13 Apr 2026 20:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHRP7IMV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B40610E031
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776110434; x=1807646434;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fEY3X97OKFRB93F6MpUx2CPWmoNLGgDFZaU9BtG17k0=;
 b=kHRP7IMV9C0rwcsXTeuhVNiz65hDLxnZGmTz0pHelwc/eOl+LTG3HdiS
 I4e286r43oPFtSNQZZu/4njZgUi1cVge3sEpPRYHX+43u6FgnKd9WGtz2
 O8fZZ8BYvZ3jcoH1U6rNrRsEohY3MvYdgMlr8/exHpRET1YiOuh5dsnUg
 PUmQCTw4vRJXw7gIIEsAJYPKvXqN4pcZyvAnkTWARClQ8q8CDBtb5hr6a
 XOpeTlnFCWBQMiaxfcEUppbxnKLW018VaSB7L99lWlYpZDFYyqJFPy5yf
 Cfqteq4I7JG6SfmSuTrM4FYJMQzN05izAja3eJOMQE7h3rZBbz9zLAYTi g==;
X-CSE-ConnectionGUID: gmiXFYsfR/CEr4/KJPuKVQ==
X-CSE-MsgGUID: uZ+VP2F6RhWQYGI5eCmT9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87357137"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="87357137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:00:34 -0700
X-CSE-ConnectionGUID: gR/af1ZJT9GW5k+o8LsFgQ==
X-CSE-MsgGUID: QBQ0w5Y+QJqvZxIt2G/8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="234860988"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:00:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] tests/kms: Nuke local copies of
 for_each_valid_output_on_crtc()
Date: Mon, 13 Apr 2026 23:00:20 +0300
Message-ID: <20260413200021.29485-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
References: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
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

A few tests need to nest two for_each_valid_output_on_crtc() loops.
Now that the local iterator variable is removed from for_each_output()
we can just nest the real thing without problems.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_display_modes.c  | 12 +-----------
 tests/kms_plane_multiple.c | 12 +-----------
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 18582cf1500c..76e73152a2ab 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -177,15 +177,6 @@ static void run_extendedmode_basic(data_t *data, igt_crtc_t *crtc1,
 	igt_assert_crc_equal(&crc[1], &ref_crc[1]);
 }
 
-#define for_each_connected_output_local(display, output)		\
-	for (int j__ = 0;  assert(igt_can_fail()), j__ < (display)->n_outputs; j__++)	\
-		for_each_if ((((output) = &(display)->outputs[j__]), \
-			      igt_output_is_connected((output))))
-
-#define for_each_valid_output_on_crtc_local(display, crtc, output) \
-	for_each_connected_output_local((display), (output)) \
-		for_each_if (igt_crtc_connector_valid((crtc), (output)))
-
 static void run_extendedmode_test(data_t *data) {
 	igt_crtc_t *crtc2;
 	igt_crtc_t *crtc;
@@ -204,8 +195,7 @@ static void run_extendedmode_test(data_t *data) {
 				if (crtc == crtc2)
 					continue;
 
-				for_each_valid_output_on_crtc_local(display, crtc2,
-								    output2) {
+				for_each_valid_output_on_crtc(display, crtc2, output2) {
 					if (output1 == output2)
 						continue;
 
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index d8a32d9526ad..55cee260d01f 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -522,15 +522,6 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 	igt_assert_crc_equal(&data->ref_crc2, &crc2);
 }
 
-#define for_each_connected_output_local(display, output)		\
-	for (int j__ = 0;  assert(igt_can_fail()), j__ < (display)->n_outputs; j__++)	\
-		for_each_if((((output) = &(display)->outputs[j__]), \
-			      igt_output_is_connected((output))))
-
-#define for_each_valid_output_on_crtc_local(display, crtc, output) \
-	for_each_connected_output_local((display), (output)) \
-		for_each_if(igt_crtc_connector_valid((crtc), (output)))
-
 static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
 {
 	igt_crtc_t *crtc2;
@@ -551,8 +542,7 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 				if (crtc == crtc2)
 					continue;
 
-				for_each_valid_output_on_crtc_local(display, crtc2,
-								    output2) {
+				for_each_valid_output_on_crtc(display, crtc2, output2) {
 					if (output1 == output2)
 						continue;
 
-- 
2.52.0

