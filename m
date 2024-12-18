Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B70E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 19:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE3C10EC47;
	Wed, 18 Dec 2024 19:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrdnpzPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B79110E337
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734548679; x=1766084679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FZyfKgHY1fyL+86VhwsYO4dTIxn+nWorJrPRgV+R3Hg=;
 b=mrdnpzPztxfDgKwmmRuuTNlg7zrP0U1IiuyN+rtOfiGr7VUrtCKTGyA7
 bVUc+OrEw+64giMRJddpi5/vo0VRo5ef6a9KeBmEvKmVUXmSOSB4YIRZs
 ZH5PXXiKHGDYJnfU/ZPhSpx1Q/ZvXCdkYhXORrLCUdQSTeaajXYgcCrM3
 eTFktE5GW8aMCWfxwAq7eGRDMn7yjLOZ5xCvIYgXCLTKA/wFVbfCaaOnV
 Lf+ZxVbjjhYRn6kaK4x3G9eLAhcn5jtWfQM7GfDimz5162gSpfraZVRd6
 vfKsm0faixH6SlGYmMsw5RXT5sosXIkuF97grUdnVHuzwgKJiYXuDi319 Q==;
X-CSE-ConnectionGUID: FPdEezeNQJ6/VmhQpM55Bg==
X-CSE-MsgGUID: IAnhD/BTQ2myIc8XMnPWxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38717128"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="38717128"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:04:39 -0800
X-CSE-ConnectionGUID: yyRI9Y9WSQKIW0/4Sxby4w==
X-CSE-MsgGUID: ir3qtq8OQjmmlD5JRNOOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="102946740"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:04:38 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
Date: Wed, 18 Dec 2024 20:04:18 +0100
Message-ID: <20241218190418.126565-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
References: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
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

Created new subtest raw-card for checking all cards without
loading any driver, so it could show what is loaded on a system
after booting.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 0842b7db6..989ed2aba 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -25,6 +25,7 @@
  *
  */
 
+#include <fcntl.h>
 #include <string.h>
 #include <sys/ioctl.h>
 
@@ -45,6 +46,9 @@
  *
  * SUBTEST: all-cards
  * Description: Tests GET_VERSION ioctl for all drm devices.
+ *
+ * SUBTEST: raw-cards
+ * Description: Test GET_VERSION ioctl for all present drm devices without loading any driver.
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
@@ -83,26 +87,47 @@ static void check_all_drm(void)
 	}
 }
 
-igt_main
+static void check_raw_drm_cards(void)
 {
+	char fname[32];
 	char info[256];
-	int fd;
+	int fd2, count;
 
-	igt_fixture {
-		fd = __drm_open_driver(DRIVER_ANY);
-		igt_assert_fd(fd);
+	count = 0;
+	for (int i = 0; i < 128; i++) {
+		snprintf(fname, ARRAY_SIZE(fname), "/dev/dri/card%d", i);
+		fd2 = open(fname, O_RDWR);
+		if (fd2 == -1)
+			continue;
+
+		++count;
+		check(fd2, info, sizeof(info));
+		igt_info("%d: %s\n", i, info);
+		close(fd2);
 	}
 
+	igt_info("Tested %d drm devices\n", count);
+}
+
+igt_main
+{
+	char info[256];
+	int fd;
+
 	igt_describe("Check GET_VERSION ioctl of the first drm device.");
 	igt_subtest("basic") {
+		fd = __drm_open_driver(DRIVER_ANY);
+		igt_assert_fd(fd);
 		check(fd, info, sizeof(info));
 		igt_info("0: %s\n", info);
+		__drm_close_driver(fd);
 	}
 
 	igt_describe("Check GET_VERSION ioctl for all drm devices.");
 	igt_subtest("all-cards")
 		check_all_drm();
 
-	igt_fixture
-		__drm_close_driver(fd);
+	igt_describe("Check GET_VERSION ioctl for all present drm devices without loading any driver.");
+	igt_subtest("raw-cards")
+		check_raw_drm_cards();
 }
-- 
2.47.1

