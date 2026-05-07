Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF13FCD3436
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 01:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC4010E231;
	Thu,  7 May 2026 01:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bxumc7nY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F44310E231
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 01:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117316; x=1809653316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pdq9aWvbKiMTuIjWaT5Mp4BBACE1OAfwRyEq9sLZxh8=;
 b=Bxumc7nYHFZwS3uyofxsEBsT7EnHK+u2e3ET/yww1duSk661Eqs9Ve4V
 dG5QiHm39zTjJnQY9LWWHF2Pyknou4pUDj2rO/lICjQqth0IwBO97izNN
 56QEK26DdZQSaURFWzeZ/yTcV07ePkhMyJszsuHR2VTK1Ira0mt7hai5Y
 q48UqK9oCuSLwIAk9WQDJMEMA0omplk9Wy9U+NLAPlvEvBq+DF9M8kH8Z
 SPJo5KpoMrWRKo9Fk/1EL4QQ5MT8O224j+Y7hhGeWTZQH23fPEVXDrxs3
 I6zz13TSyC19BYlOw4HbIRyt2TsjkP1ph56DzvfEPFw98pKYS4KuLTk1I g==;
X-CSE-ConnectionGUID: nzlKC+a3Q0GBPrRl4UvSug==
X-CSE-MsgGUID: LDBw5I9nSkCZWuf9WwmNQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96490335"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="96490335"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:28:35 -0700
X-CSE-ConnectionGUID: Ogu4bLXCSsWvTAMSST/SdQ==
X-CSE-MsgGUID: LJLyqIh6TkuYOwLQElZW1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238115863"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 18:28:34 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 6/7] tools/vbt_decode: parse & dump VS/PE-O tables
 for Snps
Date: Thu,  7 May 2026 03:28:20 +0200
Message-ID: <20260507012821.527453-7-michal.grzelak@intel.com>
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

Dump VBT #57 tables for Snps. Add a table of strings to store each table
purpose. Show the affected modes on dumping.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 47 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 6e5fd73473..cf6101f077 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3478,6 +3478,15 @@ static const char * const vspeo_lt_tables[6] = {
 	"DP 2.1",
 };
 
+static const char * const vspeo_snps_tables[6] = {
+	"DP 1.4 RBR/HBR",
+	"DP 1.4 HBR2/HBR3",
+	"eDP non-HBR3",
+	"eDP HBR3",
+	"DP 1.4",
+	"DP 2.0",
+};
+
 static void dump_vspeo_lt(const struct bdb_vswing_preemph *vspeo)
 {
 	const unsigned int *tables = vspeo->tables;
@@ -3487,7 +3496,8 @@ static void dump_vspeo_lt(const struct bdb_vswing_preemph *vspeo)
 
 	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
 	printf("\tNumber of columns: %d\n", vspeo->num_columns);
-	printf("\tNumber of rows: %d\n", num-rows);
+	printf("\tNumber of rows: %d\n", num_rows);
+
 	printf("\tPhy type: LT\n");
 
 	for (int idx = 0; idx < vspeo->num_tables; idx++) {
@@ -3505,6 +3515,33 @@ static void dump_vspeo_lt(const struct bdb_vswing_preemph *vspeo)
 	}
 }
 
+static void dump_vspeo_snps(const struct bdb_vswing_preemph *vspeo)
+{
+	const unsigned int *tables = vspeo->tables;
+	const unsigned int *vals;
+	int num_rows = 16;
+	size_t offset = 0;
+
+	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
+	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num_rows);
+
+	printf("\tPhy type: Snps\n");
+	for (int idx = 0; idx < vspeo->num_tables; idx++) {
+		printf("\tVswing Table #%d (%s):\n", idx+1, vspeo_snps_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			vals = &tables[offset];
+
+			printf("\t\t%s: ", vspeo_levels[row]);
+			printf("vswing: 0x%08x, ", vals[0]);
+			printf("pre-cursor: 0x%08x, ", vals[1]);
+			printf("post-cursor: 0x%08x\n", vals[2]);
+
+			offset += vspeo->num_columns;
+		}
+	}
+}
+
 static void dump_vswing_preemphasis(struct context *context,
 				    const struct bdb_block *block)
 {
@@ -3513,6 +3550,14 @@ static void dump_vswing_preemphasis(struct context *context,
 
 	if (strstr(sgt, "NOVALAKE")) {
 		dump_vspeo_lt(vspeo);
+	} else if (strstr(sgt, "PANTHERLAKE")) {
+		dump_vspeo_snps(vspeo);
+	} else if (strstr(sgt, "BATTLEMAGE")) {
+		dump_vspeo_snps(vspeo);
+	} else if (strstr(sgt, "LUNARLAKE")) {
+		dump_vspeo_snps(vspeo);
+	} else if (strstr(sgt, "METEORLAKE")) {
+		dump_vspeo_snps(vspeo);
 	} else {
 		printf("platform not supported\n");
 	}
-- 
2.45.2

