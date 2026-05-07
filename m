Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB73CD3436
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 01:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BB310E231;
	Thu,  7 May 2026 01:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lr5n1AIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23F710E231
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 01:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117312; x=1809653312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A7XD/oVpA5Qjlzgfgx3NTJyWYW0chbuG2pSE0S7EnKg=;
 b=lr5n1AIz5EFXvHSkj98OLMC3ZrL6/3u6gSELmdup1w5ui6hni01TAcUX
 W8UTPirvJZumnXEOVV42c3zbLkIjre/ZRLkVFE0L6mBx2EhPF+XMjrJ5V
 G+ne4m+XM52LiFvnP/ZeeGzmQ51Bez+oFOYdpLXePY2ZLUOM2zjmGrhwm
 J+ceN+/9lcK2SIuJMcAjtcoQ4R8DBv2vgcomsDbTA5NSOCrCx1hnx0FxR
 k0eFOY7r8B+nMGIDDWo9i6kGdhjT3b3nnejS3SKs2MIViW9CiWIVZKo0F
 HOie6H5WAI/q0fAMfDaipTvHa6XdPUjpZit7rg5oU0Zioj/G/3mkXGpwN A==;
X-CSE-ConnectionGUID: osfA7sFHS+utV2XlOibjRQ==
X-CSE-MsgGUID: BHWn+I/5THO9PVSq7Kf0Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96490332"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="96490332"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:28:32 -0700
X-CSE-ConnectionGUID: PkGEMAlET+mjH3lz7hedxw==
X-CSE-MsgGUID: 3tWJ3rlYSu6r3Y/lUoayXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238115839"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 18:28:31 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 3/7] tools/vbt_decode: rename VBT#57 related vars
Date: Thu,  7 May 2026 03:28:17 +0200
Message-ID: <20260507012821.527453-4-michal.grzelak@intel.com>
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

Rename loop iterators n, i, j into idx, row and col. Rename
vswing_preemph[] into vspeo_levels[] since vswing_preemph is an already
overloaded name. Rename vs into vspeo, which stands for VS/PE-O, which
in turn expands to VSwing / Pre-Emphasis Override.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 74ac958f71..6879bd7a7e 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3450,7 +3450,7 @@ static void dump_compression_parameters(struct context *context,
 	}
 }
 
-static const char * const vswing_preemph[16] = {
+static const char * const vspeo_levels[16] = {
 	"V0-P0",
 	"V0-P1",
 	"V0-P2",
@@ -3472,19 +3472,19 @@ static const char * const vswing_preemph[16] = {
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

