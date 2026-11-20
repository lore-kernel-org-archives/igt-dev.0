Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1776606A338
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 18:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jl5Hl1Oc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E1A112C3E;
	Fri, 20 Nov 2026 18:30:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9910B112C5B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 18:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795199196; x=1826735196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2YDabax5C+TLyOz4UXIhl/cqC/BdDB1Q8O3XbLujYkA=;
 b=Jl5Hl1OcN9B4cmWqqWGjCZBpqZePpaAwUbd4MkuP/wm54Pbh9APsTooB
 78u4H935jJi+L0XfMKW+VEDIZ3L2RR9XD3geXXKKExKIIQbTBfG1DEf+Q
 Q2prmmwF0IIWhJGpW5gbPaH8CsITr7qTZYJ2e414XVh1PA6YYSD1CKRsp
 lOFsx5aPe5PeJ6kjZPBiDtSyPTT9RPSmqAO7V+53ALpktZsheBVpFEFAb
 jfwNGbFSvsNK+jrQUGaUX6/Gw10M+TBXzHXPQ5Wu0qikMZMI7nJaeLP6K
 lUtd/ofPm7cPGD0xD1wzMKc6v2sIaeYoDq1cM9gkqEmPeSwaaQVPgbOhC g==;
X-CSE-ConnectionGUID: ae38futfT4S86SDL537RNg==
X-CSE-MsgGUID: ZPC5Fgc+Quq9Jvq7hEZYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3969163"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3969163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:26:36 -0800
X-CSE-ConnectionGUID: ubEhkVAZT5uNoCHOjFag0A==
X-CSE-MsgGUID: zdRtjVtgSA2QeWcl5Jcy1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10641197"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:26:36 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/core_sysfs: Correct typo
Date: Fri, 20 Nov 2026 19:26:13 +0100
Message-ID: <20261120182614.34410-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Fix typo s/readed/read/.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index 99117eea3..8719b4ffe 100644
--- a/tests/core_sysfs.c
+++ b/tests/core_sysfs.c
@@ -27,7 +27,7 @@
 
 IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
 
-static int not_readed_count;
+static int not_read_count;
 static int ok_count;
 static int read_fails;
 static int open_fails;
@@ -53,13 +53,13 @@ static int read_sysfs(const char *filename, void *data)
 
 	if ((sb.st_mode & S_IFMT) != S_IFREG) {
 		igt_info("Not a regular file %s\n", filename);
-		not_readed_count++;
+		not_read_count++;
 		return 0;
 	}
 
 	if (!(sb.st_mode & 0444)) {
 		igt_info("Not readable %s\n", filename);
-		not_readed_count++;
+		not_read_count++;
 		return 0;
 	}
 
@@ -75,7 +75,7 @@ static int read_sysfs(const char *filename, void *data)
 	if (bytes_read < 0) {
 		if (errno == EIO && strstr(filename, "/power/")) {
 			igt_info("power management EIO %s\n", filename);
-			not_readed_count++;
+			not_read_count++;
 		} else {
 			igt_info("Read fails errno=%d %s\n", errno, filename);
 			read_fails++;
@@ -136,9 +136,9 @@ int igt_main()
 	igt_describe("Read all entries from sysfs path.");
 	igt_subtest("read-all-entries") {
 		process_sysfs(sysfs);
-		igt_info("Summary: reads=%d fails=%d not_readed=%d\n", ok_count,
+		igt_info("Summary: reads=%d fails=%d not_read=%d\n", ok_count,
 			 read_fails + open_fails + stat_fails,
-			 not_readed_count);
+			 not_read_count);
 
 		igt_assert_eq(read_fails, 0);
 		igt_assert_eq(open_fails, 0);
-- 
2.55.0

