Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C326C0218F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C467C10E9B5;
	Thu, 30 Jan 2025 17:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NR9mMqGm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA2810E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257735; x=1769793735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=drTcLI1cT5ukbd+1l3GadUQQ0F5eIIOXA5+lq5IPgHY=;
 b=NR9mMqGmhtV9Fbb6OyMtCa2VK40qUFKXaDs/+8+FeV26CNGvtVfAcroh
 91jJC0sY2jNr4lFdZq0oyzvtp1ovwskYIa+D/87BPjmjQFHlMo0V7p7lk
 OBLV5GvWv6qthCoTrLG/irxxJv+ZdxN3sdluePnmmH61ZoCrfdDp8TxTM
 ty/nbJAE+PDMy2ss6ra1dvyLW7Osea2zRMQh5ncPcUKmXfndAK6yEoHxY
 A5k5+XD04s+G16g5S8R1TO5rRUs5MPZMq2aR0Oip0QK/1BxcF+Y9EKq8O
 3/T0lCl0hOlSCDmHFal9EEAX5Iet8XjI1LW/bqrTqPjA+bol9kx2RjGFL Q==;
X-CSE-ConnectionGUID: 0il9n6KETGO2WjFPip6vBw==
X-CSE-MsgGUID: X1tjLuS5SCazr4y3AtJYiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567071"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567071"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:11 -0800
X-CSE-ConnectionGUID: 9djBkNl7Qx+4/YB3bO2oMA==
X-CSE-MsgGUID: FhC8dODZSMqm2s6+oLmcJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539647"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 02/10] runner: Free settings at the end
Date: Thu, 30 Jan 2025 09:21:41 -0800
Message-ID: <20250130172149.3657144-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250130172149.3657144-1-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
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
2.48.0

