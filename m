Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4EDCF8864
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 14:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E3010E758;
	Thu, 20 Nov 2025 14:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ht/Puole";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6600A10E758
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763648889; x=1795184889;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=33SvUPaVoyA/WJY+bFJm4DM1IzOXxHAf2Dzp/aus6Zw=;
 b=Ht/PuoleAupVSkVZQnOrWYWeUPmvtsxx8iY5SYq1scuYZrrCzjHpPOnq
 lHQnvxnV14a46YIXRzTpMrC46fXsKbCJieDxVkBLpyPHp99vNhrPmUWp3
 s9QbgtrotxLkwK9cjtyH7qtb83qsOReyuS6W7mPnfeYsoK9uJhSEI92KP
 JmGhw5+dbe0j1e5bvpBHT9hWJwmRhy4EyfzEwgj03R0Pq0YeFmTfhUQky
 j9DdriJh/NPxRe0drjZ4KEiYc65iO7l6aSh4q8VNfYDHUA/rxOD1z8wnZ
 iSlRnXS8OnInDi2uPhj6Zjsf0sCOHG7hVeKcT7Q9TPOo4o9VmWD6Xvgpr g==;
X-CSE-ConnectionGUID: fG/jD3GxSjSHPGh1pzkEKA==
X-CSE-MsgGUID: OS47AO/ZQsSb3tV0dUqUgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76824124"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76824124"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:08 -0800
X-CSE-ConnectionGUID: 7UCc4Tl4RnGWLVC75y4swQ==
X-CSE-MsgGUID: +gSv9a/kRWeMHsBsSWtD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191057633"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:06 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 20 Nov 2025 15:25:38 +0100
Subject: [PATCH v4 1/6] lib/xe_query: add helper to get first value of hwconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-xe_query_helpers-v4-1-2ed6dc04dd94@intel.com>
References: <20251120-xe_query_helpers-v4-0-2ed6dc04dd94@intel.com>
In-Reply-To: <20251120-xe_query_helpers-v4-0-2ed6dc04dd94@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=33SvUPaVoyA/WJY+bFJm4DM1IzOXxHAf2Dzp/aus6Zw=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpHyUuKySEwe2UTgv5eFs6kyfgF0k+rgz38KUxi
 ok6P3VTBpyJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaR8lLgAKCRAjYrKT3hD9
 1woiDAC5mmJbuMA62we2bZBxkIbOnTQQG/g9Z3mV3EfClJ7cva4HCB15y05xleSnNIfSXE7vkuG
 0a5sXIgNoRO3UZr/UJJsiW799LelBMhpZeAZiS7ZImQ4u0G2CpvB1NV2u9WZhlM841Xh3yMM34p
 M8/O6lU4mkViKLWfM6Km7seoCFUs+5ogbzd+ou6qg5qHnZI8Zt7ZB1OqpxRJS1RJnrH4S5kPzs7
 Oi8P9qioJ7WoWNPQWFVJDtvh42fYpvcEbFkPrYqBmbg915y31GXPi2gsH0dNUSc70AvMSXGggtt
 FQ+Ncu288dbb4zVowVNB68vYAAz6+7S1R1hWuq4cRQzCr4eovzj4CHHEusCYt6QfH1RAFXcHIHu
 pVcTljm9KkY7xjSvr3+DlAyb1qejgVlZDqwtyS6DXcGxgsGnWxXv2SSOHSCVxScI7GslQJZFRA+
 BUx/uti+Kw2JTknVHul9KhVFxfOJSDtQTZ7db/xrFiqttQ44nXRJKl2FLc6Cmspi1anLo=
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
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
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

