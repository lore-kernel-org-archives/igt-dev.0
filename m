Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C84606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 00:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jMVNgbr2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E74110E0AD;
	Tue,  3 Nov 2026 00:02:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C912C10E73B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 23:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793663951; x=1825199951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B0Cx5JVpk1li2AjFHsJrHylxgorv38r7RCm4UETbELQ=;
 b=jMVNgbr2EawtmN/pWKe6jGu4LTEPvEWQmJL/+9UiMGpvxtYqcg5R0NwX
 krBVsscvLB6lqsQmRRuK2lFBMVp7qMA2e5LilPk4mJTMiJNMo8n2OWljl
 w/Zy3soIHO0jMyT8B9IBkIn9CPBSnut8Wf6TGO5k0QaDA+yUOg+lW7dML
 oSRlDtntuXLv3k96E+ZQZ3xXUc9SMyqaqXBYjWXSFcsq3J15vEJYCq99M
 vsNrql912qdSAAA+zPy5WMasMhULgcQhqL8NFPMuWz5GUIovYrlHx+L5E
 15JJqoG3Fk4AjEKel8VPYz9IsIV/wAI3LlZGA5wF46cWcf7kIo33w1UsC Q==;
X-CSE-ConnectionGUID: XEIBzctsQKyOUnCO9ynM4A==
X-CSE-MsgGUID: vZSRBdWtR0GLbo3Qd/9Jnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391550"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391550"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:10 -0800
X-CSE-ConnectionGUID: AePDXOc4R+uaB29nbxlTmA==
X-CSE-MsgGUID: 8leo0EoPQk+QImAvoPMKjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6595252"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:09 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 2/7] tools/vbt_decode: rename VBT#57 related vars
Date: Tue,  3 Nov 2026 00:58:48 +0100
Message-ID: <20261102235853.3437332-3-michal.grzelak@linux.intel.com>
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

Rename loop iterators n, i, j into idx, row and col. Rename
vswing_preemph[] into vspeo_dp14_levels[] since vswing_preemph is an
already overloaded name. Rename vs into vspeo, which stands for VS/PE-O,
which in turn expands to VSwing / Pre-Emphasis Override.

v5->v6
- rename table of rows' description (Pranay)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tools/intel_vbt_decode.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 0ea7582745..9f059bfbbb 100644
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
+			printf("\t\t%s: ", vspeo_dp14_levels[row]);
 
-			for (int j = 0; j < vs->num_columns; j++)
-				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + i * vs->num_columns + j]);
+			for (int col = 0; col < vspeo->num_columns; col++)
+				printf(" 0x%08x", vspeo->tables[idx * 10 * vspeo->num_columns + row * vspeo->num_columns + col]);
 			printf("\n");
 		}
 	}
-- 
2.45.2

