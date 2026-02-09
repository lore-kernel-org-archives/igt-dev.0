Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EF0E7E0BC
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8CC10E436;
	Mon,  9 Feb 2026 16:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HiwtZFyz";
	dkim-atps=neutral
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A4410E436
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:32:37 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-126ea4b77adso4953710c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Feb 2026 08:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770654756; x=1771259556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJIBPedqu15VlpN0OxwL4Z6gEbupWvTpvDCdcc1ut1Q=;
 b=HiwtZFyzqryKaY2CKAuBgfKT9O2YIUHtIl+otZcn+Mibz/uX5EuFJOW6wQmyg12rTB
 B+9Nl664ne4vsfEymPkxNktlKOoyMFkrScy/GNk99G7yfRnb4XwVEeIsA+xIRgb348hO
 8IpBmPyNFkHiihZZ9GgcEmDl7kRxp9AydH2eDv6mCzIgrMsivyBPn2sBBjGS42i3Lmj0
 lGWZEBWtE/JqQPSwA00fmLW7C/P8LQUP/WG/RiCQknyS1RlaXkkkbN7iWhmHs0HIm+9+
 SjzVjjQ7AdyBXdo9fxiFBjTKQ3FTAKTvoa66mUKJpGRT4K3rVtUfR2I98bepEXN26Yji
 CT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770654756; x=1771259556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mJIBPedqu15VlpN0OxwL4Z6gEbupWvTpvDCdcc1ut1Q=;
 b=D+6Tz2Li0DH2om79yWHrq2ANfn+uECbsftjs5Xm9a0g364kEBnEsFiT85AJLG2Ty2S
 5pt8KzEgANzYi3uLhBVsmAbdFPeHXsUYfftXPnY5Tw54W1uVbDmUUUrAFS5sE9QKRkeR
 VYV3qD4dXXD8dLTsElixLDJtQQApoRJBum0S68sEDNWoZT6dZD5Y84YYlK9jbGlvjgB3
 XxK/EN0ByzlYb/PgiRBmR3TbFn0yqlIlq/j3rhy+qjxay2RLHoyOSx3pdv8jmfXryd7m
 javdec4X/pnDb4ZTUD5OQ6QnGdfj44rssmzTBxQvGZHINrVtxUT8PvEtArcm/hOWX2oN
 YbUQ==
X-Gm-Message-State: AOJu0YwdMPZBa68GGOgVkR8BPLod1KgWWL5fHdKT8kWZbZvCwnbyYpgk
 UPhZgoJ7+iXv0EWzWfW00/CsWkZdsQcSmKZbeL8t+TZHG7Tsyxg1AHhvaqc/Km2Y
X-Gm-Gg: AZuq6aJ9WDpyDXwP/Wi0E1Zxu0zeiERQiMMamkC5B7GUs5MMpHeU08CHbgAqisHjZLu
 oEXchAldBi+iVRkZ45kLx5BVQbkeC3hX3oOJRDbkV9vxIIMaG4buLgFmGGeyqxl7Xlg3HcZghS0
 eb6NEF/loKbG2tXWHVIa4WdAxhNl0EmhUDewTmDyABj7+1npWoI0oeqLcX1UAdY2eMQfeGMvJnB
 ZoKXUk1D7Qya6Mty7Fxf/b3v5nW6uT91GtGV1mjmVytEvEAdaD4gm9zPaxuLcUSYAa+kIodSmyF
 52pzFx7P6lTM2GNvEFOA1uVjLJvf2ts/Qgr0JBsqoJ3FHoofGOTTEsPR+AjGRr6Cu6Op+FVDq0V
 X4dVWjHkaeryAo/9Ua6oSNfuHmOo5vQiYda+SOcFf88W4q4jlBlbB5FhtgMiksGDEYcMCN5RBl+
 NrhfYbaHV40oXK/r2t5WRs2Vl/uE7QsUQMfhENw5uKuQsfiWd/
X-Received: by 2002:a05:7022:6296:b0:119:e56c:18a0 with SMTP id
 a92af1059eb24-12703f701c8mr5682745c88.8.1770654756202; 
 Mon, 09 Feb 2026 08:32:36 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ba776c4a2bsm1698737eec.24.2026.02.09.08.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:32:35 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/7] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Mon,  9 Feb 2026 18:32:09 +0200
Message-ID: <20260209163213.1483598-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
References: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
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

add possibility to use gt id with batchbuffer  when on xe

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 25 +++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3b25a385b..c12beed46 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1158,6 +1158,31 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
 }
 
+/**
+ * intel_bb_create_with_gt:
+ * @fd: drm fd - i915 or xe
+ * @gt: for i915 context id, for xe engine id
+ * @vm: for xe vm_id, unused for i915
+ * @size: size of the batchbuffer
+ *
+ * Creates bb with engine id passed in @gt
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, int gt)
+{
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 && gem_has_relocations(fd);
+
+	return __intel_bb_create(fd, gt, vm, NULL, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, gt));
+}
+
 /**
  * intel_bb_create_with_context_in_region:
  * @fd: drm fd - i915 or xe
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d0a7c8dc7..ffe09c9ac 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -323,6 +323,9 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
+					 int gt);
+
 struct intel_bb *
 intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
-- 
2.43.0

