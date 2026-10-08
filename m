Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03901CA600B
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 11:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D42110E22F;
	Thu,  8 Oct 2026 11:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDZ6lzwV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D20E10E22F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791458090; x=1822994090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CD4DWsjMMr6tRwVs2C+wY1wU0NSdMo/P/RmViTfyjDE=;
 b=IDZ6lzwVa/pUoNVp0RBszqcy0U2N2xZhvjO22GxDpYln9essV3GbBL0d
 78yVjVSRw+qJz7kyjizE4ZaIZDNCsmAKzX8qMDygTfssOf0gmLdQ3z6QI
 LCROGIfn+Ci91Sb0apdoHvsKsyz335Wl9Mg5lRxoPI9o4ApdI8HM4FfkW
 KDqUvA1Bo9RU5obkv2mL7L+LWVuFWTXAB187k6neNlBxczcAKP8VVewFl
 1hcBiYknCjtsXGdaUJ3+lkWbcnOdFg0CTfavkX7hDsknWdbD5o14XH0fQ
 3TKfvcY74WZTF7KR+KfN9X4GD3znYv8pauoUipCyEzSSxzXhbQDogDRPr w==;
X-CSE-ConnectionGUID: xT4NFQCCQtWrnJjc5N3UoQ==
X-CSE-MsgGUID: LoSS1h76QH2mynTN1+y5GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="349522"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="349522"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 04:14:49 -0700
X-CSE-ConnectionGUID: BNKWfVdKRVOtp7MiAkwyJg==
X-CSE-MsgGUID: vAPYqEQeRVK//Ykx1kJoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1840638"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 04:14:47 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Bernd Kuhls <bernd@kuhls.net>
Subject: [PATCH i-g-t v2] lib/igt_platform_filter: Fix musl build
Date: Thu,  8 Oct 2026 13:14:35 +0200
Message-ID: <20261008111435.25331-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

When using musl C libs, stdout/stderr are read-only vars and
compilation reports errors, for example:

../lib/igt_platform_filter.c: In function ‘igt_platform_filter_dump_to_file’:
../lib/igt_platform_filter.c:551:16: error: assignment of read-only variable ‘stdout’
  551 |         stdout = f;

Also man stdout points out:
Since the symbols stdin, stdout, and stderr are specified to be
macros, assigning to them is nonportable.

As this function do not have any user, just remove it.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Reported-by: Bernd Kuhls <bernd@kuhls.net>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/211
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/igt_platform_filter.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
index 15b4e9690..9ccc0eadc 100644
--- a/lib/igt_platform_filter.c
+++ b/lib/igt_platform_filter.c
@@ -527,39 +527,6 @@ void igt_platform_filter_dump(void)
 	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
 }
 
-/**
- * igt_platform_filter_dump_to_file:
- * @filename: Path to output file
- *
- * Dump platform filtering configuration to a file.
- *
- * Returns: 0 on success, -1 on error
- */
-int igt_platform_filter_dump_to_file(const char *filename)
-{
-	FILE *old_stdout;
-	FILE *f;
-
-	f = fopen(filename, "w");
-	if (!f) {
-		igt_warn("Failed to open %s for writing\n", filename);
-		return -1;
-	}
-
-	/* Redirect stdout to file */
-	old_stdout = stdout;
-	stdout = f;
-
-	igt_platform_filter_dump();
-
-	/* Restore stdout */
-	stdout = old_stdout;
-	fclose(f);
-
-	igt_info("Platform filter configuration dumped to: %s\n", filename);
-	return 0;
-}
-
 /**
  * igt_platform_filter_is_initialized:
  *
-- 
2.55.0

