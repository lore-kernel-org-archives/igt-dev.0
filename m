Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1B8CA1016
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 08:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25142889BE;
	Thu, 11 Sep 2025 08:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEhqzN/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1830889BE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757580588; x=1789116588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xBmqTFtHCN4ItJzW9lA4P8gU0PYK+O2B+l1BRDJsLAs=;
 b=SEhqzN/BR+WehE+lVnIL1QLxoqQIHIriFTvEAa62wj1U4+VDXjprqrF7
 tW30CVpd7NzlClbrJXLq/fWZ/ySC6Y0rfw3i/qWvzAHOtcTnscXP+/oXs
 9FRSKKWb3R9CUo3+/2ZgaSbTMt6WM8qxdTFrer3DCefk/kEVddpIZTpSk
 uotG0FC7wN4av869DKSAwZFycwzwttYV2b++Z9lkCL9Jrc00+7K4gzP1c
 2t90JfGCjw3lLvvyNVjDVqZjXNzSguHP/6vCouoIH4eZik2fyUVQwH0Q2
 T/4vsxHqm6NvziB4EsgFU/Y3GjYFdfJfYjL+OlCtyKYxn9sshYrfQCspC A==;
X-CSE-ConnectionGUID: 6PIzxOT0Sc+vlO541ju64A==
X-CSE-MsgGUID: gRHfCKDeRzCQ6GRBiWf8Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59599148"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="59599148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 01:49:40 -0700
X-CSE-ConnectionGUID: 1ztaElpZT2y8DRzLVr8+dw==
X-CSE-MsgGUID: GTpR0RDUQaesR6H9QdaL7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="172925481"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 01:49:38 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, varun.gupta@intel.com,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH v2] tests/intel/xe_query: Print both GT and tile in
 query-engines test
Date: Thu, 11 Sep 2025 14:19:27 +0530
Message-ID: <20250911084927.755143-1-varun.gupta@intel.com>
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
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
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

