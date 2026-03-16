Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF92F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4C310E344;
	Mon, 16 Mar 2026 08:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVOKJIbv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DEA10E344
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649182; x=1805185182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TRVWGQ+lzxA8/WbIgH78lmOaW+N3vXxrs+HYeYfjfPo=;
 b=IVOKJIbv02T07wCfIBgzhH73JFMqlQnKdUmzsdBuOgdWyumoWl09nqrf
 Nv4LwtBMN6Zzp7TncmV5LunyElAu6pn/oCNBW/kBJ0en18hvGtRX8jNUU
 Z9dBZpIS2pVuEitgGorY/TMh4CgFZdjT70mw8rOsPTRGK2CLu908dfmaP
 qsFvyyUCNmoifgXppqPYt62iHwjxiS9z8/upqsNkrlRp/zeF39+4AW76p
 isaoo0xg7J4I0HtfsCKtWt7sTsObesRj7WDsVH+/Eblg0SZTVzgoZQMa3
 S7D0YkslmAJPIEbcv+Oeh/x/vJWWOnJZDkSMzBSfvYUHz1y0BRxTIPdCY A==;
X-CSE-ConnectionGUID: juzlMNXtSSSBXKqMRMhJww==
X-CSE-MsgGUID: jhcqpdpdTzqcIsuJuYRt5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359436"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359436"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:42 -0700
X-CSE-ConnectionGUID: mHmVg1QSTwqol+DtYw4gzg==
X-CSE-MsgGUID: GjE9hVG3TaSDKtZ4cNi6pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300698"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:41 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 10/17] tests/kms_cursor_edge_walk: Use CRC
 stop-on-fail assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:14 +0530
Message-ID: <20260316084021.419580-11-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316084021.419580-1-sowmiya.s@intel.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
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

Replace igt_assert_crc_equal() with igt_assert_crc_equal_stop_on_fail()
to automatically stop CRC collection on mismatch.
Replace manual free+NULL with igt_pipe_crc_cleanup() in cleanup_crtc()
and add cleanup in fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_cursor_edge_walk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 8036d43d5..2bd7f29fa 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -178,7 +178,7 @@ static void test_edge_pos(data_t *data, int sx, int ex, int y, bool swap_axis)
 		igt_debug("Checking CRCs: ");
 		for (i = 0; i < n; i++) {
 			igt_debug("[%d] ", i);
-			igt_assert_crc_equal(&data->ref_crc, &crc[i]);
+			igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &data->ref_crc, &crc[i]);
 		}
 		igt_debug("\n");
 	}
@@ -248,8 +248,7 @@ static void cleanup_crtc(data_t *data)
 	igt_display_t *display = &data->display;
 
 	igt_display_reset(display);
-	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = NULL;
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 
 	igt_remove_fb(data->drm_fd, &data->primary_fb);
 	igt_remove_fb(data->drm_fd, &data->fb);
@@ -419,6 +418,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.0

