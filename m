Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E10D35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 09:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450CA10EFF1;
	Wed,  1 Apr 2026 09:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y70CFRvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626EB10EFDB
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775034637; x=1806570637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iir97K6R3jWFwZTcRmj+S8Y75baa10UvwCAnaWZxC2Y=;
 b=Y70CFRvhCG+YjvlwjcU41lN0yyUF+jq7a/Bro5vnJl6mFkZzk7gKBlBd
 2TNfTfeRgiTh2PlF0/rotErB0J+FqBI1f7RmLLY+jwAbxFyDN2ZiYcXZV
 ByDQwApYGx3GhwRWX8oF0fkziVvXDVsjNMMAiVGZQAwKVvP8rzKefw4yS
 ldxRdYgRBWcAIOuFyQfFfnSUOCwWqz3gjGX+9UYgs/aCx2KE25KLOy+qM
 3GujSajbOZv2vSYtEswJr+hqBBNkNVMZerj6/hmDl5mbtpXYQQZw1Khex
 fS+s8akEa3vSjAtenc7Inqpq7w4Pafspt6wVKFK10WYxViOwiMMPYyCnl w==;
X-CSE-ConnectionGUID: 3ZSiTUV/Qe+VXmVnIrKvbQ==
X-CSE-MsgGUID: Dnau/zzoRuCZQQvvJX8UKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86762939"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="86762939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:10:37 -0700
X-CSE-ConnectionGUID: jpVNKk6tSgihcqgOtuA8Uw==
X-CSE-MsgGUID: H9yGlfO9TImGhO+I3EV1nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226867517"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.181])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:10:36 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/xe_compute: Exercise larger buffers passed
 from the user
Date: Wed,  1 Apr 2026 11:10:21 +0200
Message-ID: <20260401091017.2772519-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
References: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
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

Verify larger buffers are properly handled in intel library when
they are passed via userenv.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_compute.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index ef2d891667..406d708bcd 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -519,6 +519,14 @@ test_compute_square(int fd)
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	taking buffers from userenv.
  *
+ * SUBTEST: compute-square-userenv-large-buffer
+ * Mega feature: Compute
+ * Sub-category: compute tests
+ * Functionality: OpenCL kernel
+ * Description:
+ *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
+ *	taking large buffers from userenv.
+ *
  * SUBTEST: compute-square-userenv-isvm
  * Mega feature: Compute
  * Sub-category: compute tests
@@ -546,6 +554,8 @@ test_compute_square(int fd)
 
 #define INPUT_IN_SVM		(1 << 0)
 #define OUTPUT_IN_SVM		(1 << 1)
+#define LARGE_BUFFER		(1 << 2)
+#define LARGE_BUFFER_SIZE	(SZ_2M + SZ_1M)
 #define INPUT_BO_ADDR		0x30000000
 #define OUTPUT_BO_ADDR		0x31000000
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
@@ -568,6 +578,8 @@ test_compute_square_userenv(int fd, uint32_t flags)
 	float *input, *output;
 	int i;
 
+	if (flags & LARGE_BUFFER)
+		size = LARGE_BUFFER_SIZE;
 	size = ALIGN(size, xe_get_default_alignment(fd));
 	env.array_size = size / sizeof(float);
 
@@ -616,7 +628,10 @@ test_compute_square_userenv(int fd, uint32_t flags)
 		env.output_addr = OUTPUT_BO_ADDR;
 	}
 
-	env.loop_count = env.array_size / 2;
+	if (flags == LARGE_BUFFER)
+		env.loop_count = env.array_size;
+	else
+		env.loop_count = env.array_size / 2;
 
 	/* Skip check in the library and verify user controls data locally */
 	env.skip_results_check = true;
@@ -670,6 +685,9 @@ int igt_main()
 	igt_subtest("compute-square-userenv")
 		test_compute_square_userenv(xe, 0);
 
+	igt_subtest("compute-square-userenv-large-buffer")
+		test_compute_square_userenv(xe, LARGE_BUFFER);
+
 	igt_subtest("compute-square-userenv-isvm")
 		test_compute_square_userenv(xe, INPUT_IN_SVM);
 
-- 
2.43.0

