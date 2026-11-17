Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEEC606A331
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 19:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QnFc+0wj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3257A10F8FB;
	Tue, 17 Nov 2026 19:44:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D41410F8F1
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794944597; x=1826480597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E0odxg+Wy4O+XC10ycdDmu0+onuaDomJwXXIqUvP7jI=;
 b=QnFc+0wjuHyxaBHhIfAefW7Fg7dP6TTRVrb/P/2KNCoXYdce4oYeYUEX
 zfMtIjRFoJlWc5XfoZppPinC0MIJRnADjdLhnK0iz3zEmwmC6TtAChk81
 40UWWbPmHXBI35Sb8EF6fBizSUBw8NdO8AfxxRwbSgP1oAvbE32s2BFeR
 ni+zU3kgvlSRFbTDMcutxJrDzAm0VPdPYhDuUWtUeSwb482twsxbne92i
 AFPZFXAtvvdFLDbb162LsAmTf03NuI9QCLvqYqGvO4r70op5uYsGwYoPK
 Ux7SGG9+UwJZNIgG1wlYaZ3RFKOH1X7uCoxkEBCylAAZbcnwbNaqjd8z7 Q==;
X-CSE-ConnectionGUID: Mp+Za8BoTJ2gPeRfxdB53w==
X-CSE-MsgGUID: 2xJwIZdCTgChCRzga7o5jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3627271"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3627271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 11:43:16 -0800
X-CSE-ConnectionGUID: nhb4JhlDS4WfDUMWiZelrg==
X-CSE-MsgGUID: vgR/xdT0TX2y2NEA8TLPvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9914480"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 11:43:14 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] tests/core_sysfs: Create listing while reading
Date: Tue, 17 Nov 2026 20:42:49 +0100
Message-ID: <20261117194250.72855-1-kamil.konieczny@linux.intel.com>
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

Create a lists of sysfs files readed, so it will be easy to
confirm if all of them are actually read or where is a problem.

Cc: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_sysfs.c | 88 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index 3173ffa7b..14ffa2e0d 100644
--- a/tests/core_sysfs.c
+++ b/tests/core_sysfs.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <sys/stat.h>
+
 #include "igt.h"
 #include "igt_dir.h"
 #include "igt_sysfs.h"
@@ -24,6 +26,84 @@
 
 IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
 
+static int read_fails;
+static int open_fails;
+static int stat_fails;
+
+static int read_sysfs(const char *filename, void *data)
+{
+	struct stat sb;
+	ssize_t bytes_read;
+	char buf[4096];
+	int len;
+	int fd;
+
+	len = data ? to_user_pointer(data) + 1 : 0;
+	if (strlen(filename) <= len || len < 0)
+		len = 0;
+
+	if (lstat(filename, &sb) == -1) {
+		igt_info("Stat fails errno=%d %s\n", errno, filename);
+		stat_fails++;
+		return 0;
+	}
+
+	if ((sb.st_mode & S_IFMT) != S_IFREG) {
+		igt_info("Not a regular file %s\n", filename);
+		return 0;
+	}
+
+	fd = open(filename, O_RDONLY);
+	if (fd < 0) {
+		if (errno == EISDIR) {
+			igt_info("dir %s\n", filename);
+			return 0; /* dir or link */
+		}
+
+		igt_info("Open fails errno=%d %s\n", errno, filename);
+		open_fails++;
+		return 0;
+	}
+
+	bytes_read = read(fd, buf, sizeof(buf) - 1);
+	if (bytes_read < 0) {
+		igt_info("Read fails errno=%d %s\n", errno, filename);
+		close(fd);
+		read_fails++;
+		return 0;
+	}
+
+	buf[bytes_read] = '\0';
+	igt_info("%zd\t%s\n", bytes_read, filename + len);
+
+	igt_debug("File %s\nData: %s\n", filename + len, buf);
+	close(fd);
+
+	return 0;
+}
+
+static int process_sysfs(int dirfd)
+{
+	char syspath[PATH_MAX];
+	igt_dir_t *config;
+	int ret;
+
+	igt_dir_get_fd_path(dirfd, syspath, PATH_MAX - 1);
+	igt_info("Reading sysfs files from %s\n", syspath);
+
+	config = igt_dir_create(dirfd);
+	igt_assert_f(config, "Cannot create dir config\n");
+
+	igt_dir_scan_dirfd(config, -1);
+
+	ret = igt_dir_process_files(config, read_sysfs,
+				    from_user_pointer(strlen(syspath)));
+
+	igt_dir_destroy(config);
+
+	return ret;
+}
+
 int igt_main()
 {
 	int fd = -1;
@@ -38,8 +118,12 @@ int igt_main()
 	}
 
 	igt_describe("Read all entries from sysfs path.");
-	igt_subtest("read-all-entries")
-		igt_dir_process_files_simple(sysfs);
+	igt_subtest("read-all-entries") {
+		process_sysfs(sysfs);
+		igt_assert_eq(read_fails, 0);
+		igt_assert_eq(open_fails, 0);
+		igt_assert_eq(stat_fails, 0);
+	}
 
 	igt_fixture() {
 		close(sysfs);
-- 
2.55.0

