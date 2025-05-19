Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE3DC3ABD8
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 11:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD0810E39F;
	Mon, 19 May 2025 11:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvg3rpSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B6B10E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747654177; x=1779190177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GhyJPDklkCPFpE2XgVTyRtZ9KNSNpo3Ng1gh27cFoco=;
 b=nvg3rpSJFcsVGYoZzVDCtwcff5WkLNZrEeP9skE4QfBqGVrsRq0iC5Pf
 /tRMC1JmsIOZk1FJpupiqwOoNj1ksUQO9PvvCWZNYEmKoM0aafl9eALuQ
 Pad5x/rJ/xBgUYkHgMJWeLYENBDBLuZDYSF7rpS2x8wyX4pX1Rvcg0KoZ
 OArudOIRZ9/S1KlsjbwSXlczBXeabGKUu7cL3b3cyjpKyRoG/nOdg/vde
 qSCza0R+uMPXxs7Thz56rEn3wuFe9XK/VcR1OlQcBLflz/aD1NSOFPYnB
 6aDOxWyFRBCKR8kGX3CR0KXQgO2/eyPbEDs+xrBDo7Hig/akdIVs8zo8e w==;
X-CSE-ConnectionGUID: 9LliTMMAQR+PNCc2MMtZDA==
X-CSE-MsgGUID: DymuktcFS8Sp0B7ktDMoVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53347322"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="53347322"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:37 -0700
X-CSE-ConnectionGUID: j/W764PuS8SRl1ALEAaL6A==
X-CSE-MsgGUID: HHNQ87xaSyaPWm0Fr1ovmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139385849"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:36 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v2 7/8] runner: fixup print/scan formatting for files in
 runner
Date: Mon, 19 May 2025 11:30:09 +0000
Message-Id: <20250519113010.125751-8-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519113010.125751-1-jan.sokolowski@intel.com>
References: <20250519113010.125751-1-jan.sokolowski@intel.com>
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

