Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D4AC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 19:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8632810EF40;
	Fri, 17 May 2024 19:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2QomjQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A2710EF40
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 19:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715973002; x=1747509002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YGDoymhBVDESW2mBHtKvAFd7x0Bcsxl5u9nlYV8pSdE=;
 b=h2QomjQI3Pi8tdzRq64EbrxA9uwI7Fg8jE4nFm9xwrvV0JE8nCE3BBEX
 CI4bQTmhqdcBpL96dufVFNvNXJEBnfCseU1vGZ2lQaSwTcOzSollalW7V
 Z63D8wOMMEaY/b8MCQVG/jn9M102SEoo2+ROlQRO33fc2m5muE0YahdRv
 ChwxL/Qx+zYveyfy9/lIQr66lKlf6fekw96IxUefYbYezYGDljsvZMBvD
 /TXr7ZTk1BcsdGDDRdY0mOJi6uTgs4vy34A9KcGVprwnO/i5Ff9ieBk6J
 d666vOqxYCK4ABvEqVTHiYrgUtgk9CqbKza9aj/iretLPQFYM3QDJ4W0o A==;
X-CSE-ConnectionGUID: n0KJermFSRObYwS8ywlQoA==
X-CSE-MsgGUID: mwe2bLosROSZ1ZXRsBI4Yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15961168"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="15961168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 12:10:01 -0700
X-CSE-ConnectionGUID: GQnl3KzERI2YUgNgaRvPtw==
X-CSE-MsgGUID: HIM4cJoNRtGnSNtKUY4LRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="36303368"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.26])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 12:10:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v1] tests/core_getversion: test all drm devices
Date: Fri, 17 May 2024 21:09:55 +0200
Message-ID: <20240517190955.83517-1-kamil.konieczny@linux.intel.com>
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

Check all drm devices in all-cards subtest.

v2: add define for number of max tested cards (Helen)
v3: remove define as opening function from drmtest will
  stop after opening all existing drm cards (Kamil)
  changed subtest name to all-cards (Kamil)

Cc: Helen Koike <helen.koike@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index bb2e6013d..8198f5f7f 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -40,6 +40,9 @@
  *
  * SUBTEST: basic
  * Description: Tests GET_VERSION ioctl of the first device.
+ *
+ * SUBTEST: all-cards
+ * Description: Tests GET_VERSION ioctl for all drm devices.
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
@@ -62,6 +65,22 @@ static void check(int fd, char *dst, int len)
 	drmFree(v);
 }
 
+static void check_all_drm(void)
+{
+	char info[256];
+	int fd2;
+
+	for (int i = 0; ; i++) {
+		fd2 = __drm_open_driver_another(i, DRIVER_ANY);
+		if (fd2 == -1)
+			break;
+
+		check(fd2, info, sizeof(info));
+		igt_info("%d: %s\n", i, info);
+		drm_close_driver(fd2);
+	}
+}
+
 igt_main
 {
 	char info[256];
@@ -78,6 +97,10 @@ igt_main
 		igt_info("0: %s\n", info);
 	}
 
+	igt_describe("Check GET_VERSION ioctl for all drm devices.");
+	igt_subtest("all-cards")
+		check_all_drm();
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.42.0

