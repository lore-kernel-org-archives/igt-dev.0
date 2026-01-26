Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55E1CF65E7
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 12:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A2310E409;
	Mon, 26 Jan 2026 12:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzOmae2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EA410E409
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 12:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769429741; x=1800965741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o4NZQ3fOsVNohbWIUtAHPJskbx4OQ8I6NS3BVPRYelY=;
 b=dzOmae2Lc3bbf1UdZFYW81A2mLE8l+VbYuH9UJxY/6utXQpK7cjsgGdZ
 9W0OgDUpKkcnhgJWGVZa7rG4J1aOmQUyKu3BTr38JwNsLaLI+qjGC6T8K
 iPBV4vSWTMvHRRbl+oTqn4JMQCIBzdtsexbkinPeaafJBbkGBR8QKuA2x
 k9135x2QeFOUnDZ4F6WsKb/bTH57nOW34lUWQ/5pOnoZ1B6I5b/2/OH2p
 U41mlOe/ywzPnms5iZdbgRykn8NT+jql1kL17gCKiCXlPB6092yzRnEb0
 aNE/PtDEmY5eplUs52Ic5rQkmK1/MmpGYFuANWhHSWe30dsx0pWjrqQ6o g==;
X-CSE-ConnectionGUID: B4nJWe6sTlOmnh01bGZcBQ==
X-CSE-MsgGUID: UnMzx7egQMyqnTzhp8oK4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="88017697"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="88017697"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 04:15:40 -0800
X-CSE-ConnectionGUID: 4op8hazVRiikr21cDDILsw==
X-CSE-MsgGUID: B5bqBWNISfylaJ4NQToyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="208015002"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.132])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 04:15:39 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Jan=20Ma=C5=9Blak?= <jan.maslak@intel.com>
Subject: [PATCH i-g-t] Revert "tests/xe_render_copy: Skip if platform doesn't
 support flatccs"
Date: Mon, 26 Jan 2026 13:15:35 +0100
Message-ID: <20260126121535.336206-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

This reverts commit 071bf8edb91dcdf6b8bbe0c5d301477a39c5ccb8.

Xe platforms even if doesn't support flatccs still can handle
compression with aux-ccs tables. Rollback change which limits
the test to flatccs only.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Jan Maślak <jan.maslak@intel.com>
---
 tests/intel/xe_render_copy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index 861daec971..e2e752e28b 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -710,8 +710,6 @@ int igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
 		igt_subtest_with_dynamic_f("render-%s", testname[id]) {
 			igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
-			if (id == COPY_FULL_COMPRESSED)
-				igt_require(HAS_FLATCCS(buf_ops_get_devid(bops)));
 
 			for_each_tiling(tiling) {
 				if (!render_supports_tiling(xe, tiling,
-- 
2.43.0

