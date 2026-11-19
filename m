Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F12606A331
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FRJNi/V6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38BB10EC23;
	Thu, 19 Nov 2026 20:17:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5445210EC23
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795119358; x=1826655358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fXvdfDuF2I5u0ZNnHYuu0iExx9AfdivTsmD0xu+Ubjk=;
 b=FRJNi/V6xY5PvKu7AY27b9LkBTVJs+MkwyaoZ4urbPnpxI4HZf3Cd9B9
 rvdPyW2J0SNInVg8mXzts0/VZQAkDRAj6wyj1fZEZFFOXCj626FoloSbn
 /gUqnzJ9MdAugRA1aCXK9funD/+Cxz8plU5PBYw370oLDhQ+Xx/zoZhl5
 KzqNY2MMrsLLMdAIo63B7z39Jdc4UDwNfr6wj47WF4VU+fmZioSLA5vjp
 cHDcpF7x0LmpBlghFff00piWZI3Kk1b4b2rB69YZHdOU1RX5gRgKP+4rc
 A8fxLf02sYJf0vnxAFselSZnAvyYGMClAqibrMm+YKWidnuwN3e65A+Tf w==;
X-CSE-ConnectionGUID: VXHd8y3QRNWIfvyVUZgq9Q==
X-CSE-MsgGUID: qjHUTcYSQfWnNaYt5Ir0nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3979135"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3979135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:15:57 -0800
X-CSE-ConnectionGUID: 4LyMdkKvQeKpoN98+i3mLg==
X-CSE-MsgGUID: qwutU2+VSuC+5e2GHNvHHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10877385"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:15:56 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/core_debugfs: Create listing while reading
Date: Thu, 19 Nov 2026 21:15:42 +0100
Message-ID: <20261119201544.128411-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Create a listing of processed debugfs files while reading them.
Debugfs and can have some pre-required conditions before reading
a node suceedes, so fail only when stat is impossible or no file
was read.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_debugfs.c | 98 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
index 0e654c3e3..c644d9185 100644
--- a/tests/core_debugfs.c
+++ b/tests/core_debugfs.c
@@ -3,6 +3,9 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <fcntl.h>
+#include <sys/stat.h>
+
 #include "igt.h"
 #include "igt_debugfs.h"
 #include "igt_dir.h"
@@ -23,6 +26,93 @@
 
 IGT_TEST_DESCRIPTION("Read entries from debugfs");
 
+static int not_read_count;
+static int ok_count;
+static int stat_fails;
+
+static int read_debugfs(const char *filename, void *data)
+{
+	struct stat sb;
+	ssize_t bytes_read;
+	char buf[4096];
+	int len;
+	int fd;
+
+	len = data ? to_user_pointer(data) + 1 : 0;
+	if (len < 0 || strlen(filename) <= len)
+		len = 0;
+
+	if (lstat(filename, &sb) == -1) {
+		igt_info("Stat fails errno=%d %s\n", errno, filename);
+		stat_fails++;
+
+		return 0;
+	}
+
+	if ((sb.st_mode & S_IFMT) != S_IFREG) {
+		igt_info("Not a regular file %s\n", filename);
+		not_read_count++;
+
+		return 0;
+	}
+
+	if (!(sb.st_mode & 0444)) {
+		igt_info("Not readable %o %s\n", sb.st_mode & 0777, filename);
+		not_read_count++;
+
+		return 0;
+	}
+
+	fd = open(filename, O_RDONLY);
+	if (fd < 0) {
+		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
+		not_read_count++;
+
+		return 0;
+	}
+
+	bytes_read = read(fd, buf, sizeof(buf) - 1);
+	if (bytes_read < 0) {
+		igt_info("Read fails errno=%d %s\n", errno, filename);
+		close(fd);
+		not_read_count++;
+
+		return 0;
+	}
+
+	buf[bytes_read] = '\0';
+	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
+	ok_count++;
+
+	igt_debug("File %s\nData: %s\n", filename + len, buf);
+	close(fd);
+
+	return 0;
+}
+
+static int process_debugfs(int dirfd)
+{
+	char debugpath[PATH_MAX];
+	igt_dir_t *config;
+	int ret;
+
+	ret = igt_dir_get_fd_path(dirfd, debugpath, PATH_MAX - 1);
+	igt_assert_f(ret >= 0, "Cannot get path\n");
+	igt_info("Reading debugfs files from %s\n", debugpath);
+
+	config = igt_dir_create(dirfd);
+	igt_assert_f(config, "Cannot create dir config\n");
+
+	igt_dir_scan_dirfd(config, -1);
+
+	ret = igt_dir_process_files(config, read_debugfs,
+				    from_user_pointer(strlen(debugpath)));
+
+	igt_dir_destroy(config);
+
+	return ret;
+}
+
 int igt_main()
 {
 	int debugfs = -1;
@@ -38,7 +128,13 @@ int igt_main()
 
 	igt_describe("Read all entries from debugfs path.");
 	igt_subtest("read-all-entries") {
-		igt_dir_process_files_simple(debugfs);
+		process_debugfs(debugfs);
+		igt_info("Summary: reads=%d stat_fails=%d not_read=%d\n", ok_count,
+			 stat_fails,
+			 not_read_count);
+
+		igt_assert_lt(0, ok_count);
+		igt_assert_eq(stat_fails, 0);
 	}
 
 	igt_fixture() {
-- 
2.55.0

