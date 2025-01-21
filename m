Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E06C0218F
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 22:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B8C10E651;
	Tue, 21 Jan 2025 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGKPWA3E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2947610E644
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737500272; x=1769036272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2gW+ZTjO8bef0MFiouiOS+W3RhWEG//Hvi/5rT4V/ug=;
 b=NGKPWA3EZroB053hR9PpXH+eQG5VYY1crVkKYgvzNkARJVoy5LKlOdR6
 g1v+mDN0dm7b6GWe5s00EpizKlmYtlgRkZjap16wJlBGJM0v3GrLjTmDJ
 5NecaDmVGWWnbvunQMxeKRlJawkqUFXxwkYM63f2sMD0qt7gS8IrOhsw6
 pLJn43Dx10TSQ1ktl91h6M+X/m1J1c5hY2u+HtdI4mTBY4LplCwQ6fARI
 P/x18CYGtfoioj0dlalOGZVQnv6C1aSnG7SIsWlQtIMn8NaCo2UGCXQug
 9QoDUUT0gwMQleej7qlYzLEvifX6ae/RkMD+7TBw6YBYwXT8Z0rJRxSQS Q==;
X-CSE-ConnectionGUID: q/CcrvKrT0aLJd7rGgOD/Q==
X-CSE-MsgGUID: fj0NHsfrQsielDHB96ytVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55352727"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="55352727"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
X-CSE-ConnectionGUID: Tb/yb1p/TNWpaBD0IOkeBA==
X-CSE-MsgGUID: d8adzK3oRe2UxnhuiC6u0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111933678"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 5/7] runner: Free settings at the end
Date: Tue, 21 Jan 2025 14:57:31 -0800
Message-ID: <20250121225733.808978-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250121225733.808978-1-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
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

