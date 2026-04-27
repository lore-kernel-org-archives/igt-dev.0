Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64930FF8862
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 12:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1129F10E718;
	Mon, 27 Apr 2026 12:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApY1g/Vz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BD110E726
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777292701; x=1808828701;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JzrETQIoKFQjG2/S8s2hXTtkVsK2WIIvjHEwrzMYhis=;
 b=ApY1g/VzazyD4osNGQwfpwphd1UP7OBj7Fbzx/9v3Pz53DyWDal3E0Qz
 KQHYbQns83D9ALMnSx3etC0awgXg8nNBjBrtymOchwZBV5vRqYL1Ptu5O
 Zc4SHGQA/8YKiYYXH8R9xQqZDJw1HjwGWFFxw8UI5XI54kBGJQt/jQ9fz
 wDtzwop2OBZyxAfggz7RfrRcRXRup5635sqo5odNYcrz/MDTJiZnGFu3v
 FsDxJBHvKYZCMoVgNC6wipaLpA+2Z1bajYRuQ7x/787iVyaWQ/s9/uVbh
 HpVH/WiO9R5xLxS/Lh1Uix9gLMiogPFFhXKlUqiXQE6mQo4imlswJt8bQ g==;
X-CSE-ConnectionGUID: AgP0W1MfRFiFheadI0csgQ==
X-CSE-MsgGUID: Pub1A2PNSbuFx46TKFx1fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89262643"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="89262643"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:25:01 -0700
X-CSE-ConnectionGUID: WM/LZOEOQFepdtKV+E0LmQ==
X-CSE-MsgGUID: USr2xTUYR7KLN2WpNrauQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="271749413"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa001.jf.intel.com with ESMTP; 27 Apr 2026 05:25:01 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_configfs: Add malformed multi-line BB to
 verify ctx rejection and rollback
Date: Mon, 27 Apr 2026 17:58:24 +0530
Message-ID: <20260427122824.1132566-1-smitha.balasubramanyam@intel.com>
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

Add a test vector with a partially invalid second command in the
ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line
BB is rejected and the stored BB remains empty (rollback).

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 755524e7c..f024235f2 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -225,6 +225,10 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-engine-instance",
 		  .in = "rcs0 reg 4F100 DEADBEEF",
 		},
+		{ .test = "invalid-second-command",
+		  .in = "rcs cmd 11000001 4F100 DEADBEEF\n"
+			"rcs cmd 11000001 4F10G DEADBEEF",
+		},
 	};
 	char buf[4096] = { };
 	char file[64] = { };
-- 
2.43.0

