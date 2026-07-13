Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0319C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 13:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B4410E9AF;
	Mon, 13 Jul 2026 13:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFeiZXB6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BF110E5E9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 13:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783949899; x=1815485899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pZAWoGkkxracVrW6z2O/CKps3WrslXmjNRv57tdDs40=;
 b=mFeiZXB6VLQbhp8KKduz4ChjFou9OWYw65/uXJDxunf9hacsc1mH8/j3
 RpflCK04zbIIxfUrrSmhEXNPS6zJM0EjUFxiXkcRI3GjrG55NMzCU4IBV
 TL42D+RIvQkV4T9UJXG5J4S0HJQFHeFVh3RXUFoEqWXwNIQ0IllznpaD5
 /RZt+RwdkKg0tmAmi7rBFVKPNWWhbnBJr/BOYGhsQKu6wDQjBvQFD4L6I
 eKBVUmooVkx65pIX0PeIFzASXj6DNaQtmuU6zq5D0ExE7TFRac23OP10H
 3t+IWH4c2Y8dEIZsrwGk1mI2IE1d4+ktvpdK7Os9gScYDvNl2ZhKBtWVy g==;
X-CSE-ConnectionGUID: pVwtEndaTbaGESSZhuPRFA==
X-CSE-MsgGUID: gjEAojlNReuSSa6YsNGdFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87101711"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87101711"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:38:19 -0700
X-CSE-ConnectionGUID: GcZ0ocapTpi+u7m4lzvGkA==
X-CSE-MsgGUID: xTd/n3y+QrmD0b6bVKgl1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="285639121"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:38:19 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v6 06/11] lib/mocs: Add packed MOCS helpers
Date: Mon, 13 Jul 2026 15:37:41 +0200
Message-ID: <20260713133746.453051-7-jan.maslak@intel.com>
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
protected-content bit at bit 0. The existing _index() helpers return
only the table index, which is correct for layouts where the index and
protection bit are represented separately, but not for genxml fields
that expect the packed value.

Add helpers that return the full 7-bit value ready for direct
assignment:

  - intel_get_wb_mocs(fd): write-back policy, PXP clear
  - intel_get_uc_mocs(fd): uncached policy, PXP clear

Keep the existing _index() helpers for callers using layouts where the
MOCS index and protection or encryption bit are represented separately.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_mocs.c | 28 ++++++++++++++++++++++++++++
 lib/intel_mocs.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 778fd848ed..973bf9e7b9 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -81,6 +81,34 @@ uint8_t intel_get_wb_mocs_index(int fd)
 	return mocs.wb_index;
 }
 
+/**
+ * intel_get_wb_mocs:
+ * @fd: the DRM file descriptor
+ *
+ * Returns: The full 7-bit MOCS field value for write-back caching, with the
+ * 6-bit table index shifted to bits 6:1 and the PXP bit (bit 0) cleared.
+ * Use this when assigning to a genxml-generated MOCS field, which encodes
+ * both the index and PXP bit in a single 7-bit value.
+ */
+uint8_t intel_get_wb_mocs(int fd)
+{
+	return intel_get_wb_mocs_index(fd) << 1;
+}
+
+/**
+ * intel_get_uc_mocs:
+ * @fd: the DRM file descriptor
+ *
+ * Returns: The full 7-bit MOCS field value for uncached accesses, with the
+ * 6-bit table index shifted to bits 6:1 and the PXP bit (bit 0) cleared.
+ * Use this when assigning to a genxml-generated MOCS field, which encodes
+ * both the index and PXP bit in a single 7-bit value.
+ */
+uint8_t intel_get_uc_mocs(int fd)
+{
+	return intel_get_uc_mocs_index(fd) << 1;
+}
+
 /**
  * intel_get_uc_mocs_index:
  * @fd: the DRM file descriptor
diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
index 394bb41be0..6a1c0f99ce 100644
--- a/lib/intel_mocs.h
+++ b/lib/intel_mocs.h
@@ -12,6 +12,8 @@
 #define DISPLAYABLE_MOCS_INDEX ((uint8_t)-2)
 
 uint8_t intel_get_wb_mocs_index(int fd);
+uint8_t intel_get_wb_mocs(int fd);
+uint8_t intel_get_uc_mocs(int fd);
 uint8_t intel_get_uc_mocs_index(int fd);
 uint8_t intel_get_displayable_mocs_index(int fd);
 uint8_t intel_get_defer_to_pat_mocs_index(int fd);
-- 
2.43.0

