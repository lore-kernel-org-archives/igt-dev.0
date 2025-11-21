Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0056ACFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DCB10E037;
	Fri, 21 Nov 2025 19:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUCQQg0X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25E10E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763753752; x=1795289752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QKQqI/7GONQJYmM6VrvFzLKqW7IwDrSMH/ypjw09igA=;
 b=MUCQQg0XkkwudCLUIeees3+/B2kpoR646VjrclnAeTaLx6HNSG6KokQs
 /HyXIxjrIeR5bWeJ7cC10QG1encTBqAWTdsMIjQQmqaNTApm+hnBdHPD9
 Ys1maXf5a/Gq5XD1JjKkt8E1I120gvB5M0O/m/aDUAUdA1ztQzGHPdkEJ
 WVA60cPRxNEge/IVr4GjPPA8HzeQeglr5DRQsoSSwtWLvDFZxJ7FwMSA7
 RrP7sgIOY7jZ2tre36qoAXw9SsNJ8qVEKE3FnFoJV+/s7BWqXwBcy/bEX
 v9VEhwxdnt/xVXbf+cw9vY6K7gq4bV0irBTIPeepM65hVqsV4v05SxFPp Q==;
X-CSE-ConnectionGUID: fZMkLQXcQpGFluULHem/rg==
X-CSE-MsgGUID: sIyynGjXRjyFxo4PVLZUSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69720448"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="69720448"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:35:52 -0800
X-CSE-ConnectionGUID: mwfHPSleSJuCti1uSlK4Cw==
X-CSE-MsgGUID: tt4BI8dXRrSOqsPKShZamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191657014"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.48])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:35:51 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/3] tools/intel_gpu_frequency: print short program
 name
Date: Fri, 21 Nov 2025 20:35:22 +0100
Message-ID: <20251121193539.195005-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
References: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
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

When printing help or version info, print only short program
name, without a path used to run it. Also while at it, update
copyright year.

v2: shorten also name used for version info, update year at
  version print (Kamil)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_frequency.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 8c3c91313..999db756b 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -1,5 +1,5 @@
 /*
- * Copyright © 2015,2018 Intel Corporation
+ * Copyright © 2015,2018,2025 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -117,11 +117,21 @@ static int get_frequency(struct freq_info *freq_info)
 	return val;
 }
 
+static const char *
+get_shortname(const char *prog)
+{
+	const char *slash = strrchr(prog, '/');
+
+	return slash ? slash + 1 : prog;
+}
+
 static void __attribute__((noreturn))
 usage(const char *prog, int err)
 {
-	printf("%s A program to manipulate Intel GPU frequencies.\n\n", prog);
-	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", prog);
+	const char *shortname = get_shortname(prog);
+
+	printf("%s A program to manipulate Intel GPU frequencies.\n\n", shortname);
+	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", shortname);
 	printf("Options: \n");
 	printf("  -e		Lock frequency to the most efficient frequency\n");
 	printf("  -g, --get     Get all the frequency settings\n");
@@ -145,8 +155,8 @@ usage(const char *prog, int err)
 static void
 version(const char *prog)
 {
-	printf("%s: %s\n", prog, VERSION);
-	printf("Copyright © 2015,2018 Intel Corporation\n");
+	printf("%s: %s\n", get_shortname(prog), VERSION);
+	printf("Copyright © 2015,2018,2025 Intel Corporation\n");
 }
 
 static void
-- 
2.52.0

