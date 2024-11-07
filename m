Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCF4D5AE64
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 05:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333CF10E7B1;
	Thu,  7 Nov 2024 05:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNllo+Vg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0674510E7B1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730958798; x=1762494798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yzoyvy14SXuLp/98qzGC9AzaAmVHUpudO/AJFd5nElE=;
 b=aNllo+Vgj9xGfu13xkW6rfh8dag6jCtnacuFh52licxkfrB64qqO347K
 yozKJIdJmhSDkBesLNV3iSFSBVXyQ8YJINb01B9zBlq+c+NbCeW+p1GmX
 uxWNk5es5AM7FmHuIxUVzSJGRI+IL2QMd3QDwXa3T6NnRgCGc8Yi9ezcH
 WbIbpk+kjkM1qlXTihWMOxgVH3x1Z6lMSOf7lR1FZu/ZNaSgIWoHOnukV
 Tf0/jpqrFPILCGjmmMKZ8+6EgJruivuH69yMMe4IqwOdHZCxmlw7TmCwy
 DN04lLSkNIsV7te8CNBtCDVsIdCNKE85/8y3WnN86VCVoaK0mJtXFk1ha Q==;
X-CSE-ConnectionGUID: BThQfGk+SSC6TSqjvD+Lmg==
X-CSE-MsgGUID: xJumsLfBTLWF7rH6bJzXbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41381731"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="41381731"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:13 -0800
X-CSE-ConnectionGUID: BhlF6Ms7Qd6wdJCyNe9m3w==
X-CSE-MsgGUID: uDSehcAjQXmOySo/7ROQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84879399"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:53:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 5/6] lib/igt_ktap: Just free ktap
Date: Wed,  6 Nov 2024 21:52:53 -0800
Message-ID: <20241107055254.3129207-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107055254.3129207-1-lucas.demarchi@intel.com>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
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

Change function signature so it only set the pointer free rather than
also setting it to NULL. This matches alloc/free behavior for other
objects in igt.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c              |  2 +-
 lib/igt_ktap.c              |  5 ++---
 lib/igt_ktap.h              |  2 +-
 lib/tests/igt_ktap_parser.c | 24 ++++++++++++------------
 4 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index fd79e8739..7be95a61c 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1026,7 +1026,7 @@ static int kunit_get_results(struct igt_list_head *results, const char *debugfs_
 	}
 
 	free(buf);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 out_fclose:
 	fclose(results_stream);
diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index 300fb2bb5..aa7ea8447 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -310,8 +310,7 @@ struct igt_ktap_results *igt_ktap_alloc(struct igt_list_head *results)
 	return ktap;
 }
 
-void igt_ktap_free(struct igt_ktap_results **ktap)
+void igt_ktap_free(struct igt_ktap_results *ktap)
 {
-	free(*ktap);
-	*ktap = NULL;
+	free(ktap);
 }
diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
index 7684e859b..c422636bf 100644
--- a/lib/igt_ktap.h
+++ b/lib/igt_ktap.h
@@ -41,6 +41,6 @@ struct igt_ktap_results;
 
 struct igt_ktap_results *igt_ktap_alloc(struct igt_list_head *results);
 int igt_ktap_parse(const char *buf, struct igt_ktap_results *ktap);
-void igt_ktap_free(struct igt_ktap_results **ktap);
+void igt_ktap_free(struct igt_ktap_results *ktap);
 
 #endif /* IGT_KTAP_H */
diff --git a/lib/tests/igt_ktap_parser.c b/lib/tests/igt_ktap_parser.c
index 8c2d16080..6357bdf6a 100644
--- a/lib/tests/igt_ktap_parser.c
+++ b/lib/tests/igt_ktap_parser.c
@@ -45,7 +45,7 @@ static void ktap_list(void)
 	igt_assert_eq(igt_ktap_parse("    ok 4 test_case_4 # SKIP\n", ktap), -EINPROGRESS);
 	igt_assert_eq(igt_ktap_parse("ok 3 test_suite_3\n", ktap), 0);
 
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	igt_assert_eq(igt_list_length(&results), 8);
 
@@ -107,7 +107,7 @@ static void ktap_results(void)
 	igt_assert_eq(igt_ktap_parse("    ok 1 test_case\n", ktap), -EINPROGRESS);
 	igt_assert_eq(igt_ktap_parse("not ok 1 test_suite\n", ktap), 0);
 
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	igt_assert_eq(igt_list_length(&results), 2);
 
@@ -162,7 +162,7 @@ static void ktap_success(void)
 	igt_assert_eq(igt_ktap_parse("not ok 1 test_suite\n", ktap), 0);
 	igt_assert_eq(igt_list_length(&results), 2);
 
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	result = igt_list_last_entry(&results, result, link);
 	igt_list_del(&result->link);
@@ -186,48 +186,48 @@ static void ktap_top_version(void)
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	igt_assert_eq(igt_ktap_parse("1..1\n", ktap), -EPROTO);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	/* TODO: change to -EPROTO as soon as related workaround is dropped */
 	igt_assert_eq(igt_ktap_parse("    KTAP version 1\n", ktap), -EINPROGRESS);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	igt_assert_eq(igt_ktap_parse("    # Subtest: test_suite\n", ktap), -EPROTO);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	igt_assert_eq(igt_ktap_parse("    1..1\n", ktap), -EPROTO);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	igt_assert_eq(igt_ktap_parse("        KTAP version 1\n", ktap), -EPROTO);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	igt_assert_eq(igt_ktap_parse("        # Subtest: test_case\n", ktap), -EPROTO);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	igt_assert_eq(igt_ktap_parse("        ok 1 parameter 1\n", ktap), -EPROTO);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	igt_assert_eq(igt_ktap_parse("    ok 1 test_case\n", ktap), -EPROTO);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 	igt_assert_eq(igt_ktap_parse("ok 1 test_suite\n", ktap), -EPROTO);
-	igt_ktap_free(&ktap);
+	igt_ktap_free(ktap);
 }
 
 igt_main
-- 
2.47.0

