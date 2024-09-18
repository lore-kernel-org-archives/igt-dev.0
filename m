Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EA4CDD54A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 16:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2888A10E5F5;
	Wed, 18 Sep 2024 16:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ittKM/Wi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3292C10E5EA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677391; x=1758213391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O5k35iEIcnAIjAnPfqE/AQIjRSbiVxWfcQiVoJwHlwU=;
 b=ittKM/Wi9CwoWXoA09kB+NAKph+eSCDMy+9FJ6xdem9I4DLpQaLOgWyj
 VukUzu7YQFvQekIYAOEycXdrNp7EH8usbHJqsc35+8spqQDUZDiZaGJDT
 cIDb/ixc5ArKh8hJR/Oa1NIorQQhli9H9m+mrgnS55hNaG1ZE/5fEbkXO
 jPdlE3Y2i2Jf2OPWDqUF3bvwmFUN+UCeqxlw01fVtEorPB4hA/snISemh
 OCU8xRGpWH0jaHiPbI9cJZc/pZgtz2LylYqiREKCzyJNomuhWJaV1uYvx
 hsftn5J1qeoKroegzb/DAJSZnVVReEQlDhwsraAuOIQyqouDExjaXCGQn w==;
X-CSE-ConnectionGUID: DONtYIzETKehC0fCgGiDpw==
X-CSE-MsgGUID: fdDbfi+bR4ypea2+5CBn1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29496273"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29496273"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
X-CSE-ConnectionGUID: QtusH2FFStS3rk2v6re5vQ==
X-CSE-MsgGUID: uxySif9uRW+hS6Ph+U9bIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69235568"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/6] lib/igt_gt: Fix forcewake open
Date: Wed, 18 Sep 2024 09:36:24 -0700
Message-ID: <20240918163629.1186314-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918163629.1186314-1-lucas.demarchi@intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
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

