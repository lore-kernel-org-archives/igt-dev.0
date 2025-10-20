Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71302CCD193
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 16:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2345310E2B0;
	Mon, 20 Oct 2025 16:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgKWkoPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F8810E2B0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977151; x=1792513151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3oUR2ft5oFk/1XFlbOzGw91jQaUnk7ZmcqqT157kWI=;
 b=GgKWkoPv1ttRKQGbS7EB0vr5hc8gZq59gJx5Jhoc/FJ4kLbFtYUJD92K
 y2al8gW6aHzDhCXePNPcA/s9seBzp1OJ9x7+wYdsU0WK711gL9w87sPbs
 WZVhlj9tXvvNqb4BLnA3mVAVbOVDiIWz0+ZUUR/9fndWYsOgxllyzcwh8
 N0+FV2bJdQUrjCPyQCZREUNjLNpbSY5F8UtwCgg10hn5Uf4HqokBQvvo/
 8VhjQvvjklL5CG5jB1SOCwavixp58rleVEbYxd9y8x7VYySd4bZXtHdUI
 TrPPFIXRj6ow0gXCmcNz1+AkLb8xBD1YIiEANjfES+rfYqJf6NsyOws/L w==;
X-CSE-ConnectionGUID: N12/vkYUQ0G5bI2GJj7UVg==
X-CSE-MsgGUID: onl66qzdQWCSFcZaxWmB8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66929082"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66929082"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:19:10 -0700
X-CSE-ConnectionGUID: vIICHVw6SJaFtWfSEs68TA==
X-CSE-MsgGUID: yg1Sn3X9QuSmSnCyND4rkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187628591"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:19:03 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/core_getversion: Add new all-renders
 subtest
Date: Mon, 20 Oct 2025 18:18:46 +0200
Message-ID: <20251020161846.156952-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251020161846.156952-1-kamil.konieczny@linux.intel.com>
References: <20251020161846.156952-1-kamil.konieczny@linux.intel.com>
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

Create a new subtest for renders in dri folder.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 32378f985..834d25430 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -43,6 +43,9 @@
  *
  * SUBTEST: all-cards
  * Description: Tests GET_VERSION ioctl for all drm devices.
+ *
+ * SUBTEST: all-renders
+ * Description: Tests GET_VERSION ioctl for all drm render devices.
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
@@ -65,7 +68,7 @@ static void check(int fd, char *dst, int len)
 	drmFree(v);
 }
 
-static void check_all_drm(void)
+static void check_all_drm(int flag)
 {
 	char info[256];
 	int checked;
@@ -73,7 +76,7 @@ static void check_all_drm(void)
 
 	checked = 0;
 	for (int i = 0; ; i++) {
-		fd2 = __drm_open_dri_card(i);
+		fd2 = flag ? __drm_open_dri_card(i) : __drm_open_dri_render(i);
 		if (fd2 == -1)
 			continue;
 
@@ -86,7 +89,7 @@ static void check_all_drm(void)
 		drm_close_driver(fd2);
 	}
 
-	igt_info("Checked %d cards\n", checked);
+	igt_info("Checked %d %s\n", checked, flag ? "cards" : "renders");
 }
 
 igt_main
@@ -105,5 +108,9 @@ igt_main
 
 	igt_describe("Check GET_VERSION ioctl for all drm devices.");
 	igt_subtest("all-cards")
-		check_all_drm();
+		check_all_drm(1);
+
+	igt_describe("Check GET_VERSION ioctl for all drm render devices.");
+	igt_subtest("all-renders")
+		check_all_drm(0);
 }
-- 
2.51.1

