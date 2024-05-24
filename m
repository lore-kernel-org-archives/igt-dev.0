Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44774C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3E10E1EB;
	Fri, 24 May 2024 08:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdkHcqWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343DA10E13E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540554; x=1748076554;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5Bou3CHPmcbpswbM75LYhurqWWcYb6qYIdD4i7sdeW0=;
 b=cdkHcqWAU2RaDsCbTIH1fNXFqscjdIVGRRdTUbZ5L3wFbFwppLKvF/wW
 6R6zcrwqV2mWQ1Kr5RfBHLZxIFUakAaNGeZWyEA08GvA9JFEJbMBcVz19
 8wSSY6yTnhaXehE7cjWwQpVqyMhcDvDAqBY4N45b7dsCwcCSbP6H0SzBu
 4Y8s0vGAvjphWF20CFG29H8SB4BUsTTVU/80rV5A2J9IyJYvxlioxFVZP
 nxs4igktivuK2lfO3gilvYxIYvgndcHhz8oRbtoxe4uA+KRgcc3ToN9lV
 2AP3rr0WpfLzhF2TWOLFhsOa5OAJQMH9F6Lmp2IudFUmLfCfNfvReeFsR Q==;
X-CSE-ConnectionGUID: JXM1FbGDSr+UQzDrUi8K2Q==
X-CSE-MsgGUID: 9IOGCEQdQH6mNlMLKGTQ4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12692326"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12692326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:14 -0700
X-CSE-ConnectionGUID: oWzUo3XHSAiAyBJRnP2fRg==
X-CSE-MsgGUID: MaWG9VmIQY2Ns/3AyUdsiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33940904"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:12 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 24 May 2024 10:49:01 +0200
Subject: [PATCH v3 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-iga64_inline_ups-v3-1-62427617ced3@intel.com>
References: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2867;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=5Bou3CHPmcbpswbM75LYhurqWWcYb6qYIdD4i7sdeW0=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUFSEL2aW7crO6IuvjblDe+2+Yyr+EiFK1lv33tdq
 5+736jGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlBUhAAKCRAjYrKT3hD915OzC/
 9EsT/dX7ltJvPQPtSDfNhgj6GDsWjzgNZdPum306AmZveosXdetIKcQ20pWNNXZ0JmGaqMiIvhLOco
 W8URxpB6s/ipJ1G037LbWqwS/UmNBhqpQ3NbuVlMR3DQ/VnjiSnxTcbvVK4abZ/upwjtrErZAdJ04k
 PGNPZqico67nk5ekBXFP8AV5yV/rKYi0l40H8YQvqDzW7GxJaENivH56e98geVIeXqE3qFeo3sQ2s1
 iijm+EZxUeEpxl1XjT1bcPZfqE4zYGVmkE1I/ZbzpGV2/Iw2J4+By74BjsQj3hND0kCJVKSQNZ6z4y
 IWqBDHxemMeTCaYAvfyj9UJEoF/QfG9Ypy2v0K8+W0AIHkfYzk08vYZUz+O3hJm8L0x0xub8v+S9+8
 QaTUhaG0ZBpU+O/bd9MuQZdtw+9xZeeeVE9EcTlm3H5oErmtOi/+ZCRrTQyyTQvIfG0PkKBIhqEe+o
 /yspl5EpsSXhDy4JO765922vk7oBlENhOvYY0y+Xmmzsk=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpu_cmds.c | 29 +++++++++++++++++++++++------
 lib/gpu_cmds.h |  6 ++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 378fa9166ab8..6caaeb01be29 100644
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
 
@@ -676,6 +676,15 @@ gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
 	intel_bb_out(ibb, 0);
 }
 
+void
+gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
+		    uint32_t urb_entries, uint32_t urb_size,
+		    uint32_t curbe_size)
+{
+	__gen8_emit_vfe_state(ibb, threads, urb_entries, urb_size, curbe_size,
+			      false);
+}
+
 void
 gen7_emit_curbe_load(struct intel_bb *ibb, uint32_t curbe_buffer)
 {
@@ -864,6 +873,14 @@ gen7_emit_media_objects(struct intel_bb *ibb,
 			gen_emit_media_object(ibb, x + i * 16, y + j * 16);
 }
 
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

