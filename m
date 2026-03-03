Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03088E67A6D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 05:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD03710E62F;
	Tue,  3 Mar 2026 05:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nN1E+YYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7FC10E62F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 05:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772515868; x=1804051868;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uSHJkchh8qTxBo/aonRoR1487GcCeFWj2S1NVK2VC2o=;
 b=nN1E+YYdngNRbth4Vcily/LtSDUWzteR1ljWE+moeBTvKxX13Shxup5B
 XdkUmWPxy+3v60T5PIet9pnC3Vo9BN4jzi8aRBk8Tfr9xJVQq/OHmMq1+
 MaXwy/NOR8crqvh/Ld7DIOHtCVHCK9RuZ1M9t5z97+slqoZP5j6AgVblw
 gi6Wj7ETD0lkZOGNumfTqrRl4HiX8E7okHrIwpOKVFB86EL6FVOTgFbve
 PhLq06Hql9191uSDjl4+CjaB48pUwVhNcEGyPa+jJbw59c421+2/gp0Sc
 CQcUMFP3YrCsyPUtQGcg8kvyM9c0OMjpIegNad6PnYfibSrcwi0vqOWYl w==;
X-CSE-ConnectionGUID: BzgGYLx2T+aGfDYWbgNC9g==
X-CSE-MsgGUID: OADyPibWQf6SeX0SvD8pfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84630039"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="84630039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:31:08 -0800
X-CSE-ConnectionGUID: 1l+IerKYSoSDVHV/hkwyqw==
X-CSE-MsgGUID: zpk//oa9QiO9BsIpk5os+Q==
X-ExtLoop1: 1
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2026 21:31:06 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com
Subject: [PATCH i-g-t v2 1/5] lib/xe_util.h: add canonical helper for 48/57
 bit vas
Date: Tue,  3 Mar 2026 11:01:00 +0530
Message-ID: <20260303053104.1674811-2-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303053104.1674811-1-priyanka.dandamudi@intel.com>
References: <20260303053104.1674811-1-priyanka.dandamudi@intel.com>
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

