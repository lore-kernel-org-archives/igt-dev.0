Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD2BD6B6B4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 23:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B336D10E2C3;
	Wed, 30 Oct 2024 23:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2I/58dT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6106610E2C3
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730332169; x=1761868169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YM8AuWE4pgytJHDiNw74bDQsy51iBxzpHRCXb6Vk/40=;
 b=P2I/58dTqHP0T44DoSYn9QxpP1BkPUqQOrXS98+wdDy/4aagYcEL/wnh
 8yrvdXRcQ6DcTN7P9RCk63sH5uprrvz6+d1eBOMs9lQM/ER5nneqnu4jN
 B0lGpMUmXwHmB7TKD5opxn6EJE9IPUp22SyoxVz6MegNv3F0RRZPUz/0L
 nLMgG+P/+MJjahnuzJ+/1JlxwZzIggRgfN5M/hkKppwWSqOnn9bVCeeFz
 RglvMf9XmsPi7Hhte63tFbc3Nndo87ZWJ6UHhUZPMgyW4a+RcQGc80hiI
 fp/3VdtBd0fY7vHm4gQNSbZ93Iw4QpxuaOrsHctnr41F1KLWr0CZdLrtv Q==;
X-CSE-ConnectionGUID: pObTMS1PSUuksf+mezF0TQ==
X-CSE-MsgGUID: /vn5eePjT4aNk77IB8FGKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30013386"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30013386"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:49:29 -0700
X-CSE-ConnectionGUID: wV34L0cqQXGFxiSya+3VpQ==
X-CSE-MsgGUID: CuWga8TlSgy4i+Ow+qNTSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="82625767"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:49:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: stop using KMOD_REMOVE_FORCE, again
Date: Wed, 30 Oct 2024 16:49:08 -0700
Message-ID: <20241030234908.858018-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Just like done in commit 93ad5b785ea0 ("lib/igt_kmod: stop using
KMOD_REMOVE_FORCE"). From igt perspective, if a module can't be removed,
forcing its removal is not the right thing to do: the test should just
fail and be fixed.

If the kernel actually enforces KMOD_REMOVE_FORCE, then it would just
taint and all tests get aborted. Lastly, our kernel config doesn't have
CONFIG_MODULE_FORCE_UNLOAD set, so this is pointless for multiple times.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 75a0d057c..cc3e5e5b1 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1409,8 +1409,7 @@ static void __igt_kunit(struct igt_ktest *tst,
 			char glob[1024];
 			int i;
 
-			igt_skip_on(kmod_module_remove_module(tst->kmod,
-							      KMOD_REMOVE_FORCE));
+			igt_skip_on(kmod_module_remove_module(tst->kmod, 0));
 			igt_skip_on(igt_kernel_tainted(&taints));
 
 			igt_assert_lt(snprintf(glob, sizeof(glob), "%s.%s",
-- 
2.47.0

