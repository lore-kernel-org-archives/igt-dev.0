Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179E0CF3965
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 19:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF9B10E772;
	Thu, 19 Sep 2024 19:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEmWCqDf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6953210E771
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 19:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726774372; x=1758310372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wHTIhqxRgBfk8cWy3uUVcQ/8cRjMgShefaGbEv7GIEo=;
 b=YEmWCqDfVHnsXi/l0/fwKhccRAD15ggQKngq9JHA5tFm1FV4J0k8BAz4
 uvgf3rwavB2TPay1A/pnVtPguNbxcgy9VgTwY7fZvIPAkANGLCafBC6pH
 E9iw+5ubDGzrvbl7wQHtqQou/ngf9x+CZB/RZjfIfg7BMlbZn4HV7Wvqt
 nzYoYjZxgCO+c+lVLarwBLn6rU38qnyVdKlb6ZZH5LBxjLN5b3g827vCz
 kvky0Nj1upgt7sKX8B8pyjXxiBIeZHVVctZorUCgHNu4Q/01rSJzb5xL1
 LEsyiJmAKAqu3I/w6g7oioM9EUT/rqwmsvtxw5TIEIBR5iDv5vhw+3p7B g==;
X-CSE-ConnectionGUID: wJyLXL8+TraYg3EOc+6feA==
X-CSE-MsgGUID: 7dg4QAUNQjKElnQDMjykyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43279658"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="43279658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:32:52 -0700
X-CSE-ConnectionGUID: AXTRvz1LS+m0D6QcGqwVHA==
X-CSE-MsgGUID: ysq834NpQSucB+BWUYVBVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="93327808"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:32:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_rmfb: Fix support for xe
Date: Thu, 19 Sep 2024 12:32:49 -0700
Message-ID: <20240919193250.1439745-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240919193250.1439745-1-lucas.demarchi@intel.com>
References: <20240919193250.1439745-1-lucas.demarchi@intel.com>
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

Make sure to hold a drm fd open while running the test so we can check
for fb_id == 0 after either removing the fb or closing the previous fd.
With i915 this is guaranteed by holding on to an fd to be used in an
exit handler in drm_open_driver().

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/kms_rmfb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 0ea689d60..e4203bdd4 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -206,10 +206,15 @@ igt_main
 				    "it" },
 	};
 	struct rmfb_data data = {};
-	int i;
+	int i, other_fd;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		/*
+		 * Prevent fb from changing underneath so we can check by
+		 * fb_id == 0 after removing the fb
+		 */
+		other_fd = drm_reopen_driver(data.drm_fd);
 
 		kmstest_set_vt_graphics_mode();
 
@@ -227,5 +232,6 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
+		drm_close_driver(other_fd);
 	}
 }
-- 
2.46.1

