Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2E7CD98F6
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 03:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48F210E453;
	Mon, 22 Jun 2026 03:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INNI9A0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C79610E43D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 03:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782100298; x=1813636298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OEKpDHTJY/Crm9lT6lWtORumvzEaRrzmgBmXLbfgqJQ=;
 b=INNI9A0/kWRbqD7qz4DPw7kMx5kezSOHcwakTdcNwYMuHVd1Tmorr0I/
 kIaEVwNAYJv2BB5pBHp2cjl8jjcVrYqP9Ygc3tN3EvAp0zIRekIM3Syb4
 +nEj/iB+RLtuntbw/Is1fLqCoR3645iiFthfBu/Mj9njOAsU3rVVjPAm+
 DB1Z7QQ8Aa8USRzQRi2V4s7oSkE5vR/M0VlEy4HV30tQpfoXxsSRUXQLj
 2ArII/GOFEodMqe7bCRA1n14VjGulxqvupgv8iLKuMQN1x3Qa1ZvkaZQE
 wiUOOFQhc/wNf5IYhQ7XjaLTQT1BBzvl/RLMtHrnwtQkJyxvrQ0rlN6bW Q==;
X-CSE-ConnectionGUID: iR0uWWjNR86vLHi3+Z9zYw==
X-CSE-MsgGUID: A92LDV+bTCie8YogY60YzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82596526"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82596526"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 20:51:37 -0700
X-CSE-ConnectionGUID: ld5oJzLMRIC0ysgYyQcgsw==
X-CSE-MsgGUID: ufaa0/JkSvCQ476y1Nq+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248964556"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 20:51:36 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 11/11] lib: Add genxml annotated batch buffer decode
Date: Mon, 22 Jun 2026 05:51:06 +0200
Message-ID: <20260622035106.3023047-12-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622035106.3023047-1-jan.maslak@intel.com>
References: <20260622035106.3023047-1-jan.maslak@intel.com>
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
index 912b936e0c..1dacfdc6c7 100644
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
@@ -1611,7 +1612,9 @@ void intel_bb_print(struct intel_bb *ibb)
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
@@ -1641,6 +1644,33 @@ void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex)
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

