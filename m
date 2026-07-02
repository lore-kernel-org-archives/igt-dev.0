Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F90C43602
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 18:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7455810F55E;
	Thu,  2 Jul 2026 18:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bojo0uAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150E710F55E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783016807; x=1814552807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JxF+4WJgRsWGjL26BZk8r5gSD1kExphWQ9Zqx32I7/I=;
 b=bojo0uAWeAVwKqPyjDzIMaeh8dkLRje+IYZgxASHpZDKe2iS/D+l1lhs
 bqK8u05tPaFpiGt3LUD0uALqggEsamUi03HxW9Jd2rvv4p4QXLb+LsK3C
 OVfh7flCB4dmLWFKqMvrWiJIHooI5yvhFdeS0EM55zAMZk67913cck0eM
 +PPG/N1BCwmetZ9y6lAWfdFSnfZmEMp0Iseg5Dz3jFE46nvFeADeZhLwj
 0CGiskfgnfQOKhp/tMfsTtDEgOfGzkepC+PPH0ISTQyL+U+Qaf6etL+cX
 r+e+l8TbNswKoXCq7T+8i8bmMIrfbFmRhc/JZuEkIrzlL/HYpGirEbbFG Q==;
X-CSE-ConnectionGUID: YJy4KH9SSQ+/30QHiOSpLQ==
X-CSE-MsgGUID: 2exxn58OQBi406Dflf/O8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95154706"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="95154706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 11:26:47 -0700
X-CSE-ConnectionGUID: dfXz6AtLTFS+bQuarjxfNA==
X-CSE-MsgGUID: 0FwtyNwiSYi8J3uyGP0mBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="253577114"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 02 Jul 2026 11:26:46 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 6/7] tools/vbt_decode: parse & dump VS/PE-O tables
 for Combo
Date: Thu,  2 Jul 2026 20:26:18 +0200
Message-ID: <20260702182619.3973788-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702182619.3973788-1-michal.grzelak@intel.com>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
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

Dump VBT #57 tables for JSL/EHL. Add a table of strings to store each
table's purpose. Show the affected modes on dumping. Warn the user on
varying purpose of VS/PE-O tables which depend on whether VBT comes from
EHL or JSL.

v4->v5
- show all Combo's columns

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 lib/intel_chipset.h      |  2 ++
 tools/intel_vbt_decode.c | 53 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 1f02932e4a..bdeaf038b5 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -203,6 +203,8 @@ void intel_check_pch(void);
 #define IS_COMETLAKE(devid)	(intel_get_device_info(devid)->is_cometlake)
 #define IS_CANNONLAKE(devid)	(intel_get_device_info(devid)->is_cannonlake)
 #define IS_ICELAKE(devid)	(intel_get_device_info(devid)->is_icelake)
+#define IS_JASPERLAKE(devid)	(intel_get_device_info(devid)->is_jasperlake)
+#define IS_ELKHARTLAKE(devid)	(intel_get_device_info(devid)->is_elkhartlake)
 #define IS_TIGERLAKE(devid)	(intel_get_device_info(devid)->is_tigerlake)
 #define IS_ROCKETLAKE(devid)	(intel_get_device_info(devid)->is_rocketlake)
 #define IS_DG1(devid)		(intel_get_device_info(devid)->is_dg1)
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 8d54b113ad..f557d85e91 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3483,6 +3483,12 @@ static const char * const vspeo_cx0_tables[6] = {
 	"C10: UNUSED; C20: DP 2.X",
 };
 
+static const char * const vspeo_combo_tables[3] = {
+	"High Vswing eDP/DP upto HBR3",
+	"Low Vswing eDP upto HBR2",
+	"Low Vswing eDP upto HBR3",
+};
+
 static void dump_lt_vspeo(const struct bdb_vswing_preemph *vspeo,
 			  int num_rows)
 {
@@ -3540,6 +3546,51 @@ static void dump_cx0_vspeo(const struct bdb_vswing_preemph *vspeo,
 	}
 }
 
+static void dump_combo_vspeo(const struct bdb_vswing_preemph *vspeo,
+			     int num_rows)
+{
+	const unsigned int *tables = vspeo->tables;
+	size_t offset = 0;
+
+	fprintf(stderr, "\tWarning: purpose of tables varies between EHL & JSL\n");
+	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
+	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num_rows);
+
+	printf("\tPHY type: Combo\n");
+	for (int idx = 0; idx < vspeo->num_tables; idx++) {
+		printf("\tVswing Table #%d (%s):\n", idx+1, vspeo_combo_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			int dw2_swing_sel = tables[offset];
+			int dw7_n_scalar = tables[offset + 1];
+			int dw4_cursor_coeff = tables[offset + 2];
+			int dw4_post_cursor_2 = tables[offset + 3];
+			int dw4_post_cursor_1 = tables[offset + 4];
+			int rcomp_scalar = tables[offset + 5];
+			int rterm_select = tables[offset + 6];
+			int tap3_disable = tables[offset + 7];
+			int tap2_disable = tables[offset + 8];
+			int cursor_program = tables[offset + 9];
+			int coeff_polarity = tables[offset + 10];
+
+			printf("\t\t%s: ", vspeo_dp14_levels[row]);
+			printf("dw2_swing_sel: 0x%08x, ", dw2_swing_sel);
+			printf("dw7_n_scalar: 0x%08x, ", dw7_n_scalar);
+			printf("dw4_cursor_coeff: 0x%08x, ", dw4_cursor_coeff);
+			printf("dw4_post_cursor_2: 0x%08x, ", dw4_post_cursor_2);
+			printf("dw4_post_cursor_1: 0x%08x, ", dw4_post_cursor_1);
+			printf("rcomp_scalar: 0x%08x, ", rcomp_scalar);
+			printf("rterm_select: 0x%08x, ", rterm_select);
+			printf("tap3_disable: 0x%08x, ", tap3_disable);
+			printf("tap2_disable: 0x%08x, ", tap2_disable);
+			printf("cursor_program: 0x%08x, ", cursor_program);
+			printf("coeff_polarity: 0x%08x\n", coeff_polarity);
+
+			offset += vspeo->num_columns;
+		}
+	}
+}
+
 static int
 vswing_preemph_num_rows(int devid)
 {
@@ -3567,6 +3618,8 @@ static void dump_vswing_preemphasis(struct context *context,
 		   IS_LUNARLAKE(devid) ||
 		   IS_METEORLAKE(devid)) {
 		dump_cx0_vspeo(vspeo, num_rows);
+	} else if (IS_JASPERLAKE(devid) || IS_ELKHARTLAKE(devid)) {
+		dump_combo_vspeo(vspeo, num_rows);
 	} else {
 		printf("Warning: deparsing VS/PE-O from devid %x not supported\n", devid);
 	}
-- 
2.45.2

