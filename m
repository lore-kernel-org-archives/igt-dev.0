Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4B8C48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 10:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFBF10E6D9;
	Wed, 21 Feb 2024 10:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah8RAe8m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7989010E6D9
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708511385; x=1740047385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lGgfC8rAIf6wOGBsdcMCyEOxUj7p63QdZ+nE/OYdT98=;
 b=ah8RAe8mRa6zC4CuKauz4fKx+FShUuVVwtAbS2TFfYQ+2Bi5hR+wUVS6
 97vEarkIQelzGTsB5ay+sUKteImJ6pKifdpPL1VgBmMHtS4g04sdAn4XV
 5hcIszTYOPNsyyiXEx32H0HayXiVtjCZFQ3+QM40Z2Nd/hQ4v83e+HXyp
 ugcIxDI7TkewNNgCHEzChoQFejhRvtSQBh4EpFKHeSwpsL4NK/rtAWiBd
 7QAvECyj7dDypJPAN5gtr1Z4mY0FIlGZ00DXePjSJhRFGgjRZAiYtg2qd
 RqGTDnwRmhRLYmbVmkCQnzZyVGb1mypH4rA6UwlKLAM+eTtQj3fyssEQN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2531759"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2531759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5470829"
Received: from unknown (HELO localhost) ([10.246.5.230])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:29:43 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: [PATCH i-g-t v2 2/3] tests/core_getversion: print version info
Date: Wed, 21 Feb 2024 11:29:28 +0100
Message-ID: <20240221102930.21473-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
References: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
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

Add printing of version information to basic subtest.

Cc: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 6ec223eef..8b95e2ce4 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -45,7 +45,7 @@
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
 		     "drmGetVersion() interface to it.");
 
-static void check(int fd)
+static void check(int fd, char *dst, int len)
 {
 	drmVersionPtr v;
 
@@ -56,11 +56,15 @@ static void check(int fd)
 	if (is_i915_device(fd))
 		igt_assert_lte(1, v->version_major);
 
+	snprintf(dst, len, "%s v%d.%d %s %s", v->name, v->version_major,
+		v->version_minor, v->date, v->desc);
+	dst[len - 1] = 0;
 	drmFree(v);
 }
 
 igt_main
 {
+	char info[256];
 	int fd;
 
 	igt_fixture {
@@ -69,8 +73,10 @@ igt_main
 	}
 
 	igt_describe("Check GET_VERSION ioctl of the first drm device.");
-	igt_subtest("basic")
-		check(fd);
+	igt_subtest("basic") {
+		check(fd, info, sizeof(info));
+		igt_info("0: %s\n", info);
+	}
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.42.0

