Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9BCD4920F
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 12:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E6410E4B1;
	Mon, 18 Nov 2024 12:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOjVIHto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678AC10E4B1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 12:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731932292; x=1763468292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nlfDQrsSYkX9IgZFGlU4AcjDNFVDO+JwfBn7XqCkxJk=;
 b=SOjVIHtoLHXB9OAXU3Llo7lYVI9sj9ukHAi2s70vcjnMVSuCkdtCLAV5
 dfZ3HfOHBnDydOhK9n+gPlyKFPr3ft4gvsyVMVmGzqOgF5bQ8hyC96TzQ
 WOYzV3vRte6PAqGU5e24EMaj5SlTxqU9dCc15Z9GGu10rpRSOLo3aWuWC
 SfhwoTRn004ic3T3ja6HzKVt44NFyKv6XRPNXBvZ7CxuKDi0tT+Vp1lfM
 WnPVmVjGcgwo0v3S00l51ul4z8KdV74EluQ7D+CIZn5bsVZNAS+agK75i
 3wptG7pMRjq8Xnz15tdSVy1QLIdqo2rgMelmG8Kk03PMBX/u3NRiy5ZGH Q==;
X-CSE-ConnectionGUID: kkIdtdSQTs6HNT03+jcaFA==
X-CSE-MsgGUID: mgUFe/hZRS+4DUkhdPDo3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="57288248"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="57288248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:18:11 -0800
X-CSE-ConnectionGUID: Zj1ulMjwT4W2rpFYknJGIw==
X-CSE-MsgGUID: 6QZZMdRVQ62La/f6Fkm43g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94299026"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.159])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:18:09 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/gem_ctx_persistence: Wait for context
 termination
Date: Mon, 18 Nov 2024 13:16:58 +0100
Message-ID: <20241118121657.10624-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

