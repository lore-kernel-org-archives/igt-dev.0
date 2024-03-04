Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E475FC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 20:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7AA112598;
	Mon,  4 Mar 2024 20:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8/KK8ai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0C112598
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709585293; x=1741121293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qi+xWIcJ1soL860UUuIQW/M1S0+p+qkmvKAsD2dbajU=;
 b=D8/KK8aiKUuwm3YeG5bDJ6YTsFucnTntGM25KiW6peVE4VFG0SFJWWy7
 Bur4qT/9vulV6XS68IG/whLo+Pe6qAljYbqHZlr7MH8YQq2luE4rGeAbQ
 /dzrB5sudof16wCEgfSXE/5Ia1r5gqNJO8vKYNeUsUSWAlgpKVOXHAhfQ
 rr6KawGGZN+e9Ov05Z7LP4zabrXkNMyJNUqopjVgMqSpzWH+Gzhj4GL4u
 48lICMRDw5Ycoi4lfgwVyHPZQebviex/swNmvCkoILreHzng22JC3Wvlm
 OayP0fTfvsCaF3jYHedAD+nwz5jK/ZxaurNJmvppF9p57hAdMElnb6dh5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4262774"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4262774"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 12:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9031748"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 12:48:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, janusz.krzysztofik@linux.intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_kmod: Allow to load kunit from alias
Date: Mon,  4 Mar 2024 12:48:38 -0800
Message-ID: <20240304204838.1577556-1-lucas.demarchi@intel.com>
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

Instead of only allowing to load the from the module name, also allow it
from alias by using kmod_module_new_from_lookup(). With that a user can
have their on aliases and the kernel can also export a compat alias for
future module renames.

v2: Fallback to kmod_module_new_from_name() since the kmod ctx is also
    used on builder machines to determine the test lists.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index cc242838f..0fe289950 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1443,6 +1443,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 int igt_ktest_init(struct igt_ktest *tst,
 		   const char *module_name)
 {
+	struct kmod_list *l = NULL;
 	int err;
 
 	memset(tst, 0, sizeof(*tst));
@@ -1453,10 +1454,20 @@ int igt_ktest_init(struct igt_ktest *tst,
 
 	tst->kmsg = -1;
 
-	err = kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
-	if (err)
+	err = kmod_module_new_from_lookup(kmod_ctx(), module_name, &l);
+	if (err < 0)
 		return err;
 
+	/*
+	 * Lookup may not resolve to a module when used to just list subtests,
+	 * where module is not available. Fallback to _new_from_name().
+	 */
+	if (!l)
+		return kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
+
+	tst->kmod = kmod_module_get_module(l);
+	kmod_module_unref_list(l);
+
 	return 0;
 }
 
-- 
2.43.0

