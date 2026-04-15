Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FEDF433CF
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 22:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C2910E750;
	Wed, 15 Apr 2026 22:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGRclsV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE4910E750
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 22:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776290865; x=1807826865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xhxarYCUywtYuGhC13euMlipxnS9NW3DTUiUiARtdU4=;
 b=fGRclsV1DvEfGpSgcDdGFjPTs0q0fMrvoxRVafThdtwNN3UdqqhCgg3L
 CbXWPlKjjx8aHxjFvwC72u0WrrQI3p2YYBglHPYGS0zphasqD501qXUjR
 Zs6aLNRTSWKmKkid3PBRfuktGQ5pfSHNHJtCDyB1uDyTaU+Z8mATIPjS0
 bVFCH3DMdvNAI0Azq7rx6Ln4TiKSy6JtuSQbFWKuFGquehCTfaq4u0O57
 Rz4cOc/bV3B90D2+NGdTd1S8R5LH0aDlaBD3I40ReTs9WDSmq55MIjNLX
 xLB+oUb7P4pCmAMv3PjMV3Y9XoszwxcdhXtDSLFTkwAtSxjrKlPKWu+3X w==;
X-CSE-ConnectionGUID: gRyhWaqUS/SIprPbBpeeQw==
X-CSE-MsgGUID: L3FrpVBSSEGJ6d+JkpJHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77397201"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77397201"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:45 -0700
X-CSE-ConnectionGUID: M9G0D8F1ShWz1ZUzPMGoTQ==
X-CSE-MsgGUID: 3B0CPjP3TnmrxY8f5jQT3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234926160"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:44 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 10/10] lib: Add genxml annotated batch buffer decode
Date: Thu, 16 Apr 2026 00:07:20 +0200
Message-Id: <20260415220720.1594414-11-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415220720.1594414-1-jan.maslak@intel.com>
References: <20260415220720.1594414-1-jan.maslak@intel.com>
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

When IGT_BB_ANNOTATE=1 is set, intel_bb_dump() writes a companion
<filename>.annotated file alongside the raw hex dump.  The annotated file
identifies each command and prints its field names and values, decoded via
the genxml *_decode.h headers.

The opt-in environment variable avoids file I/O overhead in normal test runs.
A disclaimer in the file header notes that the decode is best-effort and may
lag hardware on newer platforms.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/intel_batchbuffer.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index b09506574..5b3c3da48 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -49,6 +49,7 @@
 #include "veboxcopy.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "intel/genxml/igt_genxml_decode.h"
 
 #define BCS_SWCTRL 0x22200
 #define BCS_SRC_Y (1 << 0)
@@ -1579,7 +1580,9 @@ void intel_bb_print(struct intel_bb *ibb)
  * @filename: name to which write bb
  * @in_hex: dump bb in hex form
  *
- * Dump batch bo to file.
+ * Dump batch bo to file.  When IGT_BB_ANNOTATE=1 is set, also writes
+ * a companion annotated file (filename + ".annotated") with
+ * genxml-decoded field names and values.
  */
 void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex)
 {
@@ -1609,6 +1612,33 @@ void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex)
 	}
 	fclose(out);
 
+	/* Write a companion annotated decode alongside the raw dump,
+	 * but only when explicitly requested via IGT_BB_ANNOTATE=1.
+	 */
+	if (getenv("IGT_BB_ANNOTATE")) {
+		char *ann_filename;
+		unsigned batch_dwords;
+
+		igt_assert(asprintf(&ann_filename, "%s.annotated", filename) > 0);
+		batch_dwords = intel_bb_offset(ibb) / sizeof(uint32_t);
+
+		out = fopen(ann_filename, "w");
+		if (out) {
+			fprintf(out,
+				"# Batch buffer annotated decode\n"
+				"# Decoded using IGT's genxml definitions.\n"
+				"# This is a best-effort annotation and may be inaccurate,\n"
+				"# especially on newer platforms where the XML definitions\n"
+				"# may not yet reflect the latest hardware changes.\n"
+				"\n");
+			igt_genxml_decode_batch(out, ibb->devid,
+						(const uint32_t *)ptr,
+						batch_dwords);
+			fclose(out);
+		}
+		free(ann_filename);
+	}
+
 	if (ptr != ibb->batch)
 		munmap(ptr, ibb->size);
 }
-- 
2.34.1

