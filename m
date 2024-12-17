Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAABE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 10:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF54510E914;
	Tue, 17 Dec 2024 10:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLl7SEG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAC710E918
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734433097; x=1765969097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TERUawlA47wMCwfzhbrhe0VFv+vW7KTtwbAeqv0/yVU=;
 b=ZLl7SEG3G7FC8rNuxyuuoSzmYmZFAOOiF9TeWd2zW4m16vwKVDJTAPBN
 4zdoZPQ21sCfhW6L6BdFORbfl9mRYATxSyudHTkJnynfcZ4eQeLLdP8uo
 26Y4N1/DNT6xQGxCYounu0P8ENXPIeCvZjS6lh5ZOFsAf3lRrp0++uC/6
 fwM2Fuyic5h/rUOakYP0OAMVs5AYKZ8P2Ts3rpNzNDXm/yPZ9ROam9pGe
 WGqetHmqzNxJ7AQdAlU1c5+l6DegmadG2Ao7snUhL7Kl43NE6mGToqlLc
 i3jh0SJVMxN96WVGdc/qFVKTm1iPl3IQPJ9wwtoW0nZwDpKnOJwCDl+Np g==;
X-CSE-ConnectionGUID: lpIMKCOxRv2mR9qgndTmIg==
X-CSE-MsgGUID: zjZSMGfWSOCjmakW4ui12w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38628801"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="38628801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 02:58:17 -0800
X-CSE-ConnectionGUID: Gf0TIDqfQA69d1qylJ3eEw==
X-CSE-MsgGUID: BN/2SvaiRvq/sWj+6IfRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97397325"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.48])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 02:58:14 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Ilia Levi <ilia.levi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_core: Use suffix for casting to long to avoid
 overflow
Date: Tue, 17 Dec 2024 11:58:07 +0100
Message-Id: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Multiplication without using casting to long (long) for at least
one argument in expression may cause overflow especially when we're
using this for calculating timeouts in nanoseconds precision.

Ensure we're picking valid ul/ull suffix for base definitions for
all dependents.

Reported-by: Ilia Levi <ilia.levi@intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
---
 lib/igt_core.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 90f57402f0..1b6e70182b 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1517,11 +1517,17 @@ void igt_kmsg(const char *format, ...);
 #define le32_to_cpu(x)  (x)
 #endif
 
-#define MSEC_PER_SEC (1000u)
+#if __WORDSIZE == 64
+#define MSEC_PER_SEC (1000ul)
+#define USEC_PER_MSEC (1000ul)
+#else
+#define MSEC_PER_SEC (1000ull)
+#define USEC_PER_MSEC (1000ull)
+#endif
+
 #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
 #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
 #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
-#define USEC_PER_MSEC (1000u)
 #define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
 
 #define for_if(expr__) if (!(expr__)) {} else
-- 
2.34.1

