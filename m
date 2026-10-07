Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2971CA6002
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 16:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9610E61A;
	Wed,  7 Oct 2026 16:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccPpcKPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E76A10E618
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791389336; x=1822925336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7n5xYIwME3n4lI2nC+Ug8zJLPoy5cZ3RUQ3c1fw3Y90=;
 b=ccPpcKPIs6o5mm0liZO7zkMuhnHcSENxQHyxP9LMpdLOe37Y0fuzoeIe
 8Z2zfe/4oDUYUTImFXiN4HhMxgG+MMlkyPCMyG88BfVcl8xQWvRkFfBD1
 1MaVD36CHkk+ygZx3ATKs3K5rU2OCtTuiu+7dFtKUJS6gkK9e3X3a05we
 aI2G414snyqR0GkIn5rJ5thefC/p0BWsEizxcDlH254aM9PPt9ldohs9G
 y+obb//6WLxlOBmMwGKqfjj22JZ/pfvvP7/gdnNsd+lbRhNq6jk2XM3O9
 CEFS5Aje057h12Py7Ms4ph3CaA/liRDWCL+DgIBA5lAI4BT5N7su815Nc Q==;
X-CSE-ConnectionGUID: XhL7WX/FT0OYKhzLdvz2OQ==
X-CSE-MsgGUID: jNWoqgjAQoOav9fiMujTug==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="164496"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="164496"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 09:08:56 -0700
X-CSE-ConnectionGUID: 4xNkLo0+RwGZPZK/VucPBQ==
X-CSE-MsgGUID: N1VdU6HVRsqRQxfWX/jN9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="282296239"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 09:08:53 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Bernd Kuhls <bernd@kuhls.net>
Subject: [PATCH i-g-t] lib/igt_platform_filter: Fix musl build
Date: Wed,  7 Oct 2026 18:08:47 +0200
Message-ID: <20261007160847.169029-1-kamil.konieczny@linux.intel.com>
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

Fix it on such platforms by dumping platform filters to stdout.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Reported-by: Bernd Kuhls <bernd@kuhls.net>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/211
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_platform_filter.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
index 15b4e9690..c2c28e7f0 100644
--- a/lib/igt_platform_filter.c
+++ b/lib/igt_platform_filter.c
@@ -537,6 +537,7 @@ void igt_platform_filter_dump(void)
  */
 int igt_platform_filter_dump_to_file(const char *filename)
 {
+#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
 	FILE *old_stdout;
 	FILE *f;
 
@@ -549,14 +550,19 @@ int igt_platform_filter_dump_to_file(const char *filename)
 	/* Redirect stdout to file */
 	old_stdout = stdout;
 	stdout = f;
+#endif
 
 	igt_platform_filter_dump();
 
+#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
 	/* Restore stdout */
 	stdout = old_stdout;
 	fclose(f);
 
 	igt_info("Platform filter configuration dumped to: %s\n", filename);
+#else
+	igt_info("Platform filter configuration dumped\n");
+#endif
 	return 0;
 }
 
-- 
2.55.0

