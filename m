Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6900CC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 12:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EBC112BF4;
	Mon, 29 Apr 2024 12:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATf0m74v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4B1112BE9
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392526; x=1745928526;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=LYsgImonVrednFpNEptqoHHLbD38tMHDiMFYLwpgi5Q=;
 b=ATf0m74vUqUpDqBTERamjV5YvGu2p59F1Io3aKjZ6FeopKwWD6nZrTrq
 7zpL3kTji11vP5EtwhfSn9ItqujUzxSseL3bHolLu74E1CAdWhxug3imb
 gakdz5KGiilPl47wwXIN8DNYD96ejCYkCPxY6S6HYFnklU5vxV/QJWqTQ
 Ui3IltgRu3GoeoownS9lJTKoP3XLxCrxT0Arsbri0blLrMVNblHNHC6PD
 24G6dlhGQon9AufGwW6BRp+4Rp9BapOBTKOc2IG0awexanz86tXLJt6rK
 2rY1KPdxadBxvAvh/FOQczWdq6i9MdEwdpxkiN6Uk1TbN0mnhzR+emtYv g==;
X-CSE-ConnectionGUID: QAF6A22oSHul6W69TiX4ug==
X-CSE-MsgGUID: 4jAtpSr5Sem9wwfsfqFnKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13823216"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="13823216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:08:45 -0700
X-CSE-ConnectionGUID: iNpirLLeRzyXgLCRNKg2+w==
X-CSE-MsgGUID: CZCWnslLTv2iUbPTKzPuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30772360"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:08:44 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 29 Apr 2024 14:08:17 +0200
Subject: [PATCH 1/4] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-iga64_inline_ups-v1-1-2e9ac46cf6ba@intel.com>
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
In-Reply-To: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=LYsgImonVrednFpNEptqoHHLbD38tMHDiMFYLwpgi5Q=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmL43IEpf8nhlL50VRTONQfH57Yzev0ThtaArsLYi3
 hE3LESaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZi+NyAAKCRAjYrKT3hD91xG2C/
 9nGHV6v2QWmVNYmVTbKaRNDRpob/rvwHjBhARq4GMXGXbGAJCAAc0It4ZJtdUQBnuzG/fkd6cHJQ2A
 PtV7f2zRwvnFDs2hYuvecXGIsHPhHtfBwfEOZPesMogs3NLXR41tKMAwAApUpLbcMkf+Bbp3dAK6Oh
 K3/Igv81uu5SMmyBH0FH/DJv/O92lcAc+BXQSqXJgg/mdxiJIn5521MYfwgAUdQdAYh7ViIuRd/5hU
 fp+FfVB4RP6U6/H9DH/asQkWTOiQ6AX2CqWeC6e9v3mIq9Mkm+ta4+oSyLIffwiwQH4N5i1l8GMs+Y
 nyvq4n6M4lNKsAhDRp4qxSIyInGv6ilk2/re/OCnUWhkQsS5lWAmr+y6MkzxjbTlvuP1JdwGGi03zR
 IHxaR73++xgj8Gyb3e4Qy3uZmXkx/JTR/wpCAlcUE7Dd+51Mk7E6aKs/rQLPI5lkLBndt2cD6fTUeX
 cb+A8GCwwg9qe1v7dI5s1bZHZ88L63z9cdzQFtLawQ8LA=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpu_cmds.c | 29 +++++++++++++++++++++++------
 lib/gpu_cmds.h |  6 ++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index da41121ce945..c73d56cc3f8c 100644
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

