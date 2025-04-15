Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992D5C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 07:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495FB10E670;
	Tue, 15 Apr 2025 07:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXQ+QlV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C5110E66F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 07:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744702740; x=1776238740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=epx8mPrzyCTFuZ7Lush41CcLGZiWEnHOi8N6vdvj4Hk=;
 b=WXQ+QlV/vH4TM/IPNFOldFOyio/zNyzGj/UYEburtqoaHLDa9gDA9+SR
 4R/pVOYTNelmsBcJLqSZyh+ZJbnUO6FXLQ0hnUYMDGEuxTacJH9oI2lFG
 whc/IevC2Vzfl5NPepIfJ3D5gk5dOUOy4sXFB5xzMR1k2S8bVt7ZQUbGA
 fy6Los1e6l5H/LkJHXGklstdUJMqRLFWoSSGxbzhpHPlqSmLSpXVb76i5
 kfqCSBJaPJRsxCqSYWkETQjvafxmVW+wHqGWenr+3jhEgRY8ShiVdDwtm
 kEqqmjARIq4/FpIcX1tHL1sKnfhOsXPjTsQ751unBFfd5EaMItGholp76 w==;
X-CSE-ConnectionGUID: 9+GJoc+1RZa5UCN4oK3DrQ==
X-CSE-MsgGUID: OAnS0iizTWK644WePxyNag==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46076394"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46076394"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:39:00 -0700
X-CSE-ConnectionGUID: ml1uWssgS8OTzbYmqe6lag==
X-CSE-MsgGUID: 2ZtBW768TgaFo9HfEfKnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129806699"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:38:58 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v7 2/5] lib/xe/xe_spin: Add mem copy capability to spinner
Date: Tue, 15 Apr 2025 09:36:02 +0200
Message-ID: <20250415073833.121611-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415073833.121611-1-francois.dugast@intel.com>
References: <20250415073833.121611-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add the option to perform a copy while spinning. The existing struct
blt_mem_object is reused as it contains the information required for
the copy.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_spin.c | 14 ++++++++++++++
 lib/xe/xe_spin.h | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 0de0b1f2e..3fd29275e 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -125,6 +125,20 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = ticks_delta_addr >> 32;
 	}
 
+	if (opts->mem_copy) {
+		spin->batch[b++] = MEM_COPY_CMD;
+		spin->batch[b++] = opts->mem_copy->src->width - 1;
+		spin->batch[b++] = opts->mem_copy->src->height - 1;
+		spin->batch[b++] = opts->mem_copy->src->pitch - 1;
+		spin->batch[b++] = opts->mem_copy->dst->pitch - 1;
+		spin->batch[b++] = opts->mem_copy->src_offset;
+		spin->batch[b++] = opts->mem_copy->src_offset << 32;
+		spin->batch[b++] = opts->mem_copy->dst_offset;
+		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
+		spin->batch[b++] = opts->mem_copy->src->mocs_index << XE2_MEM_COPY_MOCS_SHIFT |
+				   opts->mem_copy->dst->mocs_index;
+	}
+
 	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
 	spin->batch[b++] = 0;
 	spin->batch[b++] = end_addr;
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 7c95996c3..c2199d0aa 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -14,6 +14,7 @@
 
 #include "xe_query.h"
 #include "lib/igt_dummyload.h"
+#include "lib/intel_blt.h"
 
 /* Wrapper to integrate with igt_dummyload, aka igt_spin */
 igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
@@ -24,11 +25,28 @@ void xe_spin_free(int fd, struct igt_spin *spin);
  * engine in which it's exec'ed
  */
 
+/**
+ * struct xe_spin_mem_copy
+ * @src: source BLT object
+ * @dst: destination BLT object
+ * @src_offset: source offset
+ * @dst_offset: destination offset
+ *
+ * Used to perform memory copy with the spinner.
+ */
+struct xe_spin_mem_copy {
+	struct blt_mem_object *src;
+	struct blt_mem_object *dst;
+	uint64_t src_offset;
+	uint64_t dst_offset;
+};
+
 /**
  * struct xe_spin_opts
  * @addr: offset of spinner within vm
  * @preempt: allow spinner to be preempted or not
  * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
+ * @mem_copy: container of objects used for memory copy (optional)
  *
  * Used to initialize struct xe_spin spinner behavior.
  */
@@ -37,6 +55,7 @@ struct xe_spin_opts {
 	bool preempt;
 	uint32_t ctx_ticks;
 	bool write_timestamp;
+	struct xe_spin_mem_copy *mem_copy;
 };
 
 /* Mapped GPU object */
-- 
2.43.0

