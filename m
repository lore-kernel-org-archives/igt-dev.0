Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FD1CAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC4410EA63;
	Fri, 19 Sep 2025 17:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaZZDLba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B98F10EA63
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758301524; x=1789837524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S/lMj5M11d8DvgWABUiYtgyfzXyrrzFCwiKnKESz0gE=;
 b=XaZZDLbaspyq1nykVLqF2voHQ8jb/GKBMjLa1t0PChPju4ZdMwXfwdbL
 PTgPGVVxOeVOeIbL220nTVt2xrcUcU1+Zwf6ISlm/EVn8k2EE2J7XQSrx
 1UY5/iFqVHhyG26R4ICRgTrFczfSpEJJnqQ5RDgyvo82HQtCdjUZIufQ6
 v/D6A7/yyxocKYbRYdIQ/PEPaoswPpndcXkstpUBja5fZmzIbOJaa7prO
 Xu4T044p2hDdPPb326LsDNOn6s1k5vr92YUShc984yxmKNtbpb24uuXYs
 Dh5V+v5+yspaZQJH76OrM+F44db+j+dzgpjZweUzGX5uQgJpBcp/YbXbB w==;
X-CSE-ConnectionGUID: d7xNLp9NSoqygJXrMpGg5Q==
X-CSE-MsgGUID: 2HouOdOTQimWAWxNEo3Law==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59691335"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="59691335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:24 -0700
X-CSE-ConnectionGUID: tOE2goQqTriej7mf3h6Xcg==
X-CSE-MsgGUID: +bFjQ0I6ThOzZwroU9kSdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175131747"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:23 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/4] tests/intel/xe_noexec_ping_pong: Create basic
 subtest
Date: Fri, 19 Sep 2025 19:05:08 +0200
Message-ID: <20250919170510.154992-3-kamil.konieczny@linux.intel.com>
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

Convert test to have one basic subtest.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_noexec_ping_pong.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 609e05876..91cd04243 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -23,7 +23,7 @@
  * Functionality: VM rebind
  * Test category: functionality test
  *
- * SUBTEST:
+ * SUBTEST: basic
  * Description:
  *	This test creates compute vms, binds a couple of bos and an exec_queue each,
  *	thus redying it for execution.
@@ -95,12 +95,15 @@ static void test_ping_pong(int fd, struct drm_xe_engine *engine)
 static int fd;
 
 IGT_TEST_DESCRIPTION("Expose compute VM's unnecessary rebinds");
-igt_simple_main
+igt_main
 {
+	igt_fixture
+		fd = drm_open_driver(DRIVER_XE);
 
-	fd = drm_open_driver(DRIVER_XE);
+	igt_describe("Check for unnnecessary rebinds");
+	igt_subtest("basic")
+		test_ping_pong(fd, xe_engine(fd, 0));
 
-	test_ping_pong(fd, xe_engine(fd, 0));
-
-	drm_close_driver(fd);
+	igt_fixture
+		drm_close_driver(fd);
 }
-- 
2.51.0

