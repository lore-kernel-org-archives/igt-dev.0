Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7D1EF9014
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 05:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49DB10EB0E;
	Thu,  5 Mar 2026 05:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IA7RnUoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322E910EB0C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 05:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772688866; x=1804224866;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=g+FxnrQ7OwOVPpwMoIzfEp4cjwkbSaAzaiHpljjNuJ8=;
 b=IA7RnUoRgj69Mp74HIvKpTRr9Iw1ehcaIemLzIuXTicp/+9lkx6JetCg
 EN8z9JQBKWCQtrkl4noYiM9Xbw0BQNhLAq4gFNzg6jTL+xgHNnVJ2YmoU
 XKZN+VEp5JGAX+fiuD/o3oDMgcJNGsRatYMG6s47xk92aLp8Y/qgoaL8+
 dLi3kMXIHv+68J1q/70t8wklOact7ziEizA6BNyWeA7Ptps+ogqUQdMmk
 6/NhjC5Wb4ATw5eBxCCvXe8IfvkFOOA4vWSLC9utII8VMyH2plxloORaz
 ijn0lXxz+j1a0bYS8LCiP2qBI5u0S+LG/pg5TGGZYqMJK4MEUDsA39NOa Q==;
X-CSE-ConnectionGUID: Sw7lrhlwQLCp1fCOPaKUow==
X-CSE-MsgGUID: jlF2E+8xTHiyWFtYi0dBkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73833738"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73833738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 21:34:22 -0800
X-CSE-ConnectionGUID: KbkBO+sSSyGtZ3NQxhnX6Q==
X-CSE-MsgGUID: OqADWnJrRAOx4CCWAoR4Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="216388795"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 21:34:21 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v3 1/5] lib/xe_util.h: add canonical helper for 48/57
 bit vas
Date: Thu,  5 Mar 2026 11:04:15 +0530
Message-ID: <20260305053413.1734922-8-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305053413.1734922-7-priyanka.dandamudi@intel.com>
References: <20260305053413.1734922-7-priyanka.dandamudi@intel.com>
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Add helper which returns valid from hw perspective offset
ready to be inserted to gpu pipeline.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_util.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index a22572f35c..8dcfd2fb7f 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -7,6 +7,7 @@
 #ifndef XE_UTIL_H
 #define XE_UTIL_H
 
+#include <linux_scaffold.h>
 #include <stdbool.h>
 #include <stddef.h>
 #include <stdint.h>
@@ -54,4 +55,8 @@ void xe_fast_copy(int fd,
 		  uint32_t dst_bo, uint32_t dst_region, uint8_t dst_pat_index,
 		  uint64_t size);
 
+static inline uint64_t xe_canonical_va(int fd, uint64_t offset) {
+	return sign_extend64(offset, xe_va_bits(fd) - 1);
+}
+
 #endif /* XE_UTIL_H */
-- 
2.43.0

