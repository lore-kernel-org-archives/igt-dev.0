Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1BDC98315
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 07:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4598110E182;
	Sat, 17 Jan 2026 07:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNNqzOeR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874610E043
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768634155; x=1800170155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjOYFg0rT+WkEqIEVmm06KEo3PUglTul/NG94HHclCM=;
 b=KNNqzOeR2dXSYwu1G/n9UT0b6azqzrzplNydEtM+2DiwjDx4kum1an2y
 ovyimxlCVpDhE8/pYiaTNezg1b6E643FSDNWvtwPjArAO2OHQVh/UGd3i
 msOKKtMf9LATKZ14KLwHF0diHgmho+gHfBoYhA15KW/yoMtxE14nga7cD
 LjYRgl8DhkS+NzCfvFBMOApCauQvlbffjAbDsWZqPu1M5swyhKZ/LRhtZ
 hqtzQ09rmKeqOf91LVawHDyKfafr0XbM9iwKvOZIXs+N+TrQXoYAGg7vh
 W8FdFQaWXlORPaR2v1Vzg3By+D5ZtZKGDXUDYn94kORjLPIde8zBNp7TW w==;
X-CSE-ConnectionGUID: WFAVDNBASa6bnNUhDr5eAA==
X-CSE-MsgGUID: D6RuGC/sTAePgaB2QDM0tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73786308"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="73786308"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 23:15:55 -0800
X-CSE-ConnectionGUID: iAotJRAvQSaBFVy0pUfdTw==
X-CSE-MsgGUID: QJlmihfeQJi2RloLmUMyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="205842654"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2026 23:15:54 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH 1/4] lib/igt_core: add igt_destructor helper macro
Date: Sat, 17 Jan 2026 07:14:56 +0000
Message-ID: <20260117071459.892532-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117071459.892532-1-x.wang@intel.com>
References: <20260117071459.892532-1-x.wang@intel.com>
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

