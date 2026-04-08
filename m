Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1305210F9968
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 20:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71F710E6E3;
	Wed,  8 Apr 2026 20:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsyRrpX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33B110E6E9
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 20:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775679712; x=1807215712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u20RLN3e/kTzFxSFQPTJeAdYqPg+l5yNhO98X9BmYaQ=;
 b=WsyRrpX2JPieJqWuzc2NeNf856Gc9kfuUiO3i4jYG+/3rkgiNgzTj+Ts
 0j0/YQdSqxW4HLyd+VMNEN9vag4k4D6K9p0Ovlajm+gxVMUsngbL2mFdh
 t6534gcZi2Lfj6qzq5+eXmPaS21gTEnZ/WN8GMNg3naMl4eo5jJD9/0sZ
 A4gXJRkORFchaUlWz48kwlQD4iO6WlQLbEAxOFRYq59PKDoZf7K2Quzwj
 OQOqsr1ta4O11Y6R41MD0fP9D7wvSABO75GLmEZ/WPVnEIpf9hGPFxKWz
 i83n5g0QnWGRpVM/jQmuIygqy9+hBJPNuNxPKpO8at8dRM5mejPDy2jrl A==;
X-CSE-ConnectionGUID: xUCP5O2eRf6mC30Ra5k6KA==
X-CSE-MsgGUID: 4z82p7geToK1HzUTQ/1IFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75713419"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="75713419"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:52 -0700
X-CSE-ConnectionGUID: h73CYiW4QRGDeDuqkLQvWQ==
X-CSE-MsgGUID: 9VrEWUkMQdizp0XJB86pgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="223810575"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 7/7] tests/kms_writeback: use for_each_connector_mode()
Date: Wed,  8 Apr 2026 23:21:13 +0300
Message-ID: <a29343913a5cc0b9f20017719f75b91eae3fe603.1775679624.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775679624.git.jani.nikula@intel.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
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

We have	a helper for looping the output	modes. Use it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_writeback.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index f15abba96765..d189f2f04657 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -468,10 +468,14 @@ static igt_output_t *list_writeback_modes(igt_display_t *display)
 		igt_output_t *output = &display->outputs[i];
 
 		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK) {
+			drmModeModeInfo *mode;
+			int j = 0;
+
 			igt_info("\tname  vref hdis hss hse htot vdis vss vse vtot flags type clock\n");
-			for (int j = 0; j < output->config.connector->count_modes; j++) {
-				igt_info("[%d]", j);
-				kmstest_dump_mode(&output->config.connector->modes[j]);
+
+			for_each_connector_mode(output, mode) {
+				igt_info("[%d]", j++);
+				kmstest_dump_mode(mode);
 			}
 			break;
 		}
-- 
2.47.3

