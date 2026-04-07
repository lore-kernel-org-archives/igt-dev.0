Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D184CFEEF34
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 13:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1F210E097;
	Tue,  7 Apr 2026 13:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfOXcqcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAB710E097
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775568396; x=1807104396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4LbXqFGJi3tslwCoC/9da1DEFlJO4E8/4vQx43WS8Vs=;
 b=TfOXcqcOr11bYNO1fUl/+ugLWD7l3owDG5LCg2mApuZ4cFx5VkbdU6R3
 7mccMjCGjjjQyNMADPuI4aEJyB7eoKP8XyoEH/2Eyk6vFJwtfBluMfkQf
 9sGLOB6YpgD3jbqxjNiPRC2RlcsSFb8eIjArhFc57aj69HslAU0Zh9imR
 ozCMJsTkPajDUd4JpMIdHpm4pk0xWXhYv+g5b8H3uM+/Z2Lqur5IYgJPA
 +R+n39RAzf0aaVnvBtYSQVYGh+IYs0myElJ7mL7zW5hMtEYn385yOT2dA
 wrMstjbK3NO0+Kq87wdSjfmzV2p5XcQZ3hOHLNtuLX1GH5mPTNnFla9dn Q==;
X-CSE-ConnectionGUID: S7wkfnXwT5SFdT3RGAV1yw==
X-CSE-MsgGUID: sR24wUrBSEaj9sr5qrqE8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76425611"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76425611"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 06:26:36 -0700
X-CSE-ConnectionGUID: QJuV3X7uQDuKLbAh7lQFHg==
X-CSE-MsgGUID: rpql50psQoKKQrRGbkwmqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="224983946"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 06:26:35 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 3/3] lib: Add genxml annotated batch buffer decode
Date: Tue,  7 Apr 2026 15:26:20 +0200
Message-Id: <20260407132620.1397340-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407132620.1397340-1-jan.maslak@intel.com>
References: <20260407132620.1397340-1-jan.maslak@intel.com>
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
index b09506574..3d1ee2dab 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -49,6 +49,7 @@
 #include "veboxcopy.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "genxml/igt_genxml_decode.h"
 
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

