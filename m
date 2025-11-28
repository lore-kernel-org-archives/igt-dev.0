Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2518ECFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3990310E90A;
	Fri, 28 Nov 2025 14:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gl4lZeMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7A010E8E4
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339268; x=1795875268;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=3u9zaSDivRe9IJHXXzPUmN9KMlUZs5dwQXGL/V9VYLI=;
 b=gl4lZeMGBGS8QXDIZDFvPMhRTE6gKOvmbuNnx1H/XyQB5LPSgXHz9TQz
 sim6/qkI/rv0M/tzHaNtnHYg0BvSsQJdNtvBq/l6F86LQzcOS8N/06Dfv
 XM6sOYNC9qlGwnTk9KyaGRI/GyWp7SKguG+lSGMeOhC4ONNIiAz15wg1X
 rnyEnkRjOBT0lMqBa52zSfC//ct+jq2J2gvPbJKouRRZyTlCls24DwXC6
 vxWU2hqrS2ivNxeUmc3cdQfdzC/qnPu0zO9xevtkK6E9G/DhSNuziFBA4
 b2FPvMETTTItPwC/1U3uZOXkWrmAMF2QZf0TL6Ej3u/GS93RiKz1mEQq7 Q==;
X-CSE-ConnectionGUID: 4bjW50CRQfO1i3aQfWo2RQ==
X-CSE-MsgGUID: 3LfIt7WRSzinbym5sWpwQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261604"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:28 -0800
X-CSE-ConnectionGUID: uu98oBSjSBmKIBWZCRROOQ==
X-CSE-MsgGUID: sv36R6/CTk+nk1aI+N1Svw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173653"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:27 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:09 +0100
Subject: [PATCH 05/11] lib/igt_aux: add fls helper for bitmaps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-5-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=3u9zaSDivRe9IJHXXzPUmN9KMlUZs5dwQXGL/V9VYLI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa30S437Hp2B5zvS2h0iRWl+ODBWjLNwIdODp
 9tdfgMgaQmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt9AAKCRAjYrKT3hD9
 173CC/9KwvmNzbPei1yvHzegTxAYBE23fHtmm5xVjoESgJep/4begREtgfRhm+3Nd6eOKc9aYwJ
 SVs6zg/VUBDidUu9DlLqwtbrcA/G/zBUXcUrBGzrStisY2c8+Nllz1ex2uohO4WMYN+goKky+IS
 8Vl6MW41am9GdRBDYWIljA3In1QOEn0c5vMsTKw38WUbMxRvq35qxaX4rnVkEUB2YhZ8iPGa7tN
 9cbiaSgP64FLF+Fy/mz4lo00V3IMWL1eNO5ExNx+IsCCsH0+uRLnW0cFT5Xdwtk7PxNhU3YHNrb
 vQRcK/iNRSX8KoH5wt9YE1nF8RKYxl59+39R7NTaQobeCErj6Ua51psqR6bo/Om+p4R8p51mITV
 GUja/HAAFf+T1BspS2aZpke+7q+4jtldcLsCHz3Fkc05SrS3btOYsqT4fl8II1rj+VZmo+WQkte
 mMOWp81Ugh542QTtXbA8Sj1ll+6yrOJQjKTRlZI+UPHpL1BiqVxsOxq4/Vmqcea/8lzQA=
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
 lib/igt_aux.c | 20 ++++++++++++++++++++
 lib/igt_aux.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index d3280c3514a0..abfd8b0fdbd9 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -2152,3 +2152,23 @@ int igt_bitmap_hweight(void *bitmap, int nbits)
 		ret += igt_hweight(bitmap_get_nbits(p, nbits));
 	return ret;
 }
+
+/**
+ * igt_bitmap_fls: find last set bit in bitmap
+ *
+ * @bitmap: pointer to bitmap
+ * @nbits: number of bits to examine
+ *
+ * Bitmap version of fls.
+ */
+int igt_bitmap_fls(void *bitmap, int nbits)
+{
+	uint64_t *p = bitmap;
+	int n = nbits / BITS_PER_TYPE(*p), r = nbits % BITS_PER_TYPE(*p);
+	uint64_t v = r ? bitmap_get_nbits(p + n, r) : 0;
+
+	while (!v && n)
+		v = p[--n];
+
+	return n * BITS_PER_TYPE(*p) + igt_fls(v);
+}
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 885c6b096e49..8ff182384cce 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -353,5 +353,6 @@ void *igt_memdup(const void *ptr, size_t len);
 void igt_wait_and_close(int fence_fd);
 
 int igt_bitmap_hweight(void *bitmap, int nbits);
+int igt_bitmap_fls(void *bitmap, int nbits);
 
 #endif /* IGT_AUX_H */

-- 
2.43.0

