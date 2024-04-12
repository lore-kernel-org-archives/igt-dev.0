Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F14C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF6810F545;
	Fri, 12 Apr 2024 09:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lj96R5rj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710D610F532
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913111; x=1744449111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6dKJTzB5vMS6hJ5q4fQABlbA1tlrLui24MK5HoWgpug=;
 b=lj96R5rj+ibrasH+l3FH3XvdparkIlb5yoFtqB5R/B0dVRIXnwcnA8wF
 x7E+K65+TaedhKxGBIPZQ2ydMEt3FUVHaFepD0Ca6i0rcGKUQxKZ6xM9W
 sgcDFSEYXu9z0VgMCuaaT/pvGh2XqHkKe+u6QJAvw+0lCPxaNr+at4D/F
 BmdVpaqQO8C1F3xSuWUPDMTgVdIEr+atbQpmqZGN0WPlXLMIOH6GRftLp
 sHiXlBP74/0cM7e/339ZcgmgHylCsGA38Cn7DfUrHMTpmtFwYnnPBfGSP
 CVZw4YI405tK82GOBVxrU8mqqHurWQVA9cmZyoY/zbT7wRAMroHNhRLNy g==;
X-CSE-ConnectionGUID: 0V/wekIdTG6T199My7/z7A==
X-CSE-MsgGUID: xS0Rld3PTquIS6e2RtANBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30842841"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="30842841"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:51 -0700
X-CSE-ConnectionGUID: 3Eez0nv+SQGGUFoCQWQpSA==
X-CSE-MsgGUID: 7X2oGB7YQc2E50jzvQnsVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25625093"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:49 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/gem_ctx_shared: Skip some test on MTL
Date: Fri, 12 Apr 2024 10:57:40 +0200
Message-ID: <20240412085744.21196-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412085744.21196-1-nirmoy.das@intel.com>
References: <20240412085744.21196-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

We do GGTT update on MTL using bcs engine, blocking that would
fail the test so skip such subtests on bcs engine for MTL.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_ctx_shared.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index d24ae5483..fd429306e 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -1047,6 +1047,12 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", e->name)
 
+#define for_each_nonblocking_ggtt_binder_queue(e, i915, cfg) \
+	for_each_ctx_cfg_engine(i915, cfg, e) \
+		for_each_if(gem_class_can_store_dword(i915, (e)->class) && \
+			    !gem_engine_can_block_ggtt_binder(i915, e)) \
+			igt_dynamic_f("%s", e->name)
+
 igt_main
 {
 	const struct intel_execution_engine2 *e;
@@ -1104,22 +1110,22 @@ igt_main
 			}
 
 			igt_subtest_with_dynamic("Q-independent") {
-				for_each_queue(e, i915, &cfg)
+				for_each_nonblocking_ggtt_binder_queue(e, i915, &cfg)
 					independent(i915, &cfg, e, 0);
 			}
 
 			igt_subtest_with_dynamic("Q-in-order") {
-				for_each_queue(e, i915, &cfg)
+				for_each_nonblocking_ggtt_binder_queue(e, i915, &cfg)
 					reorder(i915, &cfg, e->flags, EQUAL);
 			}
 
 			igt_subtest_with_dynamic("Q-out-order") {
-				for_each_queue(e, i915, &cfg)
+				for_each_nonblocking_ggtt_binder_queue(e, i915, &cfg)
 					reorder(i915, &cfg, e->flags, 0);
 			}
 
 			igt_subtest_with_dynamic("Q-promotion") {
-				for_each_queue(e, i915, &cfg)
+				for_each_nonblocking_ggtt_binder_queue(e, i915, &cfg)
 					promotion(i915, &cfg, e->flags);
 			}
 		}
-- 
2.41.0

