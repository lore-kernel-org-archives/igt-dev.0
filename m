Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CD7CD98E1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 11:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DC110EA34;
	Tue, 16 Jun 2026 11:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiwX8f4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981B10E6E2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781608328; x=1813144328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CdasVP9jfbPp66pl/ocRw/J2AZ1Q5xlnmyh0JEoiPIc=;
 b=KiwX8f4uBjoeCGCqHmUc5k1FXrZt1n7CpJXAjg+E+AHMu/aOLEgV6CFg
 vZVUkXdZRbgobgwTYoif/IPVJe1gx3BF7zxpVXhzSyP9xoorkmJNf1ZPY
 CdRyNPTNEhXl8r8DI9T2CFi+WYKeBrDaSiCVhgXZaD1NFpMCiO+xKPHxT
 qtjUW69qywZmNcxUazEMlv23KCdUgdxBfwYreV7KfCyT7YIhjWMBzPxgL
 XTS/aXjmD8g3/DaNRl3hfGwz/LhyG9g3myyV9ijG4GNlMypjibeWNJCSD
 SlodhU8hg9xWoqdSaWjvGd1XqdXlMu3v0KCXQR7DVd1n0HlNG7N28i+9K g==;
X-CSE-ConnectionGUID: NUDZMhbLQtOtMf9ylDEwhg==
X-CSE-MsgGUID: yahIRAsATvCg0mWw6h7Q9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82381959"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82381959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 04:12:08 -0700
X-CSE-ConnectionGUID: Ta++gEK4TryZ/XgrSZ+JFw==
X-CSE-MsgGUID: Pm92Pz7/RA+X5qWBDF4U+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252714048"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 04:12:07 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 2/6] tools/vbt_decode: rename VBT#57 related vars
Date: Tue, 16 Jun 2026 13:11:58 +0200
Message-ID: <20260616111202.1254067-3-michal.grzelak@intel.com>
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

Rename loop iterators n, i, j into idx, row and col. Rename
vswing_preemph[] into vspeo_dp14_levels[] since vswing_preemph is an
already overloaded name. Rename vs into vspeo, which stands for VS/PE-O,
which in turn expands to VSwing / Pre-Emphasis Override.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 16f1c96fee..a2e57206d6 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3452,7 +3452,7 @@ static void dump_compression_parameters(struct context *context,
 	}
 }
 
-static const char * const vswing_preemph[10] = {
+static const char * const vspeo_dp14_levels[10] = {
 	"V0-P0",
 	"V0-P1",
 	"V0-P2",
@@ -3468,19 +3468,19 @@ static const char * const vswing_preemph[10] = {
 static void dump_vswing_preemphasis(struct context *context,
 				    const struct bdb_block *block)
 {
-	const struct bdb_vswing_preemph *vs = block_data(block);
+	const struct bdb_vswing_preemph *vspeo = block_data(block);
 
-	printf("\tNumber of vswing tables: %d\n", vs->num_tables);
-	printf("\tNumber of columns: %d\n", vs->num_columns);
+	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
+	printf("\tNumber of columns: %d\n", vspeo->num_columns);
 
-	for (int n = 0; n < vs->num_tables; n++) {
-		printf("\tVswing Table #%d:\n", n+1);
+	for (int idx = 0; idx < vspeo->num_tables; idx++) {
+		printf("\tVswing Table #%d:\n", idx+1);
 
-		for (int i = 0; i < 10; i++) {
-			printf("\t\t%s: ", vswing_preemph[i]);
+		for (int row = 0; row < 10; row++) {
+			printf("\t\t%s: ", vspeo_levels[row]);
 
-			for (int j = 0; j < vs->num_columns; j++)
-				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + i * j]);
+			for (int col = 0; col < vspeo->num_columns; col++)
+				printf(" 0x%08x", vspeo->tables[idx * 10 * vspeo->num_columns + row * col]);
 			printf("\n");
 		}
 	}
-- 
2.45.2

