Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA404C79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 18:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E12110E56A;
	Wed,  9 Sep 2026 18:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyG76k4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B4710E1F0
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788978932; x=1820514932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FSOsObo+2oloyWKAVOxqyZpMEVnkkTU5hBbcaMX6cGA=;
 b=YyG76k4hfnHGGXnjc9Km7BrAkJzO9TJGj8mTGDiihbk8tRU+5HNiDU05
 cUKlSxgEzqdThNGPxNPtQsgfGYtKaSnRUDXuWLHZqiL42cbtY8SqWzC6Q
 CK6Qctp2I+iJHFAhwbfPMJZ6rhunN2dw3EKgI47SU3hSR1AyeWuSTAhUD
 rbef5tn/sw+WzfXdoCmIlmIY6ESUbYIk1tx54wXR+PTXuil6Hlzho1XNl
 TXaR8vr1uAnLSQBpmJHovrLbJH2CwWoFV/iclOI/lsal8cncP2R1UvQ2o
 Z8cLjjVrT7QK/eGIT3u2/MJaV5PF8HXLq8EjIJSszTdv4SoglVhphZSGl g==;
X-CSE-ConnectionGUID: RWp1K7vrSeSEHZz7yNVWoA==
X-CSE-MsgGUID: cd6QjSPFSKOdZx0hm/6J0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114960106"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114960106"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 11:35:32 -0700
X-CSE-ConnectionGUID: 1g/60LpMT5Gi81NSeEVnQQ==
X-CSE-MsgGUID: HrT3FfhLRfK7pDC9qNe2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270901286"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 11:35:31 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v6 4/6] tools/vbt_decode: parse & dump VS/PE-O tables
 for Snps
Date: Wed,  9 Sep 2026 20:34:49 +0200
Message-ID: <20260909183451.2630263-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260909183451.2630263-1-michal.grzelak@intel.com>
References: <20260909183451.2630263-1-michal.grzelak@intel.com>
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

Dump VBT #57 tables for Snps. Add a table of strings to store each table
purpose. Show the affected modes on dumping.

v5->v6
- add spaces around operators

v2->v3
- use Cx0 for Snps

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
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

