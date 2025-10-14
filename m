Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB833CCD187
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 11:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BB210E21D;
	Tue, 14 Oct 2025 11:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6TLV2AE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C84010E21D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760442235; x=1791978235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ed439EOflU3a3/ux/n4X6S/4Qb/dCOmWxrPfpyBwXTA=;
 b=k6TLV2AEmLarB1JA3us3Xn6Hnj7kJhqen7D3aXoAIz2cgWB4M4KiGoKY
 x0SYwEuQSJ8sP2JzgTjtbb6SY6uchRuxsxWB8TI+iigOp+Aqj2PXs7A4v
 drhRXc4biRAJr+WuvuR9R7wH5TGUd/pciuqVqeCDQkCkh+sWlt/dI+l+Z
 KYN2bRFAYUjCbeV25r3o+pUTYlEPOC9aGNciOn9tQn6mATUxcUO/bUkTN
 lafnwWnoj3e3NBJp+W4KcFqHdJB754LI4MHa/u5argdwnhI524ln0n2wg
 7oR7HkE6ZwCn/SkYEgXYmuPUavQ+2sHyj/z9t/QI5x9KDoTJa7nOtW/0t g==;
X-CSE-ConnectionGUID: airVrApxT2GX7dqCUHcoTw==
X-CSE-MsgGUID: 3I/30QTNRb+igJE4PPX+wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62509220"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62509220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:43:55 -0700
X-CSE-ConnectionGUID: Z6tb8MXETtG54rHZKHTwfg==
X-CSE-MsgGUID: ELmQ3t7VRyuJCj8ok3KZcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="205569306"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:43:53 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, zbigniew.kempczynski@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 3/4] lib/xe/xe_query: add function to retrieve uint32_t value
 from hwconfig
Date: Tue, 14 Oct 2025 11:43:35 +0000
Message-Id: <20251014114336.1712360-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014114336.1712360-1-jan.maslak@intel.com>
References: <20251014114336.1712360-1-jan.maslak@intel.com>
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

Adds helper function to xe_query which retrieves a single u32 value out of
hwconfig.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.c | 17 +++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980..89590d571 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -1035,6 +1035,23 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
 	return NULL;
 }
 
+/**
+ * xe_hwconfig_lookup_value_u32:
+ * @fd: xe device fd
+ * @attribute: hwconfig attribute id
+ *
+ * Returns the u32 value of the hwconfig attribute @attribute. Asserts if the
+ * attribute is not found or if its length is not 1.
+ */
+uint32_t xe_hwconfig_lookup_value_u32(int fd, enum intel_hwconfig attribute)
+{
+	uint32_t len, *val;
+
+	val = xe_hwconfig_lookup_value(fd, attribute, &len);
+	igt_assert(val && len == 1);
+	return *val;
+}
+
 /**
  * xe_query_pxp_status:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f..1c803a192 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -136,6 +136,7 @@ bool xe_is_media_gt(int fd, int gt);
 bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
+uint32_t xe_hwconfig_lookup_value_u32(int fd, enum intel_hwconfig attribute);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 
-- 
2.34.1

