Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0FBC2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7704710EA55;
	Thu, 27 Jun 2024 07:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgewjzUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1047D10EA55
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719473122; x=1751009122;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=gfuhmNXzB1jHiONWQ9Gb6nOB54dAUDuvTAwhMBd9VxE=;
 b=QgewjzUyf7JHr6cywhPsuA+f2NwwQ5H9ue9GFJ6eLNmFW+sNSJVw9zq4
 22m1QN5SBsdoVy4VuBEm4T1uKE77AUR8ZxtCiaqQBA2tTJkB+FyNE6WLD
 c/Ium1WWNlZSl5sNzbWrltVgslHzsLpVVfSfgbnvsGbob0xILDYYzCPG/
 MaHgcLHJWiKCh68Fi4QnOJVyfDkehNd9gn/vmF+BTKBP93YIxxXl1GTAW
 tn0sFOccFUN5B4c69YPSGm9c+uOHaCiaA566MqfwK65xwu6/aDYCrvl+e
 e6WYTV9hSj96RhXE31xr2EG5Cvz7vtUIJN+ZtcspkCemnPyMBVF2GCagG Q==;
X-CSE-ConnectionGUID: hb3737C6RoSTUluPUXYnwA==
X-CSE-MsgGUID: gum8/mQxS96borVJbXDypA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20466237"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="20466237"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:25:22 -0700
X-CSE-ConnectionGUID: e+C+Its0TLaVbM99EomMfQ==
X-CSE-MsgGUID: 8FuEatpuQvm7FPy1uTO5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="49221715"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:25:21 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 27 Jun 2024 09:25:00 +0200
Subject: [PATCH v8 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-iga64_inline_ups-v8-1-08605c9360d3@intel.com>
References: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
In-Reply-To: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3757;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=gfuhmNXzB1jHiONWQ9Gb6nOB54dAUDuvTAwhMBd9VxE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmfRPcj9TzK+Kf3I5KXwQMMAKyW1or64Wg7oGEonR5
 zLqAsJ2JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZn0T3AAKCRAjYrKT3hD91+iiC/
 4o8nu+qWtyqmPso3iMwnAfWndicZ4DUd/I7v3J/u0hgibKFP3tNbjH7ETUT49PkG73n8MUYfRoGvCp
 SD0AV1fEZvgCgVpRndvUYZllwSLeLIRsXl0Bq6udPZrHfEY8ZJsgJMayYQsJgryvUob5S5HNero41T
 ajD0xofsQsuMp7nSO4c4mbbYPDVi5BP9g7yDRtI5hG6i+5hhhFMZ9IWUwzuMpHAakCoa6khtl3vQ9E
 nLu7UzNTn3G3Bw6yXHEsKReCgaIatOvC3U0JZSI2UiM0BKlZAor0nAyHmRrU14eek+JSmMLyLEPHjh
 c7w8BuLIJ/OZ7ttYc3BynngMPFLiahzqQjnf+WdMRnEYK0JAWkYbYd9/x//uRZ7UxZ6qVHeABGALIP
 TvCnxqc8F81qs9NBribNmGjUv4/s4ErI7fqfPqgcPLaGA5LR2nKuYjhC8GLxZKiVShxIjgf7lv6GSU
 oJRvCAxYq19P+vZn9zhNwSN3OhwRrDJVpX8fQQoQNCTJc=
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
v8: removed spare return from void function

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpu_cmds.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++------
 lib/gpu_cmds.h |  6 ++++++
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 2e29cc6c4650..c44b24c79bd1 100644
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
+	__gen8_emit_vfe_state(ibb, threads, urb_entries, urb_size,
+			      curbe_size, legacy_mode);
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

