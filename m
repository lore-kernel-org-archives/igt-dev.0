Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16723D3B9B6
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8A110E658;
	Wed, 10 Dec 2025 00:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoOy95gS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFBA10E625
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327185; x=1796863185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BIxmeEbqwfZw/Be0M9ViY6ekHiIYlKpQOXVqj/0SYHo=;
 b=VoOy95gS3Krr+x8Y3sLUQbDUYcP/6uSK9raHkv4m1Yh6rc5Xc9kFJwya
 xplmkV4fuwdAgZ03dv1IXFrnm2POI0jmwrnLk9zclzSUPFBxcy1rLHsfO
 8nzfJ4syy2ytqTUY7c9IBQr5ZIbj7ksD04Ra9taCEUT6NJknPQ8A0ESI4
 ZaufbEGghzGoY9hfdSARfK7G1HY/BWPWmCZAFqwTa6PYbnWF60BmqUwRW
 r9UDmk4OWs4zo+Hchmxr6mhL6QVp424VFxnST2uEf7X+lJvtdZerB7Yoy
 boq7doJ9SLz7g4zcplXKEGBs09xRAKZpEiRpFt6AuU2HomxMRzeKNlIrR g==;
X-CSE-ConnectionGUID: 7cwZXeuOSEScbeYY/wRVgw==
X-CSE-MsgGUID: DdmN/blaTyaD/0EBzLxAJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180401"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180401"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:45 -0800
X-CSE-ConnectionGUID: lAKa+syLTNW3dvIbo0z4gw==
X-CSE-MsgGUID: pokcWMKRS9iCnfb89bvEkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421615"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:45 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v4 07/18] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Date: Tue,  9 Dec 2025 16:39:42 -0800
Message-ID: <20251210003936.1613078-27-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
References: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
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

Validate using virtual exec queues with multiple placements.

v2: Run test even with single engine instance

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 972e1ceec..9fbdacb82 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -397,6 +397,29 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
 	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs, flags);
 }
 
+/**
+ * SUBTEST: virtual
+ * Description: Validate virtual queues with multiple placements
+ * Test category: functionality test
+ */
+static void
+test_exec_virtual(int fd, int gt, int class)
+{
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *hwe;
+	int n = 0;
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+
+		eci[n++] = *hwe;
+	}
+	igt_assert(n);
+
+	test_exec(fd, eci, n, n, n, 0);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -422,6 +445,11 @@ int igt_main()
 			xe_for_each_multi_queue_engine_class(class)
 				test_sanity(fd, gt, class);
 
+	igt_subtest_f("virtual")
+		xe_for_each_gt(fd, gt)
+			xe_for_each_multi_queue_engine_class(class)
+				test_exec_virtual(fd, gt, class);
+
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("one-queue-%s", s->name)
 			xe_for_each_multi_queue_engine(fd, hwe)
-- 
2.43.0

