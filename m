Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF58DD58B21
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 05:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0DB10E213;
	Mon, 16 Mar 2026 05:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMCWeonH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B33810E213
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 05:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773638152; x=1805174152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lq5eUX2e8fcB/MmwPSK0lnPBEws9bhTykPW2on07tAE=;
 b=kMCWeonHaGskDozKJHwAvFa/QHISSn8NRBBkpW2sS6i75YfOzByYDLug
 0U+/KDAMAkqrV3Xz+ujf7D8nUNkZRIU1+pY47JoEEVkQOAlmVVhV+6xYr
 Z+y7jTN0156YwJ4gR3/69FVf3l3/Nj3fv2D+X+fmcDG8WToG8yN5kbtXn
 jpIbjO56S4dXxBcLCZ85imr2Sqj3OnWw297eTIzhSN//CgJO9C2kBouSJ
 lS8FxwBmF1K3LRQt5qXen9SoCl+mwyHpSCUjkWkAXmLqmjPkQLdSoV3gb
 OCZI6BSe4iJp15HTiDlaCw8ZMdPCikhySyMEuucZrvNkA4mbi7WE/4+qH g==;
X-CSE-ConnectionGUID: MLXT+OuITD+yxZjjK3Uotw==
X-CSE-MsgGUID: uJ7kcMnJRTa3v3SmgCgnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="86003541"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="86003541"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 22:15:52 -0700
X-CSE-ConnectionGUID: 7RjHRP9mSQG6aWqyqwtEWw==
X-CSE-MsgGUID: erzGzpQ/QdOl1VRZastFVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="218100200"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 22:15:50 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, karthik.b.s@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_content_protection: Get HDCP capable
 outputs before modeset
Date: Mon, 16 Mar 2026 10:43:51 +0530
Message-Id: <20260316051351.15659-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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

