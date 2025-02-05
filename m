Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E5CC02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 10:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E66310E772;
	Wed,  5 Feb 2025 10:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="md/dpkXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA45F10E0E0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738750712; x=1770286712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bQXJRGOWMSEUM9gnhg0K6tw9qaJI+E5WUx7Vz4YLk2E=;
 b=md/dpkXJHF9jBBI08Soa72LebJCm1gEvrpFkzLHyLvXrX3ve9pw9USFY
 BshUbsUzVAe6UJonwLSIuuQE2SJSt3wCIvHR5AcnHMDlhIye37+M64iNE
 IFBhXgteqkOPLn0rKp6mGquxioIMyx9DuabACORuLTtKpEzJUX7oAGoNR
 mwU4ypgKXFS33+Lxvui3HRh1qhv0IPgHz7SRCIJLfmIU07kEXrHzzy59F
 If0Cb+YQ0Q+XIBqsNYz1wxy/OeSMGH2bKgWckKeLaUgyAYDePhXVkfppK
 Exu/lSPdaYa+8jIpYcaT+it/BpVm8KCASCdjUxhPjkKL1v5ET6TUsKJZQ g==;
X-CSE-ConnectionGUID: XHbupnS2RIye0ZpO89wEpQ==
X-CSE-MsgGUID: M8KrHh7wQmaLXmBW8pE2ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50700683"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="50700683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:25 -0800
X-CSE-ConnectionGUID: ZtUsuD2MQoWB3QUaJk67dA==
X-CSE-MsgGUID: 8N9Fr3JzSFiN2h783JqABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111299202"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.221])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:24 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/5] lib/intel_compute: Allow the user to provide a
 custom compute kernel
Date: Wed,  5 Feb 2025 11:17:04 +0100
Message-ID: <20250205101748.1117809-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205101748.1117809-1-francois.dugast@intel.com>
References: <20250205101748.1117809-1-francois.dugast@intel.com>
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
instead of the default compute square one. This will be helpful to
try out corner cases which require a specific compute kernel.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 26 ++++++++++++++++++--------
 lib/intel_compute.h |  2 ++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index e0776fb6d..a826d58c0 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1770,6 +1770,8 @@ static bool __run_intel_compute_kernel(int fd,
 	unsigned int batch;
 	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
 	enum intel_driver driver = get_intel_driver(fd);
+	const unsigned char *kernel;
+	unsigned int kernel_size;
 
 	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
 		if (ip_ver == intel_compute_batches[batch].ip_ver)
@@ -1787,16 +1789,24 @@ static bool __run_intel_compute_kernel(int fd,
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
index c4b4ee5e1..6096bb83a 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -35,6 +35,8 @@ struct intel_compute_kernels {
 
 struct user_execenv {
 	uint32_t vm;
+	const unsigned char *kernel;
+	unsigned int kernel_size;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

