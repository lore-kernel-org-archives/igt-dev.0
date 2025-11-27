Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC653CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 16:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5616E10E729;
	Thu, 27 Nov 2025 16:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BholqmqO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4AF10E828
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764260903; x=1795796903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N0BODyyEBEEZB9Wt2B/zPi3vvTZk34SNi+g/JGkRU60=;
 b=BholqmqOiei39QpWwTsrS9gY/91lqXMwgOt61ARlJkqT1nx/RbPN5T9I
 xzbBG9tPFMYdItwM1/JqCGkyUMgU9PG1KyinVgWFzL0geLfHmxGLFmltV
 m+s2cAjuCz4/+vR4fXAbT0e/LPzwssYGLvWL4pwZ9cXR7NInZ6QVEf4Tp
 fSWfleDA7r+maCq21swvtI/MMZPbFh/cy0n+qbkc6/DXVWuAfqhdDSCj2
 SZSFnVuQgvZ//2OEcNRVuW972llHxfch2Fxv+L86rrjlg3TjuO2qxqQd2
 mXGOePPnIe4gat3lYgQztio26u0b4eYRMYggdYgsga4yesjxBYkpsgU6W Q==;
X-CSE-ConnectionGUID: 37UVZaCVRxybx99Nein3rQ==
X-CSE-MsgGUID: Egu+uTMlT4qCeKrQ4Wkk6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66204321"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66204321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:28:22 -0800
X-CSE-ConnectionGUID: qIfZdfA3QsixRdDa9LmThw==
X-CSE-MsgGUID: G2mGSDfSSyyRzjsfDOpJfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193363917"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:28:21 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 1/3] tools/intel_gpu_frequency: print short program
 name
Date: Thu, 27 Nov 2025 17:28:02 +0100
Message-ID: <20251127162806.173535-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127162806.173535-1-kamil.konieczny@linux.intel.com>
References: <20251127162806.173535-1-kamil.konieczny@linux.intel.com>
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

