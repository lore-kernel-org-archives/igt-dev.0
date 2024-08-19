Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759F5C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 10:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B8410E206;
	Mon, 19 Aug 2024 10:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1gd5N6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF06510E206
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724063759; x=1755599759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1eHrbNPoJshnxDbZ/GIvmsGWQa7OM8m3Yk8XXk/Nlbo=;
 b=Q1gd5N6UE5IzeOwVOnwGT9z1R3ZKvzx7X5iMBtgnQxqlCS2fyUSFr/N4
 M/SszTTa+xRPlB6ll0UkKYjDsTgHV6Ih0F086VAc8fD0E3mDvRw80PkxC
 4jkji9lv2V0/nrCnyAsKIb3AqoIKHSQBvx0tbjakOORx20lVadY8RzRAo
 mQEMJ9DM6Ti2kGeqtLWjjk3lOPyYoj4HcaNTbyrmRV7lYSPXerHVWzA+Q
 WXYPAL3LBbqlKtDJTcPMS8QBDj9JSSDP9pmNpEHcO6FxMYtnCb6stHV6G
 qOC7xP7pZK18z/K2EKsZYYFhVNItV+1wuRt53oCD4qz7rmijSgOTs05AH g==;
X-CSE-ConnectionGUID: hyX4Q2vjTCalD1GAuXLsaA==
X-CSE-MsgGUID: 9kzrySHHQPOgIuCettwLSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="39763329"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="39763329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 03:35:54 -0700
X-CSE-ConnectionGUID: WAVyHLsMQDu77kuJT4jJCQ==
X-CSE-MsgGUID: lxW5tuJ3QKSpp6oZy3TzwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65286344"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.144])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 03:35:54 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 3/4] tests/intel/xe_wedged: Inform runner about
 expected error
Date: Mon, 19 Aug 2024 12:32:41 +0200
Message-ID: <20240819103242.26527-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
References: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
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

