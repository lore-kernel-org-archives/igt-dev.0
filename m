Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1C4CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8971710E8A7;
	Wed, 10 Sep 2025 08:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUGVxF2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8576F10E8AA
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757494663; x=1789030663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PFqsbRDSCX624gDpwlk0arhc1YHL2piOPQ9jTKf3PfI=;
 b=TUGVxF2OMlO5fyhNIvOh2WGbP605cnc8MJKpNGwL47wjCBzdvjKaruOT
 j2DvGfYcGerabED+gEpx+39Dm7Pqy5Mo/z3H3Aj1YqpcXImR1Q2+3L4GK
 4CPQCtHB4AUhTVa4fXEG3mc70SpxMQTRyRUwUxRj2RjPx95DvOIrAgq+2
 2dbIiTb27jC/urEioF2omAZSAL4xyreXdgrL52ELGLzjdVEy4huOyQXZ5
 eZI82fY3tyNThEn7v2AxYsqR1sUHZZuG0do0i0oJnb+H6bQ5qV9HQkvoi
 zZqjmE7BL7ncSBm80RjjGezumB6vUzMcDMylKFR5vyj6iM1kc0M4bCcWt g==;
X-CSE-ConnectionGUID: 1G62EOIQQ/CTQpv5RWT1Ag==
X-CSE-MsgGUID: I/61eAUBR4Ko/b/i2UC61A==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58839246"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="58839246"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:57:43 -0700
X-CSE-ConnectionGUID: UxCfeZwZSmy2LUAm1O1A8A==
X-CSE-MsgGUID: MN39gwtvQI2oKrzS8QEX2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="174123358"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:57:42 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	varun.gupta@intel.com
Subject: [PATCH] tests/intel/xe_query: Print both GT and tile in query-engines
 test
Date: Wed, 10 Sep 2025 14:27:36 +0530
Message-ID: <20250910085736.428669-1-varun.gupta@intel.com>
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

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_query.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 96352da2c..18f8d7a3e 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -196,9 +196,9 @@ test_query_engines(int fd)
 
 	xe_for_each_engine(fd, hwe) {
 		igt_assert(hwe);
-		igt_info("engine %d: %s, engine instance: %d, tile: TILE-%d\n", i++,
-			 xe_engine_class_string(hwe->engine_class), hwe->engine_instance,
-								    hwe->gt_id);
+		igt_info("engine %d: %s, engine instance: %d, gt: GT%d, tile: TILE-%d\n",
+			i++, xe_engine_class_string(hwe->engine_class),
+			hwe->engine_instance, hwe->gt_id, xe_gt_get_tile_id(fd, hwe->gt_id));
 	}
 
 	igt_assert_lt(0, i);
-- 
2.43.0

