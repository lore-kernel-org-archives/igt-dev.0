Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FC3E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 12:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18BC10F09A;
	Fri, 10 Jan 2025 12:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImZMvKcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160BA10F09A
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736513530; x=1768049530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mZZXYSbeSCGQzE3e7/lrVk8fzwg6Tc9iPSYvw4oeo58=;
 b=ImZMvKcWMdb6m6Jbub7B8f1yxfyIggqi4hVYt9U6LNgni55Bwyiq7tSn
 NaFvqptoseWnt9Vi/17nGw/Ym2/o9+TTK0fTm96ZJkN0sgvZAOl5DpYo2
 8boTGl7cvN6Z9bGzhMMbF1y8WjnEf4aFJiyc5mIlZH/+X4K8vjMN2tG+O
 Ob2gTNn5xoOy8m2AnZOtlyICAxsDbADirwSkwYyX4icqXbW5E8roRVQe4
 hT/5hbOzK+N/U8GW7ZT4pU342vS/r66WzOTkUubjolS7O0U8dBhXjvjth
 nq4gwO1hETuhlUcLkGyQpT5HxpXRLf6hmXr0aM9V5brkNeOc/VGoziwTX A==;
X-CSE-ConnectionGUID: fZmxZgrJT/+zHbi0IjyXVg==
X-CSE-MsgGUID: jbYyeu53S16iTpm3HmgbSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36966082"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36966082"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 04:52:10 -0800
X-CSE-ConnectionGUID: 879SG0yoQT2+uW05AlWEoA==
X-CSE-MsgGUID: 91JLXubMTw6YmDtc4USXGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="104283985"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 04:52:08 -0800
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/xe_eudebug: check if driver is open before
 toggling enable
Date: Fri, 10 Jan 2025 12:52:01 +0000
Message-Id: <20250110125201.59630-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

In some cases, ccs_mode_all_engines can fail,
which will cause test fixture to not execute properly
and skip drm_open_driver, thus putting the test
in an unstable state.

Check if driver is open or not and reopen if necessary.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 22b0da658..6d06ed647 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2868,7 +2868,16 @@ igt_main
 	}
 
 	igt_fixture {
+		/* in previous subtest group, ccs_mode_all_engines can fail,
+		 * which will cause test fixture to not execute properly
+		 * and skip drm_open_driver, thus putting the test in an unstable state.
+		 * Therefore, check if driver is open or not and reopen if necessary
+		 */
+		if (fcntl(fd, F_GETFD) < 0)
+			fd = drm_open_driver(DRIVER_XE);
+
 		xe_eudebug_enable(fd, was_enabled);
+
 		drm_close_driver(fd);
 	}
 
-- 
2.34.1

