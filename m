Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349691075262
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 06:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC91010E8A8;
	Thu, 19 Mar 2026 06:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJbQsPaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED05D10E8A7
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773902612; x=1805438612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OS4QZ9UZbspoLlsbEB3r5BOhmXmiGiYfz4ct2eopu7U=;
 b=FJbQsPaO2I1vztHXBYcGGNoPXw1LYSmE4bFu7Qa3je0nXYN5CxCcm1MO
 15gpBPShlr6/6d+scND+eVW7jPvI9l/QsyjDWdwABMmGW5nlbCPt/tyWE
 W+8XgUii0ffbtnBJA7+4t4V0hi2bTKjdTIsEPxFso3O2Q2aKm25t+V1SB
 27iw8ndkLo30Ar0wLI8gsBhR8ip4FPww7upxRAC11EHDfYeZCfeUUdP5X
 5oi6FCelpbuQvcBMYiZrwP1SeZMfH3cqAYZ0YTMBY8V5IMgm8efpkVNcY
 OmlK+DMmqoGkdHhsLPd/O/CXRxlBBfJZmToMbRQICryZi9q1jTwdEEWPu g==;
X-CSE-ConnectionGUID: HpDlFgK7R9q6C8Wn4Q2gbA==
X-CSE-MsgGUID: ZkF29dkpQleLSaryLOpPOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74854259"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="74854259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:43:31 -0700
X-CSE-ConnectionGUID: i3TaigsFTF+dnaT3I2KZNw==
X-CSE-MsgGUID: khYEuC+5SWWj5X0XzdbFYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="222851088"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:43:29 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, karthik.b.s@intel.com,
 mohammed.thasleem@intel.com, sowmiya.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 1/2] tests/kms_content_protection: Get HDCP capable
 outputs before modeset
Date: Thu, 19 Mar 2026 12:11:14 +0530
Message-Id: <20260319064115.72836-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319064115.72836-1-santhosh.reddy.guddati@intel.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
 <20260319064115.72836-1-santhosh.reddy.guddati@intel.com>
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

Filter out the HDCP capable outputs from the connected outputs before
doing a modeset. This will make the test to execute on HDCP
supported panels and avoid commit failures and invalid skips on
HDCP supported panels.

A connector needs a valid CRTC to reliably read its debugfs consistently.
To avoid unwanted modesets before checking HDCP capability checks, collect
all HDCP‑capable outputs separately.

V2: Add comment describing reasons for invalid skips (Suraj)

V3: Replace hardcoded values with macros for hdcp outputs (Sowmiya)

V4: Get hdcp capability first before EDID reading and blocklisting.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_content_protection.c | 43 +++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index f35c9fa73..caf3d7a56 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -127,6 +127,7 @@ struct data {
 #define CP_UNDESIRED				0
 #define CP_DESIRED				1
 #define CP_ENABLED				2
+#define MAX_HDCP_OUTPUTS			10
 
 /*
  * HDCP_CONTENT_TYPE_0 can be handled on both HDCP1.4 and HDCP2.2. Where as
@@ -707,32 +708,56 @@ static bool is_output_hdcp_test_exempt(igt_output_t *output)
 	return igt_is_panel_blocked(sink_name, hdcp_blocklist, ARRAY_SIZE(hdcp_blocklist));
 }
 
+static int get_hdcp_outputs(igt_display_t *display, int content_type,
+			    igt_output_t **hdcp_outputs)
+{
+	igt_output_t *output;
+	int count = 0;
+
+	for_each_connected_output(display, output) {
+		if (!output_hdcp_capable(output, content_type))
+			continue;
+
+		if (is_output_hdcp_test_exempt(output)) {
+			igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
+				 output->name);
+			continue;
+		}
+
+
+		if (count < MAX_HDCP_OUTPUTS)
+			hdcp_outputs[count++] = output;
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
+	igt_output_t *hdcp_outputs[MAX_HDCP_OUTPUTS];
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

