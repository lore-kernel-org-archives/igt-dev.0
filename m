Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA91DFA1FC5
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 15:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C5210E032;
	Wed, 22 Apr 2026 15:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjoE0rRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03D710E032
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776872677; x=1808408677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yd7La4NssBag1iO7NgOOXJAT/drjXbCA9C7xS4I7XqU=;
 b=KjoE0rRrqVD/+4aZNpESbnqRwWPzYRoL9eyIVT7+OxKYK1+x1WYYsHBE
 wyWNBrIJDnr+D+QCyNtHClWcq5t8pW2vDsiJIcBg7bgsLvD6xN5pwN9F4
 gx7Dds89J7VLDAsc5MDX2r9KEeHfZ0QUxyCmmqYV9etsRwCeaeUiICID9
 QOPWv0FNR4m+49gel+75XyGPW5esJD7Pc4bKtqT7sAs3J4W8gCmmota2T
 5IAliY2zQxRwZOefVbVNaN/HdGm4nYWRZjzh0Haxiz9/7WoLZ5NWMy1Nw
 FTrLFqKiSuCgilxOIe5cl3AY86+FKMMeOpICrVLOyomi+rc1Z4iETvClS A==;
X-CSE-ConnectionGUID: Dn50g7rgS4yzB+0/Lmfoiw==
X-CSE-MsgGUID: LyStCfupS4OFFDPgOVOyJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76861096"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="76861096"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:36 -0700
X-CSE-ConnectionGUID: BmbNtuFqS0mit/6tFT7q9Q==
X-CSE-MsgGUID: U2Q76t/CTvO1B1XxSScRgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="234174343"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:36 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/5] tests/prime_udl: Create subtests
Date: Wed, 22 Apr 2026 17:44:20 +0200
Message-ID: <20260422154423.141908-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
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

Refactor code and create opening fixture, subtests and cleanup
fixture.

v2: use igt_main() with igt_fixture() (Kamil)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_udl.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index c3e92be1e..b1524e6de 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -121,18 +121,23 @@ static void test2(void)
 	gem_close(intel_fd, intel_handle);
 }
 
-int igt_simple_main()
+int igt_main()
 {
-	igt_assert(find_and_open_devices() >= 0);
-
-	igt_skip_on(udl_fd == -1);
-	igt_skip_on(intel_fd == -1);
+	igt_fixture() {
+		igt_assert(find_and_open_devices() >= 0);
+		igt_skip_on(udl_fd == -1);
+		igt_skip_on(intel_fd == -1);
+	}
 
 	/* create an object on the i915 */
-	test1();
+	igt_subtest("share-import")
+		test1();
 
-	test2();
+	igt_subtest("share-import-addfb")
+		test2();
 
-	close(intel_fd);
-	close(udl_fd);
+	igt_fixture() {
+		close(intel_fd);
+		close(udl_fd);
+	}
 }
-- 
2.54.0

