Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ECFC48BC4
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 10:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8745F10E2D2;
	Tue, 20 Feb 2024 10:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KswzDBC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E40310E2D2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708424410; x=1739960410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MIJa+PVXi5UxnrLpz4e+2nZ4LNGAlpZpfDM8o3uQ/C4=;
 b=KswzDBC/qGtLhu3VtIAFaag/0LdADnbvnr3dhD5ZSIwXNBmxYb+sbt33
 SI4qzS8bSZtutQGMCIODcxJj3rH6XjkOnaKCyTgfH8ml6576seTH86L2S
 C4NHQrcLb0TpeFXBwbCRxzi92XaVBw9U5Qr0L9NxMFk1JaC5Mp4JYd22F
 AoLUjt4ScJD0a/rsOryqHi4Cfj/RLL+iVZJA6DfjbcGnT7+lBrrDc2urg
 vzs7kSL/OyK+mkntHTlAN8X8RuO/BIiPN2PF48RRvbxeb3Bk6VJ7ulav9
 uYZznKYm8tO79QiUnfpmYsIOijAfP7g8XwD5eMplfFDUwVZ8C5xynn+K1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2392758"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2392758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:20:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="27901778"
Received: from pwlazlyn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.80.134])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:20:08 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/core_getversion: test all drm devices
Date: Tue, 20 Feb 2024 11:19:53 +0100
Message-ID: <20240220101953.64371-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240220101953.64371-1-kamil.konieczny@linux.intel.com>
References: <20240220101953.64371-1-kamil.konieczny@linux.intel.com>
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

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 8b95e2ce4..797a2baed 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -40,6 +40,9 @@
  *
  * SUBTEST: basic
  * Description: Tests GET_VERSION ioctl of the first device.
+ *
+ * SUBTEST: multigpu
+ * Description: Tests GET_VERSION ioctl for all drm devices.
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
@@ -78,6 +81,21 @@ igt_main
 		igt_info("0: %s\n", info);
 	}
 
+	igt_describe("Check GET_VERSION ioctl for all drm devices.");
+	igt_subtest("multigpu") {
+		int fd2;
+
+		for (int i = 0; i < 16; ++i) {
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

