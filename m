Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FEAC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 16:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C6410E795;
	Thu,  8 Aug 2024 16:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KI/joRXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C234010E795
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 16:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723135701; x=1754671701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1eHrbNPoJshnxDbZ/GIvmsGWQa7OM8m3Yk8XXk/Nlbo=;
 b=KI/joRXUlelk6nxKXlkTL7iFYaItJCtXim3oK2/YvX4pZc4GzT9L1kBk
 Ije1L1v52bVy+SceJkbZDx8JqbcXXdZWniTMwtjec//UODIrDmvuDiDM6
 P9LCHaHNtm2XiAL92OSw/44fkV/mW4yz4WJENFn52/TSjjl1ceH+iiGpi
 L7rpGIbuYM9QxUb8E3aBwg7mvplJmJBUVLtzff5PD1/4gD+G54ybBDPSm
 4nMPgzqzdI8GEfTFzNrylbxkW9dKp+6N6O+BEiq4Kpi2xGYCr4Y8NtvoL
 yH81Gasdc4J4W/7kWKpxK5sVBqYoLeRFjPf/iaARHuOOOD360+MfxT+Ak Q==;
X-CSE-ConnectionGUID: gMydstaiQrSYlQpV4EEHaw==
X-CSE-MsgGUID: JsGs1TDTRdOUSr95tY9Gsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43794172"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="43794172"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:48:20 -0700
X-CSE-ConnectionGUID: PWhLXw9xR3OoMxN1qdrUug==
X-CSE-MsgGUID: ZdZc2IbJSqGbi3tBRFji+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57520200"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.125.108.94])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:48:20 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 3/4] tests/intel/xe_wedged: Inform runner about
 expected error
Date: Thu,  8 Aug 2024 18:47:58 +0200
Message-ID: <20240808164759.133621-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808164759.133621-1-kamil.konieczny@linux.intel.com>
References: <20240808164759.133621-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Tests runs force wedged state and then driver emits an error.
Standalone runs are succeeding but when run by igt runner it
catch such errors and reports them in results.

Inform runner to ignore such triggered failure.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1760
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1958
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_wedged.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index a4fc53869..a3f7a697f 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -26,6 +26,12 @@
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
 
+static void ignore_wedged_in_dmesg(void)
+{
+	/* this is needed for igt_runner so it will ignore it */
+	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
+}
+
 static void force_wedged(int fd)
 {
 	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
@@ -235,6 +241,8 @@ igt_main
 					       O_RDWR));
 
 		igt_assert_eq(simple_ioctl(fd), 0);
+		ignore_wedged_in_dmesg();
+
 		force_wedged(fd);
 		igt_assert_neq(simple_ioctl(fd), 0);
 		fd = rebind_xe(fd);
@@ -245,6 +253,7 @@ igt_main
 
 	igt_subtest_f("wedged-at-any-timeout") {
 		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
+		ignore_wedged_in_dmesg();
 
 		igt_debugfs_write(fd, "wedged_mode", "2");
 		simple_hang(fd);
@@ -268,6 +277,7 @@ igt_main
 		igt_debugfs_write(fd, "wedged_mode", "2");
 		igt_assert_eq(simple_ioctl(fd), 0);
 		igt_debugfs_write(fd, "wedged_mode", "1");
+		ignore_wedged_in_dmesg();
 		simple_hang(fd);
 		igt_assert_eq(simple_ioctl(fd), 0);
 	}
-- 
2.43.0

