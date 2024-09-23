Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7ABCF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 22:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B96A10E4AE;
	Mon, 23 Sep 2024 22:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B08k3OFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D19410E4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727129516; x=1758665516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OHCmzynSf91FJREKDq7o/lG31+oQtvMyYtZDLwX5qtw=;
 b=B08k3OFHJFB22YF859i3NXkUBVOY8YoDyb2AGMQGVz4IF5fba5JiZyFH
 prSp6VZ3UwWYSRSyiSZUcE7a4oxlLn6rgzDzHPZsFxMNRrWkeh/tjz51F
 u6YD+iMHWkCzxoNscBIfe2m6Q3i1ro8xa2NgxNw2sHF62OPa73KDVfzUC
 szaXzhesN4J1j13YPQMq8S9R6zJ7upZgZNaIqj9OfNetMqwVJj0qiGocM
 lieBWm7LbqhnPPzKZUcwuEV5yinbUL5KcHF72RwFDrmF7NTS0Xqqs0Nls
 Q67JSrxwHFMIYzYtFupLFHykCqE9DhtGza5WIvu8jGV5udbRhsvBedZwa A==;
X-CSE-ConnectionGUID: MSxu34ZJSbyteq3jJvcaCg==
X-CSE-MsgGUID: H7CgYlpoS2eE68uY5SBKhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43615580"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43615580"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:56 -0700
X-CSE-ConnectionGUID: E0+fPWgQQReYCKE6CzmjHQ==
X-CSE-MsgGUID: tp15uI2VSM6OT8J5cuzwIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71244252"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.110.192])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/5] lib/igt_gt: Fix forcewake open
Date: Mon, 23 Sep 2024 17:11:42 -0500
Message-ID: <20240923221146.125848-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923221146.125848-1-lucas.demarchi@intel.com>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
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

