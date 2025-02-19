Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A67C021AF
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 07:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E60810E474;
	Wed, 19 Feb 2025 07:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMZTOcJJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A5010E476
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739949570; x=1771485570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FvcxRSwZnhw3Vp1o8RjlQvTsk++JRr927dZEk5q3aSY=;
 b=NMZTOcJJdt0RGsGERuMTzLzYaI/0pdQzyKRp8V1VvLRyLLCgsSw4LMLv
 czGtfnKKVrKH3ngHNaiUqmLYTKzcqEv85jDEstn9lbS8S3D4/129u5udN
 7wxf1P/zJRmCRuOHhnVWlOKjQdzQLRqZ9+/dCJqky+eSBmEmKxTMdwz4A
 dmtpBgFyBe9260IstMCk9s3hTJM+Fz5O9VnGPZ882JZiGHIxkrzfGjPX5
 Cqt9ibBuZ77kts1R911cUfMHzWtCfhckI47t/cP5K+fP2RjsYlAQ5FFf7
 AdgQeOit97Dm8kLV4kpavdd/nQmanzmp50eldF9hM52wqkFvfD7dp5US2 Q==;
X-CSE-ConnectionGUID: HFQBUzsVRtSx3Dl4Yn1wJg==
X-CSE-MsgGUID: FFJ+917bQ6uCswel9quMFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40885368"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40885368"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 23:19:30 -0800
X-CSE-ConnectionGUID: up9EgKhARtKAvByut+Urmw==
X-CSE-MsgGUID: xg/+5svqRw2FjQRwHTsSzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114611836"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2025 23:19:29 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 3/5] tests/intel/xe_fault_injection: Add helper
 functions to inject fault with specific budget parameter.
Date: Wed, 19 Feb 2025 13:04:43 +0530
Message-Id: <20250219073445.31423-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
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

As per the current implementation, the fault is injected on the first call
of the error injection function. Introduce an environment variable
IGT_FAULT_INJECT_ITERATION using which, an error can be injected at
specific function call. If the environment is not exported, an error will
be injected in every possible function call starting from first up to the
max number of iteration defined by INJECT_ITERATIONS, currently hardcoded
as 100.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index bc05515a8..32733fec5 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -25,6 +25,7 @@
 #define INJECT_ERRNO	-ENOMEM
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
+#define INJECT_ITERATIONS	100
 
 enum injection_list_action {
 	INJECTION_LIST_ADD,
@@ -42,6 +43,21 @@ struct fault_injection_params {
 	uint32_t space;
 };
 
+static int get_fault_inject_iter(void)
+{
+	/**
+	 *  Introduce a new env variable IGT_FAULT_INJECT_ITERATION.
+	 *  When unset test will run for INJECT_ITERATIONS iterations.
+	 *  When set to <=0 or malformed - same as unset.
+	 *  When set to >0 it will run single n-th iteration only.
+	 */
+
+	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
+
+	/* Return 0 if not exported / -ve value */
+	return env ? (atoi(env) > 0 ? atoi(env) : 0) : 0;
+}
+
 static int fail_function_open(void)
 {
 	int debugfs_fail_function_dir_fd;
-- 
2.35.3

