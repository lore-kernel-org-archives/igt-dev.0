Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16273E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 05:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C922E10EAB4;
	Wed, 18 Dec 2024 05:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW9pARtq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CD210E17D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 05:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734498839; x=1766034839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q/zfOZrmJMVM44jnRTEW0/OEvCz1xqJILrRkMUgYFLU=;
 b=iW9pARtqieY/WbdVr7C2hzrHq76lyf5g7Mb+h2d6EIXAsECpQgdqGjVw
 iyX4kVXG9LVFSNNlcwBtH85m+NeijTy+nCwdXVfjtkCc6jFAFLe0WHE7J
 G6df2mkVk4d7ZcuhCNnxLfrgMnN499FhuIil+BsluiLoK1Y/tgmfUV589
 oPTTdAWZ7YLnJdNJyrtDW8/cgAXasSBacnhGskoPE0d7u1KNuWqPWVVvU
 LZtFf9bKbf/sCKki0w+Lg5xpVwUo8p6Vg8rbQYSzIhFHUKlF72mvhtBeB
 BfRl6afUrQ5cgl/hVpeu9h13kP2EHKSW+CLI9p/pm5xrc2JbV4ahiK6TS A==;
X-CSE-ConnectionGUID: MPRd/fq0TkekAwMHO3sAcQ==
X-CSE-MsgGUID: GyHxlw/+QR+FcNuNL3gdKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45649498"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="45649498"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:58 -0800
X-CSE-ConnectionGUID: CBrRSPv/QOWbddhzMGRIbw==
X-CSE-MsgGUID: +qNzZ/8QRhGLOgDax/qLnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="102588174"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/4] Device scan fixes
Date: Tue, 17 Dec 2024 21:13:20 -0800
Message-ID: <20241218051324.2696557-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

This started with the goal of fixing xe_wedged (besides the fix to the
kernel that is in flight), however the issue of device "disappearing
from bus" looks similar to several other issues we occasionally have -
it may be the same issue. Try to fix it by forcing scans.

Lucas De Marchi (4):
  lib/drmtest: Fix drm_close_driver()
  lib/igt_sysfs: Fix close when rebinding
  lib/igt_sysfs: Move close to be common to all actions
  lib/igt_device_scan: Fix scan vs bind/unbind/reload

 lib/drmtest.c         | 26 ++++++++++++++++++++------
 lib/igt_device_scan.c |  2 +-
 lib/igt_sysfs.c       |  8 +++-----
 3 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.47.0

