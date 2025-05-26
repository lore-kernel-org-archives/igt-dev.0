Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1589C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 08:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942B710E2B5;
	Mon, 26 May 2025 08:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTWQOXXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E487510E2B2
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748246816; x=1779782816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RoAtKMGdZbNDkNiZ08934TfX01eBGbOG1oBonF07BhA=;
 b=bTWQOXXSsR1rmhh7AXGtdYgUbUZikxczzGD718rX6aSLlHH3d3T8lDoA
 LMdJ+OrtmwaPK5yj0N5sOo8xioERRZIETc78Fm6AE20KYCYffW6KYipFi
 d5xtkDQv6Klvw94k9UreOBjm0wWttQ6I+XmJ2w9Kl/MLZGfGvWknnr7d6
 RxTHGh22PTpkmT5IlNCQxEexCV0jZPto5VSv3J74oPBrBOKtzOqIPe6hN
 JJhgNmsNaAiBEQJ6ESEWpsOhWyCzbd7FFXU+Hckx1KmJiID0OSlGPOgwa
 wKsyH3mPfSen5lF5XhVmT+DY3hCnAR9K6OG76JCPTg6NXUgiRJNP3jlPK A==;
X-CSE-ConnectionGUID: zpCvnrShQ0WwXSCRPT6OYA==
X-CSE-MsgGUID: PmNR2JPBS3qo6LDlqppYnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="67762843"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="67762843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:06:55 -0700
X-CSE-ConnectionGUID: rcDawu2iSFmq18WzPB42Lg==
X-CSE-MsgGUID: JLsg7PFkRM2F3n/fAxizLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142208400"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:06:54 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 7/8] runner: fixup print/scan formatting for files in
 runner
Date: Mon, 26 May 2025 08:07:39 +0000
Message-Id: <20250526080740.67790-8-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526080740.67790-1-jan.sokolowski@intel.com>
References: <20250526080740.67790-1-jan.sokolowski@intel.com>
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

Fix formatting by using proper formatters, eg. zu for sizes.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

