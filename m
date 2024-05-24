Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7A4C25B7C
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 13:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5C210F2FF;
	Fri, 24 May 2024 13:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eB8QM070";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B9510EA84
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716557536; x=1748093536;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5Bou3CHPmcbpswbM75LYhurqWWcYb6qYIdD4i7sdeW0=;
 b=eB8QM070pdbEA2nsI4NtvETYQjJunnDmBfgPN3pBMn5OTEAaHdbSCAv5
 8+B7by4EbmL+xN/eh72A0d11rxJyACiIAxqVrOHhAwYOGj7OfFf/+TFUZ
 wnFl6igK+DfltVAfZBXH8UyyTf7EJ8WJ+GFlQhiZMt4qyp2mLvsVUZZsK
 EMiqjt8AViYAFpTVaeH5FGeF+uBc3MlNAsqsZOhYwyJuOn7tzXpIzh8qV
 XvvlzgUf18RQL4WI5hVFmmpugH+6erwUqxZ0LYYs79UtU4ycNqSqEu4/l
 VxSLA3xr6CdmJoyz0+YH5Ftuuk0iA3mEVIU3HuABWFRPmCQuZ3mF/qixe g==;
X-CSE-ConnectionGUID: 1L5ZKGoURziI9TG4G28ttg==
X-CSE-MsgGUID: B/bddIEyT2WZHOpG8SaLDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30441274"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="30441274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:32:16 -0700
X-CSE-ConnectionGUID: 6FQvTQPYSKuPAafHnGm2yg==
X-CSE-MsgGUID: MA4d7DnhQ/CaYhPTht8BPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34040877"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:32:13 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 24 May 2024 15:31:59 +0200
Subject: [PATCH v4 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-iga64_inline_ups-v4-1-c2e31c55e083@intel.com>
References: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
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
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUJbZara+jfOpyrjHgJZbBd8FJJmVgL9Jd6UXMTaN
 sEg+qY2JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlCW2QAKCRAjYrKT3hD915RHC/
 95yrT90wQK5QCY9QaozMrbtUHmZbFfYjggCPznTReZGQ51feqTqFeU+1EznN8bbDMyal9mtx2QtRL6
 ngI1nCQI7yOb4tYNawetIAALIbfHtp4igVIUT2Td3IFDmmXx1H/w0gixSYhDBG85evtlOVccIR0Jlw
 Dol906Jtp7vZ6hX5M7pajMZTB18QobpOa5m8n4HUd9jqkcdFUT7b3yvfaF1Kjyy/J14ah/7pimnURl
 35zMhyv1jGhu1RkngQuOkAao21A9Kosto6n53urHGcd2zrYxIoNguoKNtFiJFRPd8EJ2Yu8enUuMps
 nJC2X/TpP5iIcaXoRic7rMsyYEgz19Z57D9z3mMpwQhF7RStYhLL63bTOcvWrv4OkX1vo/qM2pSB2G
 JfnFPtKfeS2FhiyjmviBPxOFeTav5U1VyHbwPW+wVCFEdeOAsh9XR6Fwnl9d85w6tKtq4g35N7hMst
 WQ59Vz2LDmzZBfQtpd81ZmdMvd6CPWueGGw0O/Zh3biHA=
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

