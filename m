Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B4CCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 16:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFD410E480;
	Mon, 20 Oct 2025 16:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1Awozka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475AF10E480
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977141; x=1792513141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0crzcRS80Gt5/F2I8zAH+cthiXSddBpx8/rNq3AmaY=;
 b=b1AwozkaJVN8SnNlqq3ZkKrwElDnuENAsThQLC0bnyz63uzqqk9zf5Nz
 uo0/y17/rOmpvRzXP2YVMCQf7TqA4VyabeOgWlXE2I36xrACEOmJAJ0P7
 wkS5zCnYkN1u0fUNm2MjiuRExLIlKKeiKy8oOU0lb7PJu+YpH1/o/nrfu
 1wbB6AfkQwjXXbISfBJ+phBfwoiaLp2zqbASbFAYpApEEdjdFSgCYpUw5
 pcyGV86LI1AY7XgozUfHJgUwM2Rzmww4fvOuaOPMN6vbx4poQCtxIo06c
 iShslQAuk5yOXqr9dYjDAJwlwhjV8Zn7TOMnnXsoqTvF+r3r6tekHq4Xw A==;
X-CSE-ConnectionGUID: QOVSosjmRBSmhChHjA4ZbA==
X-CSE-MsgGUID: avdaG+0ES1KjWBeCsXIGig==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62989629"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62989629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:19:01 -0700
X-CSE-ConnectionGUID: spys2MiSRe+XALKvw4fXhA==
X-CSE-MsgGUID: 8TXlXNXAQLCISdU79oecRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="188462164"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:18:59 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/core_getversion: refactor all-cards subtest
Date: Mon, 20 Oct 2025 18:18:45 +0200
Message-ID: <20251020161846.156952-3-kamil.konieczny@linux.intel.com>
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

Refactor all-cards subtest and use new lib function, so it will
not load any driver and will check only already existing cards.
While at this move also card opening from fixture inside a basic
subtest, so it will not interfere with other subtests.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 158133da7..32378f985 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -68,39 +68,42 @@ static void check(int fd, char *dst, int len)
 static void check_all_drm(void)
 {
 	char info[256];
+	int checked;
 	int fd2;
 
+	checked = 0;
 	for (int i = 0; ; i++) {
-		fd2 = __drm_open_driver_another(i, DRIVER_ANY);
+		fd2 = __drm_open_dri_card(i);
 		if (fd2 == -1)
+			continue;
+
+		if (fd2 == -EINVAL)
 			break;
 
+		++checked;
 		check(fd2, info, sizeof(info));
 		igt_info("%d: %s\n", i, info);
 		drm_close_driver(fd2);
 	}
+
+	igt_info("Checked %d cards\n", checked);
 }
 
 igt_main
 {
-	char info[256];
-	int fd;
+	igt_describe("Check GET_VERSION ioctl of the first drm device.");
+	igt_subtest("basic") {
+		char info[256];
+		int fd;
 
-	igt_fixture {
 		fd = __drm_open_driver(DRIVER_ANY);
 		igt_assert_fd(fd);
-	}
-
-	igt_describe("Check GET_VERSION ioctl of the first drm device.");
-	igt_subtest("basic") {
 		check(fd, info, sizeof(info));
 		igt_info("0: %s\n", info);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Check GET_VERSION ioctl for all drm devices.");
 	igt_subtest("all-cards")
 		check_all_drm();
-
-	igt_fixture
-		drm_close_driver(fd);
 }
-- 
2.51.1

