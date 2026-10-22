Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115FC606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gkn7C/iq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD48A10E3D7;
	Thu, 22 Oct 2026 10:53:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455DF1124C3
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792666283; x=1824202283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0jcrY40jWFGZkSpShsQx1d3d0jA/gLxZuEb5d5P5xc=;
 b=gkn7C/iq2/tVfSdQ2PfZYhdJeWeGcsD7MbQ6ERsG1BQE/jTvuF5mzouV
 nLTB9Nm9lxw+Fr9IkFaJFuN/e0sIKUAr9VvaOqdLRYXTP+b/QMTnwWLAA
 Qm4EqkgKPFDim2uQON5YVbRud/8YmQY4xHA3j5RvNJ519ja2lEAbDxz7y
 bL1Z7UbVQh9LIDUwMlEzfw67BSfRWL04HpIrpa3vdTzZf9lfuvjoyHegf
 EwUT4GRK3j5+B3SUC3rowA5FZwMtVfAE1sxA1IMc3I5r0onDEkfJvEcp4
 vRI+WS56NN4l+QoJrgg35W6Q+IIP5lcRYygeSDcsOSBm9c7URNFvfKPG5 g==;
X-CSE-ConnectionGUID: HJYIz945Rw26V4Zdz0dhMQ==
X-CSE-MsgGUID: BULnBdUpTR6Se1t8DpmawA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1502736"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1502736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 03:51:23 -0700
X-CSE-ConnectionGUID: zqaHj6iGTMaDcxC5rUhRLg==
X-CSE-MsgGUID: k0U/c4sWQPiBJHamJEzfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3400804"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 03:51:22 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/kms_feature_discovery: add hdcp capability
 discovery subtest
Date: Thu, 22 Oct 2026 16:20:58 +0530
Message-ID: <20261022105102.384486-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022105102.384486-1-sowmiya.s@intel.com>
References: <20261022105102.384486-1-sowmiya.s@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a "hdcp" subtest that reports whether at least one connected
output supports HDCP, using igt_hdcp_output_capable() from the
shared igt_hdcp library with IGT_HDCP_CONTENT_TYPE_0.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_feature_discovery.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index d18272b97..fdc48685f 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -36,6 +36,7 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#include "igt_hdcp.h"
 #include "igt_hdr.h"
 #include "igt_kms.h"
 #include "igt_psr.h"
@@ -76,6 +77,10 @@
  * Description: Make sure that we have at least one DSC-capable sink.
  * Mega feature: VDSC
  *
+ * SUBTEST: hdcp
+ * Description: Make sure that we have at least one HDCP-capable output.
+ * Mega feature: HDCP
+ *
  * arg[1].values: 1, 2, 3, 4
  */
 
@@ -266,5 +271,26 @@ int igt_main() {
 				      "No DSC-capable sink found (checked %d outputs).\n",
 				      num_outputs);
 		}
+
+		igt_describe("Make sure that we have at least one HDCP-capable output.");
+		igt_subtest("hdcp") {
+			igt_output_t *output;
+			int num_outputs = 0;
+			bool found = false;
+
+			for_each_connected_output(&display, output) {
+				num_outputs++;
+				if (!igt_hdcp_output_capable(fd, output,
+							    IGT_HDCP_CONTENT_TYPE_0))
+					continue;
+
+				found = true;
+				break;
+			}
+
+			igt_require_f(found,
+				      "No HDCP-capable output found (checked %d outputs).\n",
+				      num_outputs);
+		}
 	}
 }
-- 
2.43.0

