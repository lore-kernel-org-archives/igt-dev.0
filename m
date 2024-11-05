Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87D6D1CA38
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631DF10E51C;
	Tue,  5 Nov 2024 06:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccFaruIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E242410E51C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730788385; x=1762324385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5BGbhezOgVeK2DzoXDQ9QYynRIjjcOybkCzCDP13HSk=;
 b=ccFaruIx7vQe9uOsPlFxODjDunmAZU4ZFS2ERSmRjuTs9tXxNmzq/9Og
 zGFpA8VtXpB0+66Bqu14BJC6ZqNkzglJeMutsXa4KFm0yOq445yIcozRG
 zxXkuQKuIVx/ml9fJ/EOJV043ljihRCHKZTOUW1N8IQUPquyDuKZixk8a
 GDQ8xttOFIDJRFrbvQ7JazIy8rZkIajWG2QXuGxrtoVGha77RCs9otuDt
 jQqjTnKWai4HUcR4jUCVXRtvfUmHH1IyIL1eDYeioGUBfgqprHucpFCgd
 rpwtBrvGbcM6gz+mO0j7gA2K3WyNDjqWAgqMoiwRTctWi/OT5a4Ldw2YM Q==;
X-CSE-ConnectionGUID: rKu0L5ZOQ5e0Ayabmn+uOQ==
X-CSE-MsgGUID: Izwcu8STTQShpJzCKxuE2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30470556"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30470556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:33:04 -0800
X-CSE-ConnectionGUID: MQ/vhTSSTr29n4F/LsXfrQ==
X-CSE-MsgGUID: rjBqG1BrRwSVfnvev9F7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="121368002"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa001.jf.intel.com with ESMTP; 04 Nov 2024 22:33:01 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, John.C.Harrison@Intel.com,
 sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/xe_gt_freq: Change basic throttle API
 test criteria
Date: Tue,  5 Nov 2024 12:02:28 +0530
Message-Id: <20241105063228.452559-1-raag.jadav@intel.com>
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

Basic throttle API test is implemented in a way that expects multiple
sysfs reads to provide atomic results. Since atomicity is never guaranteed
between multiple sysfs reads, this is an incorrect expection from the test.
Change the test criteria to check for boolean value from throttle status
and throttle reasons sysfs entries.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3254
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3147
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 tests/intel/xe_gt_freq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index de4d111ea..632415d33 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -121,10 +121,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
 	reasons |= get_throttle(fd, gt_id, "reason_vr_tdc");
 	reasons |= get_throttle(fd, gt_id, "reason_vr_thermalert");
 
-	if (status)
-		igt_assert(reasons);
-	else
-		igt_assert(!reasons);
+	igt_assert(status == true || status == false);
+	igt_assert(reasons == true || reasons == false);
 }
 
 /**
-- 
2.34.1

