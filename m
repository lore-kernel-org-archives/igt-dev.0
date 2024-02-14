Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6772EC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 17:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00A210E4C0;
	Wed, 14 Feb 2024 17:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlBWMOeD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7036210E488
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707930819; x=1739466819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y1J3Bk22m1jVoCAUqZV9utpIsQxy++sFbwD4A99z+oA=;
 b=TlBWMOeDepfcrngwxcfc7TmmLdCbdQdhgzD05PPrfN59Ryi2jzQdG1Eu
 EJ6lhQDp6epOp5zJmUBkonHcdYI2xueQ4LT971fQgRm1mtsCoDIl7Juzt
 iOrEdlBBhg29mbJ9NkRKx8cuPty1XB4wzu+6zpGUw6W1N8rEVr2AU8WyC
 uj14Is8atg0Vt3tmyp8VyUMmeGvtPHFPORy/tOLnTRPAxtJUDXbdkaNqb
 Ks34UbXRDhAbkcpQlXJ+PGJkAiSnMvrzGrxQWC55idtvi+me1Ye3F92xj
 D6TDKTpzZ+2akNA3aGVynUVNVpZ6jZuprSPDFFHm8NnhF4CeFJvK60DAq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2114101"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2114101"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 09:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3324131"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 09:13:38 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t 2/2] tests/i915: Add test for
 DRM_I915_QUERY_GUC_SUBMISSION_VERSION
Date: Wed, 14 Feb 2024 09:13:19 -0800
Message-ID: <20240214171319.148482-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240214171319.148482-1-jose.souza@intel.com>
References: <20240214171319.148482-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Test the new query uAPI to fetch GUC submission version.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/intel/i915_query.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index e9cc49597..17671dd02 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -121,6 +121,10 @@
  * SUBTEST: test-query-geometry-subslices
  * Description: Test DRM_I915_QUERY_GEOMETRY_SUBSLICES query
  * Feature: gem_core
+ *
+ * SUBTEST: guc_submission_version
+ * Description: Test DRM_I915_QUERY_GUC_SUBMISSION_VERSION query"
+ * Feature: gem_core
  */
 
 IGT_TEST_DESCRIPTION("Testing the i915 query uAPI.");
@@ -1473,6 +1477,28 @@ static void query_parse_and_validate_hwconfig_table(int i915)
 	free(data);
 }
 
+static void
+query_guc_submission_version(int fd)
+{
+	struct drm_i915_query_guc_submission_version *guc_submission_ver;
+	struct drm_i915_query_item item = {};
+
+	item.query_id = DRM_I915_QUERY_GUC_SUBMISSION_VERSION;
+	i915_query_items(fd, &item, 1);
+	if (item.length < 0) {
+		igt_skip_on_f(item.length == -ENODEV, "GuC submission not enabled\n");
+		igt_skip_on_f(item.length == -EINVAL, "Query not supported by this i915 version\n");
+	}
+
+	guc_submission_ver = calloc(1, item.length);
+	igt_assert(guc_submission_ver);
+	item.data_ptr = to_user_pointer(guc_submission_ver);
+	i915_query_items(fd, &item, 1);
+
+	igt_assert(guc_submission_ver->major > 0 || guc_submission_ver->branch > 0);
+	free(guc_submission_ver);
+}
+
 igt_main
 {
 	int fd = -1;
@@ -1570,6 +1596,10 @@ igt_main
 	igt_subtest("hwconfig_table")
 		query_parse_and_validate_hwconfig_table(fd);
 
+	igt_describe("Test DRM_I915_QUERY_GUC_SUBMISSION_VERSION query");
+	igt_subtest("guc_submission_version")
+		query_guc_submission_version(fd);
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.43.1

