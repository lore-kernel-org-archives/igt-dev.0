Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA4FC27C5E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 10:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C59910E5A4;
	Tue, 11 Jun 2024 10:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+JHW5xV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A20E10E598
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718102466; x=1749638466;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=3PMxZM4GJhxvymjVxEpBt9z/cieNjbdvNhaUn659004=;
 b=K+JHW5xV+dl1f85ONs8HFh1/vBvKpMVB6cOtPTkeVXQPRaMs3QkpZ4WZ
 Ajy6hALuf0RULXXgK5elXFbddpY7wpH0StR8ySWThLu7x7Zo/fblLPZzT
 yiI+OM2AcyzEwDqzKf9oRRI6dVbtz+SEE/O6RNBcAr0Rz9eE7g8MyOj4N
 jUFGX7wuhrBHARQJcig93T8hFj4PhUoNJR5uGxNOfly1r+EKk1DReDSqO
 pXWetySGDY/1HKiSpvY36sSn5U6oXvoWMi/upCOsipM5uCnUbEOR+FSkt
 OqZt5hmOCX9ewgPPi530IBle/VW1qJ1dy34VJgda//jv4+za6nwSs81uN g==;
X-CSE-ConnectionGUID: vm4Ap7IKRje/7OsguMAM2g==
X-CSE-MsgGUID: twj5shLqSfyljwCyYeDDYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26217715"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="26217715"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:41:05 -0700
X-CSE-ConnectionGUID: 93ViTViOSBGBNdwN89RKeg==
X-CSE-MsgGUID: 1g+DBWveRLCPumeFZK9CQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="62563543"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:41:02 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 11 Jun 2024 12:40:50 +0200
Subject: [PATCH v6 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-iga64_inline_ups-v6-1-b634ec43a610@intel.com>
References: <20240611-iga64_inline_ups-v6-0-b634ec43a610@intel.com>
In-Reply-To: <20240611-iga64_inline_ups-v6-0-b634ec43a610@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3716;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=3PMxZM4GJhxvymjVxEpBt9z/cieNjbdvNhaUn659004=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmaCm59TVhcxNXBDr+fkNC1XQ/3YLBSM03dJ9iO5qQ
 ArDvbk6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZmgpuQAKCRAjYrKT3hD91/biC/
 9DupREo6K/4GmE3U2v3uzJWWQ1KdYgTgDxCMzTCSjk8dbB9qHALvfNsAFlj4l50XbZj4ColFaTEmzp
 i3sSe+dZQhGFAhsUyAQRGsmAdYcRMeyi0RrrsbXCmDAFO+soNMWW7MMIyICjMIsJCfbAm5bTsWqeLp
 4KpLsnNw4aJ9m0DRy/8Ou7L4dBDJITo7JJVAmg57icfB2TUIVBlMQaaX3KjVj0g+rXcOzudpciTQks
 C6uxx1gbjCwaKPrVp+ysdqKMfUSMyp26IRk6no5NMro1f/P/8qe4su5kLDBdWGMptvlO3NvWu2kyEk
 VEnSqB1H9D2OkVZSuRb77STzDgqDaH2Ufm+gQXG/pqC8PbpVqDnlcbawlAvpcKuZnPtg1mY2B82sDy
 CnrsZwDPmCUNS7gvCCxRDwpt1jl8VHCm92I/L/5LANe422zX/Cg+qK9fFK3ATQXD+9Q3+sn4knGqax
 WZ+y8nrVaWpP440+GpVi3c6bSa/RvJ9at1I2ksDm91NcY=
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
index 378fa9166ab8..cd0623dc28a3 100644
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
+ * 	otherwise they are dispatched in sets(fused EU mode)
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

