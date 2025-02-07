Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4EEC021A3
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1640310EBB7;
	Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZP21WRrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EF710E348
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zuyhETUe+ZwIbzfxwMo39TkKUOp1nSDsCdgVAjlKl98=;
 b=ZP21WRrBn88xkAWz7vGV83sbRfYQvR36Cx+YBOeoodWNQBJh/lDySCEO
 mEuABHZ5SfTJTVTJc4I8kMgkzWew98NUHfXZ2HojfnPBhv4+Tx8aijZkW
 tXTEIg6lloGD1dFfAKlkjQj5HfXq9HZd4o/uA6t0ObdJPZws7v/YRG1HP
 ZSIi/+CEpK5gzulenkXrF126jHpOeRMkP7Jz6rQeNQxNxLGYsYBcPX1Kj
 yhobUSc7ic6msTqgl+EaXV73yo7wyjsfJ9wnE1DiFAHWoxcRSa41Kb4gX
 6SGwukUnV4s8EMswZ2NCIJdmL6DT+A2o9m5ZmBgTVbILlJtqoUTAig9rz Q==;
X-CSE-ConnectionGUID: m4kGsf77R3ehhANqbvjMPg==
X-CSE-MsgGUID: fC9EUpOzTdGAjFOYfPhIEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281771"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281771"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: /vA6/cEnSNCzxKdwVwQtng==
X-CSE-MsgGUID: amjKQVyVQe+c1m5ghiNCqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425859"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 02/10] runner: Free settings at the end
Date: Fri,  7 Feb 2025 15:09:36 -0800
Message-ID: <20250207231039.2883195-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207231039.2883195-2-lucas.demarchi@intel.com>
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
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

Keep valgrind happy with the normal allocations so we can find the real
leaks. Avoid this kind of leak:

	==806592== 8 bytes in 1 blocks are definitely lost in loss record 46 of 188
	==806592==    at 0x4846828: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
	==806592==    by 0x4BD534E: strdup (strdup.c:42)
	==806592==    by 0x10E6AA: parse_options (settings.c:863)
	==806592==    by 0x10D2DD: main (runner.c:19)

This only fixes the leaks on success. The error path handling on both
igt_resume and igt_runner will need some more work on how they are
interacting with all the initializations/cleanups.

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/resume.c | 2 ++
 runner/runner.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/runner/resume.c b/runner/resume.c
index 0f4e42bfa..ed17351c6 100644
--- a/runner/resume.c
+++ b/runner/resume.c
@@ -55,6 +55,8 @@ int main(int argc, char **argv)
 		exitcode = 3;
 	}
 
+	clear_settings(&settings);
+
 	printf("Done.\n");
 	return exitcode;
 }
diff --git a/runner/runner.c b/runner/runner.c
index 4855ad641..258b30b36 100644
--- a/runner/runner.c
+++ b/runner/runner.c
@@ -49,6 +49,8 @@ int main(int argc, char **argv)
 		exitcode = 1;
 	}
 
+	clear_settings(&settings);
+
 	printf("Done.\n");
 	return exitcode;
 }
-- 
2.48.1

