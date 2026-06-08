Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5722CD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566D810E358;
	Mon,  8 Jun 2026 12:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXdvid2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C935310E348
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780922582; x=1812458582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PsPhjEAJL6vhWl3qNUzPQRJ+fxchlmLIRjkQ/rmipOA=;
 b=TXdvid2j6hMhU+CWJvLEMnJvWe5+/8NRf3+Ns2AAqXkcVC4K/HGNwEAu
 k98Eg/Fga3YLlNkyai3w0WXyGhsyF6QKN6TgfQLEgDa4MdiLTadnWahFN
 AoJgFn0ovbAWexcj7ND4SdsvHFfNu0b1YvXTOFzuSrBAJP1sNGX4HjQp5
 0Ii5G6c1Q8DNgkAzBYjT2n0/7cuqswaCXPzW/Qdm7E/a8LYcIksv3Uxk8
 z9JabwaoVk4Go4oFZ1WHRh5P+YcqP2hIgwYGX0VhgehSHh/QgMOcyazFx
 X2cFMVf51Rn4hFxlTwXmXq7KeHPuLK8FMKVXHV1qNmOh/YgKXUiN8nvhp w==;
X-CSE-ConnectionGUID: mbRDe/c5SkedCFrO+uRTig==
X-CSE-MsgGUID: vzWKoUkqQw2yhIVd2VFwQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683124"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80683124"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:43:01 -0700
X-CSE-ConnectionGUID: T4XGr2IOStiDgEMmep4r6A==
X-CSE-MsgGUID: dgopu7BNSDigCbZStqIydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244688464"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 05:43:00 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 8/8] tools/vbt_decode: parse & dump VS/PE-O tables
 for Combo
Date: Mon,  8 Jun 2026 14:41:21 +0200
Message-ID: <20260608124121.3131410-9-michal.grzelak@intel.com>
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

Dump VBT #57 tables for JSL/EHL. Add a table of strings to store each
table's purpose. Show the affected modes on dumping. Warn the user on
varying purpose of VS/PE-O tables which depend on whether VBT comes from
EHL or JSL.

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 lib/intel_chipset.h      |  2 ++
 tools/intel_vbt_decode.c | 41 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 3fcc5b18d6..28600a01b3 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -201,6 +201,8 @@ void intel_check_pch(void);
 #define IS_COMETLAKE(devid)	(intel_get_device_info(devid)->is_cometlake)
 #define IS_CANNONLAKE(devid)	(intel_get_device_info(devid)->is_cannonlake)
 #define IS_ICELAKE(devid)	(intel_get_device_info(devid)->is_icelake)
+#define IS_JASPERLAKE(devid)	(intel_get_device_info(devid)->is_jasperlake)
+#define IS_ELKHARTLAKE(devid)	(intel_get_device_info(devid)->is_elkhartlake)
 #define IS_TIGERLAKE(devid)	(intel_get_device_info(devid)->is_tigerlake)
 #define IS_ROCKETLAKE(devid)	(intel_get_device_info(devid)->is_rocketlake)
 #define IS_DG1(devid)		(intel_get_device_info(devid)->is_dg1)
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 0ec08530a9..f30337d84b 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3482,6 +3482,12 @@ static const char * const vspeo_cx0_tables[6] = {
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
@@ -3539,6 +3545,39 @@ static void dump_c20_vspeo(const struct bdb_vswing_preemph *vspeo,
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
+		printf("\tVswing Table #%d (%s):\n", idx, vspeo_combo_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			int dw2_swing_sel = tables[offset];
+			int dw7_n_scalar = tables[offset + 1];
+			int dw4_cursor_coeff = tables[offset + 2];
+			int dw4_post_cursor_2 = tables[offset + 3];
+			int dw4_post_cursor_1 = tables[offset + 4];
+
+			printf("\t\t%s: ", vspeo_dp14_levels[row]);
+			printf("dw2_swing_sel: 0x%08x, ", dw2_swing_sel);
+			printf("dw7_n_scalar: 0x%08x, ", dw7_n_scalar);
+			printf("dw4_cursor_coeff: 0x%08x, ", dw4_cursor_coeff);
+			printf("dw4_post_cursor_2: 0x%08x, ", dw4_post_cursor_2);
+			printf("dw4_post_cursor_1: 0x%08x\n", dw4_post_cursor_1);
+
+			offset += vspeo->num_columns;
+		}
+	}
+}
+
 static int
 vswing_preemph_num_rows(int devid)
 {
@@ -3566,6 +3605,8 @@ static void dump_vswing_preemphasis(struct context *context,
 		   IS_LUNARLAKE(devid) ||
 		   IS_METEORLAKE(devid)) {
 		dump_c20_vspeo(vspeo, num_rows);
+	} else if (IS_JASPERLAKE(devid) || IS_ELKHARTLAKE(devid)) {
+		dump_combo_vspeo(vspeo, num_rows);
 	} else {
 		printf("Warning: deparsing VS/PE-O from devid %x not supported\n", devid);
 	}
-- 
2.45.2

