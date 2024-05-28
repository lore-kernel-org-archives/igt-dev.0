Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31711C25B7C
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 14:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADDA1122F4;
	Tue, 28 May 2024 14:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxUHBZZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806921122F3
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716905106; x=1748441106;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5Bou3CHPmcbpswbM75LYhurqWWcYb6qYIdD4i7sdeW0=;
 b=QxUHBZZjxpv+eOGdXYaZRQJoZv+Ytjgdb6Ug6fkA65iU1UvR4PTT93XD
 dKMbBTe/kZGqwf2a78PJh8VPscvGjTvMtgFMJyfPUluRpQwstyP9Da0lc
 So4ir8GDHefHTzMaxCCGRhhTJUfknsJXHPfueaQaPymXmkiixoJvibRAp
 wOALuBx+kSr0Gb7O7J5nz+pCG34BSpLQAwntfTTvf1+VuVnBtpDvgLIVU
 PxovUdGOpHdOJNv1ELt7cB6Qtl9TM0w+YtjnFHzgZ9MLGal0yyZ8ghCXx
 j0tHBA/UTG2gDcrfe1H9lqZ4Hka/rG+xBs1WKzAztk5PgPC6XTvegoK09 Q==;
X-CSE-ConnectionGUID: 97Z7naFFQAqwrGUGXRug6Q==
X-CSE-MsgGUID: hpKAjlScTfqe8BJnv9JtrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13074937"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13074937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:05:06 -0700
X-CSE-ConnectionGUID: nNVrejzGT4ykYvnJ+pLWNQ==
X-CSE-MsgGUID: QXPks45qTrynvVQwvseEjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="58273498"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:05:04 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 28 May 2024 16:04:47 +0200
Subject: [PATCH v5 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-iga64_inline_ups-v5-1-fdd8e9dcd64c@intel.com>
References: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
In-Reply-To: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
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
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmVeSL4vxvntOuZ2G5EZZ+j3y1CsPsflmK5Kk8fLDz
 DjVZoM+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlXkiwAKCRAjYrKT3hD913XsC/
 9mRXzl0dk6SlX5MrfQPw4QmaDjz2LKsHi5GivZuY6HbRsBXJSbT8A5lpRxs02RCofAkK1Orvt98TUu
 0AV4NX4wmkllmFEDIb8i1nvN7pAF2fcD2117vEjORX7EEr69cVhxIfvDkLgAg11N1cAU4fhKXTpICN
 XwJU5SWoB7rRpK8NFj7RQbw+PTfNWKpljzi5tVs6sMgOrrWTJ87aDwGB5gk1tJBC2BTOvwHXxa61G+
 ADybpH3hMo8WorRMBLP9kSZHv6ZPOsiY0AezvwwlqBEC5w0Cc2nze8OXP72uDVZOKeKRw+DXgVeUOU
 E7X9+9h7fFmv2zWttc5xXNqLYkw5eMYzVTAR9tp8p84EIM0T7ikHKbL+yB0iMPzfFh399oc2tPOFx+
 82WTHR97MDeEoIowbDgWh46iCfyA/MMpFtTEP5IirC+M3ipheKarudcc1+wKyHc/enx0N8E6PToeeb
 fopIFcEkp+zmRk5vDk4PJekONJnjXtQDSLVRRsG27JqD8=
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

