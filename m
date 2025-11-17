Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5990ACEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70810E1B3;
	Mon, 17 Nov 2025 10:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M61LlBx9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5537C10E1B3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376556; x=1794912556;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/WTOoXw7/aHE9ILH16apJg5IBIP1PqZpdgCo7RDc1kQ=;
 b=M61LlBx9kb6nUvxkaNn32h252zSV/4a8owLwGLe3teZPNXOzYAzf7UOA
 vbJ314dtgO+XpUMIbDcmYi9zkP36qexAVKoPnFF9+dKbKEgEU0tRAu2F2
 TuPWSe3xdUCJSmqNYUzda3LRmcA0+lW1q0sGjAafbnWcf6TdtR8XzH3kO
 L10jCsqXxYVHJe+AmlMmZhfbdomaVu38uMNGVz5GTULsgwIsDLRz5q10p
 hDWCQ/2fxenFIDERRntJULMgK2sZprkvsgAAE/OU01OQiCYvTq2zir/df
 38iHYbq2IrfJ/wuWZEEocx258AhxLz+Zirml/AZmFd4Fxko8y7unUSqcx g==;
X-CSE-ConnectionGUID: o19RqUzfSnaRztqeMxf9ow==
X-CSE-MsgGUID: OWAAFsjvTiurwZPW8SKZeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306075"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:16 -0800
X-CSE-ConnectionGUID: 6TuqmA3ZTLeOPs1Cpuoc8A==
X-CSE-MsgGUID: x+jJM0C1SV+DVvWkAAV+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213817958"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:13 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Nov 2025 11:47:39 +0100
Subject: [PATCH v3 1/8] lib/xe_query: add helper to get first value of hwconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-xe_query_helpers-v3-1-25d984ae58cb@intel.com>
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
In-Reply-To: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=/WTOoXw7/aHE9ILH16apJg5IBIP1PqZpdgCo7RDc1kQ=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1iqICSLdv2K9D0wND8WVk8XnXJIbAvOhMru
 t7pTlQUlzOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9YgAKCRAjYrKT3hD9
 1xB7DACUfCohuqndTDVztQRp5v8eYml1tK5quf0OeMvsL0wdfYub6iu0ojnsH8trZMeeoKN+F8u
 jbxpXvY0O7MAC1LZWL+ObPjmwclgLZvmMN1CgAEpiFwelKlB3+iRB67CG7AKY4neVtPam5wDjgp
 kPvunwK4/HiBWPsVGdMJSPPnxHykdu+yG1zV08F8ImuerRQKwCfunu4tm/aQt+N2MpMwUVFzIMz
 g5GgVGBDIdv9cHQrsEhAd2ik9WNZsnrl+uuqe18e6UV2IceFoMyypKsfE/Ge9Ihi89C3pczMacy
 Ya+4W4bQlIhws58UfBO7EZQKEV9eYRFHkaGjZG1OOB/7edj1+ObOy9frFEdOIBTKWZ8qmdf8Vod
 getDiAdgAJ/uKidQWYgUkCcF6cnwbL1crl4Bqts3TFtrVAamIcifbd6mlD7BDwhhO6fdXg+mYYN
 tDoogba/6zz8pDhMcpji1/wLXavYuC08xsACQ7twpPvZyReXwBW9YTF0cBtY+GsolU71M=
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
index 8e3e05fd3a7cf949a0bc0f64f06853e96be8c78e..a3fab133e6c4d9f949564b47cc817383bee7a568 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -1080,6 +1080,23 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
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
+	return (vals && len > 0) ? *vals : default_value;
+}
+
 /**
  * xe_query_pxp_status:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index bcdfb54b027540b442da95d3c6a3cfd0f8b08dca..4f1c0687133c03b81ba53f95457c55860e5ce194 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -142,6 +142,7 @@ bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
+uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 

-- 
2.43.0

