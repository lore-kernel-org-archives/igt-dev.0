Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C74CD6E60
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036FD113AA6;
	Tue,  2 Jun 2026 14:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAjkcaW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25F5113AA3
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780411137; x=1811947137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P2kOc/kDHRo0KTTnYhyCWYLa8SbnVRmwm9qV14IIR4Q=;
 b=PAjkcaW2Mts2MittqqS5vOaIrHdzcQSQhKUR8kBXUrlzeNH2WtkWmJqa
 6qHyJ+4D2lsq4iGgOG7fyHCUB3VLMcKoogLlZHSKmywXXmCq+5ABRT1ki
 SraeerbBWJoKWHEQSEA23bd4NR8AcbpnoX9ryE9WBUgaaufHee+M1lZ++
 DK4RS8Xt84zBbJCxSCZfMCl7Ll0FaGYOnORF10SMJCXnQMQUIC8zNXAtg
 DnnlJH+nI/RMRuNrW44WWzxKNfsqa3t1KDOJqaNy0GRLKWcBl76lWAGsL
 lIHDeP/2ljzC05MYxoIzXV6LpeVyfULfgh/WtZ7mk3JyT2M87hToge8Oq w==;
X-CSE-ConnectionGUID: FcPtxDgzQf+bNei1eUK29w==
X-CSE-MsgGUID: 8589PxKWSByZspn9Xpnl/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81226801"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81226801"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:38:56 -0700
X-CSE-ConnectionGUID: 80SclVo1S1ixP0Smc+M+IA==
X-CSE-MsgGUID: mjFIAL4YSbqOs5mn/xrlGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="239751528"
Received: from shawnle1-i9-build-machine.itwn.intel.com ([10.225.64.200])
 by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 07:38:55 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Subject: [PATCH i-g-t v8 0/2] tests/kms_vrr: Add full-range refresh rate
 testing
Date: Tue,  2 Jun 2026 14:30:04 +0000
Message-Id: <20260602143006.2416260-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series extends kms_vrr to validate hardware stability across the
entire VRR refresh rate spectrum, rather than only fixed step increments.

The first patch reverts a previous workaround that started virtual RR
tests above the midpoint to avoid mode fallback. This workaround is no
longer needed once full-range testing is in place.

The second patch introduces a 'full-range' testing mode to kms_vrr.
When enabled, the test iterates from maximum down to minimum refresh
rate (stepping by 1Hz), covering all supported rates within the VRR
range. For eDP displays, the test is skipped if the panel does not
support multiple refresh rates. Standard behavior (min-to-max with
defined step size) is preserved for existing subtests.

Lee Shawn C (2):
  Revert "tests/kms_vrr: Start virtual RR test above midpoint to avoid
    mode fallback"
  tests/kms_vrr: add support for full range refresh rate testing

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>

 tests/kms_vrr.c | 193 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 152 insertions(+), 41 deletions(-)

-- 
2.34.1

