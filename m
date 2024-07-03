Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE2C31D97
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAD910E717;
	Wed,  3 Jul 2024 00:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZMj1c3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D4D10E6F8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966338; x=1751502338;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QcW0JwUw3NVuRXLuqtGxpqvaDPOmQzhAkCPJpvjN/rA=;
 b=EZMj1c3YpeCL/tWgDWkbuM7ms2EA0nSgz6Arm7iHojATIpVJ3JLT1lQh
 5WRPG4vD2Z6+0RCIA87hZdBxNWe1H2SWteKjx/4P8RAwtxqOcDaly6qi4
 gGoX4s1fUv5vPD5GgFm+qrsrkyFYruFitQ/TlKqWgqSW2BfA4Aos3/gV/
 AgSblE1Qw8BvO4B9ezlBNhtnfm7w87IDI7Ea07o5eSLmpFT/NQtMSHKSw
 ENuyV6+/0Gd7caBiSuJyFAmmXLjikEoPWfYNm4ihvocpEQmtRuHNGJu5T
 djoBJ0TxGSgOla3qfAIyxDcDz7vqfCWrpoAO2cYfwg/KKocKsqVuYA7ut g==;
X-CSE-ConnectionGUID: DAldQbjeRguOrVF9PdrUbA==
X-CSE-MsgGUID: MjSP0CeXTtuxYzTXZKkBwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074279"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074279"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
X-CSE-ConnectionGUID: l8QX8cFqQXucF7jSCwPigQ==
X-CSE-MsgGUID: R5IA7gb/RjmaeCLtsJRCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072858"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 00/10] Add per-client engine utilization tests
Date: Tue,  2 Jul 2024 17:25:22 -0700
Message-Id: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

Port per client engine utilization tests from i915 to xe.

v2:
- Add a test to destroy exec queue before capturing sample
- Include review comments from Lucas/Riana

Opens from v1 review
---
1) Documenting mapping for TEST_BUSY/TEST_TRAILING_IDLE etc to tests
- Not seeing a clean way to do this since some tests iterate over all engine and
  some over virtual engines and then some tests omit hwe/width/count params.
  Would leave it as is if acceptable.

2) Busyness > 100%
- sampling RING_TIMESTAMP before utilization values is likely leading to this
  error. Ideally RING TIMESTAMP should be sampled before 1st sample and after 2nd
  sample, but that's not feasible. It can only be one way for each sample -
  either before or after.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (10):
  tests/intel/xe_drm_fdinfo: Rename basic to basic-memory test
  tests/intel/xe_drm_fdinfo: Add basic-engine-utilization test
  tests/intel/xe_drm_fdinfo: Add helper to read utilization for all
    classes
  tests/intel/xe_drm_fdinfo: Add helpers for spinning batches
  tests/intel/xe_drm_fdinfo: Add single engine tests
  tests/intel/xe_drm_fdinfo: Add tests to verify all class utilization
  tests/intel/xe_drm_fdinfo: Add an iterator for virtual engines
  tests/intel/xe_drm_fdinfo: Add tests for virtual engines
  tests/intel/xe_drm_fdinfo: Add tests for parallel engines
  tests/intel/xe_drm_fdinfo: Ensure queue destroy records load correctly

 tests/intel/xe_drm_fdinfo.c | 587 +++++++++++++++++++++++++++++++++++-
 1 file changed, 577 insertions(+), 10 deletions(-)

-- 
2.38.1

