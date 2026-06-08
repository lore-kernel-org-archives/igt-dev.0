Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD03CD8C9F
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D03310F34A;
	Mon,  8 Jun 2026 12:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjNGvR7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D767210F35C
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780922579; x=1812458579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ECVxr0uDbw1VsyOtjQqsvpJfIrRHSfT8DRBW+V2VNAM=;
 b=SjNGvR7CshedTipfECJQ52rEHC9XAd98j5JO7uFZidRnko7sHIZsKjSz
 7d8++/GPylPxBqer7d02c8aPe3oKMcJeJOKzJQsmBD1aMPluw+2SX9rOQ
 1TjTsBD0mZMI37AjgdaPXa+70TOJReQslbY5BvLPPBceBFrkrDIiArEUf
 pSfp//nNbhUoCcPh5XhUCLfak2hcvzh19JtDPIQsy6O0ZsNLfjQWZQeA+
 IvK1jbOyiipTWfs/1iund/QjFLxHGesfb2kKjufdd9EEDREVOFQRbjwlS
 uIkiOwGPaDAoZN0CRXRV1atRu4ebFZJl5bHWaIPSc17HibAXrMwMmoU4d w==;
X-CSE-ConnectionGUID: DLqXZRyYTTqBhw+YDqutKQ==
X-CSE-MsgGUID: ZEymzs73TemsKigVJVZgJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683120"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80683120"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:42:58 -0700
X-CSE-ConnectionGUID: nCGItOKsQdy7cJS9syVk5A==
X-CSE-MsgGUID: tiPam3V5QcWAYv5L7Eh6Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244688453"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 05:42:57 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 6/8] tools/vbt_decode: parse & dump VS/PE-O tables
 for LT
Date: Mon,  8 Jun 2026 14:41:19 +0200
Message-ID: <20260608124121.3131410-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260608124121.3131410-1-michal.grzelak@intel.com>
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
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

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 64 +++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index ec82b00939..f209fd89b0 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3464,24 +3464,68 @@ static const char * const vspeo_dp14_levels[10] = {
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
+		printf("\tVswing Table #%d (%s):\n", idx, vspeo_lt_tables[idx]);
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
+	return intel_display_ver(devid) > 14 ? 16 : 10;
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

