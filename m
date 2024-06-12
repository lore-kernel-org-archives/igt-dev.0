Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45284C27C75
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 09:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0EF10E801;
	Wed, 12 Jun 2024 09:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQHDvi1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD1E10E801
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718185159; x=1749721159;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=1i0GcTRPErELy1IeR3z7Bfb3DUMXepO3cd4Je7u7hlE=;
 b=bQHDvi1NXCfmrcNcsaEPI9I2qt/TQrfD7O3kYVU/LfEfu7B4BpVYeK1n
 ElRbKr6gURUJ1wA6yhIn6jwPeZCGDkztKANm/PQjJn/EhBeM//9FMU1lJ
 prpEk9onshok7X7wYT8ixyj3jDmoQjUSbRjrfHJuXoSc0zhZfrVPvBFJg
 1dV93eTba4kHOokSyV55UXPWxVqKqdWI6TCxHYYOxhWi7RtQKI6fEIBmQ
 Oko8BMCPkG5breCb44aadnwXywXMN1zjssowxkPOwttVI1c8rWZ/FQZIT
 necvKdHCAB5k5kHGOw1SP32hMe7JQc/xdHGufhykxeDpxkzLrW4JaumiQ g==;
X-CSE-ConnectionGUID: Pt0uiYvBTQWdFOJ7PszNlA==
X-CSE-MsgGUID: tRKl3z+LQoWeCzcmt5CcMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14901168"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14901168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:39:19 -0700
X-CSE-ConnectionGUID: NhZBhxUuRpafuuobv7Cvbg==
X-CSE-MsgGUID: qQWg1txeS+O4iAWfpRk5UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39795069"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:39:17 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 12 Jun 2024 11:38:59 +0200
Subject: [PATCH v7 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-iga64_inline_ups-v7-1-0d4b840498c7@intel.com>
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
In-Reply-To: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3719;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=1i0GcTRPErELy1IeR3z7Bfb3DUMXepO3cd4Je7u7hlE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmaWzBWR3LX/tqZznMHS6WCEhiP/vNkzB/ZE0PoKO9
 5cg/cEyJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZmlswQAKCRAjYrKT3hD911RNC/
 kByp1CGhVSetmXn6kjuiIL+RsrhsJAlNCyCYCHDP+rVSk0Ah2Jf5P4h/B5BvApH58snv4BmPlAHEJX
 KxN/BhhexD3PkfOQnNSN75WMw4RLYzFvY4Qy/MmdjfzjjgOlwilikTQU8kc/d+iQ8OUhAuxVexPYeO
 S9xKLqJlFy7yjYfnGzbudQ8yT1tBwM3gCyzmx1meCG9I9XvIUiAQmuhIewCge8Hm1L4lJuHAq7LcEh
 Q79yWuir8H5eA0qVq5Qm+AIRb5S3cmOHOox5phfls+/ZfsrLeMZxlktbBI8Vkd8swOrHghIPv/QV70
 IVfzvh6htfd54nWsyFa3qUHgfrJo+M/ICs25aOccmkU+U+K3voxMStMRrDM2i1OmnK2mtvEDXRKH+f
 KGEdd1SHeIsDcQzPxxO6Cpe9HN4edLV59rTMk+KsRv8pFeNpVB8/mmF1t8ZLOeICw8kHGjJV6DnjzB
 B8a+t83AJvCICXKteypP/+D3yveSdxRKmPFbotJ+iU1+M=
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

In Xe_LP version there is added argument to control EU thread
dispatching mode. For shaders lagacy mode is used.

v2: added commit description
v6: added public function descriptions

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpu_cmds.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++------
 lib/gpu_cmds.h |  6 ++++++
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 378fa9166ab8..b096670b073c 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -651,10 +651,10 @@ gen7_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
 	intel_bb_out(ibb, 0);
 }
 
-void
-gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
-		    uint32_t urb_entries, uint32_t urb_size,
-		    uint32_t curbe_size)
+static void
+__gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
+		      uint32_t urb_entries, uint32_t urb_size,
+		      uint32_t curbe_size, bool legacy_mode)
 {
 	intel_bb_out(ibb, GEN7_MEDIA_VFE_STATE | (9 - 2));
 
@@ -662,8 +662,8 @@ gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 
-	/* number of threads & urb entries */
-	intel_bb_out(ibb, threads << 16 | urb_entries << 8);
+	/* number of threads & urb entries & eu fusion */
+	intel_bb_out(ibb, threads << 16 | urb_entries << 8 | legacy_mode << 6);
 
 	intel_bb_out(ibb, 0);
 
@@ -676,6 +676,25 @@ gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
 	intel_bb_out(ibb, 0);
 }
 
+/**
+ * gen8_emit_vfe_state:
+ * @ibb: batchbuffer
+ * @threads: maximum number of threads
+ * @urb_entries: number of URB entries
+ * @urb_size: URB entry allocation size
+ * @curbe_size: CURBE allocation size
+ *
+ * Emits instruction MEDIA_VFE_STATE for Gen8+ which sets Video Front End (VFE)
+ * state.
+ */
+void gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
+			 uint32_t urb_entries, uint32_t urb_size,
+			 uint32_t curbe_size)
+{
+	__gen8_emit_vfe_state(ibb, threads, urb_entries, urb_size, curbe_size,
+			      false);
+}
+
 void
 gen7_emit_curbe_load(struct intel_bb *ibb, uint32_t curbe_buffer)
 {
@@ -864,6 +883,27 @@ gen7_emit_media_objects(struct intel_bb *ibb,
 			gen_emit_media_object(ibb, x + i * 16, y + j * 16);
 }
 
+/**
+ * xelp_emit_vfe_state:
+ * @ibb: pointer to intel_bb
+ * @threads: maximum number of threads
+ * @urb_entries: number of URB entries
+ * @urb_size: URB entry allocation size
+ * @curbe_size: CURBE allocation size
+ * @legacy_mode: if set, threads are dispatched individually (legacy mode),
+ *     otherwise they are dispatched in sets(fused EU mode)
+ *
+ * Emits instruction MEDIA_VFE_STATE for XeLP which sets Video Front End (VFE)
+ * state.
+ */
+void xelp_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
+			 uint32_t urb_entries, uint32_t urb_size,
+			 uint32_t curbe_size, bool legacy_mode)
+{
+	return __gen8_emit_vfe_state(ibb, threads, urb_entries, urb_size,
+				     curbe_size, legacy_mode);
+}
+
 /*
  * XEHP
  */
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index 348c6c9453e9..1b9156a80c7c 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -81,6 +81,12 @@ void
 gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
 		    uint32_t urb_entries, uint32_t urb_size,
 		    uint32_t curbe_size);
+
+void
+xelp_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
+		    uint32_t urb_entries, uint32_t urb_size,
+		    uint32_t curbe_size, bool legacy_mode);
+
 void
 gen7_emit_curbe_load(struct intel_bb *ibb, uint32_t curbe_buffer);
 

-- 
2.34.1

