Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF7606A332
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 00:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djpZ9pim
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE4710E13F;
	Tue,  3 Nov 2026 00:05:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7851810E73B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 23:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793663959; x=1825199959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+18GWMQSFevQ8pgoDCMsHWshw6sCOjW0587KNG7+D2w=;
 b=djpZ9pimlImR1SKo3xSMIBaWBx6j1RVRk3LB4qAr5N3oqOfmtdXOzaPA
 EJvRvseCyGNhWtYNNPafYQg/m8AMf6MLRBnnj/YUunN/GVQuG2B0ThM7D
 evyw+Qia0nemxRqmpONvCzsgZcBrJE4pmWdEY8JXSw/2eVP4yqbbfS8vs
 jbe71Y8pOvZNnO666ElwGffzfeWBZwMKVqdNYaqfozgZYJ+puQSg8aqtK
 aOtrEPFSYj1LO0+ifPt7Qmig7NWG3DxUUkiXiDkKjnhpq7fDBUWEvzseA
 GJfPjjtQBRG7tYGkXAXkIcJG9Wdmc3gFB7WeUph9DbYptfilsALq1i+3D Q==;
X-CSE-ConnectionGUID: 9XUH5LNqQHO6D28etcOplw==
X-CSE-MsgGUID: 9ff0qgdSRtKLqFMvINqgLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391555"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391555"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:16 -0800
X-CSE-ConnectionGUID: HkrNt1T7Tn6sKjWkjjwz1w==
X-CSE-MsgGUID: GN11jPkUT4uBIyJebMQcuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6595271"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:15 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 6/7] tools/vbt_decode: change VBT#57 Combo's layout
Date: Tue,  3 Nov 2026 00:58:52 +0100
Message-ID: <20261102235853.3437332-7-michal.grzelak@linux.intel.com>
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

Each table from Combo's VBT#57 has 11 columns. Showing them in one line
can cause eyestrain. Show max 3 columns per line.

Align shown values using tab. Replace some of previous tab signs with
space signs to preserve indentation without taking too much space.

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
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

