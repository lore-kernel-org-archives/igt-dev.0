Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34659C52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 11:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB1710E8B8;
	Fri,  9 Aug 2024 11:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApyuYFA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA2110E8B8
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723201295; x=1754737295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1eHrbNPoJshnxDbZ/GIvmsGWQa7OM8m3Yk8XXk/Nlbo=;
 b=ApyuYFA06IH9ISJoNlwQ7idD5PkhDKnfSRQ3sZVC4G2RiGOXZlHbZ3sC
 mrnikSYwbGKw0n5kHqOrtF29JIDDhj6o2g/V3wyOIBkO6/afksUQn3fzx
 rC5CerAFl16HP+6luGW24AzwRGpJCI6IAabCD2k1H5q1z5/HuNKegKL70
 xU7rm3td+h9xI78X0VvEKCBf12GLIpzD+9oHGL3oOMCwq6YlBJ5KhrEnt
 EsrjrOpR+2VDIhKxVBPzroXpDXa8Z3qNLC7PI5W2feYgvt4zMb8TdYRSf
 kWmfzwNMo8cotXNBeoXjsYUDDV9Jv/3ivfr311JCZSL8bTHQwTkvYn8UK A==;
X-CSE-ConnectionGUID: j8zKOTN0Temd9coqZPk7Wg==
X-CSE-MsgGUID: ydaxrkkeSU6Oqrm7q/2z2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21495637"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21495637"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:01:34 -0700
X-CSE-ConnectionGUID: YkzIHFDDT1K/9d+TErNKDw==
X-CSE-MsgGUID: HPli+xwbSMWD5zX4eLsZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57503168"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:01:31 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 3/4] tests/intel/xe_wedged: Inform runner about
 expected error
Date: Fri,  9 Aug 2024 13:01:11 +0200
Message-ID: <20240809110112.25685-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809110112.25685-1-kamil.konieczny@linux.intel.com>
References: <20240809110112.25685-1-kamil.konieczny@linux.intel.com>
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

