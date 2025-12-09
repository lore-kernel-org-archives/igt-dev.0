Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FF5D3B7FC
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D749D10E47E;
	Tue,  9 Dec 2025 03:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQVohUjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F96610E37F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250545; x=1796786545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xSnWG7wtxwXMY4CMCJoqZko7l5bSqMamlpBbrsAtIuo=;
 b=RQVohUjxAqLETMdmLmik6S8fTMAf7or8IuZ6S3x2Tx4JPL9iz0vXfkxL
 eVsU4lZR+cMFM0djQTQV7cyB3etvJH4Q88JXqWOv5yEAODTzwlvbNVg3+
 WWZN1jTQfDuJK2nP0rVxAXEUcvhuXuqijyw7PCnBZ0OU5C5QSb579ItND
 ufYZs+B37To/4odLEyaoX3/8PlqrEpboAcA2N+TY34WRxh3gZ4I1/MgIE
 aWIy2COUwYs21XjtgsUjtkwwba3Hev5UGH2xLXUq+PwLdcx55rUC7hnBA
 ai0kxmHEu5oaTa0/Vq1J941qkHam3T+RcJP2Y1L+Z3LxBayAPjQ/7kh8A Q==;
X-CSE-ConnectionGUID: GXEqRxRIQ8aC6Gsnj3wHhA==
X-CSE-MsgGUID: jg3giTTZSF6Vs8DhVv5zYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164324"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164324"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:24 -0800
X-CSE-ConnectionGUID: qXiuRkUkQuC7SbpeRGJ9uQ==
X-CSE-MsgGUID: Si7YTBNKRTmbmN8NjcHNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570909"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 07/18] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Date: Mon,  8 Dec 2025 19:22:13 -0800
Message-ID: <20251209032208.1540217-27-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
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
---
 tests/intel/xe_exec_multi_queue.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 6c1b6616f..4acf5a47f 100644
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
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -422,6 +445,11 @@ igt_main
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

