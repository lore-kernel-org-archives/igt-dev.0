Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB44CD3436
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 01:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D9A10E231;
	Thu,  7 May 2026 01:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nO4a26e/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497C510E231
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 01:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117314; x=1809653314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UCVP98ZezSo5tuglBai9FWII9P+9GoShnOlzqNUGQlA=;
 b=nO4a26e/9nerrbQOR09/tYqPLXhfkbB6BVB6tb3Gd+KRoOw3zWb8Z+iK
 xeluzdgYM5hkjXYR1IdY2pLu4c5vYc+HxuZENHMb7/k0jV7mIzo4NwoBZ
 vxGiKe6RUVSAganQpsmbDUJ1QHlWcBmPTsj09dqlORBsuQTF0hHSM77SR
 1HpoZYbllSZVbjYOmIKjv29van9WPSficj04QgOUsw68E5MaWDdi/U8UF
 bctwzN70nV8qRH7RBDqTJR2AFV7MOTYQFgBRzH3V6ih7/BMS0zVxdEWff
 Qb14L6HdinJ/SLTFPAQ8BLD5Zj2IQf5kA1IglVIhpbO3HrB1aO2FkVQA8 Q==;
X-CSE-ConnectionGUID: OcmFZC9NQAmiea7O+4ErmA==
X-CSE-MsgGUID: p1v/KC12RbSg+vZo9aZ9PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96490334"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="96490334"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:28:34 -0700
X-CSE-ConnectionGUID: e8aLGQClTXuOfzFrv1nm6w==
X-CSE-MsgGUID: rkfsYUQYSF2t7NVIfMiOTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238115856"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 18:28:33 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 5/7] tools/vbt_decode: parse & dump VS/PE-O tables
 for LT
Date: Thu,  7 May 2026 03:28:19 +0200
Message-ID: <20260507012821.527453-6-michal.grzelak@intel.com>
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

Dump VBT #57 tables for LT. Add a table of strings to store each table
purpose. Show the affected modes on dumping.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 44 ++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f7ba4bc3d5..6e5fd73473 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3469,27 +3469,55 @@ static const char * const vspeo_levels[16] = {
 	"N/A  ",
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
+static void dump_vspeo_lt(const struct bdb_vswing_preemph *vspeo)
 {
-	const struct bdb_vswing_preemph *vspeo = block_data(block);
+	const unsigned int *tables = vspeo->tables;
+	const unsigned int *vals;
+	int num_rows = 16;
+	size_t offset = 0;
 
 	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
 	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num-rows);
+	printf("\tPhy type: LT\n");
 
 	for (int idx = 0; idx < vspeo->num_tables; idx++) {
-		printf("\tVswing Table #%d:\n", idx+1);
+		printf("\tVswing Table #%d (%s):\n", idx+1, vspeo_lt_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			vals = &tables[offset];
 
-		for (int row = 0; row < 10; row++) {
 			printf("\t\t%s: ", vspeo_levels[row]);
+			printf("main-cursor: 0x%08x, ", vals[0]);
+			printf("pre-cursor: 0x%08x, ", vals[1]);
+			printf("post-cursor: 0x%08x\n", vals[2]);
 
-			for (int col = 0; col < vspeo->num_columns; col++)
-				printf(" 0x%08x", vspeo->tables[idx * 10 * vspeo->num_columns + row * col]);
-			printf("\n");
+			offset += vspeo->num_columns;
 		}
 	}
 }
 
+static void dump_vswing_preemphasis(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_vswing_preemph *vspeo = block_data(block);
+	const char *sgt = (char *) context->vbt->signature;
+
+	if (strstr(sgt, "NOVALAKE")) {
+		dump_vspeo_lt(vspeo);
+	} else {
+		printf("platform not supported\n");
+	}
+}
+
 static void dump_generic_dtd_entry(const struct generic_dtd_entry *dtd,
 				   const char *prefix)
 {
-- 
2.45.2

