Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6341CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 04:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5F510E743;
	Thu,  8 Oct 2026 04:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWbBD+Ie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6C510FC39
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 04:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791434790; x=1822970790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4fceSCSG5fazkbiEVvXMZP8hYF2I6RjHrEO4YDfnvTc=;
 b=CWbBD+IeRGqEuyYmp6IkA2cPFIMxk12CUqDPFtUdkPFapPxrD1VGzSWx
 8Kb/h4zF/zqdxTC6vgqitHhHAiKQPcGj9jFNgC0epTGQJQ4cf/J7uIymH
 x8S+C+ByO0Fhtq2uSUMWNgHykrQlHq+dBeFoh9v7ETWpiKV+xUfkBkCey
 ZukLybkpB/8EeYOsZJqfBCmbC/KlB4yuZs3c7fZ+z+jSORHckbRkZzEXb
 x+tzg4Zi+QYEV8rbpkp0D3bnDceXyLH5JMENyIZEmcdvvTqliBMrTYLUF
 tb/75K9tnEbrr9pXh+7liiOwnOQTwBMCeYfkik5wx4M4MwCxNQZ+JP6uA A==;
X-CSE-ConnectionGUID: iFtswEnrRfeJWvUtAlLJrw==
X-CSE-MsgGUID: zn9b4WGZTIKBVBhcmM6y1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="90244"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="90244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 21:46:30 -0700
X-CSE-ConnectionGUID: 4sS5tkWhSb2VKggxIh4fag==
X-CSE-MsgGUID: jx/Qy0nSS3mM+a+B9hqb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="366799"
Received: from hgirotra-desk.iind.intel.com ([10.190.216.57])
 by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 21:46:29 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com
Subject: [PATCH i-g-t] Revert "intel-ci: Allow PXP negative testing on CRI"
Date: Thu,  8 Oct 2026 10:16:27 +0530
Message-ID: <20261008044627.2730162-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.53.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

This reverts commit f38ee7c7b3e3e5377808bfd793b56c536c16fda4.

Both pxp-bo-alloc and pxp-queue-alloc require the render engine
class to run, even as negative tests. CRI does not expose a render
engine, so unblocking them just makes the subtests SKIP on every
CRI run instead of being excluded, adding noise and hurting the
overall pass rate in CI without providing any coverage.

Re-block xe_pxp@.* on CRI until the tests are reworked to fall
back to a non-render engine class when render is unavailable, so
negative testing can still happen on platforms like CRI.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 2e7779064..41328186c 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -9,11 +9,11 @@ igt@fbdev@.*
 # Valid skip: Features / hardware blocks not present on CRI
 #   - xe_huc_copy@: No HuC support on CRI.
 #   - xe_oa@oa-tlb-invalidate: valid only for older gen12 platforms.
-#   - xe_pxp@.*: No PXP on CRI so skip except negative-pxp tests
+#   - xe_pxp@.*: No PXP (Protected Xe Path) support on CRI.
 ##################################################################
 igt@xe_huc_copy@.*
 igt@xe_oa@oa-tlb-invalidate
-igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
+igt@xe_pxp@.*
 ##################################################################
 # Valid skip: multigpu runs in separate config
 ##################################################################
-- 
2.53.0

