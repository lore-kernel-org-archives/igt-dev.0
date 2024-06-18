Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79798C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E0110E102;
	Tue, 18 Jun 2024 05:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcoJLc++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE9C10E102
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688224; x=1750224224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+IZcpwWlbN7jG7auDGqA2lFZf3GRqOUrHxNw3XSPlKA=;
 b=XcoJLc++F/yXI/cTZhoUt25GZry6zPIMl7450pqOriZ2k4t1HDO7vonu
 Ci/X6d9V6mjxd6X+b6zk8WD1MJNGX4GAHqu7ynNt68M3yyTxHxgupwA5s
 Jd9gJHABMslFnH0OPOsGkrxyIPdb5FuJRLGvvZEzLouuJO/jf4m7AFDbU
 MQy400k49zQAOsYOW45ez/qP/NkG9JFmZMe6C5nx0ehE3Ag3YKIggcwQ5
 pip2Cm00I+lF4H5JDH0Vsn3gLx++yDQ9vJ6S0jckIW6HrJpBUu9CkOYkk
 ELFY8qGQYjm6wgzm1SpJvOmv4hSE9BKrhUZXWxWu/bxmCc/s6wQP0Ifkv A==;
X-CSE-ConnectionGUID: FcLs/Pd2SjG90IyBKe/wPg==
X-CSE-MsgGUID: H0h2vGaaQVuXiaJCsnv+/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26660062"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="26660062"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:23:44 -0700
X-CSE-ConnectionGUID: deVRDcx9SM22VodPfp9urQ==
X-CSE-MsgGUID: u2r5ZC2SRjWAGpAFzu0Tsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41525117"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:23:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 01/12] lib/intel_bufops: Fix offset returned for Tile4
Date: Tue, 18 Jun 2024 07:23:24 +0200
Message-Id: <20240618052335.152588-2-zbigniew.kempczynski@intel.com>
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

Functions which calculates offset in bufops for specific tiling should
return it in bytes, not in cpp. Fix this issue for Tile4.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 52a5f322ea..313c2665ae 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -377,7 +377,6 @@ static void *tile4_ptr(void *ptr,
 		((tile_y & 3) << __builtin_ctz(owords)) +
 		(tile_x & (owords - 1));
 	igt_assert((pos & (cpp - 1)) == 0);
-	pos = pos >> __builtin_ctz(cpp);
 
 	return ptr + pos;
 }
-- 
2.34.1

