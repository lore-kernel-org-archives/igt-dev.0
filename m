Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10333C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 14:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A376E10E8E4;
	Thu, 10 Jul 2025 14:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBFpd/U8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0F610E8E4
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752157892; x=1783693892;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=td8PdR5NSaILdYNUqPbZrehi59yAZpek7roKlhfo/ls=;
 b=TBFpd/U8XgJVlwED+3eEyrog000CRd9oHVVAuXSwrObZliRc5gnP97Bn
 Cwatz6SpItzTwVVWE594DH6O+9Z7njiceKn7sy3MIzZ6zlcYoaW6FG+NA
 uYVHbcHCigIZq/2cjDUbbdtZTJWuH9qMqbiei9wNQDXvvneCkkpsUuKRa
 T8rZtInFv9Z3BoiS/EB3T2F0tqfs+Lm7Yp47/wfLKewO4HymNsRNewbmC
 FtARCdj4lALDhIpyZEC1GCa84wDSOG1kvvGowMDFQbW/zXx37CEJMbbj5
 qCKfrAo1dw800sm+5MCW34LZegdfan/RcA0DTT54h8ScDmpbvLBGcZsMZ w==;
X-CSE-ConnectionGUID: /SsBlbISSDaee9sX/uqZUA==
X-CSE-MsgGUID: fnv3cdqJQRywWo6sWFUCKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65502612"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65502612"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 07:31:32 -0700
X-CSE-ConnectionGUID: LVMZaD7jS7aM2wTibL35Pw==
X-CSE-MsgGUID: 5yEJL+JuTS2+Z5CnwQ/bUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="193321046"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 10 Jul 2025 07:31:30 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_plane_cursor: Optimise plane cursor behavior
 on simulation
Date: Thu, 10 Jul 2025 20:09:13 +0530
Message-Id: <20250710143913.1208675-1-pranay.samala@intel.com>
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

Reduce the number of cursor positions and limit the
execution only to a single pipe during simulation.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane_cursor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 1b72515f7..9ce35e045 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -237,6 +237,8 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
 
 	for (i = 0; i < ARRAY_SIZE(pos); ++i) {
 		test_cursor_pos(data, pos[i].x, pos[i].y, flags);
+		if (i == 2 && igt_run_in_simulation())
+			break;
 	}
 }
 
@@ -347,6 +349,8 @@ igt_main
 						test_cursor(&data, size, tests[i].flags);
 
 					test_cleanup(&data);
+					if (igt_run_in_simulation())
+						break;
 				}
 
 				test_fini(&data);
-- 
2.34.1

