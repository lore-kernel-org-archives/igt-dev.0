Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EF8D10C11
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 12:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4275110E4A6;
	Mon, 28 Oct 2024 12:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XuhIbNB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F76F10E4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730120277; x=1761656277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M3Tk8ZjDIvtRsQdAueNIskt+zhde4qBgRfeH6gcIZ68=;
 b=XuhIbNB+1OEg1QNprt6pO1KGaYsqJcUVkflpQ3vWd5ne3LXhUj3E+/Qo
 XbtQiPD0/VSyHEtVjRzclbvY2rs9SF5hGVaG1IEF/xuSqtCyrljwiKnL0
 z2E0kPDeXka+oEUob/iIgg1Gkc+2IScZt/rZLnk894O/abpSr0ROV74yY
 KaUpvfLCQ0+om+17Cw75drGielEDSQOmm2XqLI3scKwfkPqyZeGYZ60ax
 IXFTFuPD+k+mRjGE0oPTONalVAxoVRIRzmDeJVOKvDkEDiJdUEZdDqOq7
 OqEvUBFwYmsZWW0n9YmyVvYoMl6t9DTYoC9oiHSy99wt41yMRKM0RYOVO g==;
X-CSE-ConnectionGUID: OPby22DHQ6uoFRAbAH4CTg==
X-CSE-MsgGUID: Mj/DkdoiTb2wqRMATi4JHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="41105447"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="41105447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 05:57:57 -0700
X-CSE-ConnectionGUID: GVVsM6nYT6akWOgQDNzXrA==
X-CSE-MsgGUID: xuZi5wBXR+iUek3sfgDCIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81669820"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.29])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 05:57:55 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_ctx_persistence: Wait for context
 termination
Date: Mon, 28 Oct 2024 13:56:42 +0100
Message-ID: <20241028125640.22936-3-krzysztof.niemiec@intel.com>
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

In the smoketest subtest, there is a race condition - if a
non-persistent context is not terminated by the driver before the
associated spinner is ended and probed for status, the status will be
incorrectly reported as completed.

Add a check before the spinner end to ensure this does not happen.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_ctx_persistence.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 974444cf1..f21920fc5 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -1173,6 +1173,10 @@ static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
 	drm_close_driver(fd);
 	flush_delayed_fput(i915);
 
+	/* Give the kernel time to terminate the non-persistent context */
+	igt_assert_eq(wait_for_status(spin->out_fence, timeout * 2),
+		      expected < 0 ? expected : -ETIME);
+
 	igt_spin_end(spin);
 
 	igt_assert_eq(wait_for_status(spin->out_fence, timeout), expected);
-- 
2.45.2

