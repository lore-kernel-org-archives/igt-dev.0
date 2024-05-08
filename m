Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D7DC25B4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 19:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEA510F91A;
	Wed,  8 May 2024 19:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QywowfBr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE3D10FBB2
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715196799; x=1746732799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qZ5kdauSMjlYw0cssZT67deraoz3vP6QfJfhuH/qNnA=;
 b=QywowfBrbghoJuvw6jo4qemkbuieIvIjUVXSaNEesTlLvVM9DYo1EI69
 W7zgeZpQop6/crC8IFJgAT8ldOgJugs4CfCuhyAaBkdFufYufbhU5VeIk
 A69yfwXhcVb47NkrcTdysOQJZVZyqNr1SztO07DiGElDu1h+7kWduV1z7
 e5R+AE79Ah+fGqwu5vmNOuvLBaIdAM0SL5L/ZLm/KTmGNw7N5wH0DTc4D
 yfGmvfzqXSX6zM88JUFryUAubKnZFqPARuYNhep26pQEMkkj8dscc2qnq
 7PzeaUbH0ncyyGd4p54k9U2tBHo04zNYRPNvM56TMOf5eFjwZ5BSpzJME w==;
X-CSE-ConnectionGUID: JFTOXq0ASKKBiq4GynjN/w==
X-CSE-MsgGUID: QOUWquPuQ5WPFllkD2bsHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10920629"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10920629"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:33:18 -0700
X-CSE-ConnectionGUID: gTO0zinHQkGA6MZwZUuEqg==
X-CSE-MsgGUID: 1bPjkLcQR9Cg5mpdmR3alQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28878518"
Received: from mbernato-z370.igk.intel.com (HELO localhost) ([10.91.214.41])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:33:17 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH i-g-t] tests/sriov_basic: Skip tests if sriov_totalvfs is zero
Date: Wed,  8 May 2024 19:32:58 +0000
Message-ID: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

There is no point to run the tests if no VFs can be enabled.
Additionally, the `for_random_sriov_num_vfs` macro will lead
to undefined behavior if `sriov_totalvfs` is zero.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/sriov_basic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index f58b3b7ba..1bc082d76 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -120,7 +120,7 @@ igt_main
 
 	igt_fixture {
 		pf_fd = drm_open_driver(DRIVER_ANY);
-		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_vfs_supported(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 	}
-- 
2.31.1

