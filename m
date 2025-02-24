Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C384AC021BF
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 14:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822B710E3EA;
	Mon, 24 Feb 2025 14:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAUnA5n8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB60510E3EE
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740408450; x=1771944450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pLtAdSpVTYeF9brDTMd0m8KOJpeJiS59e9EAmRE5fmE=;
 b=eAUnA5n8nmAvgIIdbHO9Wx4QkGjzq8c9uZi7YnYeB4mP0/QQ7HhHt3+j
 5wXIiDpg3jTxz/WyOjt6hbB0QZBH3hVibK34t28zjNWZZVJpcSXZfpRTo
 +MBXfnTPobalM0xM5lY/ViCkfSmh3w9Osvy1eKJHv9jjPBs3TFJW51Pq9
 1//3EFGiA5pLoDBgqP0fsJBCOGa36lqxvcfe117cyqjGnr0Hu3usYYi4D
 +hUD0pqodXvJt8USg5E6XYi8gigRNTv/m7Vw2U5XHsWety4nmqM2+xcXt
 44xp9SOX1b2NVgwJH39lsPaiCxcAoAkbLg8fxUsWlLqTNbddx9Ucpk69i g==;
X-CSE-ConnectionGUID: v15Wb5ioSHa52tLnu0ADcw==
X-CSE-MsgGUID: kPP3cd6rTGahCHT37H4x2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51793292"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51793292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:47:26 -0800
X-CSE-ConnectionGUID: 5a+BEKTKTV2y5mHqeBDEPw==
X-CSE-MsgGUID: fRz+naGtQGabzhRFZrd/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="120689959"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.122])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:47:24 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v2 4/6] lib/intel_compute: Allow the user to provide a custom compute
 kernel
Date: Mon, 24 Feb 2025 15:46:12 +0100
Message-ID: <20250224144705.1019940-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224144705.1019940-1-francois.dugast@intel.com>
References: <20250224144705.1019940-1-francois.dugast@intel.com>
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

Allow the user to provide a custom compute kernel which will be used
instead of the default compute square one. This custom kernel _must_
fulfill requirements specified in the user_execenv::kernel doc. IGT
does not provide a complete runtime which can run generic kernels.

Allowing custom compute kernels gives us the possibility to leverage
the existing lib/intel_compute infrastructure to test corner cases.
More complex KMD tests will require simple specific compute kernels.
For example this one can trigger a page fault at 0x10000 from the
compute kernel context, so that we run other checks in KMD, all from
IGT:

    __kernel void square(__global float* input,
                         __global float* output,
                         const unsigned int count) {
        int i = get_global_id(0);
        const __global uint* addr = 0x10000;
        output[i] = *addr;
    }

v2: Improve documentation and commit message

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 26 ++++++++++++++++++--------
 lib/intel_compute.h | 14 ++++++++++++++
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index cad932c24..04fb83321 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1778,6 +1778,8 @@ static bool __run_intel_compute_kernel(int fd,
 	unsigned int batch;
 	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
 	enum intel_driver driver = get_intel_driver(fd);
+	const unsigned char *kernel;
+	unsigned int kernel_size;
 
 	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
 		if (ip_ver == intel_compute_batches[batch].ip_ver)
@@ -1795,16 +1797,24 @@ static bool __run_intel_compute_kernel(int fd,
 		return false;
 	}
 
-	while (kernels->kernel) {
-		if (ip_ver == kernels->ip_ver)
-			break;
-		kernels++;
+	/* If the user provides a kernel, use it */
+	if (user && user->kernel) {
+		kernel = user->kernel;
+		kernel_size = user->kernel_size;
+	} else {
+		while (kernels->kernel) {
+			if (ip_ver == kernels->ip_ver)
+				break;
+			kernels++;
+		}
+		if (!kernels->kernel)
+			return false;
+		kernel = kernels->kernel;
+		kernel_size = kernels->size;
 	}
-	if (!kernels->kernel)
-		return false;
 
-	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
-						  kernels->size, eci, user);
+	intel_compute_batches[batch].compute_exec(fd, kernel,
+						  kernel_size, eci, user);
 
 	return true;
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 62e2422c4..3f6d0bb1d 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -39,6 +39,20 @@ struct intel_compute_kernels {
 struct user_execenv {
 	/** @vm: use this VM if provided, otherwise create one */
 	uint32_t vm;
+	/**
+	 * @kernel: use this custom kernel if provided, otherwise use a default square kernel
+	 *
+	 * Custom kernel execution in lib/intel_compute has strong limitations, it does not
+	 * allow running any custom kernel. "count" is the size of the input and output arrays
+	 * and the provided kernel must have the following prototype:
+	 *
+	 *    __kernel void square(__global float* input,
+	 *                         __global float* output,
+	 *                         const unsigned int count)
+	 */
+	const unsigned char *kernel;
+	/** @kernel_size: size of the custom kernel, if provided */
+	unsigned int kernel_size;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

