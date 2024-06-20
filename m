Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9AFC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 13:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60EB10E99B;
	Thu, 20 Jun 2024 13:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDQT6guE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D426E10E99B
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718888543; x=1750424543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KZGfFaU+WiKEkU2S2N60A1mcITkc0Ulc+dxRWoYzphI=;
 b=MDQT6guEjhDBsAwKikItkFWIxiQ8UMvrUyRyGsu+qYEc7VOUww3c7djc
 X2QBJpnWUn3Yz3POGbQcfCCIdm95sTDZbifH0Wth9COjmaKpFEJhGPexY
 1PjQdic/6oKkYrPijIGb35CIktU7fNSYylGjNofGaTd5gTvGslVIAGePu
 X7xrPGVInl7vDjdyHl7p/Wk/yJqWe6zscG5zoHOMyJyorH6C/tIHbiAWI
 DOl/THM6aXkhw1LZZtMDv6SkW4Yia58nKHRcClGrfvKJlzmqP09aNkArX
 9Xfvb7RUoj4jBn0l2HFpvo1q1WVP5ESKF94IfSoWE62G3Kt0UhcelnGBZ A==;
X-CSE-ConnectionGUID: Ckzi7ovFTxSJPe7n8ERNWA==
X-CSE-MsgGUID: DdGsifmsRnuMCs4KC1Qj2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19640675"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19640675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 06:02:23 -0700
X-CSE-ConnectionGUID: f9KIxyvYQGuN3CVEkzJAxg==
X-CSE-MsgGUID: Y6Bz4fOOSV+rAT87EiTywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="73440522"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.75])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 06:02:22 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Rob Clark <robdclark@gmail.com>
Subject: [PATCH i-g-t] runner/settings: set PRUNE_KEEP_ALL as default
Date: Thu, 20 Jun 2024 15:02:16 +0200
Message-ID: <20240620130216.85074-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

In testing drm-tip it is helpful to have reported all tests
results, especially when one have many dynamic ones we want
to get a parent result.

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Helen Koike <helen.koike@collabora.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 42d8137f1..eecadaf80 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -274,11 +274,11 @@ static const char *usage_str =
 	"                        results that are removed from the final results set.\n"
 	"                        Possible options:\n"
 	"                         keep-dynamic-subtests  - Remove subtests that have dynamic\n"
-	"                                                  subtests. (default)\n"
+	"                                                  subtests.\n"
 	"                         keep-dynamic           - Alias for the above\n"
 	"                         keep-subtests          - Remove dynamic subtests,\n"
 	"                                                  leaving just the parent subtest.\n"
-	"                         keep-all               - Don't remove anything\n"
+	"                         keep-all               - Don't remove anything (default)\n"
 	"                         keep-requested         - Remove reported results that are\n"
 	"                                                  not in the requested test set.\n"
 	"                                                  Useful when you have a hand-written\n"
@@ -672,6 +672,7 @@ bool parse_options(int argc, char **argv,
 	optind = 1;
 
 	settings->dmesg_warn_level = -1;
+	settings->prune_mode = -1;
 
 	while ((c = getopt_long(argc, argv, "hn:dt:x:e:sl:omb:L",
 				long_options, NULL)) != -1) {
@@ -791,6 +792,9 @@ bool parse_options(int argc, char **argv,
 	if (settings->dmesg_warn_level < 0)
 		settings->dmesg_warn_level = 4; /* KERN_WARN */
 
+	if (settings->prune_mode < 0)
+		settings->prune_mode = PRUNE_KEEP_ALL;
+
 	if (settings->list_all) { /* --list-all doesn't require results path */
 		switch (argc - optind) {
 		case 1:
-- 
2.43.0

