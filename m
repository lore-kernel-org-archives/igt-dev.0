Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DCEC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AD410E56F;
	Tue, 18 Jun 2024 05:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYAtQtV+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FA410E56D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688250; x=1750224250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mNCaW9x8sF5J1zDzhbTmXWgiLcwkANuRy4Z/5cAkoeQ=;
 b=TYAtQtV+McvJsBE0ziZNPar3b/iQ/WVXQu7bdcRrhB9jyzsuUHdOiR4N
 f4ssGbSE7jk0Yr5bYIToeYzaWJMbtNp33+mQWnH2kXO41DLlg7eH8CWDM
 FLZ5ggaHm2NpoaY1S+qTNVNr2CPYT3fX8UTSHaYypzz926EiwojHJLLbD
 xJcz3FSPo+oJ9SMopditGg62gsKRpgZsL1tleG1jmq3jnIy9TQxbe+gMf
 k0GTTsPK6QDv6zqPIZorE7aLjcMr0EuJLl5pCwLPIshf256fkc1E5YTJE
 ci/mIoslSP5f50IslhJJyk+qAdaTRSSKEXJkBjNF2sHMmtevFKIbd0puL Q==;
X-CSE-ConnectionGUID: 1RVT91RISKGvtv6hRS391w==
X-CSE-MsgGUID: OH/8XSHwQ5aw+SfFWfIfWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15666153"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15666153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:24:10 -0700
X-CSE-ConnectionGUID: WpXOYIXyT9Gup7GvvUejYA==
X-CSE-MsgGUID: iB0HnyogQY2EPtLR3Um3yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41286618"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:24:09 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 08/12] lib/intel_bufops: Drop unnecessary Tile4
 function assignment
Date: Tue, 18 Jun 2024 07:23:31 +0200
Message-Id: <20240618052335.152588-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
References: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Initialization is executed in bufops creation using appropriate
template in which all functions are already assigned so there's
no sense to assign them one more time for xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 38b720624e..70f70bfa9e 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1695,8 +1695,6 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		bops->x_to_linear = copy_x_to_linear;
 		bops->linear_to_y = copy_linear_to_y;
 		bops->y_to_linear = copy_y_to_linear;
-		bops->linear_to_tile4 = copy_linear_to_tile4;
-		bops->tile4_to_linear = copy_tile4_to_linear;
 
 		return bops;
 	}
-- 
2.34.1

