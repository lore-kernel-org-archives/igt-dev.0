Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66760A2608
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WGx1nKaU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8728710E8EB;
	Fri, 20 Nov 2026 18:38:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D743410E8EB
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 18:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795199839; x=1826735839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qjKuUK5Zt/c1oNSyyMscdzkSnBrb+Aix8B1bH7YLCi4=;
 b=WGx1nKaU3knvfvWR2w/DIZKdKtHar/BtJxsNrPBXDAfdpn3nHM1g6Pox
 799i8LzUPvTjO7q94b2cVrhVLBiE9IMTB+2tGVcM7YGP00FEIHJ7poM4/
 m0KjMYhP3kTTjix7beHDQ65v3jJhrC39wgLMx0EToQ2HxesQQ5BltKV+u
 iod/744GmFnu9G4kDL6Gvw0YD0VvWqbM3a/5tO7Jj/KjUQQQ2+4TP+i+K
 L0gGWLwstz/6tcEarUTa0ueBmSOR5+bzexpMFn7nRFOy9evO+c++Ew19H
 liyKNiSNGTPLfqgGvx1DIORpxJY2lSCW/840C88x6NLnzxUo60rMMuKic A==;
X-CSE-ConnectionGUID: g1UoOvhnQLuwtec583Q1jg==
X-CSE-MsgGUID: 54ExYDUUSZ2xxHtScbU43A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3929511"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3929511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:37:19 -0800
X-CSE-ConnectionGUID: Rc16MXazQYSiSVJ05i63+w==
X-CSE-MsgGUID: bnaUse7FQ6WcK1Kw2oa2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10663130"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:37:18 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] tests/core_debugfs: Create listing while reading
Date: Fri, 20 Nov 2026 19:37:05 +0100
Message-ID: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
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
Debugfs can have some pre-required conditions before reading
a node suceedes, so fail only when stat is impossible or no file
was present.

v2: add O_NONBLOCK to open, add prefix ok to prints (Kamil)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_debugfs.c | 98 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
index 0e654c3e3..a74d211a7 100644
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
+		igt_info("ok not a regular file %s\n", filename);
+		not_read_count++;
+
+		return 0;
+	}
+
+	if (!(sb.st_mode & 0444)) {
+		igt_info("ok not readable %o %s\n", sb.st_mode & 0777, filename);
+		not_read_count++;
+
+		return 0;
+	}
+
+	fd = open(filename, O_RDONLY | O_NONBLOCK);
+	if (fd < 0) {
+		igt_info("ok open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
+		not_read_count++;
+
+		return 0;
+	}
+
+	bytes_read = read(fd, buf, sizeof(buf) - 1);
+	if (bytes_read < 0) {
+		igt_info("ok read fails errno=%d %s\n", errno, filename);
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

