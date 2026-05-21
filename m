Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F417CCD5BAF
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 17:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A9A10E4AC;
	Thu, 21 May 2026 17:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxiC+8rc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5200E10E4AC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 17:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779385716; x=1810921716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOsF/79VxLbo9atUIM79mf4MOIVD28NxdpoJK4uO8f4=;
 b=MxiC+8rcdjdQK1Du6Ip74tbjw4U/NoPUgPnTqvGFwX3de2ErgWUedK/x
 /+CMRg34MXoTsusAh4cEy1j5S6lbizdrCWqKFlf9bKMkJgmCQldH3VlZk
 dgVjHIgKGv1alMT2DZ8OG3l/KJm7eCnICsz/7B2eo4l4GfKPgIeBP4D4D
 zuV/JeEyIACz91JHOAJAxJOThqzwZPnwOpTAJeBkoZw64Dr2+RIZkalcK
 4vWgAHd0ry5Efxv1MF3iOJ9k1blPOA82qeGQq1YMZiadkUoS3hIJ9rKdd
 LkU3d0vusaCG1vpd+dEXxl2MyAoSYoY6NPFzn//17q8HV4DjY7MwKJPzb A==;
X-CSE-ConnectionGUID: 8FaQzKb+RwOEiSuT/Zs50A==
X-CSE-MsgGUID: 4zTin73AQeG3JUlEiB710g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97883789"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="97883789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:36 -0700
X-CSE-ConnectionGUID: L1GSQ9FTT5qhUz3xNz5O5A==
X-CSE-MsgGUID: KDk2Kf9bRg68ZTEj03lGWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="244612370"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:34 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 2/5] tests/prime_udl: Create subtests
Date: Thu, 21 May 2026 19:48:17 +0200
Message-ID: <20260521174820.167237-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
References: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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

