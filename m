Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B35CD98CF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 11:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76D110EA28;
	Tue, 16 Jun 2026 11:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHS+K+zT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEDE10E6E2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781608333; x=1813144333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wE06f5gI7ZzTZ7NtSzX0yfvEvxs7tWLj2IFKw29s24I=;
 b=kHS+K+zTIfUrASHJVej1hJL4RIbBqjEr6qu84/kDWo3flRSTClQMrnbo
 76/mHV4QunJUrA4F8MwVxzw2ReTS3GOXPMJkzrqTb8A7ca/OTqiKwMkK8
 U0iAyJ67GQQ5gB4wwg4TaNHyy8Yc6irCRBtFVMdk22VuChwyVt3GGn048
 F6rormlmWRlJv0AFegTlQJ1pzBu1Rax2TJWkLOT9AzBUABXXTG9RehHZy
 BSRoLZ2I4ok+RuCMM0WranzKrQZtmlpR22Osp20VV39PE1vqx9rKBJyBP
 R3xxTdgTzY9sCBRS3smHFarHVhvOeE9sNuFvbvHEjOsenKFJ/7YzYPmiI w==;
X-CSE-ConnectionGUID: f4WMBjzbSHOVAAHDFmN5AA==
X-CSE-MsgGUID: X78CzjNdRHOtCor158vyJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82381969"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82381969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 04:12:13 -0700
X-CSE-ConnectionGUID: VNl9O73NSg+xGvLRpfbW0g==
X-CSE-MsgGUID: 4JM3d7cXT1Wyv6LdU611Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252714094"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 04:12:11 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 5/6] tools/vbt_decode: parse & dump VS/PE-O tables
 for Snps
Date: Tue, 16 Jun 2026 13:12:01 +0200
Message-ID: <20260616111202.1254067-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260616111202.1254067-1-michal.grzelak@intel.com>
References: <20260616111202.1254067-1-michal.grzelak@intel.com>
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

v2->v3
- use Cx0 for Snps

v1->v2
- check platform basing on devid not VBT signature (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 2f3f720573..8d54b113ad 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3474,6 +3474,15 @@ static const char * const vspeo_lt_tables[6] = {
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
@@ -3503,6 +3512,34 @@ static void dump_lt_vspeo(const struct bdb_vswing_preemph *vspeo,
 	}
 }
 
+static void dump_cx0_vspeo(const struct bdb_vswing_preemph *vspeo,
+			   int num_rows)
+{
+	const unsigned int *tables = vspeo->tables;
+	size_t offset = 0;
+
+	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
+	printf("\tNumber of columns: %d\n", vspeo->num_columns);
+	printf("\tNumber of rows: %d\n", num_rows);
+
+	printf("\tPHY type: Cx0\n");
+	for (int idx = 0; idx < vspeo->num_tables; idx++) {
+		printf("\tVswing Table #%d (%s):\n", idx+1, vspeo_cx0_tables[idx]);
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
@@ -3525,6 +3562,11 @@ static void dump_vswing_preemphasis(struct context *context,
 
 	if (IS_NOVALAKE_P(devid) || IS_NOVALAKE_S(devid)) {
 		dump_lt_vspeo(vspeo, num_rows);
+	} else if (IS_PANTHERLAKE(devid) ||
+		   IS_BATTLEMAGE(devid) ||
+		   IS_LUNARLAKE(devid) ||
+		   IS_METEORLAKE(devid)) {
+		dump_cx0_vspeo(vspeo, num_rows);
 	} else {
 		printf("Warning: deparsing VS/PE-O from devid %x not supported\n", devid);
 	}
-- 
2.45.2

