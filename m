Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFCCC48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 19:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EB410EA44;
	Thu, 22 Feb 2024 19:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1VDvSyr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5E110EA44
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708630234; x=1740166234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bKlDWPhhAyx4Ikxd/oaFTOR069OBiAFAH/S6tyag9hM=;
 b=T1VDvSyrGJn+4HSil+e6UKZ2UkktSAlQzaXoGzdhz4io8k8ZxV2KEq4Y
 lTVuzuMlPR0/apgh0JFPkrufIqAGDz+/LEP/pIard/lhMwSUV2nP16JAJ
 z9spBKuWX05MfFneTHIyLnQv/9+r3d40Fp2RFrMW8E42MMQVJClbyylLW
 uJAKTyXWttA5uVqaIy6IbWEsVOcpfz6wWnH/IBEbek5wb5NR7Z/x1IRJN
 TFuUCuHofSw5dYpSiEgd081R+6xjXi3HlU7/k8FMQ7KiFm9ZTSMgM2xa0
 TCh7Q8MSpU3g4mnIoRWMPgAo6L3VGZuv/ZrmLkmlscg+aUYRoHihlBSA/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="5841654"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5841654"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="936893140"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="936893140"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:30:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Allow to load kunit from alias
Date: Thu, 22 Feb 2024 11:30:44 -0800
Message-ID: <20240222193044.3004471-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index cc242838f..43c52eaab 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1443,6 +1443,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 int igt_ktest_init(struct igt_ktest *tst,
 		   const char *module_name)
 {
+	struct kmod_list *l = NULL;
 	int err;
 
 	memset(tst, 0, sizeof(*tst));
@@ -1453,9 +1454,14 @@ int igt_ktest_init(struct igt_ktest *tst,
 
 	tst->kmsg = -1;
 
-	err = kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
-	if (err)
+	err = kmod_module_new_from_lookup(kmod_ctx(), module_name, &l);
+	if (err < 0)
 		return err;
+	if (!l)
+		return -ENOENT;
+
+	tst->kmod = kmod_module_get_module(l);
+	kmod_module_unref_list(l);
 
 	return 0;
 }
-- 
2.43.0

