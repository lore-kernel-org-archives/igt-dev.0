Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFCCCFA0D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C9710EC07;
	Fri, 31 Oct 2025 18:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBkrOt6J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5BE10E32F
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HiDPG8orvAminiwZjHCgVRqL58ShbPuHz/JebwiTuOw=;
 b=LBkrOt6JGmvPgjL1ljembvoV+n+NKjsL8d7OiA0RfFRV32Ol+EmcUqQi
 9dXNSCrJgheCp/1pB/QK3/+eIkRgJqzZg7GOSRNDrZLkZ6LHSi0HHLXzC
 WfLUAOwuTokRHNnaLCctwCsndUaBt71Sjb0T+e8YLZgzD3avPxIbW5o04
 p0/1CHoG3qMsoFn4KgjBNv79fTF3/bKH8UdvsDmz96sTao+NlrRESqib7
 HxQuEomurauVwuCQLfNVSDxgGh0j5irH/I60MDzJZJCag5LSMfEt95d6x
 UIKlBKd0KHeYB0TWhburTr/18LQLTxXWCgPRRsqIHXD//RHeHJrdtDzBR w==;
X-CSE-ConnectionGUID: iQ/yCfomRoyHIkgA6ZxOCQ==
X-CSE-MsgGUID: JfVSB6HmRFi36O2a9eIpDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144729"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: 06O7wD5aRQSqJvc0gG4pvQ==
X-CSE-MsgGUID: v658AXg7SPmgFoJsPNZrpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650023"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple placement test
Date: Fri, 31 Oct 2025 11:35:44 -0700
Message-ID: <20251031183555.1882721-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index c9ff25ffc..eb40e92d2 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -379,6 +379,31 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
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
+
+	if (n < 2)
+		return;
+
+	test_exec(fd, eci, n, n, n, 0);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -404,6 +429,11 @@ igt_main
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

