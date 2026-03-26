Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F3110A62C4
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 12:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E3810E165;
	Thu, 26 Mar 2026 12:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bt6tYubH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4389F10E926
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774529650; x=1806065650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YAPvenO2/IaZtNdp46k+FxYNdrgUvBnJqeteSRvcmCE=;
 b=bt6tYubHkKw0yDd5BDWED3Grr8XCdJY7eH6b5/2gUQ8jQ0IdzRXw0WvL
 IXT/kreoHVT5/3UjFhuCv6ap/KicjlWDF43DVmCfe9wZ1142jjbwtqh6U
 ymTiGxU0yKAXlazZ7qELbq6Gd427f/eJ47yy3PB0tFyGbv3WT3YmDxvUp
 i0/IfXUkwZ04yVITsReVJGjJoIEqTgAskzOf6G+2IXQf8PveZmhHWZQ6J
 keUeGdEzPwcy6sEK2l+u3qPGiAHKiJx5+0MIWGjpBuy7CH9azHjB7N3+Z
 hmFUqg08rY5i7H+iCftHXXxzS1QEO5zO7/XBlHQx2iRDgjETqw5T58sU0 Q==;
X-CSE-ConnectionGUID: /jQi5s8vTFa1NxC05QGDWg==
X-CSE-MsgGUID: r8k0CWECR86scmxlVSxb2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78183091"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78183091"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:54:10 -0700
X-CSE-ConnectionGUID: hAg6o9pBTrSmoQ4TSD53Kw==
X-CSE-MsgGUID: zDEKKbT+TKKEJI3wx9cbfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="220584690"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:54:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t v3 4/5] tests/intel/kms_pipe_b_c_ivb: Prepare for
 returning NULL from igt_crtc_for_pipe()
Date: Thu, 26 Mar 2026 14:53:38 +0200
Message-ID: <8affc34562d2c0a3502cec738ade072c3bcd62ed.1774529527.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774529527.git.jani.nikula@intel.com>
References: <cover.1774529527.git.jani.nikula@intel.com>
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

Figure out igt_crtc_t pointers for pipes B and C once the beginning, and
skip the test if either isn't available.

This is really a no-op, as IVB will have pipes B and C, but prepares for
cleanly returning NULL from igt_crtc_for_pipe().

The follow-up can change the check from crtc->valid to crtc != NULL with
no functional change here.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_pipe_b_c_ivb.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 11c97e23c5e4..0e017706373c 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -65,6 +65,8 @@ IGT_TEST_DESCRIPTION(
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
+	igt_crtc_t *crtc_b;
+	igt_crtc_t *crtc_c;
 } data_t;
 
 drmModeModeInfo mode_3_lanes = {
@@ -173,8 +175,8 @@ find_outputs(data_t *data, igt_output_t **output1, igt_output_t **output2)
 static void
 test_dpms(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -202,8 +204,8 @@ test_dpms(data_t *data)
 static void
 test_lane_reduction(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -235,8 +237,8 @@ test_lane_reduction(data_t *data)
 static void
 test_disable_pipe_B(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -271,8 +273,8 @@ test_disable_pipe_B(data_t *data)
 static void
 test_from_C_to_B_with_3_lanes(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -302,8 +304,8 @@ test_from_C_to_B_with_3_lanes(data_t *data)
 static void
 test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -339,6 +341,12 @@ int igt_main()
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+
+		data.crtc_b = igt_crtc_for_pipe(&data.display, PIPE_B);
+		igt_skip_on(!data.crtc_b->valid);
+
+		data.crtc_c = igt_crtc_for_pipe(&data.display, PIPE_C);
+		igt_skip_on(!data.crtc_c->valid);
 	}
 
 	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B with mode "
-- 
2.47.3

