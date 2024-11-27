Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84718D609C4
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 09:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84B10EA6A;
	Wed, 27 Nov 2024 09:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndY7qJp7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ED410EA6A
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 09:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732700749; x=1764236749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HaBzZWF3DeeYcw1X/jAPHQyUOyMzJykfrABte9Okrn8=;
 b=ndY7qJp7NPhMbMGAarjbMU1c5YBuJz8wV6rv3MCceaxmVEbvMYBP2AGs
 F1Y5k6d/S1rf7Sv1ToYLTgc9+OA4eosnf7Ijhr5Bg3wPYpb5JTTA4qN4G
 Zd3uXdbJL5p1TcauvjlOVmgDQXfVfg8EhWdDeXRKMj87M/eyPy6f/2n4g
 NF9Ro6dPuOGy2JOs9Cmie5W7nU5EPdp2hd9JETbbTGQ3dhGONojtdAzT0
 foBiHP0SUJw2/EEtggfEPUKNxlOSq/+K288IFGNRdl4FfsMRzqUmPCOvg
 3nny5aYcRE+bhij73AhDOvWo/X5LMiIP+Jl7IOk+ZxdHZDuYSb275ShfR w==;
X-CSE-ConnectionGUID: HO6nTwQhR7+33ivkd9WfaQ==
X-CSE-MsgGUID: PoLgwSPwQAeq0/WkhDR5rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43556100"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="43556100"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:45:49 -0800
X-CSE-ConnectionGUID: vTf3LOPrRPee25FVQqE1qA==
X-CSE-MsgGUID: YOYLaY18QMuObKAlzNvzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="91984021"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:45:47 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/gem_ctx_persistence: Wait for
 context termination
Date: Wed, 27 Nov 2024 10:45:28 +0100
Message-ID: <20241127094528.7041-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
References: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
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

In some of the subtests, there is a race condition - if a non-persistent
context is not terminated by the driver before the associated spinner is
ended and probed for status, the status will be incorrectly reported as
completed.

Add a sleep instruction before the assert to give the kernel time to
clean up.

v2:
 - Update the patch description,
 - Change the previous expression to a simpler usleep(),
 - Add a usleep() call in test_saturated_hostile_all(), as this behavior
   is also shown in this subtest.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/gem_ctx_persistence.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 974444cf1..d90b78267 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -1029,6 +1029,9 @@ test_saturated_hostile_all(int i915, const intel_ctx_t *base_ctx,
 	igt_spin_busywait_until_started(spin);
 	intel_ctx_destroy(i915, ctx);
 
+	/* Give the kernel some time to terminate the context */
+	usleep(reset_timeout_ms * 1000);
+
 	/* Hostile request requires a GPU reset to terminate */
 	igt_assert_eq(wait_for_status(spin->out_fence, reset_timeout_ms), -EIO);
 
@@ -1173,6 +1176,9 @@ static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
 	drm_close_driver(fd);
 	flush_delayed_fput(i915);
 
+	/* Give the kernel some time to terminate the context */
+	usleep(reset_timeout_ms * 1000);
+
 	igt_spin_end(spin);
 
 	igt_assert_eq(wait_for_status(spin->out_fence, timeout), expected);
-- 
2.45.2

