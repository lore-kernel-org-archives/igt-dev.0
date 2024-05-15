Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE440C25B7A
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 09:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1757C10E261;
	Wed, 15 May 2024 09:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXRn19mZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA3410E1DA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715764519; x=1747300519;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5Bou3CHPmcbpswbM75LYhurqWWcYb6qYIdD4i7sdeW0=;
 b=WXRn19mZA7c/JSKE4I1/hPo7MD87XdsQX6EKLb4MdGaRyAeTvW8Ad/hg
 HVlqYSLm346JYp7Rgq0PuYs3FeNQWcuVzu/HBMaYJ2KPdNjmySG6C2j48
 X+4Yu7xNp81lXIsy59PFF3673y/qBohZKJaZQyLO1zGe3ugFH3/PBTS55
 wRmli+PgEcPS8EEwfLlmh0bx+Y0sWxiFC2h1HkCtr3OJXGU/CDe9dXAm6
 C+f3ga/Fh5206eMfnYaO5+wzNow+HCsO1HyrnOrnLO7Y7ZeEVhuKQp9k0
 u9LCRdXDk2hpwVI74SxFCKnE0EzYIE/DBwrONnRok3kF756GpS8wf2Z0u Q==;
X-CSE-ConnectionGUID: q/joAn5EQFmFeKQaFRufKg==
X-CSE-MsgGUID: jAbt7te8Rv+DeGKFbjCTMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11632053"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11632053"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 02:15:19 -0700
X-CSE-ConnectionGUID: onh28OfhT7ayO6TQBQ1yTg==
X-CSE-MsgGUID: dLCSUZUdSfa3sMp1ToH0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="35776186"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 02:15:17 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 15 May 2024 11:15:00 +0200
Subject: [PATCH v2 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-iga64_inline_ups-v2-1-693743cb0985@intel.com>
References: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
In-Reply-To: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2867;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=5Bou3CHPmcbpswbM75LYhurqWWcYb6qYIdD4i7sdeW0=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmRH0hh7oYuDMkfB4vUYHqzPFqkInYD0MP0Ss4BmCA
 GD5RyfWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZkR9IQAKCRAjYrKT3hD914ThC/
 48hT4lbDb9L0Xc9rG/nwZcXx5vHciH2OWk+YeVpmFwD0ktuLd1GaVchjWn0VI7zSmkjW7Nz4uMq3UK
 qWN16hYao17p4LzN86UBLABJm9t4vESGBqIYLqmIcl4q2a81T3WevqAuKufQK6qil2rBXkie2Ipnwj
 auC+B7Un/XNpqgNhTXodApp9FGsL82IKirbz869/hhZJZ3kwsMEuVicTDziXgZXWr92a1tDVt/2JMi
 qM3/OXa5XNGyeaWgXp+Y0iBGussr8MBUGgs9dIOt7kG22+alj/HgRxKgIfV9sT6TM+tgjSnJhKsqsE
 pzAWI7CRf7QItOIZGMwhkf70IRlOfhHcLzhWP3C/tVvS4/3u0XYID6wQ9QEQcTFukiwiCBIhzKcmT+
 ZfrLk76G7cBmdn3Cj9CikB3xkKIoZjqRAnh9maeDtJKs0qv3OshL04r1/hXVqmhZFgrWipn14qmxq2
 TCN37Ce7O/3ExfZGgQarBQiMgFMYRP/43+Pt2dbH2aE6U=
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

