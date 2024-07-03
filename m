Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05498C30658
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7AE10E702;
	Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQRbonaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F296710E6F9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966338; x=1751502338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RKtb5MewsMV77kAwQ4R5J9UZCZo2D+vWVna6Fimc0ns=;
 b=RQRbonaDpd3m+ooGtuWFMJxKm5K3BWPRtu8mLerdlktWChVivMyG0S0Q
 AN9DmO4vSOAjrgFKeijMrXAkYYiggYBCHTm4LZTn+NNHDztObRX1h2VeG
 Ukz6ztlN51OBD3tiQP4blxPtFuxDwINPaDgC1ONX3aB2TV2+V/wfDD+K1
 jQs2Os/KHQGRErKcBFwqqW1i2h9cgZ2ijAzhm/5MqbIlbv7mNmRHK4Nti
 hvQqzxMA6DRL2yotNssU2NmnZEw5URUyC4zKDautihwV20i7qeGLnxPr5
 Pstp220KugHuK0C4rQ3mWCb+CG6MMT7NCB1TiX1RQQTXEY0Pbvh5jfdo+ w==;
X-CSE-ConnectionGUID: J1TeVc0ORv+JjU+PbEgaCA==
X-CSE-MsgGUID: wpBrCHNcS124d1Mg5PgWNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074282"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074282"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
X-CSE-ConnectionGUID: S59K8kr1RH2xsARnx+PvaA==
X-CSE-MsgGUID: cUPZLK3oReGseLc891xxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072868"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 03/10] tests/intel/xe_drm_fdinfo: Add helper to read
 utilization for all classes
Date: Tue,  2 Jul 2024 17:25:25 -0700
Message-Id: <20240703002532.3156277-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
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

Add a helper that captures utilization for all classes.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index b64bef339..c697f3e53 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -42,6 +42,11 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 
 #define BO_SIZE (65536)
 
+struct pceu_cycles {
+	uint64_t cycles;
+	uint64_t total_cycles;
+};
+
 static const char *engine_map[] = {
 	"rcs",
 	"bcs",
@@ -49,6 +54,21 @@ static const char *engine_map[] = {
 	"vecs",
 	"ccs",
 };
+static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
+{
+	struct drm_client_fdinfo info = { };
+	int class;
+
+	igt_assert(pceu);
+	igt_assert(igt_parse_drm_fdinfo(xe, &info, engine_map,
+					ARRAY_SIZE(engine_map), NULL, 0));
+
+	xe_for_each_engine_class(class) {
+		pceu[class].cycles = info.cycles[class];
+		pceu[class].total_cycles = info.total_cycles[class];
+	}
+}
+
 /* Subtests */
 static void test_active(int fd, struct drm_xe_engine *engine)
 {
-- 
2.38.1

