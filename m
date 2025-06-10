Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0611FC5B552
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 12:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEF510E53A;
	Tue, 10 Jun 2025 12:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghvJ0al5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F8C10E53A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749558409; x=1781094409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V7Tekk2Kc3xEQLHWu0KYQBPyXZ5kj3rKeAF81NrtS0I=;
 b=ghvJ0al5Pc2vtk2VxmbjXa1oXv1lUoZy2amDCUXCOcQO//GCT2IpDTno
 PmwKlUvWWB6wlL/TI2O6JC7Gu8jrbKwDQcqBJMpK6r7/zJipuNWZG2JBN
 ZP7YacsseFnGjX0GoHOqRzKyPNnF26fid9LB74pZNZS2c71I/hdsS2jP0
 wqR4gQeVQr7zU6Mw0JJz24Zk9NysDZ6Ov2tSkJAaFFExgsGRUe21cNOxg
 9fDgnxEF0ivfmK5IOJGcxs3AnYVr0e72a0VGwknDXX3Z+yzjig6o/4ugu
 HKgGoFAldxq2Frzfx0w5DQCGSlpToJ/9fZo6YwILnK07TWNAnu3bxLWXK g==;
X-CSE-ConnectionGUID: YkYdU4QMShG+E2ssa09wqg==
X-CSE-MsgGUID: yoYg2PRWQOio1VavxwYoUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51749124"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51749124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 05:26:49 -0700
X-CSE-ConnectionGUID: 9LK/b53MR6GLmolojyfxmw==
X-CSE-MsgGUID: wFcXUXxxRpeHbxnnGFT3wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="184003254"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 05:26:47 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v9,
 3/3] tests/intel/pm_rc6_residency: Ensure that SLPC is enabled for
 test rc6-idle
Date: Tue, 10 Jun 2025 17:56:49 +0530
Message-ID: <20250610122645.2088257-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610122645.2088257-5-sk.anirban@intel.com>
References: <20250610122645.2088257-5-sk.anirban@intel.com>
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

The test currently utilizes sysfs to adjust the RPS minimum frequency
to RP0 in order to reach peak frequency. Therefore, skip the test on
older platforms where SLPC is not enabled.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/i915_pm_rc6_residency.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index d3fa95423..337f63e34 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -617,6 +617,9 @@ igt_main
 
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
+		igt_require_f(gem_using_guc_submission(i915) &&
+			      i915_is_slpc_enabled(i915),
+			      "This test can only be conducted if SLPC is enabled\n");
 
 		s_dirfd = igt_sysfs_gt_open(i915, 0);
 		stash_min = get_freq(s_dirfd, RPS_MIN_FREQ_MHZ);
-- 
2.43.0

