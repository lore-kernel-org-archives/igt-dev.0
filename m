Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CC4C5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 23:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A88110E577;
	Mon, 26 Feb 2024 23:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RISfcguG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3503D10E817
 for <IGT-Dev@lists.freedesktop.org>; Mon, 26 Feb 2024 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708991982; x=1740527982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ulKLc1VwDxDJP7J0I9tOqADJMJtJ88ydt4QhxWG9/UM=;
 b=RISfcguGe9ewH/pNw++LPzHjHQ7uj95jE3f0ItSJi/R14TKnYvBb/hgb
 DmSjVGL51N+E7my78egV9rMVvgGHusSR1R8AbTJaxtITcDxHb++MTqf70
 a8UeWSD1b26/YR9wrQ7rqRvQ57YOvQZeeY7GUvQaPlDJ4QAVMeNmDC6Yi
 3gFwMfKa+byUb4LpIv1sK3q62TKsl4lpSuA4UHwYEkqmD4bz0WlPXIWID
 2Tx5No5rFRM5hcBGNkxqj0GEc2xim9LjgPi76RusL6/o5K35qq5u/kWsA
 Ys5MYisCbhss2Yv4mhg0REwzsh1Hd2gxsRjkeRyQYwIx6h2JeOXWxY2ft A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3471586"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3471586"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 15:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7050617"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2024 15:59:40 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: johnharr <johnharr@invalid-email.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/gem_spin_batch: Skip compute engines on
 MTL due to w/a
Date: Mon, 26 Feb 2024 15:57:35 -0800
Message-ID: <20240226235737.2150915-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
References: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
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

From: johnharr <johnharr@invalid-email.com>

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

