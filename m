Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FECECD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C174510E317;
	Mon, 15 Jun 2026 09:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbV0CBbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C615F10E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515914; x=1813051914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6tLPbAak4cflCKSHQJorExHzJ63TPTWaHWJdUxr3sPM=;
 b=kbV0CBbPHwJXJ0TMGcWWVXnnBZB0NZMCtOSV+4Y/XVkTSotVdwT1mnCo
 lp/6I7W+g1w8V/FjT2XtYHazZGE2yYDyCQ3dLbGKATkutVPwFbYVIZFeB
 stkTn5GKFHENwSYGlSqTJqvxVDs5UpwvsUVbNsPGXpaitGxJancySlFFh
 VHQLEhDUN2/nAFCgj1BRqAZRjIIExFFH+NXscb01JMM7GTHDc0F3cbYeg
 Hyqq1OKh22XWUNMgd+y4/Qm/aQZCT/9QN5VDOXNiGcWiD5ps6ccpBoJYV
 SehSQ/XTEnzoK5XmhTFkcV/3dy3l+4MqbQt414IPNoivb9GwcOF5kN8ZS g==;
X-CSE-ConnectionGUID: Jl09xjkYTy6/I64Ly/XAjQ==
X-CSE-MsgGUID: WEkrf0k9S0eEpFGHt8lGHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82235899"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82235899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:31:54 -0700
X-CSE-ConnectionGUID: r7b6IyTHTWigxMnmdtqjJw==
X-CSE-MsgGUID: 3IN37mWaQr69BS9WKXT+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247465295"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 02:31:53 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 08/10] tools/vbt_decode: parse & dump VS/PE-O tables
 for LT
Date: Mon, 15 Jun 2026 11:31:35 +0200
Message-ID: <20260615093137.681050-9-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615093137.681050-1-michal.grzelak@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
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

