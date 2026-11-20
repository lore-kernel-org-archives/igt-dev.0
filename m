Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B4606A337
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buXb1Fza
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801F010E004;
	Fri, 20 Nov 2026 18:28:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247FB112C65
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 18:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795199193; x=1826735193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qa2+iQ0Ep9/VKsETsNhAAsE1dbVAUUlg4GFb5IWx8iM=;
 b=buXb1FzaWbCKhsKn5zhbE7if6QFTVRMvawdPAXwZzDz/PIcgZelkyice
 wH3QkimKgLl6o+uAdtNodD3s4+lKx/oMXmXuMQYhyjyFIAeumxFkgAVoU
 r18sEu/6Xr4RQNYAtx5Yd0sRwqcqjGXf5UAtnvPWbMSzW7PBw6QRdZsbr
 YYGUE3n0l226ZA45Ol7+SxORBd4zYMY1PVQ4FD17ndSqVPZNxS87SwiRz
 ar4o0LsD1NgnZFOucRpcGikzwvTR98nu8byl60ef3OmeW+ncsj3cT/9nh
 8Ff5SCyoVjmXRGtJSCD3byxL53C/P0HJCyyytcHBdJ32KInXmLQ0TWBel A==;
X-CSE-ConnectionGUID: RMbma1CxRKu/GWKwMzl49A==
X-CSE-MsgGUID: /ZRw+BOVQn+wW0jx9xL7iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3969160"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3969160"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:26:33 -0800
X-CSE-ConnectionGUID: bmMwWXGTT/a+yBMSMuw8hQ==
X-CSE-MsgGUID: uz1KDDkwQu6MAqcv5TCXjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10641177"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:26:32 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/core_sysfs: Fix logic for EIO and other
 fixes
Date: Fri, 20 Nov 2026 19:26:12 +0100
Message-ID: <20261120182614.34410-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
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

Cc: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_sysfs.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index fdb4e325c..99117eea3 100644
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
-- 
2.55.0

