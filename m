Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6117CC83F20
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 20:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEE110E38B;
	Thu, 10 Jul 2025 20:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOmTX6gR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF9410E38B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 20:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752180805; x=1783716805;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=weAbstxvJKwIMtAYqu72ZCuhs01ZQcg27DkBMJDgr3Y=;
 b=QOmTX6gRrDbSG38IDmpXcJHxxo4Z+11G5MQucl8s+clXx3N9KGEHUy3k
 KiWKvdDG7UG88/6Bf8vb//4u+2DuVBMrX7uIvsFQhc5vwGTntT66/0p1S
 DqMrO8UaVDJKDocYEK6O5ahArJt74U20hUL+ZgskaP9eqR/TvlpiLUYPD
 8groH2WozOnRBOFbnLTkUIGAFQslieVciXI9u6+LKY25dQBAz3JHtltF2
 siX24gBHrtxB2ZKO+ypHFnCPjP+FNvhFIPSDmGF67xpkylXGWPBMZSBXn
 6hH8kvd90oIwpp2yUBgY9NsYZGWw8wX2/dcFnlOAc7KG+pe+EJGjxsDz9 Q==;
X-CSE-ConnectionGUID: 1XhvLz9VT/SJjZ0tvmoDiQ==
X-CSE-MsgGUID: 7NkNvSr9S221Pmh2pYO/vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="42107927"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="42107927"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:53:25 -0700
X-CSE-ConnectionGUID: 1q5WUEbiR22+iHYwqJBBvQ==
X-CSE-MsgGUID: DMBFEglbRru3pc/JBE6X2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156288518"
Received: from spandruv-desk1.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.110.234])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:53:24 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 10 Jul 2025 17:53:10 -0300
Subject: [PATCH i-g-t] tests/xe: Fix usage of xe_dev_max_gt() for array
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250710-fix-use-of-xe_dev_max_gt-for-array-allocation-v1-1-4b255bba56d8@intel.com>
X-B4-Tracking: v=1; b=H4sIADYocGgC/x3NQQrCQAxA0auUrA2k1ap4FZEhTDM1UDuSqWWk9
 O4Gl3/z/gZFTKXArdnAZNWiefZoDw3EJ8+joA7e0FHX06UlTFrxUwRzwiphkDW8uIZxwZQN2Yy
 /yNOUIy8uoVxPRDFKfzxHcPNt4sD/d3/s+w9NN+uXfwAAAA==
X-Change-ID: 20250710-fix-use-of-xe_dev_max_gt-for-array-allocation-e8400cce536c
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

The function xe_dev_max_gt() returns the maximum GT ID. Because the ID
is zero-based, if we want to allocate an array that can hold positions
for all possible GTs, we need to take xe_dev_max_gt() + 1.

Fix the current allocations to conform to that.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Fixes: edd059dcd652 ("tests/xe: Don't assume max GT ID is num_gt - 1")
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/xe_gt_freq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 2c90804282c9f9f2ca5cfd0ddc1c7b9f01410225..d0f35b10a5fe4b09779ca8120120b22c98477b44 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -408,8 +408,8 @@ igt_main
 		max_gt = xe_dev_max_gt(fd);
 
 		/* The defaults are the same. Stashing the gt0 is enough */
-		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * max_gt);
-		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * max_gt);
+		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
+		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
 
 		xe_for_each_gt(fd, gt) {
 			stash_min[gt] = xe_gt_get_freq(fd, gt, "min");

---
base-commit: eacde5c2acc37c1570e27b68b8b6c39d8b61fb32
change-id: 20250710-fix-use-of-xe_dev_max_gt-for-array-allocation-e8400cce536c

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

