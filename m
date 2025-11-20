Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0B4CF857E
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0CD10E73C;
	Thu, 20 Nov 2025 10:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmDSe2Bk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F79810E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634791; x=1795170791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SM5fiYmIKd9SS9+Fg7sg/zRClJhqHkm2HKs+b+LDYKg=;
 b=RmDSe2BkH2uEMxBA6cNIJT9RaXQloYvv3Ek9sdR+6aDgLS8yNAM6Igxe
 BWQo44AFPUZc+ERbV6u1CImydHt4BxNRR4D4g2gC6yZocFo/TMDlukYbB
 UYSIJJwd+nqwv+zbrWPOJvgZ15ntgJz6CeCnSMvqJf3c1gmmqln964C9i
 hpJ/L6Ldq6ZSHfSD9D0Njfz4gnF7Wrpk5MHJmPAZDSgG90KwhPouMdmwB
 HDOa+sK96xXbH+5cF+8U8HZEoEJEBJO84ThOuvAIhbugsDLXYwoSC7jLh
 ifJm0b42P8qNv0G4NbkRcBx8OCgc1amHp3/+H1qWaonmW7x7ksarBaU0d g==;
X-CSE-ConnectionGUID: whIG6OhWR0mEMwUSL7WfbA==
X-CSE-MsgGUID: HmG/XJ44QkmrQGoap0IdFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65736631"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65736631"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:33:11 -0800
X-CSE-ConnectionGUID: FW+iVJU5RGKIlbOedHgekg==
X-CSE-MsgGUID: Eefl8sePSM2nhbnEcFK+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="222259573"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:31:53 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] tools/intel_gpu_frequency: print short program
 name
Date: Thu, 20 Nov 2025 11:31:37 +0100
Message-ID: <20251120103139.17169-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120103139.17169-1-kamil.konieczny@linux.intel.com>
References: <20251120103139.17169-1-kamil.konieczny@linux.intel.com>
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

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_frequency.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 8c3c91313..a5c3eb092 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -1,5 +1,5 @@
 /*
- * Copyright © 2015,2018 Intel Corporation
+ * Copyright © 2015,2018,2025 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -120,8 +120,11 @@ static int get_frequency(struct freq_info *freq_info)
 static void __attribute__((noreturn))
 usage(const char *prog, int err)
 {
-	printf("%s A program to manipulate Intel GPU frequencies.\n\n", prog);
-	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", prog);
+	const char *slash = strrchr(prog, '/');
+	const char *shortname = slash ? slash + 1 : prog;
+
+	printf("%s A program to manipulate Intel GPU frequencies.\n\n", shortname);
+	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", shortname);
 	printf("Options: \n");
 	printf("  -e		Lock frequency to the most efficient frequency\n");
 	printf("  -g, --get     Get all the frequency settings\n");
-- 
2.52.0

