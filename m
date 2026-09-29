Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0ECCA5FA7
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 17:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF6210E561;
	Tue, 29 Sep 2026 17:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXVFUVjf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4704610E156
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790703580; x=1822239580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8g+6wVPBNMtafHYNXILS0I5rHWPWlrZTj1zW0qYoQpA=;
 b=hXVFUVjfaV8yPQT7JzQ2lUNU0qFisauVqs599llEVqGgLJLY8hBTFM+R
 hKt56r4Li3UsnTQM/VrA4Y/nocnVI4kNTDFjUXDc+K3TiEKSCs4zDtsvc
 UlwSpmZAEqP45QjcQtag3iNKnGEQOn59U7zaVpvkFR8G3rdCcei0JCKwQ
 4hY/usUDCxDQQ7JZhQ0DsfxGgy8ZLzKYAxTLTtPnt5UfGNGsnZqZeN9Sa
 V5+uiOo5/6WjE8404ly0wBfbnCYqb6u3nAoK9Sv0RV3A1c7Vp7wr18QE0
 k/gUcOUwE0wcRwTYCa0nzdR+epUlCCxlRphFK/OCk49YyQsFzhGpi6/5n Q==;
X-CSE-ConnectionGUID: c2hWyjMJQpydMVh5HD+nBg==
X-CSE-MsgGUID: refIkA0lTBymn2A4t0/qdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90293114"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90293114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 10:39:39 -0700
X-CSE-ConnectionGUID: BA5FyCEWQ/C3OJFvElqbLQ==
X-CSE-MsgGUID: LgU8yW3WSyiSsPZQXP4IKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275573008"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 10:39:38 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_evict: Drop blanket skip when system
 memory < VRAM
Date: Tue, 29 Sep 2026 23:09:29 +0530
Message-ID: <20260929173928.3098760-2-varun.gupta@intel.com>
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

Since working_set() already clamps each subtest's allocation to what
fits in VRAM plus 4/5 of available system memory, and every subtest
loop has its own igt_skip_on_f(!ws) for cases that end up too small
to run. The fixture-level skip is therefore redundant and skips the
entire eviction suite.
Remove the skip and rely on the per-subtest working_set() sizing.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_evict.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 5a7298db0..230357419 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -911,15 +911,6 @@ int igt_main()
 		igt_assert(vram_size);
 		system_size = igt_get_avail_ram_mb() << 20;
 
-		/* Test requires SRAM to about as big as VRAM. For example, small-cm creates
-		 * (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
-		 * simplicity ensure the SRAM size >= VRAM before running this test.
-		 */
-		igt_skip_on_f(system_size < vram_size,
-			      "System memory %llu MiB is less than local memory %llu MiB\n",
-			      (unsigned long long)system_size >> 20,
-			      (unsigned long long)vram_size >> 20);
-
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
 				break;
-- 
2.43.0

