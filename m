Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41CEC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 12:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3541C10F26D;
	Wed, 29 May 2024 12:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJrI33Of";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523C410F3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 12:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716986944; x=1748522944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YiweyWORfQdQpSX+txYAnUL2E2es+CSnOmha93IgAfE=;
 b=TJrI33Of7gdQ7uwXF7jzkDna5KAmtieX2fB3kaqR7AEZ3nc3MbuhyijF
 pyAy2lZO8JYmQ+gqZfFE5JHFmMHSKV36t+ZDYJA+o93WpzJuSA2fM4sx3
 /AWbgKHmruvRj7XLJs0Jj6/LvaLQ56TrPb8aYg6q67u7APerR+V61g3vw
 0/XpZQiwxL8KojChMIyzvVC9/0mQixyT9dwFSLHG8QykhgOII/Yu4Yb68
 NxU5VWAwJWVdZGrQXnj6WvuzdLMW01E033r/NuERwQyMX4PjNmDvG87vE
 8kgdsV8x5dFgSIIVS6ZrKagMWgDkK2dFgoE7VrE9HJFlDgYE9BV32JWtc w==;
X-CSE-ConnectionGUID: Y41yLPp8T7yt213IUJ26Bg==
X-CSE-MsgGUID: QT5AeyNrSv+yTFqMYTiuuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30910866"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="30910866"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:49:03 -0700
X-CSE-ConnectionGUID: jgjuzvR0Qd6Mp5wd81eh/A==
X-CSE-MsgGUID: LzY7+bcTRDKqEQjUfzN4nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="39872317"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.98])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:49:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Petri Latvala <adrinael@adrinael.net>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] CONTRIBUTING: Add more guidelines
Date: Wed, 29 May 2024 14:48:49 +0200
Message-ID: <20240529124849.10728-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add few more guidelines for submitting patches:
- encourage use of checkpatch.pl script from Linux kernel
- add guide for good subject for a patch
- add links to guides about how to create a good patch
- add guide for responding to CI failure letters

v1: expand patch from Louis on checkpatch,
  also take a hint from Jani about checkpatch options
  add a guide for checking test results from CI

Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 CONTRIBUTING.md | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 2ab8a48f6..23cf0df11 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -63,6 +63,17 @@ Sending Patches
 
   on its first invocation.
 
+- Place relevant prefix in subject, for example when your change is in one
+  testfile, use its name without '.c' nor '.h' suffix, like:
+  tests/simple_test: short description
+  Consider sending cover letter with your patch, so if you decide to change
+  subject it can still be linked into same patchseries on patchwork.
+
+- Look into some guides from Linux and Open Source community:
+  https://kernelnewbies.org/PatchPhilosophy
+  https://www.kernel.org/doc/html/latest/process/submitting-patches.html
+  https://www.kernel.org/doc/html/latest/process/submit-checklist.html
+
 - Patches need to be reviewed on the mailing list. Exceptions only apply for
   testcases and tooling for drivers with just a single contributor (e.g. vc4).
   In this case patches must still be submitted to the mailing list first.
@@ -75,8 +86,17 @@ Sending Patches
   contact one of the maintainers (listed in the MAINTAINERS file) and cc the
   igt-dev mailing list.
 
+- Before sending use Linux kernel script 'checkpatch.pl' for checking your
+  patchset. You could ignore some of them like 'line too long' or 'typdef'
+  but most of the time its log is accurate. Useful options you could use:
+  --emacs --strict --show-types --max-line-length=100 \
+  --ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER
+
 - Changes to the testcases are automatically tested. Take the results into
-  account before merging.
+  account before merging.  Please also reply to CI failures if you think they
+  are unrelated, add also to Cc CI e-mail which is present in message.  This
+  can help our bug-filing team. When replying, you can cut a message after
+  'Known bugs' to keep it in reasonable size.
 
 
 Commit Rights
-- 
2.43.0

