Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A47CC88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 14:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30AE10EF19;
	Thu, 17 Sep 2026 14:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkqRfsIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC5E10EF13
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 14:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789655376; x=1821191376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s4ifTgom99FPUO4wWtfVgx02axpwdCwkue8TM0qmQoI=;
 b=GkqRfsIxkZGqHQUG31N4k0Vp8RrUQwAqCwOq5/g4UHXE5RiIi0+Ik3O9
 Qw8CrUWJ6oIS8PifN/Z1o87Z07cuq/l9OQYrCu8kdSkxe3dBNhy3Vu6EU
 dEniCjK8AANO92+AYXMaIvOb9lMKVjnBj9b/BN1PQRom7uAejgWQsF9+D
 uXR+EeHS6pbzRf2T8RuwRWnUVzdrP6asEmXQYlo817cIj2M54KQk6aupF
 t67WfOR50bJuYbu148m4650NMFFJ26t3LU2vpPuK14cbkVCA+BcM1ED+R
 xs8oxqVaTqln6W9cR5/dGJ7iWCIyqGkTqkUg6dDR3dRMw+1KHYz4rQgj1 A==;
X-CSE-ConnectionGUID: Q9Xh3wA0TSCNxnfCAEabYw==
X-CSE-MsgGUID: seyJeNExTU6mZhNf0EuMiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93914251"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93914251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:29:36 -0700
X-CSE-ConnectionGUID: g2/Ps/bAQyiKblbtfoQ2HA==
X-CSE-MsgGUID: QAwef/G6T0S7sk/spt2iiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269557152"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.74])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:29:33 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_core: Remove build path from data paths
Date: Thu, 17 Sep 2026 16:28:50 +0200
Message-ID: <20260917142851.75559-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917142851.75559-1-kamil.konieczny@linux.intel.com>
References: <20260917142851.75559-1-kamil.konieczny@linux.intel.com>
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

Reference to build path break reproducibility, as a build could
be done on different directories. Data paths are used only when
loading a data file containing screen image. Remove it from the
function which use it and make a build reproducible.

  Also, try to make it work also for a developer running test
file from a build dir by loading a data file from different
possible locations but only using relative paths.

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/190
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c  | 63 ++++++++++++++++++++++++++++++++++++-------------
 lib/igt_core.h  |  3 +--
 lib/meson.build |  1 -
 3 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 4efddb908..9937cb559 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -366,6 +366,8 @@ enum {
 
 static int igt_exitcode = IGT_EXIT_SUCCESS;
 static const char *command_str;
+static const char *command_full_path;
+static char command_base_path[PATH_MAX];
 
 static char* igt_log_domain_filter;
 static struct {
@@ -1125,6 +1127,17 @@ static int common_init(int *argc, char **argv,
 	IGT_INIT_LIST_HEAD(&subgroup_descriptions);
 	igt_vec_init(&hook_strs, sizeof(char *));
 
+	command_full_path = argv[0];
+	snprintf(command_base_path, ARRAY_SIZE(command_base_path), "%s", argv[0]);
+	if (strrchr(command_base_path, '/')) {
+		char *end = strrchr(command_base_path, '/');
+
+		*end = 0;
+	}
+
+	if (!strlen(command_base_path))
+		strcpy(command_base_path, ".");
+
 	command_str = argv[0];
 	if (strrchr(command_str, '/'))
 		command_str = strrchr(command_str, '/') + 1;
@@ -3389,31 +3402,47 @@ void igt_reset_timeout(void)
 }
 
 /**
- * __igt_fopen_data:
- * @igt_srcdir:  Directory path for source files.
- * @igt_datadir: Directory path for data files
- * @igt_imgdir: Directory path for image files.
+ * __igt_fopen_data_file:
+ * @dir:  Directory path for source files.
+ * @rel:  Relative path.
  * @filename: Name of the file to be opened.
  *
- * This function attempts to open a data file from a list of specified
- * directories. A file pointer to the opened file. If the file cannot
- * be opened, it returns NULL and logs a critical error message.
- *
+ * This function attempts to open a data file from a specified directory dir/dir2/.
+ * Returns a file pointer to the opened file or NULL.
  */
-FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
-		       const char *igt_imgdir, const char *filename)
+static FILE *__igt_fopen_data_file(const char *dir, const char *rel, const char *filename)
 {
 	char path[PATH_MAX];
 	FILE *fp;
-	const char *dirs[] = {igt_datadir, igt_srcdir, igt_imgdir,
-			      getenv("IGT_DATA_PATH"), "./data"};
 
-	for (int i = 0; i < ARRAY_SIZE(dirs); i++) {
+	snprintf(path, ARRAY_SIZE(path), "%s/%s/%s", dir, rel, filename);
+	fp = fopen(path, "r");
+
+	return fp;
+}
+
+/**
+ * igt_fopen_data:
+ * @filename: Name of the file to be opened.
+ *
+ * This function attempts to open a data file from a list of known directories.
+ *
+ * Returns a file pointer to the opened file. If the file cannot be opened, it
+ * returns NULL and logs a critical error message.
+ */
+FILE *igt_fopen_data(const char *filename)
+{
+	static const char *igt_datadir = IGT_DATADIR;
+	static const char *igt_srcdir = IGT_SRCDIR;
+	static const char *reldirs[] = {".", "..", "./data", "../data", "../../data" };
+	const char *dirs[] = {igt_datadir, igt_srcdir, command_base_path,
+			      getenv("IGT_DATA_PATH"), "."};
+	FILE *fp = NULL;
+
+	for (int i = 0; i < ARRAY_SIZE(dirs) && !fp; i++) {
 		if (dirs[i]) {
-			snprintf(path, sizeof(path), "%s/%s", dirs[i], filename);
-			fp = fopen(path, "r");
-			if (fp)
-				break;
+			for (int j = 0; j < ARRAY_SIZE(reldirs) && !fp; j++)
+				fp = __igt_fopen_data_file(dirs[i], reldirs[j], filename);
 		}
 	}
 
diff --git a/lib/igt_core.h b/lib/igt_core.h
index afaf35aa8..c0908a8ed 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1532,8 +1532,7 @@ FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
  * Open a datafile for test, first try from installation directory,
  * then from build directory, and finally from current directory.
  */
-#define igt_fopen_data(filename) \
-	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
+FILE *igt_fopen_data(const char *filename);
 
 int igt_system(const char *command);
 int igt_system_quiet(const char *command);
diff --git a/lib/meson.build b/lib/meson.build
index d1a770b6d..2ac632758 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -371,7 +371,6 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
-            '-DIGT_IMGDIR="@0@"'.format(imgdir),
 	])
 
     lib_intermediates += lib
-- 
2.55.0

