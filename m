Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B9DCCD18D
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 13:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B61510E399;
	Mon, 13 Oct 2025 13:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgCdstW1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B278210E399
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362882; x=1791898882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ed439EOflU3a3/ux/n4X6S/4Qb/dCOmWxrPfpyBwXTA=;
 b=TgCdstW1N9Rj4VgU0M3OyfnhQMajVAIaUDwFDvT10uhJ5feX+gKSK7ih
 yYwSY4PqnIrzKyC4vT1wCBuqTIVClN2K/QRVkeoVxdaL4JkQyJud/nkPs
 hF6wUenWB6IBAKqKxHl524jDoqUDoFCX3RnJKsowBZ15nw3x9HAtRy+/6
 EDTULdHqF29taAV/G5MQqoFeVVNrLAxbwebT6FOFfUMEoU3SJtOFZ3fcN
 TyAQ3Lbykly9ESwOkWppSlixtMXSalxKEF2E1GoIMFbMSSd6u/0KBtlJ2
 u9xySFFk07bCYc7D7Ad0uXoVUrUUzH3Jzbnc7EQZU+BPZkS36LWFJwrtk w==;
X-CSE-ConnectionGUID: 6fyuKdtlT320CPleLpg2hw==
X-CSE-MsgGUID: bDQLQrU4Sh6WIIEoS/0NrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66155501"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66155501"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:41:22 -0700
X-CSE-ConnectionGUID: kXYJ2fy6Qvqeuv4QUBI/rQ==
X-CSE-MsgGUID: 0oRpb7g/T0+vcnLvTTsgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180742564"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:41:21 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, zbigniew.kempczynski@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 3/4] lib/xe/xe_query: add function to retrieve uint32_t value
 from hwconfig
Date: Mon, 13 Oct 2025 13:40:42 +0000
Message-Id: <20251013134043.1676308-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013134043.1676308-1-jan.maslak@intel.com>
References: <20251013134043.1676308-1-jan.maslak@intel.com>
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

