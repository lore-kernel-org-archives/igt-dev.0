Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4234CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 13:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5872510E7C9;
	Wed, 27 May 2026 13:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbmj7dcw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0F910E7C6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779887784; x=1811423784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fpH/dXnRZLsrRjuDxUqFw+22kt014hnQftA0J1/qqV0=;
 b=bbmj7dcw9aEXpG6hESluc2LVXiq7Nxk5JcFWODuQ9vqjYO+13s6nPKdc
 gy5D7MYNJ0ZsWFFB2yfjN8nJ/CoPhgM53brn97wbiRT7C+jQYpjlUAXhD
 DHNUFABPmGiCMuNzDlfV2libO7gusDXKyP42q00DfIX00x9wKPhIUyj5T
 t5VVGTxuBvgoEheqchB4gf8GIqs/syW97CIN7Cu9hZEV62A32pH74XkTZ
 1V/ug2g8xftmChUAeNQUCZdFM7HedVsoK464E+iOWMnKmb4W2bfQInSU4
 qykhJq7pKR32/N4X9rpYDzRjwSK65bsfIQCaG63egksbInGH1lb/eyXAx w==;
X-CSE-ConnectionGUID: vNPynIlMSpeD1dlVErByMQ==
X-CSE-MsgGUID: mb2qyFpzSiWzhzO+Be+Whg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80686855"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80686855"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:16:06 -0700
X-CSE-ConnectionGUID: y6GkMOaXTQCW6V0psh00Bg==
X-CSE-MsgGUID: jfXcoCxnQPGinMo1OyQOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="241201663"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:16:05 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 10/10] lib: Add genxml annotated batch buffer decode
Date: Wed, 27 May 2026 15:15:21 +0200
Message-ID: <20260527131524.1649421-11-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527131524.1649421-1-jan.maslak@intel.com>
References: <20260527131524.1649421-1-jan.maslak@intel.com>
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
index 3b25a385b7..df4290b006 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -42,6 +42,7 @@
 #include "intel_batchbuffer.h"
 #include "intel_bufops.h"
 #include "intel_chipset.h"
+#include "intel/genxml/igt_genxml_decode.h"
 #include "intel_pat.h"
 #include "media_fill.h"
 #include "media_spin.h"
@@ -1577,7 +1578,9 @@ void intel_bb_print(struct intel_bb *ibb)
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
@@ -1607,6 +1610,33 @@ void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex)
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
2.43.0

