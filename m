Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3427ED116E2
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC6210E8FA;
	Fri, 28 Nov 2025 14:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5U5hKzm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA79F10E818
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339261; x=1795875261;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=qVzYwfShzTSNe1VK1NEE98f0BeR051ZvZUjL4LBz2mc=;
 b=f5U5hKzmwXpsHmFsiDHNIWk0RGfs2gTsucw0b/rxtRPNhaZrPC2bbwvZ
 dqKqjVomhJbJksB4oro1EsxDqOVbwkyxHa0pk6hm5yeB9orud6tAqDF4i
 qpZD44t5IIZWfrWhixhYpDmUb5/Uh7lF27z4K62/8Gk8ATmOmbQE4PIkS
 YsvryINNx42TlLL51EUpGkX8HD4vP/2d4cCLwFLQCTC2+L18BayWKmstB
 su4osURF3z1J8zLhrlhn5eJvQt31uHwJUlUmc+DvmBKZ6jbWXYGqXx9Xh
 XURb2BlAecT2+/z3o8/xGQBjndidR7bu5lDOEMVzKHcrWTXIQxP8JA4ys Q==;
X-CSE-ConnectionGUID: H54caSoCRUuLpOeFM0FEjQ==
X-CSE-MsgGUID: HD0EGp8PTXeCdIRoJTi7Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261597"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261597"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:21 -0800
X-CSE-ConnectionGUID: Ae1Yj/DWRpGYJDd9wwu6ng==
X-CSE-MsgGUID: cYPp5JHdQ8WpooPePpiLiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173617"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:20 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:05 +0100
Subject: [PATCH 01/11] lib/igt_aux: add hweight helper for bitmaps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-1-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=qVzYwfShzTSNe1VK1NEE98f0BeR051ZvZUjL4LBz2mc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa3yu+kwP3v+F9DLwVTfRheOJ2TeYfLL2kLS+
 pLt/bCfEsSJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt8gAKCRAjYrKT3hD9
 1y2aC/0XUT3KkyziTQeJXUXgsKgVKh48a0seN0HLaW6F/LXxsmUF3pGaKrkQVT56yWg56k8hXMx
 GalAfBPmDARmVADVPM7UXHYA13KiMcIK2NgfqG9AKDcOECLTSxz14VjP6jcDwiA1dbh0abpJ0po
 apRaxCddA0YNtBeZ9WTEuhGlFo0CSFva9GwHx5MIuHhQyxI2csRxnp58k1N/71FzYxdznjuOyD8
 bHKL8zRWhmzkiRy4cxu61wbQgFw5rfG86om/WcElnMyMStlZA+HCGGANwbLQNHRmkpwbwPkW6me
 e0jhBVAqAzeosj5BPjkBwzRf7lfK289iTcKd1wIwt7Zx7YAq4FMW4Sok6JWoX/TrP517Xai4aKm
 OmhSQfOfZqhEbYAmv4h7Yr6PyX4hOZ60TMruWMp10cGB70zGl9RgFcB5N9V+xVXVzXWt3DnkeKB
 wPISDD02TETGmu4jts6/oD0ZteISTcjAfPWNuxee2/0coQHLMQDmxELxsAR2Ahs4ZKOs0=
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

There are multiple places where such helper can be useful.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_aux.c | 28 ++++++++++++++++++++++++++++
 lib/igt_aux.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 5c26798129fc..d3280c3514a0 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -2124,3 +2124,31 @@ void igt_wait_and_close(int fence_fd)
 	poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
 	close(fence_fd);
 }
+
+static uint64_t bitmap_get_nbits(void *bitmap, int nbits)
+{
+	uint64_t val = 0;
+
+	igt_assert(nbits < BITS_PER_TYPE(val));
+
+	memcpy(&val, bitmap, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
+	return val & ((1ULL << nbits) - 1);
+}
+
+/**
+ * igt_bitmap_hweight: count enabled bits in bitmap
+ *
+ * @bitmap: pointer to bitmap
+ * @nbits: number of bits to examine
+ */
+int igt_bitmap_hweight(void *bitmap, int nbits)
+{
+	uint64_t *p = bitmap;
+	int ret = 0;
+
+	for (; nbits >= BITS_PER_TYPE(*p); nbits -= BITS_PER_TYPE(*p))
+		ret += igt_hweight(*p++);
+	if (nbits)
+		ret += igt_hweight(bitmap_get_nbits(p, nbits));
+	return ret;
+}
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index e8a1788b28df..885c6b096e49 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -352,4 +352,6 @@ void *igt_memdup(const void *ptr, size_t len);
 
 void igt_wait_and_close(int fence_fd);
 
+int igt_bitmap_hweight(void *bitmap, int nbits);
+
 #endif /* IGT_AUX_H */

-- 
2.43.0

