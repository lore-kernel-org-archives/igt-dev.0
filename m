Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658E8CAC58D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 06:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E747C10EA1E;
	Thu, 11 Sep 2025 06:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgwfFIYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F0C10EA1B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 06:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757570901; x=1789106901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+PhYryR5EMCkrMttcnCYIwPkMDl+tyS2dfBmJXfpEFs=;
 b=FgwfFIYBagx+1kf5KDwx47rxyd2cCV86H9XTo2rU8vP+84cxPMAxwl2n
 2A3K+4j8D176qgESRg2sPNNzcz15cYzMIAZpiPIADmP2q89gGuauOFVdC
 Ru2kQx6xPvh3EUdnzqXCQ3I9KRTc11UEEklOkC5LQfN1iRWxyUwOnL4KO
 FtDs4rFFlkNdCDD24bwVrMZgNFZ/Qi9GdH0xVFz19S26GZhS19kXxUjJr
 VaiG/9NmWuO0GAPmvWu+En9O5yDd1yBrXK5POwppPyX1ZM8dHMArhUEn6
 WOUUtsq5ZNOfGyw2ajH1KgOz6FNMP5g+EcHU1adTa07UTzbBz4j0wQWlb w==;
X-CSE-ConnectionGUID: 4EVfPdVaTbaEDXdPv7jWrQ==
X-CSE-MsgGUID: a2nlZXfpTDGpeT68+JLWxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70148189"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="70148189"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:08:21 -0700
X-CSE-ConnectionGUID: vfhBy/3fSWeDwcbttQ/wHQ==
X-CSE-MsgGUID: kd7hawP5Rk22VNyzaNJC7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="177642808"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:08:19 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	varun.gupta@intel.com
Subject: [PATCH v2] tests/intel/xe_query: Print both GT and tile in
 query-engines test
Date: Thu, 11 Sep 2025 11:38:12 +0530
Message-ID: <20250911060812.648416-1-varun.gupta@intel.com>
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

The query-engines subtest currently reports GT id as Tile id.
Update the output to explicitly print both the GT id and its associated Tile id.

v2: Cosmetic changes (Priyanka)

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_query.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 96352da2c..2de88fac9 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -196,9 +196,9 @@ test_query_engines(int fd)
 
 	xe_for_each_engine(fd, hwe) {
 		igt_assert(hwe);
-		igt_info("engine %d: %s, engine instance: %d, tile: TILE-%d\n", i++,
-			 xe_engine_class_string(hwe->engine_class), hwe->engine_instance,
-								    hwe->gt_id);
+		igt_info("engine %d: %s, engine instance: %d, gt: GT-%d, tile: TILE-%d\n",
+			i++, xe_engine_class_string(hwe->engine_class),
+			hwe->engine_instance, hwe->gt_id, xe_gt_get_tile_id(fd, hwe->gt_id));
 	}
 
 	igt_assert_lt(0, i);
-- 
2.43.0

