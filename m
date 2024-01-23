Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B43C47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 20:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5065B10E8C3;
	Tue, 23 Jan 2024 20:16:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5FF89FA5
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706040967; x=1737576967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6USNLKKkju+yNuW9Eozqb7ci87HRAbQymiIzUr+pvIo=;
 b=c9mp0aiEtno5vI3fIXx1D700bduU/1LOfata4w0dfcBNVWfzoj1Dug/t
 I73sF70lZ3hl2CIW9x3j2XbMdZ0c++K2kBQJBMXy+1nXzDGRAazkYhqJU
 VTYkzWJZSa+nBCcu+kR2rdI6NbF+cw0Pda3fEJqY+IST/bkzp6CETEAuK
 PVI5MT+vYCuvFIui7DFDLJSNrzJ9ylsVoqLxfBJOucrrH2L6h3eRue4JA
 sDfAIRbG201BEx+CVBXVRK5G9ztaZAgb8yGRLCY6gTPneVvZFQ0vDEp17
 lhNbuXH07unNxEEHhKTZEPQcaaiU/M9ELIMChlqNi6gZb13p0JWiG/v44 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401298272"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="401298272"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1647425"
Received: from unknown (HELO localhost) ([10.246.3.60])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:16:05 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v1 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Date: Tue, 23 Jan 2024 21:15:32 +0100
Message-ID: <20240123201535.108793-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
References: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Introduced gem_multigpu_count_class function that returns an actual
number of GPUs present in system, which allows for writing multi-GPU
test scenarios that does not require
--device pci:vendor=intel,device=discrete,card=all
to run as intended. Based on patch by Chris Wilson.

Introduced igt_multi_fork_foreach_gpu macro that helps with
writing multi-GPU test scenarios in idiomatic form:

igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
	test_function(i915);
igt_waitchildren();

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_multigpu.c | 10 ++++++++++
 lib/intel_multigpu.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
index 446e3ff5f..0e76d8aa3 100644
--- a/lib/intel_multigpu.c
+++ b/lib/intel_multigpu.c
@@ -8,6 +8,16 @@
 #include "igt_device_scan.h"
 #include "intel_multigpu.h"
 
+int gem_multigpu_count_class(int class)
+{
+	int count = 0;
+
+	igt_foreach_gpu(fd, class)
+		count++;
+
+	return count;
+}
+
 void gem_require_multigpu(int count)
 {
 	struct igt_devices_print_format fmt = {
diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
index 5f98307fd..ad1e5cf07 100644
--- a/lib/intel_multigpu.h
+++ b/lib/intel_multigpu.h
@@ -9,8 +9,8 @@
 #include "igt_core.h"
 #include "igt_device_scan.h"
 
-void gem_require_multigpu(int count);
 int gem_multigpu_count_class(int class);
+void gem_require_multigpu(int count);
 
 #define igt_foreach_gpu(fd__, id__) \
 	for (int igt_unique(i) = 0, fd__; \
-- 
2.42.0

