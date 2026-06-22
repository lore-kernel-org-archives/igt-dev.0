Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1084CD98E4
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 03:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A1C10E442;
	Mon, 22 Jun 2026 03:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtKm0uP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1E910E43D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 03:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782100290; x=1813636290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JrGImLCqZJ6UD8iDqV+BFAGTin2tpvdRBO0oS9/yAE=;
 b=VtKm0uP1VrGER5bKmjjjEYcK0+At/YHfgNDWnQ9wo2z/ev+rlHyhYSTC
 D8ggr6mOUuv87fJUpEAA/7d2RxiaE4Gy8cvQ3gjsbsCyRt2/ZXKH4u+G9
 bTk0wWFecFc+ciTYM17fX3bjP4LhtgdVuRUHrFQGI7QzihjVY/5IfSapw
 9ItDFlK+TCS8lso2A93HQl08c0mjX+r2bEqZpzlXrvsJCUziSz5AvE1zA
 clcoVOq4EwxqUOG3VSg0Z0dRpCpZ9FnYWEAFxJUk3kmMh1IODInUYPVEk
 rHALng6K4fUSIydFDDvOwql8g5oi5UsxpgbO8enrAhOe6G3rL3yvSQZkI w==;
X-CSE-ConnectionGUID: bPVHTzhZRzqo9qyyR+BaLA==
X-CSE-MsgGUID: 1Ayxud5ERSS3/5Sz0Z37sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82596518"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82596518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 20:51:30 -0700
X-CSE-ConnectionGUID: V1UT0dAARNmhwqNeLlBMUw==
X-CSE-MsgGUID: Fip2fR1CQmGKm5GiN5CAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248964530"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 20:51:28 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 05/11] lib/intel_bufops: Add intel_buf_mocs() helper
Date: Mon, 22 Jun 2026 05:51:00 +0200
Message-ID: <20260622035106.3023047-6-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622035106.3023047-1-jan.maslak@intel.com>
References: <20260622035106.3023047-1-jan.maslak@intel.com>
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

Some genxml-generated pack headers represent MOCS as a single 7-bit
field encoding both the 6-bit MOCS table index at bits 6:1 and the PXP
protected-content bit at bit 0.

intel_buf already carries both pieces of information, but callers would
otherwise have to open-code the packing each time they assign to a
genxml .MOCS field.

Add intel_buf_mocs(buf) to return the packed 7-bit value:

  (buf->mocs_index << 1) | intel_buf_pxp(buf)

This keeps the encoding logic in one place and makes genxml call sites
use the same packing convention consistently.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index d111346aaa..ead2c53e3f 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -210,6 +210,19 @@ static inline bool intel_buf_pxp(const struct intel_buf *buf)
 	return buf->is_protected;
 }
 
+/**
+ * intel_buf_mocs:
+ * @buf: the intel_buf
+ *
+ * Returns the full 7-bit MOCS field value for @buf, encoding the 6-bit
+ * table index at bits 6:1 and the PXP protected-content bit at bit 0.
+ * Use this when assigning to a genxml-generated MOCS field.
+ */
+static inline uint8_t intel_buf_mocs(const struct intel_buf *buf)
+{
+	return (buf->mocs_index << 1) | (intel_buf_pxp(buf) ? 1 : 0);
+}
+
 void *intel_buf_cpu_map(struct intel_buf *buf, bool write);
 void *intel_buf_device_map(struct intel_buf *buf, bool write);
 void intel_buf_unmap(struct intel_buf *buf);
-- 
2.43.0

