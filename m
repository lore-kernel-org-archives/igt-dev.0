Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434DBD58B0D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 04:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F077E10E2B7;
	Mon, 16 Mar 2026 04:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmkGoRCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE6810E2B7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 04:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773633971; x=1805169971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+MJ9VfnXXOXxBugD0tQm812w04CiFjM75mPEM8pCM+c=;
 b=FmkGoRCriONG7W+iiiB9lXx0i4ixWhV2sKhpptFvlo27ZTJkkX/usbF2
 jbnMRaMW3iXwHkt+20J046T0Z43IJVNYI5YZAKiyuK3qD0q+1NBq4Dmuj
 FIqXZ275GkcpDnvJO5IqyLz/bWdhmpjA8yACLbwKyjiP5+wRPNsSgeGoV
 AZPW1YyC6JaH0PMp+bfkLLrByJN3z4i7DtF9XR+RmkhXSNqnkzECqiC2l
 5oJMzSzC6AOFtRyCuSJV+rbvYbnpYELSihCI7q4QuTVcV1cnBp8rm8AMX
 wCG6Ie7QqYPwpHb4ojl1FCfhFft1V4oU7frrKGlqt3eIdftzV21rGuMu2 w==;
X-CSE-ConnectionGUID: CMAIgCrLT2OIDvuuloBj3g==
X-CSE-MsgGUID: cqsQa0/NSz2+GwzXm1hwVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78249575"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="78249575"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 21:06:11 -0700
X-CSE-ConnectionGUID: 4i5mSpt3R6ubga2z2JpqDA==
X-CSE-MsgGUID: 3bz6nCW/QseN1x6S9KAItw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="220828983"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 21:06:08 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, karthik.b.s@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_content_protection: Get hdcp capable
 outputs before modeset
Date: Mon, 16 Mar 2026 09:34:09 +0530
Message-Id: <20260316040409.15278-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
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

Filter out the hdcp capable outputs from the connected outputs before
doing a modeset_with_fb. This will make the test to execute on HDCP
supported panels and avoid commit failures and invalid skips on
HDCP supported panels.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 40 ++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index f35c9fa73..96a62bfc5 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -707,32 +707,54 @@ static bool is_output_hdcp_test_exempt(igt_output_t *output)
 	return igt_is_panel_blocked(sink_name, hdcp_blocklist, ARRAY_SIZE(hdcp_blocklist));
 }
 
+static int get_hdcp_outputs(igt_display_t *display, int content_type,
+			    igt_output_t **hdcp_outputs)
+{
+	igt_output_t *output;
+	int count = 0;
+
+	for_each_connected_output(display, output) {
+		if (is_output_hdcp_test_exempt(output)) {
+			igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
+				 output->name);
+			continue;
+		}
+
+		if (!output_hdcp_capable(output, content_type))
+			continue;
+
+		hdcp_outputs[count++] = output;
+	}
+
+	return count;
+}
+
 static void
 test_content_protection(enum igt_commit_style commit_style, int content_type)
 {
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
+	igt_output_t *hdcp_outputs[10];
 	igt_crtc_t *crtc;
+	int hdcp_panel_count;
+	int i;
 
 	if (data.cp_tests & CP_MEI_RELOAD)
 		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
 			      "mei_hdcp module is not loaded\n");
 
+	hdcp_panel_count = get_hdcp_outputs(display, content_type, hdcp_outputs);
+	igt_skip_on_f(hdcp_panel_count == 0, "No connected output with HDCP support found\n");
+
 	if (data.cp_tests & CP_UEVENT) {
 		data.uevent_monitor = igt_watch_uevents();
 		igt_flush_uevents(data.uevent_monitor);
 	}
 
-	for_each_connected_output(display, output) {
-		for_each_crtc(display, crtc) {
-			if (!output_hdcp_capable(output, content_type))
-				continue;
-			if (is_output_hdcp_test_exempt(output)) {
-				igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
-					  output->name);
-				continue;
-			}
+	for (i = 0; i < hdcp_panel_count; i++) {
+		output = hdcp_outputs[i];
 
+		for_each_crtc(display, crtc) {
 			igt_display_reset(display);
 			igt_output_set_crtc(output,
 				            crtc);
-- 
2.34.1

