Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D79CD98E4
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 03:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A3210E43D;
	Mon, 22 Jun 2026 03:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKQ1UIAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDC510E43D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 03:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782100291; x=1813636291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pZAWoGkkxracVrW6z2O/CKps3WrslXmjNRv57tdDs40=;
 b=SKQ1UIAvghX7m4IY/x95cz9lbTHIgTUEFsoMO1Zk06yR0e+ThNm4cqAE
 EJRcXvIve6/m15DfS+CX+F5JTDkC/EV+jrmBVg+t9vYgN1008WOhD+hk0
 4xMNQa6QMTpWzaGsg3uUo6Slikcksq83tRZ97uR4cm0ixJxtpzG4UQgEO
 UknBauhuDAMTshUQ20rP21LJse+EEj9Nu66EYNkxYML3Fb1Su9vbZnJ2B
 p2CwzNoLsO9xo1zXRxaIhjQmaAjuFuJN6N9NRtKfWQ/PSQ732gXdmixRO
 MDM8p12n4YHq5lj2w2riOdC7A+tPr1V5BnT36kt1s3h8SMdo/Osld35W9 A==;
X-CSE-ConnectionGUID: WveS4xTsSQyJlY3UbloM5Q==
X-CSE-MsgGUID: lRoThjgMR2OwNtZCRt0VRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82596519"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82596519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 20:51:31 -0700
X-CSE-ConnectionGUID: kVRi6jodQl6zBrUfcm6yQQ==
X-CSE-MsgGUID: v33pBaL2RbCo6hxcDBRxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248964533"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 20:51:29 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 06/11] lib/mocs: Add packed MOCS helpers
Date: Mon, 22 Jun 2026 05:51:01 +0200
Message-ID: <20260622035106.3023047-7-jan.maslak@intel.com>
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

