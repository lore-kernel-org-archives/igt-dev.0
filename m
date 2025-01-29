Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8ECC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 17:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E53410E849;
	Wed, 29 Jan 2025 17:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HM0CnUkd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C859A10E849
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 17:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738171585; x=1769707585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9OGDVyhpf1xZiNu4Nop590U9LXru7MlKBCodfEXdUMI=;
 b=HM0CnUkdInCWXqF9Zs3iMY/yMEcQDwXC8xvlQXgkZGEwUwmSiOVHEWu3
 vpk26VgkzpKp2MZdwq741Nnw2JK6TTD77pyfJ6DP9+7NbJXDmSAp6l/Xt
 u5yckpe+gwZ/eTL9xDt67hE4813cOPFBLZO/AbV8s3VEyIF4ryZadxk1K
 HEy3xakhrO0Mhamm2PLa7gexyoodVuFTeTORQd6tS+nsPzPhVPTusJdAB
 3o3iKndRbv6ZHMNt5O1vOw/OE29NswWdA65rN5lnRE5klkpLDtwaxHVaN
 zYvGR7xg+enNW8rn/6AhK/onEXrz4gG9QB/bmviS1kK0wNsMv0XEIlPtR w==;
X-CSE-ConnectionGUID: kSwRyc/MRA+4uqjXfRqf3w==
X-CSE-MsgGUID: XOLAy8IkQn2Ltxm3zrKHHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38580376"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38580376"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:26:25 -0800
X-CSE-ConnectionGUID: gv61BPZpRCmG+LXkvKQyIw==
X-CSE-MsgGUID: QYk6MZMOSqqcEWpSFgFgLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110007986"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 09:26:25 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/kms_pm_rpm: Restrict cursor tests to
 I915 driver
Date: Wed, 29 Jan 2025 23:11:51 +0530
Message-Id: <20250129174153.3654881-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/intel/kms_pm_rpm: Restrict cursor tests to I915 driver
  intel-ci/xe.blocklist: add i915 specific tests

 tests/intel-ci/xe.blocklist.txt | 1 +
 tests/intel/kms_pm_rpm.c        | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.25.1

