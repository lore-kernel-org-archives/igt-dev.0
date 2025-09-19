Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F019CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DC810EA61;
	Fri, 19 Sep 2025 17:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRdF8QQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FFD10EA67
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758301532; x=1789837532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f/RZobAY7iq3B4yUl0RmJRHCOg8bj9BfPqij/Iql2C8=;
 b=NRdF8QQVpQNZYFSPk9PYCb0CBE5mnNnFhi2YgpSZKtreXViwDvb9N6Wv
 baBSTniJT91mGE4FXAiyFeUwX/z1OaRjS/mVyjxB3jbOUmtGl0G25vTxw
 R/PSPQRQx9f3U9eV8N+sq3vpMrjMIITPg6Mc1ZamfAyAd8VOu+O2e8fez
 /5gGsBBYZe9NtpLfmANstUwaWF3jvOIOgykZKpAOZnzkBEbl7ZBlZ2o1D
 vAgbYzhjh9gCu3WppgKW4oX7RjEZvDGFlNazFtbVmi0QarqyusdlHj39L
 hBphU4PvvoOFzBpyvyQOUozLPPLWjs4pm1EDyX1PoySir3U7mCd0eQYvc Q==;
X-CSE-ConnectionGUID: 2MA9PzWyTD+vUyfplbyvAQ==
X-CSE-MsgGUID: mkV6XZqgSue4jIpR8f9GWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59691345"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="59691345"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:32 -0700
X-CSE-ConnectionGUID: bQnFzZETQPyQYuif/BRDvQ==
X-CSE-MsgGUID: HhGsKK/LRaG4X11wmDH2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175131767"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:31 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 4/4] tests/core_getstats: Create all-cards subtest
Date: Fri, 19 Sep 2025 19:05:10 +0200
Message-ID: <20250919170510.154992-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
References: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
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

Create all-cards subtest and check GET_STATS ioctl for all drm
devices.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getstats.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index 76804d518..f3d642c71 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -43,7 +43,10 @@
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
- * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
+ * Description: Tests the DRM_IOCTL_GET_STATS ioctl for first drm device.
+ *
+ * SUBTEST: all-cards
+ * Description: Tests the GET_STATS ioctl for all drm devices.
  */
 
 /**
@@ -55,6 +58,11 @@
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_STATS ioctl.");
 
+static int get_stats(int fd, drm_stats_t *stats)
+{
+	return ioctl(fd, DRM_IOCTL_GET_STATS, stats);
+}
+
 igt_main
 {
 	int fd, ret;
@@ -65,8 +73,23 @@ igt_main
 
 	igt_describe("Check GET_STATS ioctl of the first drm device.");
 	igt_subtest("basic") {
-		ret = ioctl(fd, DRM_IOCTL_GET_STATS, &stats);
-		igt_assert(ret == 0);
+		ret = get_stats(fd, &stats);
+		igt_assert_eq(ret, 0);
+	}
+
+	igt_describe("Check GET_STATS ioctl for all drm devices.");
+	igt_subtest("all-cards") {
+		int fd2;
+
+		for (int i = 0; ; i++) {
+			fd2 = __drm_open_driver_another(i, DRIVER_ANY);
+			if (fd2 == -1)
+				break;
+
+			ret = get_stats(fd2, &stats);
+			igt_assert_eq(ret, 0);
+			drm_close_driver(fd2);
+		}
 	}
 
 	igt_fixture
-- 
2.51.0

