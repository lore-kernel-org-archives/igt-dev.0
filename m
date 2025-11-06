Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693DFCCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185F010E06B;
	Thu,  6 Nov 2025 10:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlgzUArF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FF310E06B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424942; x=1793960942;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+18mstpBpFDBBCZHmfkbm2G2zGKZ2R4bkXIiY28AGIg=;
 b=RlgzUArFzqRg/FUcUr1AwiGF5chiXvhhN1+hJ/9iVhSLqUC7JJRJla74
 BbQvxeFs/uxNHN6bSXxtw2MNCGA4m1vdP1xVsODdIVBYhsJP4/ZPlcGEp
 2CfQEbb4uCBzVcMF2Ue0zXQEJEY5dLKvYyxTbM0BKuVg9MKyEkSA8gS4a
 Dj3P24jEusE9f0h5WILTt75325Kbsmy7rB7vGthA8ev4YF18K8dS9EfzH
 OdsNY4kRIo3rFYi6CYaLUOakw5Jk0n8Z4mItqv7w1A74oLl7pvDfNIrs3
 OSuiCaZ0Q5AZMKW24I+SZGjSEaSy/JzGAOMpq1UJpoZzn4hzfKGO4SfbO A==;
X-CSE-ConnectionGUID: sDkbHzPiSnqYHzWHEDsKFA==
X-CSE-MsgGUID: X0oxnhDSR0KZ9DlX6bFGEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81960953"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81960953"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:01 -0800
X-CSE-ConnectionGUID: PuBdqviwT2GBFGeJkhygzQ==
X-CSE-MsgGUID: Wd+3GeslTlybDBLs8r32jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187667905"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:01 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 06 Nov 2025 11:27:26 +0100
Subject: [PATCH 1/7] lib/xe_query: add helper to get first value of
 hwconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-xe_query_helpers-v1-1-d761a944c237@intel.com>
References: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
In-Reply-To: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=+18mstpBpFDBBCZHmfkbm2G2zGKZ2R4bkXIiY28AGIg=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDHglT7Uldr2e7rBIcIagOT4kZyPaDFz9IwVXB
 HWVTCRRL+aJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQx4JQAKCRAjYrKT3hD9
 18I5C/0QsziKguRsBNpVGHqYUKm6H+ZL58ADFjJt5MTesvcewAxNP6gTZKJTFpLUi6GCEMywijQ
 3F0DPfgTKnVqeMR9ZyKdZdfhu3A4CUprSZDiQ89Uaj3f268/U/imh3GhkASyqeTCbtzzMfzFkjK
 WcYdnisi2hzOc0YHulyqCqnTrsBbzvzQppDtjH+5z0r5qlqYUYpfM56+llTIOctkfS+1+uPnSAK
 ZOXfmsooZnFBVXmxMidFqtIIqB3el4r5mIPq5Z2L3U5jNqEan0FZ17IDcXm/rwL+tP/YR2OjwGJ
 8dT02W85VfyuCxB31P6AVhKQO++xw8gAUuFuQ303NU3DTue4J8WMoT9Z58L6xJhd9lJe2YFPkfa
 xjNB8Ii4HHJZzg3my+kfA1P1VVh823TgDpLnPkCu5G7mXnOU8+eGFiSEArcOelcQpw+RRrAmIdK
 e7UZsAh7l9YcVfXbk/1EeAG9xlvQkv6s13GZVPU3Hnh5lZZOLmT6rE9dtEe4LxfnQo1KA=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Most hwconfig attributes are single values. Let's simplify querying them.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.c | 17 +++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980643e9aa16b35d9a98c180ffd92a543c..d8ea79108d67dbbb8c859762b1f56d954ee749c3 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -1035,6 +1035,23 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
 	return NULL;
 }
 
+/**
+ * xe_hwconfig_get_u32:
+ * @fd: xe device fd
+ * @attribute: hwconfig attribute id
+ * @default_value: value to be returned in case attribute is not present
+ *
+ * Returns attribute value, if present, @default_value otherwise.
+ */
+uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value)
+{
+	uint32_t *vals, len;
+
+	vals = xe_hwconfig_lookup_value(fd, attribute, &len);
+
+	return vals ? *vals : default_value;
+}
+
 /**
  * xe_query_pxp_status:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f62cfbbce8dcd987dffefef7b1af72c4..acf3291b07968e829e6e72ebcbf08f00e847e27a 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -136,6 +136,7 @@ bool xe_is_media_gt(int fd, int gt);
 bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
+uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 

-- 
2.43.0

