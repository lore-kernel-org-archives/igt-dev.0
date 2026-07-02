Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD6EC43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 18:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F69610F565;
	Thu,  2 Jul 2026 18:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/KGU7jB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DE010F562
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 18:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783016808; x=1814552808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OIOSxIwKPe8SFs/SvaJETiPNPoi7FUy5Ave0WghzAfg=;
 b=i/KGU7jBVGSKGcj59dfS2iZZmJNAIJcIvFxVi0+zOBW/y7E0CY4rPN9u
 Y4SBZ5L9MehbvWJzELCitCRo9dO8OJSv0qN3EdAsRcrzoIyVLkZaWzV2D
 gb9L4Q+qr7kV+qPAIksF959sVA0CDEBf078asuJusvydHYAaH3VeNRlGk
 HZw0AQuufTHt1iAOii+RSPYLMjbPYr+BOpIpiyF+bmStMZEE+1VSiEEcK
 KLNE7KFzJ1OBBNDLcNoVSW1a9yWGHJsTCnJ86SF34YWo+atbsa0exwnJM
 RPnRhmnL4v5T2ufTzU4sjdr7tLB7xWm+2wklTBcJ2waH1k0AODU8aV7Zv w==;
X-CSE-ConnectionGUID: cJVALUmLQjiQoaJvQwHN2g==
X-CSE-MsgGUID: aWKOWEE5QvCMw8H0v6vUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95154708"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="95154708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 11:26:48 -0700
X-CSE-ConnectionGUID: QfpHyda9RH+oQ0Ms3dgx7g==
X-CSE-MsgGUID: cogcQFnXSiK9+sVGZiHYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="253577118"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 02 Jul 2026 11:26:47 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 7/7] tools/vbt_decode: change VBT#57 Combo's layout
Date: Thu,  2 Jul 2026 20:26:19 +0200
Message-ID: <20260702182619.3973788-8-michal.grzelak@intel.com>
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

Each table from Combo's VBT#57 has 11 columns. Showing them in one line
can cause severe eyestrain. Show max 3 columns per line.

Align shown values using tab. Replace some of previous tab signs with
space signs to preserve indentation without taking too much space.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f557d85e91..14a20795fa 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3573,18 +3573,22 @@ static void dump_combo_vspeo(const struct bdb_vswing_preemph *vspeo,
 			int cursor_program = tables[offset + 9];
 			int coeff_polarity = tables[offset + 10];
 
-			printf("\t\t%s: ", vspeo_dp14_levels[row]);
-			printf("dw2_swing_sel: 0x%08x, ", dw2_swing_sel);
-			printf("dw7_n_scalar: 0x%08x, ", dw7_n_scalar);
-			printf("dw4_cursor_coeff: 0x%08x, ", dw4_cursor_coeff);
-			printf("dw4_post_cursor_2: 0x%08x, ", dw4_post_cursor_2);
-			printf("dw4_post_cursor_1: 0x%08x, ", dw4_post_cursor_1);
-			printf("rcomp_scalar: 0x%08x, ", rcomp_scalar);
-			printf("rterm_select: 0x%08x, ", rterm_select);
-			printf("tap3_disable: 0x%08x, ", tap3_disable);
-			printf("tap2_disable: 0x%08x, ", tap2_disable);
-			printf("cursor_program: 0x%08x, ", cursor_program);
-			printf("coeff_polarity: 0x%08x\n", coeff_polarity);
+			printf("\t  %s:\n", vspeo_dp14_levels[row]);
+			printf("\t    ");
+			printf("dw2_swing_sel:\t0x%08x, ", dw2_swing_sel);
+			printf("dw7_n_scalar:\t0x%08x, ", dw7_n_scalar);
+			printf("dw4_cursor_coeff:\t0x%08x, \n", dw4_cursor_coeff);
+			printf("\t    ");
+			printf("dw4_post_cursor_2:\t0x%08x, ", dw4_post_cursor_2);
+			printf("dw4_post_cursor_1:\t0x%08x, ", dw4_post_cursor_1);
+			printf("rcomp_scalar:\t0x%08x, \n", rcomp_scalar);
+			printf("\t    ");
+			printf("rterm_select:\t0x%08x, ", rterm_select);
+			printf("tap3_disable:\t0x%08x, ", tap3_disable);
+			printf("tap2_disable:\t0x%08x, \n", tap2_disable);
+			printf("\t    ");
+			printf("cursor_program:\t0x%08x, ", cursor_program);
+			printf("coeff_polarity:\t0x%08x\n", coeff_polarity);
 
 			offset += vspeo->num_columns;
 		}
-- 
2.45.2

