Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A901FCA5FA2
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 17:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306CA10E93E;
	Mon, 28 Sep 2026 17:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdV8GqAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E82410E949
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790616436; x=1822152436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=paDTfzx3oev9ygvJ5qsRqEdJ4/SJrTyiXJLYbRCZSMA=;
 b=mdV8GqAhX3Y0EjgCYb62X/GLNtazkCcRhIg0SRmD4mKTVl22Ny8aqiJl
 ofVAbNgwLv0IkaI1V7b8qUcFunLH3DZaWH6Lhs4oCB8ISDs9HdumO+27t
 r100XR3M5Q9VFhBdOdseeP9MXbVZBRTSlaMBB675hEvRxDHqZYOTunjhS
 fW58H7CDIjhZp5/FK12sHinB87kKUhiiWpCIwCs/xJycTVptVEZ5YCaCG
 Oi8IoSVWb3PeDLm+HxIc+mYmOf1cyoo3nkZ1xGGFXoUpafdf9+HdLuOyU
 CWlbq8+07jRFZiM6r28/d5Qg0qbuy6B8fvn0nSwsaMMXxrL7JDm1RwGX0 w==;
X-CSE-ConnectionGUID: lOb/pZ/OQa2WzytRRZIKZQ==
X-CSE-MsgGUID: MQ9xH4tWQiapL06c06kYZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="78889473"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78889473"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 10:27:16 -0700
X-CSE-ConnectionGUID: 1pOMfceNQ4eKg4nJDJelww==
X-CSE-MsgGUID: xxZbNaJFSz2jK98VDW2b7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274616950"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2026 10:27:15 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, matthew.d.roper@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v14 1/4] lib/igt_core: add igt_destructor helper macro
Date: Mon, 28 Sep 2026 10:27:04 -0700
Message-ID: <20260928172713.1341060-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928172713.1341060-1-x.wang@intel.com>
References: <20260928172713.1341060-1-x.wang@intel.com>
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
index c0908a8edb..c2565729b9 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -524,6 +524,18 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
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

