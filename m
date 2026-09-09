Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3699AC79FB7
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 18:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3E010E1F0;
	Wed,  9 Sep 2026 18:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTgiLIPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB1210E1F0
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788978936; x=1820514936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bArxJXhdQiOoQk1Spf6c/cdRykAgPQk0sTLAOe9mL0=;
 b=aTgiLIPT6AKBNHfuB+p63OirYMXuSQeFy1d8H3XWEBzDihByrC6YB575
 y5kU3vblb3kPLWVwRfGmvqrGStwcEFKeh3Usos05kt4xCTCm/pgaeM+Tl
 w2r8CqXFSUy2/MoCeNEqY16z70gDzoL4Mn7jQjxrEBYURNe7I/RS56guz
 +IEOmRIV65stJ+oY3Y0MQEnjXo3NgrdF19tk5FMW5QxBXDHATKyqLgAUj
 +Zz3OdExIpgJ/QWdmylHfeeJVClJxtbgAqANbjiR7o3hVScQ+I4GMwp0A
 DlewB8v3k40Jv8AIeHe+zhGs88wWTRth8Kgl2VgXE2KZv5Lc+mUJNWfat A==;
X-CSE-ConnectionGUID: RQhUBgwvT0GgaR0tqPZaRA==
X-CSE-MsgGUID: Z7NhhhFRQcGREpGQ22sbZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114960115"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114960115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 11:35:35 -0700
X-CSE-ConnectionGUID: 9IaMMGCpTWCZN4LJLmOEXA==
X-CSE-MsgGUID: Ah9e/btvQUW2Wl/dsnj9Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270901305"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 11:35:34 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v6 6/6] tools/vbt_decode: change VBT#57 Combo's layout
Date: Wed,  9 Sep 2026 20:34:51 +0200
Message-ID: <20260909183451.2630263-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260909183451.2630263-1-michal.grzelak@intel.com>
References: <20260909183451.2630263-1-michal.grzelak@intel.com>
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
index da80297e4f..f7d2eccc7a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3535,18 +3535,22 @@ static void dump_combo_vspeo(const struct bdb_vswing_preemph *vspeo,
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

