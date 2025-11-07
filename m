Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EE8CCFA18
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 12:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B5F10EAB0;
	Fri,  7 Nov 2025 12:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AX8NdR1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D007910EAAE
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762518278; x=1794054278;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=0szSWS7qZOFJc8pPPyIepSUkt9f1PgOUYZe7iz2Io0U=;
 b=AX8NdR1wT3f2XILHFvKA8fioSly1D1OWfdxJSiqqUrktbJc4y2Ai29OG
 sSPQmqg0MSE/XnfaMtfxUsJHltBmDNMW7BTfdqc5VocRey5MvoCSdnvG0
 p5DHkMAXtdgOpIPcoHG4Rh5rMoGcHM098NQ2Ua30J+Xtc7L04Efj+rl5c
 Bjhl/h5HLtcIAvGko4k4uL8NOTkZkoyUvlYk7IBdr6MpgREW4Emq929Kd
 VyF9UvFjGzT/FDFWneYpvUjmQHbmF1BOjaF4wlcuWjuzKmmX+/sAbWOAl
 Y+YpQfJmuHBxURSohRziv0RLKd7UT0aQsraasaTcBwi3prLV6QzbPUf6c Q==;
X-CSE-ConnectionGUID: /f3Bt1EiQRaMuiO9DiVUDQ==
X-CSE-MsgGUID: bJF4/ohpRT6IqEZSi1ToSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64365676"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64365676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:37 -0800
X-CSE-ConnectionGUID: ZYm8P0/aRQuQLcNM59cxUA==
X-CSE-MsgGUID: Ga129ezwQQ2R5cUN1Ctf4A==
X-ExtLoop1: 1
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:37 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 07 Nov 2025 13:23:18 +0100
Subject: [PATCH v2 5/8] lib/xe/xe_query: introduce iterator for GT topology
 masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-xe_query_helpers-v2-5-ec66ba6af1c1@intel.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=0szSWS7qZOFJc8pPPyIepSUkt9f1PgOUYZe7iz2Io0U=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDeS7jn+FWb6wHJh9t/z6s74/kUjsa/Yhxnz0a
 HDWR+1gS9GJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQ3kuwAKCRAjYrKT3hD9
 1+MpC/9UmS5Es+dTkFWIt2qZHYxhf+cx6T1A3MmdQtdGWF4pmZGWr5aiNk0VTnkEyEfGnLbflo6
 /AziTeRv7qzIhpVvQgZlpCmsp53ZBP3KyWVaMmRi0rmwBlXxzp+ypsOX8zYzYKb9hb0aJe+f9JL
 48jl1O8eIB8eZnvp6scqmCp9sssCIP6sZeLhecS11wORlpYT4YNOLD2zqtr9NBk4Lp2R974/1A6
 y3VO4HSAhVw8NCkmCDumqmhIdwp3zP/IXFLGSyHFjA/92jeqIhQC25U4igpvuv28+22YrLOgRhW
 ZK83K5qp9sC0wEEDks2Wgk49ZXFz7brhOwjtPZR9RuVIm5flHrTwc8B5PbjsizTf7EEiMcyn0/B
 JpW5WHYauc3k7X99cjXR05CisLHqp6K1w9gOhtQfLfI418J2q7QJChNoHyImBgteBPl9DPHW24d
 HKJc2aWXrQyYqjy21xkDbdhZnqt/ABJuZ+SNiZWEXdhmJYhL+Fv47r5Mr5OU/QdpNhk1M=
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
index 2c2c07f34af0b5de306cd70d83f0f2aa51b65d76..12663f42c2018f48ffdb9805f928624af3992534 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -93,6 +93,12 @@ struct xe_device {
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

