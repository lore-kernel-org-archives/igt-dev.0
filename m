Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD0C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 19:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76811397B;
	Fri,  8 Mar 2024 19:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcIbNcVL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000711397B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 19:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709926293; x=1741462293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2fHgBf21bQHNBCL588wbWrXye5GKEWpFU0Y8U37BVhM=;
 b=EcIbNcVLT9HZ7J8jx2RRRsKxlho9dKVk1BXi7w8pMp7gfWlRkH2ZZCaO
 3bA8Nx7KLDiQDeT88f5acNbAMw1zuCMSLIXnab/Zi4+++lD3VBqgZt+XU
 LTG1rt2ZKMWZ7jhepzMbhzXk3yq/1owQOvQ9RnvbLKyCOlrWfxi3z6c2U
 Uh1ls4rRKFAgz9DEXMsz2TA4ahghVbsF48xgX1YrZIWsnh3J0eZx8TSD3
 oFiliVgYNcvR0DZksrMKuGYafzalOX7Y5dYJAFjCerR5QoJCRjEvC1Hvl
 rqz3RnjB1Qc8kvaEtvKn3e178Cw/bcluw1Yk7wrGNKcaXgwzCJbWXzKxn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="16067372"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="16067372"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 11:31:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="10950225"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 11:31:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3] lib/igt_kmod: Allow to load kunit from alias
Date: Fri,  8 Mar 2024 11:31:49 -0800
Message-ID: <20240308193149.2220807-1-lucas.demarchi@intel.com>
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

There was a bug in libkmod <= 29 that would make
kmod_module_new_from_lookup() return prematurely after a failed alias
lookup when we don't have a modules.alias file in the modules dir. So
add a workaround to check for -ENOSYS return code too. It should still
be compatible with what we are doing here.

v2: Fallback to kmod_module_new_from_name() since the kmod ctx is also
    used on builder machines to determine the test lists.
v3: Add workaround to bug in libkmod

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index cc242838f..d581f9073 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1443,6 +1443,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 int igt_ktest_init(struct igt_ktest *tst,
 		   const char *module_name)
 {
+	struct kmod_list *l = NULL;
 	int err;
 
 	memset(tst, 0, sizeof(*tst));
@@ -1453,9 +1454,25 @@ int igt_ktest_init(struct igt_ktest *tst,
 
 	tst->kmsg = -1;
 
-	err = kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
-	if (err)
+	err = kmod_module_new_from_lookup(kmod_ctx(), module_name, &l);
+
+	/*
+	 * Check for -ENOSYS to workaround bug in kmod_module_new_from_lookup()
+	 * from libkmod <= 29
+	 */
+	if (err < 0 && err != -ENOSYS) {
 		return err;
+	}
+
+	/*
+	 * Lookup may not resolve to a module when used to just list subtests,
+	 * where module is not available. Fallback to _new_from_name().
+	 */
+	if (!l)
+		return kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
+
+	tst->kmod = kmod_module_get_module(l);
+	kmod_module_unref_list(l);
 
 	return 0;
 }
-- 
2.43.0

