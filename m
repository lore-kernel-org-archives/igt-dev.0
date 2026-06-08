Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C851FCD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CC010F339;
	Mon,  8 Jun 2026 12:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqX/iiaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5588D10E348
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780922580; x=1812458580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YEPsjx5aN/UbevmlOY7C7NtlPkTzdf8q+5oo/MdIRPY=;
 b=cqX/iiaQiSq4Kc1M2cC1wMoqnthzplCI0SImudCRo7+SwJsP+VF8gcb2
 fXAXA55xrwUCRxaE5FcNByYySgok6qORh8Fw4PA/zgGZ4nwlDl8F/zJnc
 sl9pBv0hBwXXb9QZcwkpOP2gbfxBn9IxL8CYNLozbFDkv7uOoWMnpw7cq
 1EuwAIhvUiUh4EO8eRcVl7oEXQa9fUe67D1/LQkrohVSk3kFck3PgdgdZ
 ywg4Ryhnsn4fWvL0BP2RoT8+UzKiMcO/6vaEgc5nHnh4GP/Rk1p8IwiPJ
 nq01BRXHnq9fk8JOHMQRhyfQgw++TZjtUkBoCmJ+nwA5tt0k63RP9XAc6 w==;
X-CSE-ConnectionGUID: /FR/xsuKSNeRMYVr9Xi++A==
X-CSE-MsgGUID: gIam8iI2S1iapxsT4y6+hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683123"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80683123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:43:00 -0700
X-CSE-ConnectionGUID: PmDbQ7EfSraYS8UWuUEKVA==
X-CSE-MsgGUID: OjLOS2BrQA2/J/nW2bFHLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244688458"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 05:42:59 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 7/8] tools/vbt_decode: parse & dump VS/PE-O tables
 for Snps
Date: Mon,  8 Jun 2026 14:41:20 +0200
Message-ID: <20260608124121.3131410-8-michal.grzelak@intel.com>
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

Dump VBT #57 tables for Snps. Add a table of strings to store each table
purpose. Show the affected modes on dumping.

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f209fd89b0..0ec08530a9 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3473,6 +3473,15 @@ static const char * const vspeo_lt_tables[6] = {
 	"DP 2.1",
 };
 
+static const char * const vspeo_cx0_tables[6] = {
+	"C10: DP 1.4 RBR/HBR; C20: UNUSED",
+	"C10: DP 1.4 HBR2/HBR3; C20: UNUSED",
+	"C10: eDP non-HBR3; C20: UNUSED",
+	"C10: eDP HBR3; C20: UNUSED",
+	"C10: UNUSED; C20: DP 1.4",
+	"C10: UNUSED; C20: DP 2.X",
+};
+
 static void dump_lt_vspeo(const struct bdb_vswing_preemph *vspeo,
 			  int num_rows)
 {
@@ -3502,6 +3511,34 @@ static void dump_lt_vspeo(const struct bdb_vswing_preemph *vspeo,
 	}
 }
 
+static void dump_c20_vspeo(const struct bdb_vswing_preemph *vspeo,
+			   int num_rows)
+{
+	const unsigned int *tables = vspeo->tables;
+	size_t offset = 0;
+
+	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
+	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num_rows);
+
+	printf("\tPHY type: C20\n");
+	for (int idx = 0; idx < vspeo->num_tables; idx++) {
+		printf("\tVswing Table #%d (%s):\n", idx, vspeo_cx0_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			int vswing = tables[offset];
+			int pre_cursor = tables[offset + 1];
+			int post_cursor = tables[offset + 2];
+
+			printf("\t\tPreset #%02d: ", row+1);
+			printf("vswing: 0x%08x, ", vswing);
+			printf("pre-cursor: 0x%08x, ", pre_cursor);
+			printf("post-cursor: 0x%08x\n", post_cursor);
+
+			offset += vspeo->num_columns;
+		}
+	}
+}
+
 static int
 vswing_preemph_num_rows(int devid)
 {
@@ -3524,6 +3561,11 @@ static void dump_vswing_preemphasis(struct context *context,
 
 	if (IS_NOVALAKE_P(devid) || IS_NOVALAKE_S(devid)) {
 		dump_lt_vspeo(vspeo, num_rows);
+	} else if (IS_PANTHERLAKE(devid) ||
+		   IS_BATTLEMAGE(devid) ||
+		   IS_LUNARLAKE(devid) ||
+		   IS_METEORLAKE(devid)) {
+		dump_c20_vspeo(vspeo, num_rows);
 	} else {
 		printf("Warning: deparsing VS/PE-O from devid %x not supported\n", devid);
 	}
-- 
2.45.2

