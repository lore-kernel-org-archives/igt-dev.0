Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A046CA5FE7
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 23:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB45F10E034;
	Sat, 17 Jan 2026 23:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNMFItTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883ED10E107
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 23:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768693714; x=1800229714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjOYFg0rT+WkEqIEVmm06KEo3PUglTul/NG94HHclCM=;
 b=HNMFItTWAMNIko7OeC9YGFe/i2fabtNClPO2pSjK7ct8ew1tmMydWDP7
 PgYArxsFvIIkmV9okw++KM4ctC17Y5FqnpWNx7PnT82slgq7YvfE0W76L
 r6iR1+NGZgFZtn7vVC2M58EUPorQlZDu8hetZruH1gtEfzJwGDa4o9BJs
 ecEfOhevUKjkeoyU0E/H3UwEKRPGKqmxrFlyjIZctLFY/JjjVkIyZ4gd4
 mR0iGDKnenIoYlP/E9qiyHE+Eme2ym5gERcRTqKacn3n6vLoqeOn8f6Uv
 QuVDOvo9dfF/h63i2MZWFmuDBQWLEZYk8G7sBQ2iPNr2zS0wpMxi8RdOY Q==;
X-CSE-ConnectionGUID: ng2TPpUhS2yw+Zhe2Tsq9w==
X-CSE-MsgGUID: 4vrK2LVwQ0GKVFiZkeuLBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81073816"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="81073816"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 15:48:33 -0800
X-CSE-ConnectionGUID: 2Ka22cm7QNqLRKRvZsCgWg==
X-CSE-MsgGUID: LHMh1OjZQEStC1C9xPIYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="205150353"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 15:48:31 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v12 1/4] lib/igt_core: add igt_destructor helper macro
Date: Sat, 17 Jan 2026 23:48:17 +0000
Message-ID: <20260117234821.929209-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117234821.929209-1-x.wang@intel.com>
References: <20260117234821.929209-1-x.wang@intel.com>
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

Add igt_destructor alongside igt_constructor to make it easy to run
library teardown code when the binary unloads/exits.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/igt_core.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6845f853c..ebeac140e 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -516,6 +516,18 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
 	__attribute__((constructor)) \
 	static void igt_unique(__igt_constructor_l)(void)
 
+/**
+ * igt_destructor:
+ *
+ * Convenience macro to run the provided code block when igt is exiting,
+ * after all tests have been run. This should be used for parts of the igt
+ * library that require de-initialization of objects with global context.
+ * This code block will be executed exactly once.
+ */
+#define igt_destructor \
+	__attribute__((destructor)) \
+	static void igt_unique(__igt_destructor_l)(void)
+
 __noreturn __attribute__((format(printf, 1, 2)))
 void igt_skip(const char *f, ...);
 __noreturn __attribute__((format(printf, 5, 6)))
-- 
2.43.0

