Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382E6C36018
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F0510E5A2;
	Tue,  1 Apr 2025 14:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMWha+P1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33FC10E0DA
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743516332; x=1775052332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2rwXqaJPq2r+el9rTAilJ0K0KtSeaRdpFjS3kb2vLxo=;
 b=XMWha+P1K439Io4p2aXBRNk77YKfn0KfYjntYnIPMbAQ/k0sZqeQVDQo
 cY7p4ORhDxE54X/+k8kw2Uppxn/9hYmM1izezxhDdC84lloz2tJLnj2An
 Ww+V4x19IpmgkmocNkdB4P376NhbLplipcws3fRaQ40PwLMQJ59Be9v2e
 6T+MDZ388LW6JFMNStInmy/7feBD+NiteAHGVCpLpLS8TaXkbrrq0LByv
 UDsXkKU+k6YKU18WNle6NwaIGb5H6r9VnxOpwDTKSUemWIQX66VlKMBZN
 TSHafOqO7BAzLoFLda1SelDfpIhw2aYAZjrJY83O0tFYRpCJj7ZjPmiKr g==;
X-CSE-ConnectionGUID: gSNpZm2JSZyInx94vLgTdA==
X-CSE-MsgGUID: Arl6I6/xTOWR1YIYZpw2EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70198592"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="70198592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:05:31 -0700
X-CSE-ConnectionGUID: pzAIhQXDTnqVRIReSeD42Q==
X-CSE-MsgGUID: L1pkIthASXG50rudwI7UwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126364590"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:05:31 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v4 2/5] lib/xe/xe_spin: Add mem copy capability to spinner
Date: Tue,  1 Apr 2025 16:00:57 +0200
Message-ID: <20250401140510.38142-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401140510.38142-1-francois.dugast@intel.com>
References: <20250401140510.38142-1-francois.dugast@intel.com>
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

Add the option to perform a copy while spinning. The existing struct
blt_mem_object is reused as it contains the information required for
the copy.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/xe/xe_spin.c | 14 ++++++++++++++
 lib/xe/xe_spin.h | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 0de0b1f2e..5a9d51575 100644
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
+		spin->batch[b++] = opts->mem_copy->src->mocs_index << MEM_COPY_MOCS_SHIFT |
+				   opts->mem_copy->dst->mocs_index;
+	}
+
 	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
 	spin->batch[b++] = 0;
 	spin->batch[b++] = end_addr;
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 7c95996c3..c4110469b 100644
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
+ * @mem_copy: todo
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

