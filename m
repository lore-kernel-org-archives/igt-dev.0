Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3B9D591CC
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC2210E5B3;
	Tue, 19 Nov 2024 05:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2bcqDSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B7710E0E4
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994220; x=1763530220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Cyc+jd2EORbU78aDYSkvld9QgfM+VMpJuFr1cD6/b8=;
 b=i2bcqDStyEQ9UdHQGGwQjh0cGJj2S9JsTYTUc9bPPWsliyX9TXrVYbUf
 CNzmz9MOgnf+t7Zx5Z2wK5CWTa8cd6NCxegQiI8Ye3VN94VEeIBOhvI54
 nc1Lq2XsxnZSZf67kgo5DOmgT37YQZxhM274Y3wX7jMysd5wXmJ4taE2L
 /iUktLVO/7W5OKIoRa7Qv9msr+FJNJcY/uJTF6KC5tAAuhnpPt8Sf1lMh
 wcaMC5TY95/Nn7rWyTzFF+qf30hsx+vkTTZRwZvDdFcPnRJr9920x41sw
 F0qwQbgjgVo5QiR4d6H+QFsvAf80zTjYbscWUCrFwERW7DsjFS0hiGj2e w==;
X-CSE-ConnectionGUID: gll3DeCOQ7OWSWz3HyDbEA==
X-CSE-MsgGUID: +VwsTARWTkKofPcX7kSwNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35884741"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35884741"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
X-CSE-ConnectionGUID: 3EYAiPKyTpawxJfIm3kKfg==
X-CSE-MsgGUID: XrM7t7rVQD6dq5WuOBLkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89865111"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:30:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 5/6] lib/igt_ktap: Just free ktap
Date: Mon, 18 Nov 2024 21:29:53 -0800
Message-ID: <20241119052954.1993905-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119052954.1993905-1-lucas.demarchi@intel.com>
References: <20241119052954.1993905-1-lucas.demarchi@intel.com>
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

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c              |  2 +-
 lib/igt_ktap.c              |  5 ++---
 lib/igt_ktap.h              |  2 +-
 lib/tests/igt_ktap_parser.c | 24 ++++++++++++------------
 4 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 626d67541..3f77a0c94 100644
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

