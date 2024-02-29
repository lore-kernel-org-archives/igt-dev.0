Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2A8C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 19:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A9210E5B1;
	Thu, 29 Feb 2024 19:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drKA3j3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8E510E4C1
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 19:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709235691; x=1740771691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mfvyvde2DYZPLIc4gP15sg9FAqqiMZ4K/CBDPURS7GA=;
 b=drKA3j3YhPb5j8DblL8Y7tei7QeTpvtLQEUvYYq8xXYhYz6dyRr4HsaT
 TYgANvbA0SGM/DRfN4LaLSABnMiPnOYg8Tj7ypW1U+f+Z/K1C1+T6BuiP
 ISPTYpComFIU3ogp7jgrMsfQg1FqyvN5F+mCI3higCqr6l2s58yXm55C0
 0j1J/uwY7EXf5TZu0yVLWSeukUHI2ThWIq7kRufWo2RS/ThXhmQ92J0jr
 IWon6qgCWZb5SuCxkPffDXWY98rnqoiLXcMA0K+CMpuC6IvOAt9WYVxYp
 8or75nnkwOSw99MfWqGJ+DJav+PVgcz7ogLCccv8pDVW0EpDwdPJ5tsAS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3909345"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3909345"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:41:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7821352"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 11:41:30 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel/gem_spin_batch: Skip compute engines
 on MTL due to w/a
Date: Thu, 29 Feb 2024 11:39:29 -0800
Message-ID: <20240229193930.2933130-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229193930.2933130-1-John.C.Harrison@Intel.com>
References: <20240229193930.2933130-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There is a w/a on MTL that prevents concurrent execution of multiple
processes on RCS and CCS. The 'spin-all-new' test is explicitly
testing such execution across all engines. So either the entire test
must be skipped on MTL or just the compute engine must be skipped. Do
the latter as that at least leaves some test coverage in place.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/intel/gem_spin_batch.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index ec1458e35197..a0f35b23c718 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -214,6 +214,19 @@ spin_on_all_engines(int fd, const intel_ctx_t *ctx,
 	igt_waitchildren();
 }
 
+/*
+ * Wa_14019159160:
+ * An RCS/CCS workaround on MTL means that contexts from different address spaces
+ * cannot run in parallel, they must be timesliced. However, a non-preemptible
+ * spinner cannot be timesliced. Thus the PARALLEL_SPIN_NEW_CTX test cannot be run
+ * across both RCS and CCS engines, one or other must be skipped for the test to
+ * not hit a heartbeat timeout and be killed.
+ */
+static bool skip_bad_engine(int fd, const struct intel_execution_engine2 *e)
+{
+	return IS_METEORLAKE(intel_get_drm_devid(fd)) && (e->class == I915_ENGINE_CLASS_COMPUTE);
+}
+
 static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 #define PARALLEL_SPIN_NEW_CTX BIT(0)
 {
@@ -230,6 +243,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 		if (gem_engine_can_block_ggtt_binder(i915, e))
 			continue;
 
+		if (skip_bad_engine(i915, e))
+			continue;
+
 		if (flags & PARALLEL_SPIN_NEW_CTX)
 			ctx = intel_ctx_create(i915, &cfg);
 		ahnd = get_reloc_ahnd(i915, ctx->id);
-- 
2.43.0

