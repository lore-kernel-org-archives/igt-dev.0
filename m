Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E6E83052
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 06:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48ED10E307;
	Tue,  3 Feb 2026 06:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdVih8q9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF92310E307
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 06:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770099060; x=1801635060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zmlj5TlUNIYyAwwJRdY/XKOgAUWAVT4wFHeA8jxHWwc=;
 b=mdVih8q9RogOnaRLVrMx5QkJx84xfQ8cFHLYDKq/JVRVd0swhne6Ay9I
 +YIS0Zgb87Yc0ibP+P+iTD9hiRBZpFVUYHLtiXjPc94fdHe8BcpeBpgvh
 Zd+euvvRt/Wb32f6x5y2ZulwyH1d6RuACAoeOkZJC5s6jf3N00GuhfU4h
 lckvjUUbc1Sibw3UlxbPme5a3MRdetb3BBTO33/p+IqhTcR0KoUnJ8hQu
 j3NaAaYa9Hl2HrUtyVeO/Tw75wyKyvt6MoLo0BwMVstw9H6IGealWm4aO
 01rDFaFpc5MpzLwNR0XLhQBHn74r3KvWytodnaAgAfPHaHUZhiQ3nK/DT g==;
X-CSE-ConnectionGUID: 8vFGdyQkTK6Chm0Kp6fWHg==
X-CSE-MsgGUID: wnVTPrEmT3qjmFvxUVmnMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82000704"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82000704"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 22:10:59 -0800
X-CSE-ConnectionGUID: 5/nYJQD7TgOvuccSEXGI5A==
X-CSE-MsgGUID: WO+GefdXSPu5s4xpCeG2Bg==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.186])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 22:10:57 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel/kms_psr2_sf: Drop Early Transport
 flag from data_t
Date: Tue,  3 Feb 2026 08:10:34 +0200
Message-ID: <20260203061036.21482-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203061036.21482-1-jouni.hogander@intel.com>
References: <20260203061036.21482-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Implement helper to detect need for Early Transport check and use that to
figure out if Early Transport check is needed. Drop et_flag from data_t.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr2_sf.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index f42863874..0eae34cbd 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -224,7 +224,6 @@ typedef struct {
 	igt_plane_t *test_plane;
 	bool big_fb_test;
 	bool fbc_flag;
-	bool et_flag;
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
@@ -237,17 +236,30 @@ typedef struct {
 	} coexist_feature;
 } data_t;
 
+static bool is_et_check_needed(data_t *data)
+{
+	switch (data->psr_mode) {
+	case PR_MODE_SEL_FETCH:
+	case PR_MODE_SEL_FETCH_ET:
+		return true;
+	case PSR_MODE_2:
+	case PSR_MODE_2_SEL_FETCH:
+	case PSR_MODE_2_ET:
+		return psr_sink_support(data->drm_fd, data->debugfs_fd,
+					PSR_MODE_2_ET, data->output);
+	default:
+		igt_assert(false);
+	}
+}
+
 static bool set_sel_fetch_mode_for_output(data_t *data)
 {
 	bool supported = false;
 
-	data->et_flag = false;
-
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
 						 PR_MODE_SEL_FETCH_ET, data->output)) {
 		supported = true;
 		data->psr_mode = PR_MODE_SEL_FETCH;
-		data->et_flag = true;
 	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
 							PR_MODE_SEL_FETCH, data->output)) {
 		supported = true;
@@ -256,7 +268,6 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
 							PSR_MODE_2_ET, data->output)) {
 		supported = true;
 		data->psr_mode = PSR_MODE_2;
-		data->et_flag = true;
 	} else	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
 							  PSR_MODE_2, data->output)) {
 		supported = true;
@@ -977,9 +988,7 @@ static void run(data_t *data)
 							  data->pipe),
 							  "FBC still disabled\n");
 
-	/* TODO: Enable this check if other connectors support Early Transport */
-	if (data->et_flag && data->output != NULL &&
-	    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
+	if (is_et_check_needed(data))
 		igt_assert_f(early_transport_check(data->debugfs_fd),
 			     "Early Transport Disabled\n");
 
-- 
2.43.0

