Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3630FCEBF9A
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E277210E03A;
	Mon, 17 Nov 2025 10:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Net360qt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A24510E03A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376563; x=1794912563;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XKUt8QJuKjsoT6oJdIetYClT2ZkaF6xMxbXEvXMqjt0=;
 b=Net360qtnAjsEFPh4F7X9ZlumNLWMtUrSWFVJtHcnIIlVAAZmL2UFiNt
 7LFYHaDuDgjvvJHGaO7EmPazp/syktNkMPWrM3Dxi0SCDf7CR+29crVhY
 p5WuF+j2v+ZKtmmIFKSYBeqvxg5SsuMr8JACbq5eAafqcW70x341sl+fD
 eIEY2bOGOMtPD/k0XSqIhvhovNMvA0uqrGBrIkVkkl7StUFl63K3hBT7l
 l8NsqeeFr98xo8cdpdPOR2Phq6eCy9D3xbFmNAbwncUZ9ikiYurjiHtec
 eT1n361aC2neqBg8E5AFOE+ikLyXJqxKhhArhR3cdINOaJV/mXz4WITYl A==;
X-CSE-ConnectionGUID: HSKb96ytSiCONKW23Gg8kw==
X-CSE-MsgGUID: 0jqEU7bdQC6b6pdogYQLoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306104"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306104"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:23 -0800
X-CSE-ConnectionGUID: zg4NAdiJRBaiXU5gMUxqRQ==
X-CSE-MsgGUID: eGtW/hT+SW61O82M7P4buw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213817995"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:20 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Nov 2025 11:47:43 +0100
Subject: [PATCH v3 5/8] lib/xe/xe_query: introduce iterator for GT topology
 masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-xe_query_helpers-v3-5-25d984ae58cb@intel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=XKUt8QJuKjsoT6oJdIetYClT2ZkaF6xMxbXEvXMqjt0=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1krBgMYbzYMbR0rwCYjQapkZREOA4dXaeby
 rX34Yt6xyCJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9ZAAKCRAjYrKT3hD9
 19vdDACdMGKKUVyjqlLnbSLccLVowcJSJVrASxFcozesuy7XDdZKBYgK29+xTDOCj5L3vEnbowz
 YoTP+zSxmojnhLyXX/FxiMvlDUZs0ZYvzYizPylom/YtpGSoJt/rlJ7FPmZfXQ2kdsoDy3HYsiM
 KCnl4QSXNpytSXth042VJZrA6hZBnmk1Cvqjxr3nQffmL5D1bnsIM7K4YXGfkXJ13ZhsbUSoFN5
 9zgKHKKoWEmmRhfncD6mNKJBrwCaIEZBX6XDdYzpGQ2518LejEGVARhK52upITuSwi6LjvyN44A
 otllUGjlj2J9SmzFNpj6u/goTqDypWD5ioap3XXPttyw1Np/RbR2SNK7wOP1Ji7rsE1Xvq0cCbv
 YmSDMcF3B6r1QSJKh72+HZbHeWweFjT1TmiOY23JRVGBq7+klClc02/aDNxUz6C68DaYlghPz44
 I6R9FN7rEByCArd1kaIYOG0Hu7VOktJ/DsqzYG2AGxGMictYmRUi03OugGp64NoEeRxIk=
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

Topology masks returned by device query DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
are placed sequentially in one blob of memory, moreover every mask can
have different size as they contains flexible arrays.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index b1483f5eb6ac330454e719423dee52013b4b6137..01ca1d57fdb1c52c0676eb255caf6a5223e3f973 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -97,6 +97,12 @@ struct xe_device {
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
 
+#define xe_for_each_topology_mask(__masks, __size, __mask) \
+	for (__mask = (__masks); \
+	     (void *)__mask->mask - (void *)(__masks) < (__size) && \
+	     (void *)&__mask->mask[__mask->num_bytes] - (void *)(__masks) <= (__size); \
+	     __mask = (void *)&__mask->mask[__mask->num_bytes])
+
 /*
  * Max possible engine instance in drm_xe_engine_class_instance::engine_instance. Only
  * used to declare arrays of drm_xe_engine_class_instance

-- 
2.43.0

