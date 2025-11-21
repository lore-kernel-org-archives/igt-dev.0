Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA9ECFA471
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2DA10E7FB;
	Fri, 21 Nov 2025 03:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8hy0kEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056DC10E7F8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697447; x=1795233447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m1JK2AvkqGF6l+EDYqvHhWdUOZFp4W2wF/GzIVciUtg=;
 b=W8hy0kEvNwd293nosb/PfykYcT7AHhb/YoMPtjF13SH/ze+etoQoDfcV
 cuUjYpejmo5yAOgIJ4VkO1ChKP1CN1fs0pgzEupipYZco72t42mBFcHf/
 m3DIxmODIZK8AhMm89DdrlfIS69ZEokwKf5Ym0oJWwXdd2ho0mAiVyEfZ
 PUc5Bqx1kAGRxgEOhRnuGHQ/kRXWXQec2f+G0gW79yQHuu/GKp0PkQwav
 K/BhWVY9/f9kzub3S/yc2U4SasMi4UkL8HkYRp0EKgh0zynEjKpHjdIYB
 gG1CLi89NPwLXM44RvnNUR6YBcV8ARTc/oI/obv82BJVM1bvyk/lkjdJr Q==;
X-CSE-ConnectionGUID: jBHjl2vIRV6Ex8b/o30EBA==
X-CSE-MsgGUID: XnOVbF+3ScyR2yuH4EZhOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484669"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484669"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:26 -0800
X-CSE-ConnectionGUID: DC/DwQDqTjeJd4OS0BCgnQ==
X-CSE-MsgGUID: WvBiLgBkQrG7j64zjUYTRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433482"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 07/19] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Date: Thu, 20 Nov 2025 19:57:19 -0800
Message-ID: <20251121035715.767226-28-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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
---
 tests/intel/xe_exec_multi_queue.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index df60835d6..fdaaf78c4 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -383,6 +383,29 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
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
@@ -408,6 +431,11 @@ igt_main
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

