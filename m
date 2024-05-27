Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915EFC25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020A210E0DA;
	Mon, 27 May 2024 07:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7EB9j/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDEE10F8AD
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795277; x=1748331277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EgsjnrtDt1WtCU2L20Qn6u6C939TyqzPrO2FUebUYkM=;
 b=g7EB9j/UNUiRIzZVQyULs8/hWyK341EYgmuvd3460kCQNH8YMsYCj6DH
 SV+wcE+rcOiM8/Zb8EIERHNntGYAx8pFPoOBu/UdMY7G4PAMcZ+esSaRG
 jO07azdBsQmFtStusV+0N0PAHSNy1gS0ClhSjL9rG4aAAHM2SsnrN3KFn
 xvJjYHLeqeYJn3S4S1E8wh6KALw3VG5KD8sTNUPUGvB7vwgOG7GtYzk6V
 OABL8a0a0SqH1PYXnLuemA0SyHQyuxY2340rX41FgTpAXghP/kh77txr4
 Q5it25X1i59b0gMiO/kracmzJ4Zf6OiLfVWnHPsfurc06FFmY4Nsbct2D Q==;
X-CSE-ConnectionGUID: 3M1W9K0CQhqzKlc2VpVFPg==
X-CSE-MsgGUID: Go5pdUkiRRuNQeB78QhbbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24225299"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24225299"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:37 -0700
X-CSE-ConnectionGUID: RJqwJ/ayQBiLFUkoCHSy7A==
X-CSE-MsgGUID: ag9GVFqiTkaula1WhNGG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34584514"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:35 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 08/12] lib/intel_bufops: Drop unnecessary Tile4 function
 assignment
Date: Mon, 27 May 2024 09:33:41 +0200
Message-Id: <20240527073345.54729-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
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

