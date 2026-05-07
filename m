Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8331ECD342C
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 01:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B7F10E231;
	Thu,  7 May 2026 01:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9k7NP0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D692C10E231
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 01:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117317; x=1809653317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TArIM3wRJ7y3vy6bicx4V/XPnlgMnI0ME0E5Q2NiNoQ=;
 b=i9k7NP0etW2JBlPT+n3pNhdpGVIdmvZ3VUdvQ892X7T4OibLFqJKc4hF
 oMjwfBnx11craYdzmdq92cNynhTwx/77g1dQzdmwR+ZhMUSnClNehH6eQ
 Q7gFd8PQHVfvPMGf7j/HofV1MBy1BnkvHYactiSB/H93qsyL7dX6ACHuy
 bxw/Za6zwMJ3yvO/JfsM/SdahhkoVNLCoBhr7HrPjpMrIc95yoQCgTyIx
 Quwx44vwG0wXPKw6dMvh8luURZyAwp8dWcX/WH31zqh9bojx318BHC1qN
 euOLj+GEFls3Er5KqIJw8HKpcVXc6Kj/N8R/o2Wkj/bWbrLX6VPf/zU+Z Q==;
X-CSE-ConnectionGUID: uarLOXx2TcCfAYWojNvgiA==
X-CSE-MsgGUID: 2YN9hNdBToCTpS1PBzzcLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96490336"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="96490336"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:28:37 -0700
X-CSE-ConnectionGUID: ONI0IQRlTryj1F9RUKguLg==
X-CSE-MsgGUID: axnpbIu3S+iRwI2+Q6q91w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238115872"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 18:28:35 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 7/7] tools/vbt_decode: parse & dump VS/PE-O tables
 for JSL
Date: Thu,  7 May 2026 03:28:21 +0200
Message-ID: <20260507012821.527453-8-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507012821.527453-1-michal.grzelak@intel.com>
References: <20260507012821.527453-1-michal.grzelak@intel.com>
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

Dump VBT #57 tables for JSL. Add a table of strings to store each
table's purpose. Show the affected modes on dumping. Warn the user on
varying purpose of VS/PE-O tables which depend on whether VBT comes from
EHL or JSL.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index cf6101f077..db596419b2 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3487,6 +3487,12 @@ static const char * const vspeo_snps_tables[6] = {
 	"DP 2.0",
 };
 
+static const char * const vspeo_jsl_tables[3] = {
+	"DP default",
+	"eDP HBR",
+	"eDP HBR2",
+};
+
 static void dump_vspeo_lt(const struct bdb_vswing_preemph *vspeo)
 {
 	const unsigned int *tables = vspeo->tables;
@@ -3542,6 +3548,36 @@ static void dump_vspeo_snps(const struct bdb_vswing_preemph *vspeo)
 	}
 }
 
+static void dump_vspeo_jsl(const struct bdb_vswing_preemph *vspeo)
+{
+	const unsigned int *tables = vspeo->tables;
+	const unsigned int *vals;
+	int num_rows = 10;
+	size_t offset = 0;
+
+	fprintf(stderr, "\tWarning: purpose of tables varies between EHL & JSL\n");
+	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
+	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num_rows);
+
+	printf("\tPhy type: Combo\n");
+	for (int idx = 0; idx < vspeo->num_tables; idx++) {
+		printf("\tVswing Table #%d (%s):\n", idx+1, vspeo_jsl_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			vals = &tables[offset];
+
+			printf("\t\t%s: ", vspeo_levels[row]);
+			printf("dw2_swing_sel: 0x%08x, ", vals[0]);
+			printf("dw7_n_scalar: 0x%08x, ", vals[1]);
+			printf("dw4_cursor_coeff: 0x%08x, ", vals[2]);
+			printf("dw4_post_cursor_2: 0x%08x, ", vals[3]);
+			printf("dw4_post_cursor_1: 0x%08x\n", vals[4]);
+
+			offset += vspeo->num_columns;
+		}
+	}
+}
+
 static void dump_vswing_preemphasis(struct context *context,
 				    const struct bdb_block *block)
 {
@@ -3558,6 +3594,8 @@ static void dump_vswing_preemphasis(struct context *context,
 		dump_vspeo_snps(vspeo);
 	} else if (strstr(sgt, "METEORLAKE")) {
 		dump_vspeo_snps(vspeo);
+	} else if (strstr(sgt, "JASPERLAKE")) {
+		dump_vspeo_jsl(vspeo);
 	} else {
 		printf("platform not supported\n");
 	}
-- 
2.45.2

