Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE70E606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 00:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bSj7pwwB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57DB10E0AD;
	Tue,  3 Nov 2026 00:01:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C5B10E738
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 23:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793663956; x=1825199956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=efTfAwJyVQDubCK0u9JPBohADr/2Lt6A8zHnU5SKUbI=;
 b=bSj7pwwBnCh7sy4uU41+Mnnt2rrFYd41WFYbJGrPJsCkvPdXYaeInZy7
 tdAz56vc3Xk+sAWPVZu64IkjzXCAawulfbeQgY9cIDcUbN8zAifo/rV4c
 RZH1tVGhaScgbDpq1ST33cfBmCbBQ7V/bqfXgy+v1hS/g8Gfz3MC4QGcF
 O3/J19QhLGTBkLdfxtJJqKLeCPmPHGCil//Oqi7NsnoyiQX9/iXt+kGMc
 FgLDUYI8Uw6nP2HkLWRDGCG355hIar+L3BFCOpVUqieTodHr5CASyInkE
 vkcyG7oB02lCTuxE42IyYqBQ4IZD1FJ1go3aF8QQugwuA7aiJAGhtmFZJ w==;
X-CSE-ConnectionGUID: CT+gup09Tb6nvG84DyzKwg==
X-CSE-MsgGUID: JCjojUtsQDy2n+RVxtJWdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391554"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391554"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:15 -0800
X-CSE-ConnectionGUID: 6RCH1pmsQD+c1tgLijSUmQ==
X-CSE-MsgGUID: sLF/LKcGTq2NEcB8jg9I/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6595266"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:13 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 5/7] tools/vbt_decode: parse & dump VS/PE-O tables
 for Combo
Date: Tue,  3 Nov 2026 00:58:51 +0100
Message-ID: <20261102235853.3437332-6-michal.grzelak@linux.intel.com>
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

Dump VBT #57 tables for JSL/EHL. Add a table of strings to store each
table's purpose. Show the affected modes on dumping. Warn the user on
varying purpose of VS/PE-O tables which depend on whether VBT comes from
EHL or JSL.

v5->v6
- add spaces around operators

v4->v5
- show all Combo's columns

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 lib/intel_chipset.h      |  2 ++
 tools/intel_vbt_decode.c | 53 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index d71eeb4370..4c2d26b0b1 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -204,6 +204,8 @@ void intel_check_pch(void);
 #define IS_COMETLAKE(devid)	(intel_get_device_info(devid)->is_cometlake)
 #define IS_CANNONLAKE(devid)	(intel_get_device_info(devid)->is_cannonlake)
 #define IS_ICELAKE(devid)	(intel_get_device_info(devid)->is_icelake)
+#define IS_JASPERLAKE(devid)	(intel_get_device_info(devid)->is_jasperlake)
+#define IS_ELKHARTLAKE(devid)	(intel_get_device_info(devid)->is_elkhartlake)
 #define IS_TIGERLAKE(devid)	(intel_get_device_info(devid)->is_tigerlake)
 #define IS_ROCKETLAKE(devid)	(intel_get_device_info(devid)->is_rocketlake)
 #define IS_DG1(devid)		(intel_get_device_info(devid)->is_dg1)
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 85f1404785..da80297e4f 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3474,6 +3474,12 @@ static const char * const vspeo_cx0_tables[6] = {
 	"C10: UNUSED; C20: DP 2.X",
 };
 
+static const char * const vspeo_combo_tables[3] = {
+	"High Vswing eDP/DP upto HBR3",
+	"Low Vswing eDP upto HBR2",
+	"Low Vswing eDP upto HBR3",
+};
+
 static void dump_cx0_vspeo(const struct bdb_vswing_preemph *vspeo,
 			   int num_rows)
 {
@@ -3502,6 +3508,51 @@ static void dump_cx0_vspeo(const struct bdb_vswing_preemph *vspeo,
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
+		printf("\tVswing Table #%d (%s):\n", idx + 1, vspeo_combo_tables[idx]);
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
@@ -3527,6 +3578,8 @@ static void dump_vswing_preemphasis(struct context *context,
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

