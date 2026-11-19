Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9CD606A325
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 19:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fu9vq/6h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769B91126CB;
	Thu, 19 Nov 2026 19:25:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3CD1126CB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795116253; x=1826652253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oputKYrdjw3L9Oq/HQB7yvcTEeJw0C7+w4mQzGguBEQ=;
 b=Fu9vq/6hja8P3+a9z8Ra+Q0ksGvnpW75cciOA5/yaGZQkMo4kjpUkosV
 2lcgZ2+lAjrI9AQMIb6uoZeMjgYYYGfeeRLPT8sf2uYlzG2GaUSmzYmpS
 BrEMO0Wc2ABoZGut+0ZUQjArxMR+tyo2NJVv30GGtKcTQZS9Yz9ZVuDGu
 V2vzBZ5BGzHfsjVtUv6W039BE/Ftxwk4mxKbZdVxhWf0wehNMcdh6oe+k
 al5ioMBYYJWqDON/nyOSN/92kbZWQfuyrkV6IJWs27avAPegcYptiv2Lx
 lH9WIEBQw/lRcD4k7Ut2RZyis9eg2fo12GLLxNoZT3ZgtX+jkYjdGvHXf g==;
X-CSE-ConnectionGUID: LigF6S69TbKa4QcTbLMDoQ==
X-CSE-MsgGUID: KTsfNfeETMKatVVUkY4JWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4081375"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4081375"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 11:24:12 -0800
X-CSE-ConnectionGUID: 1VHhO6A0TR20C+Cy8/UK4A==
X-CSE-MsgGUID: HXgt4mgjRrS7rYFK8Bg+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10504622"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 11:24:11 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] tests/core_sysfs: Fix logic for EIO and other fixes
Date: Thu, 19 Nov 2026 20:23:57 +0100
Message-ID: <20261119192357.117416-1-kamil.konieczny@linux.intel.com>
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

Fix check for 'power' string in case of EIO and fix fd leaked in
that code path.

Check for non-regular file makes redundand check for directory at
open, so remove it.

Check also return values from functions and fail early.

Last fix corrects a typo s/readed/read/.

Cc: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_sysfs.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index fdb4e325c..a4dacafe1 100644
--- a/tests/core_sysfs.c
+++ b/tests/core_sysfs.c
@@ -65,12 +65,6 @@ static int read_sysfs(const char *filename, void *data)
 
 	fd = open(filename, O_RDONLY);
 	if (fd < 0) {
-		if (errno == EISDIR) {
-			igt_info("dir %s\n", filename);
-			not_readed_count++;
-			return 0; /* dir or link */
-		}
-
 		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
 		open_fails++;
 
@@ -79,15 +73,15 @@ static int read_sysfs(const char *filename, void *data)
 
 	bytes_read = read(fd, buf, sizeof(buf) - 1);
 	if (bytes_read < 0) {
-		if (errno == EIO && !strstr("/power/", filename)) {
+		if (errno == EIO && strstr(filename, "/power/")) {
 			igt_info("power management EIO %s\n", filename);
 			not_readed_count++;
-			return 0; /* dir or link */
+		} else {
+			igt_info("Read fails errno=%d %s\n", errno, filename);
+			read_fails++;
 		}
 
-		igt_info("Read fails errno=%d %s\n", errno, filename);
 		close(fd);
-		read_fails++;
 
 		return 0;
 	}
@@ -108,13 +102,15 @@ static int process_sysfs(int dirfd)
 	igt_dir_t *config;
 	int ret;
 
-	igt_dir_get_fd_path(dirfd, syspath, PATH_MAX - 1);
+	ret = igt_dir_get_fd_path(dirfd, syspath, PATH_MAX - 1);
+	igt_assert_f(ret >= 0, "Cannot get path\n");
 	igt_info("Reading sysfs files from %s\n", syspath);
 
 	config = igt_dir_create(dirfd);
 	igt_assert_f(config, "Cannot create dir config\n");
 
-	igt_dir_scan_dirfd(config, -1);
+	ret = igt_dir_scan_dirfd(config, -1);
+	igt_assert_f(ret >= 0, "Cannot scan dir\n");
 
 	ret = igt_dir_process_files(config, read_sysfs,
 				    from_user_pointer(strlen(syspath)));
@@ -140,7 +136,7 @@ int igt_main()
 	igt_describe("Read all entries from sysfs path.");
 	igt_subtest("read-all-entries") {
 		process_sysfs(sysfs);
-		igt_info("Summary: reads=%d fails=%d not_readed=%d\n", ok_count,
+		igt_info("Summary: reads=%d fails=%d not_read=%d\n", ok_count,
 			 read_fails + open_fails + stat_fails,
 			 not_readed_count);
 
-- 
2.55.0

