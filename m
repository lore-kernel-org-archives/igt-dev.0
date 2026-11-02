Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933DD606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 00:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=amSwOzkJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A3010E2F8;
	Tue,  3 Nov 2026 00:06:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E64D10F298
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 23:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793663960; x=1825199960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z3sAOJqauzAgOCs3xqKM6InZTnr7SOgG45TgNQ+FxmI=;
 b=amSwOzkJdLR5l+I6SyAH3MMjzh24m5SSx/iT0T95YSbY21rhTk6neKUF
 qtPvpCo0TUYbZdzU9BLZQ0DdQCGR7UIe9hla5CX6LzlCFBBetXCCoyUKB
 kNmFawdceIzP/HpmyltfbLIIUcybPy1o23IoGuis8NRSCcpnJXcWhOHR0
 yDGTfAyavsMkfuJqCPj6Xr8OwexPyR8BZaae9Ck/WQT/p4d5ImI4wbgb0
 G1qgPISDCSFsp3pzlOG5UPcUhGi0dspVgzXXQy7Fdjyq91h7i/hjYmcD+
 rHcUUzgwRbN8ukIq/oQ6cHv42uBfTAaiZprYlp4sSkIb7EP8UVGuMi0aT w==;
X-CSE-ConnectionGUID: +6LZGo2JSCSIVkUV8x9WVA==
X-CSE-MsgGUID: /oxWU5vITQ2LEoV3uYvxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391557"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:18 -0800
X-CSE-ConnectionGUID: B+EoWw7PQPuMh97Xn4tUMA==
X-CSE-MsgGUID: awt8lmmFTV6bghq7EHvKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6595276"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:16 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 7/7] tools/vbt_decode: parse & dump VS/PE-O tables
 for LT
Date: Tue,  3 Nov 2026 00:58:53 +0100
Message-ID: <20261102235853.3437332-8-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102235853.3437332-1-michal.grzelak@linux.intel.com>
References: <20261102235853.3437332-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
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
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dump VBT #57 tables for LT. Add a table of strings to store each table
purpose. Show the affected modes on dumping.

v6->v7
- change layout of VS/PE-O's tables

v2->v3
- return 16 rows on MTL instead of 10

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tools/intel_vbt_decode.c | 49 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f7d2eccc7a..50f3f8718c 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3465,6 +3465,12 @@ static const char * const vspeo_dp14_levels[10] = {
 	"V3-P0",
 };
 
+static const char * const vspeo_lt_tables[3] = {
+	"eDP",
+	"DP 1.4",
+	"DP 2.0",
+};
+
 static const char * const vspeo_cx0_tables[6] = {
 	"C10: DP 1.4 RBR/HBR; C20: UNUSED",
 	"C10: DP 1.4 HBR2/HBR3; C20: UNUSED",
@@ -3480,6 +3486,39 @@ static const char * const vspeo_combo_tables[3] = {
 	"Low Vswing eDP upto HBR3",
 };
 
+static void dump_lt_vspeo(const struct bdb_vswing_preemph *vspeo,
+			  int num_rows)
+{
+	const unsigned int *tables = vspeo->tables;
+	size_t offset = 0;
+
+	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
+	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num_rows);
+
+	printf("\tPHY type: LT\n");
+
+	for (int idx = 0; idx < vspeo->num_tables; idx++) {
+		printf("\tVswing Table #%d (%s):\n", idx + 1, vspeo_lt_tables[idx]);
+		for (int row = 0; row < num_rows; row++) {
+			int txswing = tables[offset];
+			int txswing_level = tables[offset + 1];
+			int main_cursor = tables[offset + 2];
+			int pre_cursor = tables[offset + 3];
+			int post_cursor = tables[offset + 4];
+
+			printf("\t\tPreset #%02d: ", row + 1);
+			printf("txswing: 0x%08x, ", txswing);
+			printf("txswing_level: 0x%08x, ", txswing_level);
+			printf("main-cursor: 0x%08x, ", main_cursor);
+			printf("pre-cursor: 0x%08x, ", pre_cursor);
+			printf("post-cursor: 0x%08x\n", post_cursor);
+
+			offset += vspeo->num_columns;
+		}
+	}
+}
+
 static void dump_cx0_vspeo(const struct bdb_vswing_preemph *vspeo,
 			   int num_rows)
 {
@@ -3577,10 +3616,12 @@ static void dump_vswing_preemphasis(struct context *context,
 
 	num_rows = vswing_preemph_num_rows(devid);
 
-	if (IS_PANTHERLAKE(devid) ||
-	    IS_BATTLEMAGE(devid) ||
-	    IS_LUNARLAKE(devid) ||
-	    IS_METEORLAKE(devid)) {
+	if (IS_NOVALAKE_P(devid) || IS_NOVALAKE_S(devid)) {
+		dump_lt_vspeo(vspeo, num_rows);
+	} else if (IS_PANTHERLAKE(devid) ||
+		   IS_BATTLEMAGE(devid) ||
+		   IS_LUNARLAKE(devid) ||
+		   IS_METEORLAKE(devid)) {
 		dump_cx0_vspeo(vspeo, num_rows);
 	} else if (IS_JASPERLAKE(devid) || IS_ELKHARTLAKE(devid)) {
 		dump_combo_vspeo(vspeo, num_rows);
-- 
2.45.2

