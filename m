Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0E9606D81E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oDGbVrE/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ABE10E0AD;
	Tue,  3 Nov 2026 00:04:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60ECB10E716
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 23:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793663954; x=1825199954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ew+glAZ22XRt9/8m9I8IoL1oHoQhvPn2vVg/JSX1XVM=;
 b=oDGbVrE/cDXo7sy5nTl9Uzr0j6GVe9Nf4bgQXma/xJw09WGFt7UMzYPW
 eSgTikbDjD9YaIWazTuM0fIPVq0YHvqsbu9vTYHbwHlmEBgRmPUzcwHf7
 tglLunytKLddm92CNlYwmi5hHAsLh676Rka/s+ubDrxJxn8EFfGyRcxNW
 fA3Ipdt/aQ+SbCHi+oVDWZse5v3yiAvopYRHyrGa2uIqgQkXg0R53OvZn
 8SiOQmzRpvt7wcU/ljdaRs4kBSLi/HcY4tYMCLR/89ZV57ERoGNqvVO19
 uqkPP+ESVdj0F0gGKsMMYyxjK55nIAR56nVc4Vl471cGMBKcRibYAE2oL Q==;
X-CSE-ConnectionGUID: GKPhloVSR1azoIaSAabZ+w==
X-CSE-MsgGUID: sGI5KEOLRjmgVCcolVs7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391552"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391552"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:13 -0800
X-CSE-ConnectionGUID: 9kqQFK0vT1G3irYxeUrEVQ==
X-CSE-MsgGUID: e44KfSrzTp2DOHQ27MM07w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6595261"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:12 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 4/7] tools/vbt_decode: parse & dump VS/PE-O tables
 for Snps
Date: Tue,  3 Nov 2026 00:58:50 +0100
Message-ID: <20261102235853.3437332-5-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102235853.3437332-1-michal.grzelak@linux.intel.com>
References: <20261102235853.3437332-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dump VBT #57 tables for Snps. Add a table of strings to store each table
purpose. Show the affected modes on dumping.

v5->v6
- add spaces around operators

v2->v3
- use Cx0 for Snps

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tools/intel_vbt_decode.c | 66 ++++++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 10 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 80e0db2814..85f1404785 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3465,24 +3465,70 @@ static const char * const vspeo_dp14_levels[10] = {
 	"V3-P0",
 };
 
-static void dump_vswing_preemphasis(struct context *context,
-				    const struct bdb_block *block)
+static const char * const vspeo_cx0_tables[6] = {
+	"C10: DP 1.4 RBR/HBR; C20: UNUSED",
+	"C10: DP 1.4 HBR2/HBR3; C20: UNUSED",
+	"C10: eDP non-HBR3; C20: UNUSED",
+	"C10: eDP HBR3; C20: UNUSED",
+	"C10: UNUSED; C20: DP 1.4",
+	"C10: UNUSED; C20: DP 2.X",
+};
+
+static void dump_cx0_vspeo(const struct bdb_vswing_preemph *vspeo,
+			   int num_rows)
 {
-	const struct bdb_vswing_preemph *vspeo = block_data(block);
+	const unsigned int *tables = vspeo->tables;
+	size_t offset = 0;
 
 	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
 	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num_rows);
 
+	printf("\tPHY type: Cx0\n");
 	for (int idx = 0; idx < vspeo->num_tables; idx++) {
-		printf("\tVswing Table #%d:\n", idx+1);
+		printf("\tVswing Table #%d (%s):\n", idx + 1, vspeo_cx0_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			int vswing = tables[offset];
+			int pre_cursor = tables[offset + 1];
+			int post_cursor = tables[offset + 2];
+
+			printf("\t\tPreset #%02d: ", row + 1);
+			printf("vswing: 0x%08x, ", vswing);
+			printf("pre-cursor: 0x%08x, ", pre_cursor);
+			printf("post-cursor: 0x%08x\n", post_cursor);
+
+			offset += vspeo->num_columns;
+		}
+	}
+}
+
+static int
+vswing_preemph_num_rows(int devid)
+{
+	return intel_display_ver(devid) >= 14 ? 16 : 10;
+}
 
-		for (int row = 0; row < 10; row++) {
-			printf("\t\t%s: ", vspeo_dp14_levels[row]);
+static void dump_vswing_preemphasis(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_vswing_preemph *vspeo = block_data(block);
+	int devid = context->devid;
+	int num_rows;
 
-			for (int col = 0; col < vspeo->num_columns; col++)
-				printf(" 0x%08x", vspeo->tables[idx * 10 * vspeo->num_columns + row * vspeo->num_columns + col]);
-			printf("\n");
-		}
+	if (!devid) {
+		fprintf(stderr, "Error: cannot parse VS/PE-O without devid\n");
+		return;
+	}
+
+	num_rows = vswing_preemph_num_rows(devid);
+
+	if (IS_PANTHERLAKE(devid) ||
+	    IS_BATTLEMAGE(devid) ||
+	    IS_LUNARLAKE(devid) ||
+	    IS_METEORLAKE(devid)) {
+		dump_cx0_vspeo(vspeo, num_rows);
+	} else {
+		printf("Warning: deparsing VS/PE-O from devid %x not supported\n", devid);
 	}
 }
 
-- 
2.45.2

