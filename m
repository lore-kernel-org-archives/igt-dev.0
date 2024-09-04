Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFEACD4F48
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 22:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D915D10E070;
	Wed,  4 Sep 2024 22:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKMfXpie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB15910E070
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 22:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725490675; x=1757026675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0225VgtiiaRyHEqC2oH8c0iuvviZIvNeOC1ifZv5yBw=;
 b=OKMfXpieFvT1dsAfv18fFW+COSyK62PBSjWC9qXDXpXesfNDBDVx1nHO
 hnrKEJrzmPmkQxqY0hGY9TVm490uGErusPoEmK702XjLUiZxXiK2RcdVf
 qj4T4U+YdzkaW9yUmPAGaQBJxgINgZPw7xKmP9eF2R+kpdLDdRoOQyI1Z
 HMccOL+IWsSVfXj4haFC84upgLuS94xynem1gZB8oyFkK0u9VdQoSULcM
 6LBtHUY1OZeraiIE6ENmNR9cFf4irYvR4Hh2EarAHrLepAXZEXn09a0Ia
 o30aw1mB+R6xF+K9OdvTzXHOMDBFASTa54qhv9mAtvsWH75o3/L2FOsuz Q==;
X-CSE-ConnectionGUID: sSxsvFXHStSlFJk6dxwYLQ==
X-CSE-MsgGUID: l266MoXcS26FnL/cwPERlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23980961"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="23980961"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 15:57:54 -0700
X-CSE-ConnectionGUID: 4BYp9dN4TNW8lnrTes6/7Q==
X-CSE-MsgGUID: Cgyz7zU3SH2JWk4WEoIrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="69565867"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 15:57:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_drm_fdinfo: Virtual and parallel
Date: Wed,  4 Sep 2024 15:57:44 -0700
Message-ID: <20240904225746.2857448-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add virtual and parallel test coverage to xe_drm_fdinfo.

Lucas De Marchi (2):
  tests/intel/xe_drm_fdinfo: Wire up parallel/virtual submission
  tests/intel/xe_drm_fdinfo: Implement virtual/parallel exec queues

 tests/intel/xe_drm_fdinfo.c | 185 +++++++++++++++++++++++++++++++-----
 1 file changed, 163 insertions(+), 22 deletions(-)

-- 
2.43.0

