Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334A8CCFA15
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 04:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34DA10E1E4;
	Thu, 26 Sep 2024 04:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gL/r3ioA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777AA10E035
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727324221; x=1758860221;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OHCmzynSf91FJREKDq7o/lG31+oQtvMyYtZDLwX5qtw=;
 b=gL/r3ioAdlw0SUUYiWONgkVApHpsI0twklORyuufc8+AFJN0P4qtBpyr
 xNK2oJ//KZ2Yw4on1HM8vdx5ot0v3otuUyFJZa8oIgqRop4iipKguKNSZ
 EqjAUHN3ypo2QoHxW7QT+GR0lRvhm7eWJFFP6FS6Iq5x9ZB/andUjdGRa
 fruwdkO6i5zkcv5QjY7P9o2zJfdPsyy815Sk1pv7Cv5K9IFrjaJ6+OU0b
 YZWZCLzNiErKrwXqOG9o2Gy+2fUhB7cJSOmG0eQ8CTdsiWvpNrreiN5qj
 kfSlxyAq9hwziE8edQxVtJyaONmxutWy/kTxWYdaEHFQ0VRQZkf0bGrXL g==;
X-CSE-ConnectionGUID: 3KFLOtNnSN24O8ZY9Op+ag==
X-CSE-MsgGUID: N2xQMZGpRGyLF35I5s7ilA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26554156"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="26554156"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 21:17:00 -0700
X-CSE-ConnectionGUID: SLQfwg54RZeuiQY4WaajTQ==
X-CSE-MsgGUID: OVFPsXxjTV6cuJc4vbpvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="76773003"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.164])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 21:17:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 1/5] lib/igt_gt: Fix forcewake open
Date: Wed, 25 Sep 2024 23:16:47 -0500
Message-ID: <20240926041651.412396-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
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

File from the kernel side is read-only and should be open as such:

	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
			    to_i915(minor->dev), &i915_forcewake_fops);

Apparently it doesn't matter for just opening it:

	openat(AT_FDCWD, "/sys/kernel/debug/dri/0", O_RDONLY) = 5
	openat(5, "i915_forcewake_user", O_WRONLY) = 6

But RDONLY is sufficient. Let's stick to the file permission.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index aa5e75b07..b043e2d41 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -503,7 +503,7 @@ int igt_open_forcewake_handle(int fd)
 {
 	if (getenv("IGT_NO_FORCEWAKE"))
 		return -1;
-	return igt_debugfs_open(fd, "i915_forcewake_user", O_WRONLY);
+	return igt_debugfs_open(fd, "i915_forcewake_user", O_RDONLY);
 }
 
 #if defined(__x86_64__) || defined(__i386__)
-- 
2.46.1

