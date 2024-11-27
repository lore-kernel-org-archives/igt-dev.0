Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EB3D609D2
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 11:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3F10E227;
	Wed, 27 Nov 2024 11:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFkStj3U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6A810E227
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732705218; x=1764241218;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yY68ebH5Xy6G5T3a+aXtExjhs5sMcdVQKbJ1gKjmXDs=;
 b=oFkStj3UChyiSoX1NN0eKCU1LWQDtbJ3jLe4JQBvVJowB0Hb4stpW/nc
 gVtZj/ZUcKfs5ageKKiw0sIngZnkXKiGfM33m2oqxEaefMmtduLfI4yAD
 wIdpDYBosvvdc7kZy/bU39VVbbV7GsfR8kX+3s9h/4LmIUB2geyxOp//K
 hf68XVKZwD3MMnIPMtwvt55JAG3NrwQwF3jkn0qqEs2RCqRzm86JZUQtL
 7xT9+wW5Wm6+h3A2FiMiqVDiTv1T7dtD1FlObigGb2a+sXFWXwryW5x3T
 SCefgqgqeHIkHFwgbcSUa51Ezglk9DJCIw7J/LW9+0hKBYxuFh4NIVzxY g==;
X-CSE-ConnectionGUID: 83nqn/BWRnSDBpzu6aACXA==
X-CSE-MsgGUID: Fa1B4APGSOqA8IcIQEzPyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32759635"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32759635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 03:00:17 -0800
X-CSE-ConnectionGUID: hUHaWfHuReyDC5hlHCAlmQ==
X-CSE-MsgGUID: aqcjtkxbQ9CCulAieRHySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92064515"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Nov 2024 03:00:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 27 Nov 2024 13:00:12 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_invalid_mode: Attempt divide-by-zero in
 drm_mode_vrefresh()
Date: Wed, 27 Nov 2024 13:00:12 +0200
Message-ID: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a new subtest which attempts to invoke a div-by-zero via
an overflow in drm_mode_vrefresh() (found by syzbot).

Link: https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_invalid_mode.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 4fd644594ef9..5fa85338c799 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -210,6 +210,20 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
 	return true;
 }
 
+static bool
+adjust_mode_overflow_vrefresh(data_t *data, drmModeModeInfoPtr mode)
+{
+	/*
+	 * htotal * vtotal * vscan == 2^32
+	 * overflow during vrefresh calculation
+	 */
+	mode->htotal = 32768;
+	mode->vtotal = 32768;
+	mode->vscan = 4;
+
+	return true;
+}
+
 static void
 test_output(data_t *data)
 {
@@ -285,6 +299,9 @@ static const struct {
 	{ .name = "bad-vtotal",
 	  .adjust_mode = adjust_mode_bad_vtotal,
 	},
+	{ .name = "overflow-vrefresh",
+	  .adjust_mode = adjust_mode_overflow_vrefresh,
+	},
 };
 
 static data_t data;
-- 
2.45.2

