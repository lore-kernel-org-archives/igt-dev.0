Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D3D4336B
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 01:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5980A10E57F;
	Fri, 12 Dec 2025 01:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsCDyfl0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A489710E314
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 01:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765501884; x=1797037884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BIxmeEbqwfZw/Be0M9ViY6ekHiIYlKpQOXVqj/0SYHo=;
 b=dsCDyfl07cJZXtHFie20u2hDhNLIQ3hkW7xdjIXggtHujfgkQqqFli6q
 8nUgBLpPpuI/twpX6WGGFV64JZ6tLDX41E23CPxIJH0t6+342buxpdERI
 6woPtHqcrXvRBVDbR81VNpZ+AbHOZ0Sf3PGeEe0wM8N9+ofLk9Rmc+C2I
 iDtwnnUV8BdP78I8RQJicWoggT5RPVGMRR6m3uP/GrUcw8Ejr/+zFivS5
 hS+Flb+NMv7bybeHeYwjFZ0fEMXD6qFlg23a7DsZUnKdGtJx0Ztur8Iwt
 LO027BRuv8qV2tCUQo70gKRwDrjGONQb9TfdR529KE146ooFSsL7ieCbX Q==;
X-CSE-ConnectionGUID: OgbUIpfjS2u8rj3/h5UdsQ==
X-CSE-MsgGUID: eBaEKXBgTTymuSZsPhLJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71118042"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71118042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:23 -0800
X-CSE-ConnectionGUID: OO+uwKEOSnSoOGt2LqDOOQ==
X-CSE-MsgGUID: rR+zqd/nSYSvDDV4s2kHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196031229"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v5 07/18] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Date: Thu, 11 Dec 2025 17:11:19 -0800
Message-ID: <20251212011115.1685703-27-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
References: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
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

