Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868AFD116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 17:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADF410E2BD;
	Mon,  1 Dec 2025 17:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBfaW7aR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EFD10E435
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 17:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764610396; x=1796146396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N0BODyyEBEEZB9Wt2B/zPi3vvTZk34SNi+g/JGkRU60=;
 b=DBfaW7aRtNzY0VkIcex6xP522vW3YvKhj8eXuUHEkvKmA0QVSBqRJNjy
 iBTh0YUPicCM7fu/hbv0n2I2gOSWZfU5cx2yeAik84/p1lKVy27P9kcXe
 nZ603IE3NLukBYIaqtrjRwdEOj82dV8hRa+mNccUtbNKjxCuMe6KWd/Db
 OD5gkzjrJ1XXMkcxEJdTpUo5aFdv3C8QtGjimfnjIlW8cI2XF77XV/Aq0
 twOmd3o+Qk3PWRt45cNPWqgH3fnLwPtejUFwb29cag8OP/hv7cMJ0VH3g
 9NCXRGhggNNo5iBJrUbKcHnzU9S41NabH2LA+EuMyU2OwOB4rO3CLiGUV A==;
X-CSE-ConnectionGUID: n5adlu5oS8+AbmKchXnXpQ==
X-CSE-MsgGUID: MfqdTevaS/SuWCI33rBRRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89205469"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="89205469"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:33:15 -0800
X-CSE-ConnectionGUID: ScbtH/SmR0qF5AfRyC3lqw==
X-CSE-MsgGUID: BdEZhnGGQR+bZ06Db3wtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193248454"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:33:14 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v4 1/3] tools/intel_gpu_frequency: print short program
 name
Date: Mon,  1 Dec 2025 18:33:01 +0100
Message-ID: <20251201173305.111564-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201173305.111564-1-kamil.konieczny@linux.intel.com>
References: <20251201173305.111564-1-kamil.konieczny@linux.intel.com>
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
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
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

