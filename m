Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C136AFF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEFE10E2C4;
	Tue, 28 Apr 2026 04:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhtISPEg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C1510E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351640; x=1808887640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7VXQp1WdURvWW5ekyO/NhJDWjwOFdxSu7CfD5474mYQ=;
 b=ZhtISPEguTcr7gihZhcXLichkziWWK8zAdzCq24Mw5jHTKRJaA6XGAQz
 GJLsK9MYeobHVe6NcppJBHqGZRDelI9Tje7U1tWrloiLSPQ7iPxQkeZwh
 FGQZEZJGLfBWH84OnVLUHm3v23V6Vj0+V6RdIuKr4+nmrMP4lXuloeX7/
 kgC4jsglaiHGsGG4TvV2+lrOPyIxEC+CLq3zE63R/Y2lmQIapGZ5OFgQA
 bNou5pgeFWjOI5rMDgWJiItUs2S1vty18BT20YQviIVetCTrfxPYX+YgB
 8A5EoGeo+whFzxrRiBJrR8TXe0jfI9juObGuGq8YYTJOG2uEizwamSPBo A==;
X-CSE-ConnectionGUID: SkmMpHkXS7qOomaYyiM++g==
X-CSE-MsgGUID: rO3xI9zvT3qHsmBcR2OM9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167818"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:19 -0700
X-CSE-ConnectionGUID: 4gSN0MiHRhqLKhZB3Egokg==
X-CSE-MsgGUID: /NIWUEHaTXGGerz+9fdQZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706657"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:18 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1 11/25] tests/chamelium: Extract Chamelium v2 tests
 into a separate directory
Date: Tue, 28 Apr 2026 10:16:20 +0530
Message-ID: <20260428044644.257001-12-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

This commit moves the existing Chamelium tests to the v2/ subdirectory
to prepare for the introduction of Chamelium v3 tests.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/{ => v2}/kms_chamelium_audio.c     |  0
 tests/chamelium/{ => v2}/kms_chamelium_color.c     |  0
 tests/chamelium/{ => v2}/kms_chamelium_edid.c      |  0
 tests/chamelium/{ => v2}/kms_chamelium_frames.c    |  0
 tests/chamelium/{ => v2}/kms_chamelium_helper.c    |  0
 tests/chamelium/{ => v2}/kms_chamelium_helper.h    |  0
 tests/chamelium/{ => v2}/kms_chamelium_hpd.c       |  0
 .../{ => v2}/kms_chamelium_sharpness_filter.c      |  0
 tests/meson.build                                  | 14 +++++++-------
 9 files changed, 7 insertions(+), 7 deletions(-)
 rename tests/chamelium/{ => v2}/kms_chamelium_audio.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_color.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_edid.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_frames.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_helper.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_helper.h (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_hpd.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_sharpness_filter.c (100%)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/v2/kms_chamelium_audio.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_audio.c
rename to tests/chamelium/v2/kms_chamelium_audio.c
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/v2/kms_chamelium_color.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_color.c
rename to tests/chamelium/v2/kms_chamelium_color.c
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/v2/kms_chamelium_edid.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_edid.c
rename to tests/chamelium/v2/kms_chamelium_edid.c
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/v2/kms_chamelium_frames.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_frames.c
rename to tests/chamelium/v2/kms_chamelium_frames.c
diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/v2/kms_chamelium_helper.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_helper.c
rename to tests/chamelium/v2/kms_chamelium_helper.c
diff --git a/tests/chamelium/kms_chamelium_helper.h b/tests/chamelium/v2/kms_chamelium_helper.h
similarity index 100%
rename from tests/chamelium/kms_chamelium_helper.h
rename to tests/chamelium/v2/kms_chamelium_helper.h
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/v2/kms_chamelium_hpd.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_hpd.c
rename to tests/chamelium/v2/kms_chamelium_hpd.c
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/v2/kms_chamelium_sharpness_filter.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_sharpness_filter.c
rename to tests/chamelium/v2/kms_chamelium_sharpness_filter.c
diff --git a/tests/meson.build b/tests/meson.build
index 60cea3aa8..4455b55c0 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -392,12 +392,12 @@ extra_sources = {
 	'kms_color':  [ 'kms_color_helper.c' ],
 	'kms_color_pipeline':  [ 'kms_color_helper.c', 'kms_colorop_helper.c' ],
 	'kms_colorop':  [ 'kms_colorop_helper.c' ],
-	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_audio': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_edid': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_frames': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_hpd': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
 	'kms_dp_linktrain_fallback': [
            join_paths ('intel', 'kms_mst_helper.c'),
            join_paths ('intel', 'kms_dsc_helper.c') ],
@@ -481,7 +481,7 @@ endforeach
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
-				 [join_paths('chamelium', prog + '.c')] + extra_sources.get(prog, []),
+				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
 				 dependencies : test_deps + extra_dependencies.get(prog, []),
 				 install_dir : libexecdir,
 				 install_rpath : libexecdir_rpathdir,
-- 
2.48.1

