Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10143CD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 11:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12EF10EA43;
	Tue, 16 Jun 2026 11:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaqsQ0Ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937B210E6E2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781608331; x=1813144331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6tLPbAak4cflCKSHQJorExHzJ63TPTWaHWJdUxr3sPM=;
 b=BaqsQ0Ijwx5sLoaCv9BPuG/RO67xGNdDa+0IHMGKnJWY2TIfP1xnw7+/
 KSTu1fIz8rwL62PFqC49CfVJSr5t33yHblodVPuEGzpHiPFUZIe+ZmcM5
 5K4t44tQv/+0dHryqZysg/5ZDgYBAbctvgESuosBB7M3EDkZztNeMN03y
 Eil76Jlhw2AvdLCGdQ6xdOrMUUl1FWz3e/j8POuF7vZzQJtf67Q95jyO/
 VC2g/uLPlUHulkYNvw6guAHYHkwu+DHFzVlyYr9Q2ift6WOSBRUpcIXiV
 kx4gId6IM07rgf+NzDdBA4RHTM+R+HnINwxjE/p4ophlFNTW/2Td17oe8 w==;
X-CSE-ConnectionGUID: G+j3+Jo1S4G/jy18kb6NyQ==
X-CSE-MsgGUID: vLi2PNXnQPWylhAD4JNjog==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82381963"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82381963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 04:12:11 -0700
X-CSE-ConnectionGUID: RCTeVu04SB2CctiJ3y1eqw==
X-CSE-MsgGUID: L1h0tcUTRCO/XXFb/HEMWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252714073"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 04:12:10 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 4/6] tools/vbt_decode: parse & dump VS/PE-O tables
 for LT
Date: Tue, 16 Jun 2026 13:12:00 +0200
Message-ID: <20260616111202.1254067-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260616111202.1254067-1-michal.grzelak@intel.com>
References: <20260616111202.1254067-1-michal.grzelak@intel.com>
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
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Dump VBT #57 tables for LT. Add a table of strings to store each table
purpose. Show the affected modes on dumping.

Currently Vswing / Pre-emphasis Override is not supported by kernel on
LT, but it doesn't harm to add decoding into IGT.

v2->v3
- return 16 rows on MTL instead of 10

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 64 +++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 33f8598e5f..2f3f720573 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3465,24 +3465,68 @@ static const char * const vspeo_dp14_levels[10] = {
 	"V3-P0",
 };
 
-static void dump_vswing_preemphasis(struct context *context,
-				    const struct bdb_block *block)
+static const char * const vspeo_lt_tables[6] = {
+	"UNUSED",
+	"UNUSED",
+	"UNUSED",
+	"UNUSED",
+	"DP 1.4",
+	"DP 2.1",
+};
+
+static void dump_lt_vspeo(const struct bdb_vswing_preemph *vspeo,
+			  int num_rows)
 {
-	const struct bdb_vswing_preemph *vspeo = block_data(block);
+	const unsigned int *tables = vspeo->tables;
+	size_t offset = 0;
 
 	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
 	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num_rows);
+
+	printf("\tPHY type: LT\n");
 
 	for (int idx = 0; idx < vspeo->num_tables; idx++) {
-		printf("\tVswing Table #%d:\n", idx+1);
+		printf("\tVswing Table #%d (%s):\n", idx+1, vspeo_lt_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			int main_cursor = tables[offset];
+			int pre_cursor = tables[offset + 1];
+			int post_cursor = tables[offset + 2];
+
+			printf("\t\tPreset #%02d: ", row+1);
+			printf("main-cursor: 0x%08x, ", main_cursor);
+			printf("pre-cursor: 0x%08x, ", pre_cursor);
+			printf("post-cursor: 0x%08x\n", post_cursor);
+
+			offset += vspeo->num_columns;
+		}
+	}
+}
 
-		for (int row = 0; row < 10; row++) {
-			printf("\t\t%s: ", vspeo_levels[row]);
+static int
+vswing_preemph_num_rows(int devid)
+{
+	return intel_display_ver(devid) >= 14 ? 16 : 10;
+}
 
-			for (int col = 0; col < vspeo->num_columns; col++)
-				printf(" 0x%08x", vspeo->tables[idx * 10 * vspeo->num_columns + row * col]);
-			printf("\n");
-		}
+static void dump_vswing_preemphasis(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_vswing_preemph *vspeo = block_data(block);
+	int devid = context->devid;
+	int num_rows;
+
+	if (!devid) {
+		fprintf(stderr, "Error: cannot parse VS/PE-O without devid\n");
+		return;
+	}
+
+	num_rows = vswing_preemph_num_rows(devid);
+
+	if (IS_NOVALAKE_P(devid) || IS_NOVALAKE_S(devid)) {
+		dump_lt_vspeo(vspeo, num_rows);
+	} else {
+		printf("Warning: deparsing VS/PE-O from devid %x not supported\n", devid);
 	}
 }
 
-- 
2.45.2

