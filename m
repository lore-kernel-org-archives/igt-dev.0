Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C027CFD315
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 09:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C801710E39E;
	Tue, 25 Nov 2025 09:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtqf4ucf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04610E39E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063541; x=1795599541;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=v/vuJl7CJZ2GZTCl0tHqLLhlRDSypPOvZQjQtno0+2o=;
 b=mtqf4ucfixYxBFytNhi7M+hP4Pcj/p9lMa9mWg65hd94WQzzRos+5XFp
 P0uXOtJCs0bnDTo9Fc+iyA3sy9n+0/kiF/UxwjHH3zr8K/+iwzcy57dKI
 bp+D1jFK8Fc4rdu34ubyAE5/sw/9rKlIuSqr1N/wr5n8Dja1gQyR4GGct
 pcgT0hxWe/qnnPIOWOsQnAEVL42QXeXfaeYpGmJnUzWpQFzhGaKsqUq7s
 cvtflyQQLgr7VQTUOpAPKASe8UzQRElZQnb4+he/WtyuW8v2HzNcERcp1
 5M8E0xdHup48z8BeD9OJ6pD14N4fEiKleieo2os4pJpSMi60d6phINWri g==;
X-CSE-ConnectionGUID: +v+j8jmxSjqpnxEwcM5PZw==
X-CSE-MsgGUID: x5F4KRZYQIaVbSdN9FoQ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66022186"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66022186"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:39:00 -0800
X-CSE-ConnectionGUID: ATFkuaI7T5S9mKUB/XqqOg==
X-CSE-MsgGUID: vteh1cAfReCpfNqyANJotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="215943995"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:38:58 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Nov 2025 10:37:24 +0100
Subject: [PATCH v6 4/7] lib/xe/xe_query: introduce iterator for GT topology
 masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-xe_query_helpers-v6-4-97686fac1b77@intel.com>
References: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
In-Reply-To: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=v/vuJl7CJZ2GZTCl0tHqLLhlRDSypPOvZQjQtno0+2o=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpJXjmGReO/RK4BlHSObIajf+ejj5WBXJazkL45
 /kz1qmAX8uJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSV45gAKCRAjYrKT3hD9
 1wgoC/0abVyzN+4gYYZQsd3WM1dXFLq1J3kE/rVmqCtOPXYScX+9sk6zo27nhp0Z8wXrIbPwl0x
 Kk68Xv71WtPOSm0JFGH9Mtif3yEKMx2QTsBNjwTUXYKekoPIPD/eyoeOrWV7JBHQJ/RZl+GrCVC
 wBxePt/oTd7i/pc8x1ZgSDRvwa1iw3wxIYg0f7S0MCZwy2U9Oyy7ori2NeG2KX7C+iPfAk8NSod
 pFfJF9j7eqVqRUZ4kqFvSWdlVR8v2AQCTtjPLlW/zxpUQGl/MPC6nKhnDipzlNMASqF2LiM2X/k
 V/g1lgOC9Vh1RtKHrcITo3HHzQRL9OPbLlZAZBJo4o4pSVkvlRxAtTyAVkLqfzf9HQ0LAVhIQ+M
 tubuL5R9ZDFBvQ5OE4JTUg7yRg0Br7flsXXfSJiaaOOiRyjxcncE2ssMxg7dI7TcpaojT7kMbg+
 2sSHu3u1s65W78dgfSraIV/AEeL17CceMHny+WnSNoI5hpvJ604wu/Qgq6tAkYsQO30fg=
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
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/xe/xe_query.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 15d5c26baf5be6e107495247ca1aaefea551d821..3eb05a6c0535f3f2edce8b8591d17198ee356b68 100644
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

