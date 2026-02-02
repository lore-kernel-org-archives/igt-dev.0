Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E457EE73158
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 13:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9867D10E2B1;
	Mon,  2 Feb 2026 13:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nuk8AfAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A454B10E2B1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770038207; x=1801574207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ETF2scRH+XoKE/lu5G++82icDrLBRF0XSDSl1C5MYKQ=;
 b=nuk8AfAW5frtqSSK15+gP9mV6uh9HX3Z7lMN7fSbOsO1STcfzLpy8Pij
 2jaBF8mEi163WGZeeVbbb7vaEKOeNH2ZPzfub8VPXZmJEZ5e9NWpMXArt
 DIlvYcROYf3N+9fcB3LwSbndHedTOTph9LqWvZVNascQDPdwx3hpLxwP3
 04S8uS9JNqTaJLXCZtokz0Z3gN1+04XyiQ5utEGWPUlR19ZJ2uj3TX8SI
 udgG2nqES1szeUSokP4bTYnc9QfAlwISRL68F4IX4eJkynGURXi4NmCft
 Mt1nW4Xq3qmhlS1p/nzJ+jNL9f38LEa7lhdqmMlePsS90fAFVxsIzArjl g==;
X-CSE-ConnectionGUID: 6Vm6pXqqQ0qcIqAS6/opyw==
X-CSE-MsgGUID: BFeEe6naToiERik8H47VRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="75044382"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="75044382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 05:16:46 -0800
X-CSE-ConnectionGUID: dZNYpYGbQK++xhe3s5UU2Q==
X-CSE-MsgGUID: hD7titqQTKWPi/ozRVqqLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="214050798"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.132])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 05:16:46 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/kms_psr2_sf: Drop Early Transport flag
 from data_t
Date: Mon,  2 Feb 2026 15:16:20 +0200
Message-ID: <20260202131622.1369539-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202131622.1369539-1-jouni.hogander@intel.com>
References: <20260202131622.1369539-1-jouni.hogander@intel.com>
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
 tests/intel/kms_psr2_sf.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 12c5b4fdc..47a878d56 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -223,7 +223,6 @@ typedef struct {
 	igt_plane_t *test_plane;
 	bool big_fb_test;
 	bool fbc_flag;
-	bool et_flag;
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
@@ -236,27 +235,38 @@ typedef struct {
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
 		data->psr_mode = PR_MODE_SEL_FETCH;
-		data->et_flag = true;
 	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
 							PSR_MODE_2_ET, data->output)) {
 		supported = true;
 		data->psr_mode = PSR_MODE_2;
-		data->et_flag = true;
 	} else	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
 							  PSR_MODE_2, data->output)) {
 		supported = true;
@@ -978,9 +988,7 @@ static void run(data_t *data)
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

