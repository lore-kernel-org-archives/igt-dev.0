Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E9DC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 11:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7F910EA70;
	Fri, 16 May 2025 11:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrZLsl6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819B810EA70
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 11:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747396652; x=1778932652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bhzNBcruGnnsOUGY1GUGjiBDl2kIKqglYLQMGdlnho0=;
 b=VrZLsl6F4Bz9207ustgtmD+p7IihxJWK6MbPgwrjZFfr4lbkmZycZZzX
 n/MupH9B3MFENhtYBmTI7+dp59l74jNhEymN++bFz614P3oa7mNR9ob22
 LHCFjUzK2v/PL+loeqQwTtQBEOqyldBlbbRIt00mxVNVoPWMBo6JvZNOE
 DKSbUVlgy5fH1BIyisMaHpR3WDmawSgSzbUtCLhZKzB9m70ApubZdvP/Z
 MyXdlyTwNsEXPWB1Fy7VELcUoff8tetzqzD9eQtcqrb8aEM2bjPqZzYxN
 HgwTDjLO6aMkNxd8yVWmFC+WtWpZ/Y49y4Yzv9oZFf7TMwFE874GnLJSg A==;
X-CSE-ConnectionGUID: O4KLc+jjT/qJfbmBT4eQBw==
X-CSE-MsgGUID: pFXZNdbSTMqUfyjVl5RA4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="36983601"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="36983601"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 04:57:32 -0700
X-CSE-ConnectionGUID: IYXFozukRY6j96TAnyQIYQ==
X-CSE-MsgGUID: KcESXtZuQ/Cw6j41S+F30w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139075010"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 04:57:31 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 2/4] runner: fixup print/scan formatting for files in
 runner
Date: Fri, 16 May 2025 11:58:09 +0000
Message-Id: <20250516115811.135889-3-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516115811.135889-1-jan.sokolowski@intel.com>
References: <20250516115811.135889-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print/scan formatting warnings.

Fix formatting by using proper formatters, eg. PRIu64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 runner/executor.c | 2 +-
 runner/settings.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 41f521e56..661305006 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1582,7 +1582,7 @@ static int monitor_output(pid_t child,
 		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
 			char disk[1024];
 
-			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmesg dump, %ld > %ld\n", disk_usage, settings->disk_usage_limit);
+			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmesg dump, %zu > %zu\n", disk_usage, settings->disk_usage_limit);
 			if (settings->log_level >= LOG_LEVEL_NORMAL) {
 				outf("%s", disk);
 				fflush(stdout);
diff --git a/runner/settings.c b/runner/settings.c
index 1d34c5bfe..a7d5dbc97 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1166,7 +1166,7 @@ static ssize_t unescape_str(char *buf, size_t *n_src)
 
 #define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #name, s->name)
 #define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
-#define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
+#define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%zu")
 #define SERIALIZE_STR(f, s, name) do {		\
 		if (s->name) {			\
 			fputs(#name " : ", f);	\
-- 
2.34.1

