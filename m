Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F56EC48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 10:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC3E10E6DE;
	Wed, 21 Feb 2024 10:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCM/2F0g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1278010E6DE
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708511389; x=1740047389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6J0RuhE/duCz/FyJSUKP0yCNKvWr8JrSrNyaTCeweO8=;
 b=VCM/2F0gsxb/+4zzjHNccpyu08wENMpIwh2a9IPVe+ZFudIOZ97fr+HR
 KZO5aJYc52ipobctW5ucXNQj0tOHE5GaLaAPns/S57KVEjrdnNwYlDJJY
 XyU3/pwap2yRqbHFqE3Xfsz48LsLy2reHEOipac6vhQUHE+M03Qj/024K
 tvqNfMmfzeri7UJCDJKmBbG9ykHUEQzP9SCjxIUJBMtzcctfPgSnOfHET
 i9OJogMw3aXcLJFTxBFWVoW+q3/1bMkN2/TVFo9zbe9SPAXrVx1Sn8A/l
 Eso/iZRqE0n4pJwfgeGrDtCZUW9/qNIEDt4+G494Pf1hLXaM/+qDH2d+J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2531767"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2531767"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5470848"
Received: from unknown (HELO localhost) ([10.246.5.230])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:29:47 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: [PATCH i-g-t v2 3/3] tests/core_getversion: test all drm devices
Date: Wed, 21 Feb 2024 11:29:29 +0100
Message-ID: <20240221102930.21473-4-kamil.konieczny@linux.intel.com>
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

Create multigpu subtest and check all drm devices.

v2: add define for number of max tested cards (Helen)

Cc: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 8b95e2ce4..1311e8dc5 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -40,11 +40,17 @@
  *
  * SUBTEST: basic
  * Description: Tests GET_VERSION ioctl of the first device.
+ *
+ * SUBTEST: multigpu
+ * Description: Tests GET_VERSION ioctl for all drm devices.
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
 		     "drmGetVersion() interface to it.");
 
+/* constant same as in drmtest.c */
+#define MAX_DRM_CARDS 16
+
 static void check(int fd, char *dst, int len)
 {
 	drmVersionPtr v;
@@ -78,6 +84,21 @@ igt_main
 		igt_info("0: %s\n", info);
 	}
 
+	igt_describe("Check GET_VERSION ioctl for all drm devices.");
+	igt_subtest("multigpu") {
+		int fd2;
+
+		for (int i = 0; i < MAX_DRM_CARDS; ++i) {
+			fd2 = __drm_open_driver_another(i, DRIVER_ANY);
+			if (fd2 == -1)
+				break;
+
+			check(fd2, info, sizeof(info));
+			igt_info("%d: %s\n", i, info);
+			drm_close_driver(fd2);
+		}
+	}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.42.0

