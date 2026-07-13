Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388C8C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 13:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA06310E5F1;
	Mon, 13 Jul 2026 13:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ei+A33Ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D5E10E5DF
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783949898; x=1815485898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JrGImLCqZJ6UD8iDqV+BFAGTin2tpvdRBO0oS9/yAE=;
 b=ei+A33HtcG5VwSEogfjbxuulW3egUcXkD/DGb3ffCZ2A48pgvNtUs4Vh
 Cq7/pLdJCrxPBcmpPX7qW07h/KJRWSaqXndFlF6stWyKo/1CuIHPcmL+n
 5HeNm7FCsjcmVBzWXYPuocoyIwdvL9XAgH/iP9l42s8mZxNGexmF+ugpk
 TRyJSDbHHuKVm//hiJu3ShJfFPqPhF7v84iepjrh9e9zAyXVWnQKK11uV
 DWWOnHq9fyCgwP7psgW4GI2eMso0bMUU3z77T0XHcWb7GdyP6/qQJ3Blh
 d+bgF/UXc4Fl8b/cTu1iL5eCAOwka17sEHWFQK3sDf7rDnFAqb8wUDb1s g==;
X-CSE-ConnectionGUID: URUnkZQ4S/iScLbPWYm6Cw==
X-CSE-MsgGUID: wtbfB7YbTm+tCRhbjDS5lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87101709"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87101709"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:38:18 -0700
X-CSE-ConnectionGUID: xuPQHIyyRiu7CY35CarItQ==
X-CSE-MsgGUID: QcRoOIbFTj2OcbZfjzhOKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="285639114"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:38:17 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v6 05/11] lib/intel_bufops: Add intel_buf_mocs() helper
Date: Mon, 13 Jul 2026 15:37:40 +0200
Message-ID: <20260713133746.453051-6-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713133746.453051-1-jan.maslak@intel.com>
References: <20260713133746.453051-1-jan.maslak@intel.com>
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

