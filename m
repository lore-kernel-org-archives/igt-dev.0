Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BD6606A33B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M46oaGLU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B6910E004;
	Fri, 20 Nov 2026 18:29:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200B3112C65
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795199200; x=1826735200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p3TArwsBaukg6FzzuLXUxmt1HqaapyKiNW4+2pytrc0=;
 b=M46oaGLUonw2zf/l1hQZDtdBlOdmNNwB7vsOkXkatxbY/BCJ6r2mtQeB
 gNdgYdmkAa9MrxiP2O8lA8YFJ75jLFhxzV8yVcjc3mvdw0U2PuZRN59ZR
 xDmj7GUAcQSeOHsR3TVchBfMEaA9uBpQai65fn6RzFO4VxvcvLR2IVia0
 vzoQym4HAaWucTtvNs2Avo4NpXEvpgmy9UmJXphtbfFUbfDuPToFpCnIr
 IOj92yqA5pEkWUM97boobYEXBZPXuMMPGPLlVbRAGibwytvHP83qTESgZ
 JMF5JVq0GPHMJMLsoycA9qrcHK50TELFEQtIpIEDpk8b4507yjE+nTZAr w==;
X-CSE-ConnectionGUID: k2vq97HrRcy1qlFYIgGbUA==
X-CSE-MsgGUID: sbi/5Yg0RxGXYz7xzc8omw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3969165"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3969165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:26:40 -0800
X-CSE-ConnectionGUID: 9Wm9UxvGQquUuZditrnpJg==
X-CSE-MsgGUID: 8+DVJG+7SxORxwgGb/Fezw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10641241"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:26:39 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/core_sysfs: Change prints to debug
Date: Fri, 20 Nov 2026 19:26:14 +0100
Message-ID: <20261120182614.34410-4-kamil.konieczny@linux.intel.com>
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

Instead of printing every name of file read, make printing into
debug only, reducing normal output.  Keep only one print at the
beggining of test about a path which will be scanned and a
summary at the end.
Also while at this, add 'ok' prefix to those prints which are
treated as non-errors, for example write-only file.

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_sysfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index 8719b4ffe..f05c8845a 100644
--- a/tests/core_sysfs.c
+++ b/tests/core_sysfs.c
@@ -46,26 +46,26 @@ static int read_sysfs(const char *filename, void *data)
 		len = 0;
 
 	if (lstat(filename, &sb) == -1) {
-		igt_info("Stat fails errno=%d %s\n", errno, filename);
+		igt_debug("Stat fails errno=%d %s\n", errno, filename);
 		stat_fails++;
 		return 0;
 	}
 
 	if ((sb.st_mode & S_IFMT) != S_IFREG) {
-		igt_info("Not a regular file %s\n", filename);
+		igt_debug("ok not a regular file %s\n", filename);
 		not_read_count++;
 		return 0;
 	}
 
 	if (!(sb.st_mode & 0444)) {
-		igt_info("Not readable %s\n", filename);
+		igt_debug("ok not readable %s\n", filename);
 		not_read_count++;
 		return 0;
 	}
 
 	fd = open(filename, O_RDONLY);
 	if (fd < 0) {
-		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
+		igt_debug("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
 		open_fails++;
 
 		return 0;
@@ -74,10 +74,10 @@ static int read_sysfs(const char *filename, void *data)
 	bytes_read = read(fd, buf, sizeof(buf) - 1);
 	if (bytes_read < 0) {
 		if (errno == EIO && strstr(filename, "/power/")) {
-			igt_info("power management EIO %s\n", filename);
+			igt_debug("ok power management EIO %s\n", filename);
 			not_read_count++;
 		} else {
-			igt_info("Read fails errno=%d %s\n", errno, filename);
+			igt_debug("Read fails errno=%d %s\n", errno, filename);
 			read_fails++;
 		}
 
@@ -87,7 +87,7 @@ static int read_sysfs(const char *filename, void *data)
 	}
 
 	buf[bytes_read] = '\0';
-	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
+	igt_debug("ok %zd\t%s\n", bytes_read, filename + len);
 	ok_count++;
 
 	igt_debug("File %s\nData: %s\n", filename + len, buf);
-- 
2.55.0

