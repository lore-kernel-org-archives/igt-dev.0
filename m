Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D0FB44C4
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 08:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0998810F3E6;
	Fri, 24 Apr 2026 08:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lD2Otf1T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCA110F3E6
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 08:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777018617; x=1808554617;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aeO/Uik2ZN39QeAMMWYKGbmtmKZAuNerUZ44X11CTG0=;
 b=lD2Otf1TsIn1rXc5SJcLTfhhxEGYQrcn93FhMB9ge8L3a/gOkcH9HaqT
 PMQ1v+cSnX7cb2igPXHIncazjTbuHRomEIK2ozRhfIhNNbKX/NK0qThCm
 U7dX6IhKweTczhbhujPyl6CjkXVKrhypCeneUkPwSnN7tgjacNlfuLiJk
 g1W1Ojg0BkT8AZnj3escBlsyFK+40KYtMf/luhG1OhjaZwPj4K0dOwCKz
 hThJ8h67BQKhKllLW+9F9L70wMST8l51MTTw/ph7t+hEKv7ogctxbc+Pb
 0MVh8wrzY57L1nvcmChlVnwEiYOx/rgg8tNMq7pEI/5K7V4n49k0UzGIz w==;
X-CSE-ConnectionGUID: /LtyF5qHTfSbJWircSjb9Q==
X-CSE-MsgGUID: ELGzh2gITtaKnxylUPpqpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77882084"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77882084"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 01:16:57 -0700
X-CSE-ConnectionGUID: DsnsY/SdRfyMf/HxRcTSBg==
X-CSE-MsgGUID: o81yD1jCRr6ALcoMzzfXGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="237948638"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.57])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 01:16:55 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Test
 madvise(MADV_DONTNEED)
Date: Fri, 24 Apr 2026 10:16:47 +0200
Message-ID: <20260424081647.516473-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Extend the compute test to make use of madvise(MADV_DONTNEED) on the input
array before reading from it after computation, so that its effects can be
checked by looking at GT stats or tracing for example with:

    sudo bpftrace -e 'kprobe:xe_migrate_from_vram { printf("%llu,%d,VRAM->SYSTEM\n", nsecs, tid); }'

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 32 +++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 5580099f7..5a6334b73 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2267,6 +2267,7 @@ static void read_gt_stats_snapshot(int fd,
 /* compute flags */
 #define TOUCH_ONCE		(0x1 << 0)
 #define ACCESS_DEVICE_HOST	(0x1 << 1)
+#define USE_MADV_DONTNEED	(0x1 << 2)
 
 /**
  * SUBTEST: compute
@@ -2285,6 +2286,18 @@ static void read_gt_stats_snapshot(int fd,
  * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
  * Test category: performance test
  *
+ * SUBTEST: eu-fault-4k-range-device-host-madvise-dontneed
+ * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
+ * Test category: performance test
+ *
+ * SUBTEST: eu-fault-64k-range-device-host-madvise-dontneed
+ * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
+ * Test category: performance test
+ *
+ * SUBTEST: eu-fault-2m-range-device-host-madvise-dontneed
+ * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
+ * Test category: performance test
+ *
  * arg[1]:
  *
  * @once-device:				touch the buffer only once, from the device
@@ -2321,7 +2334,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
 	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
-	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
+	env.skip_results_check = true;
 	env.vm = vm;
 
 	read_gt_stats_snapshot(fd, eci, &stats_before);
@@ -2343,6 +2356,22 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 
 		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
 
+		if (flags & ACCESS_DEVICE_HOST) {
+			float total = 0;
+
+			if (flags & USE_MADV_DONTNEED)
+				madvise(compute_input, size, MADV_DONTNEED);
+
+			/*
+			 * No functional purpose, just force a read on host
+			 */
+			for (int j = 0; j < env.array_size; j++)
+				total += compute_input[i];
+
+			if (!total)
+				igt_debug("compute_input is zeros\n");
+		}
+
 		free(compute_input);
 	}
 
@@ -2524,6 +2553,7 @@ int igt_main()
 		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
 		{ "range-device", 0 },
 		{ "range-device-host", ACCESS_DEVICE_HOST },
+		{ "range-device-host-madvise-dontneed", ACCESS_DEVICE_HOST | USE_MADV_DONTNEED },
 		{ NULL },
 	};
 
-- 
2.43.0

