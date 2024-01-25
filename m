Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647BBC47422
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 18:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0714C10F432;
	Thu, 25 Jan 2024 18:37:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8108210F432
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 18:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706207820; x=1737743820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wP+C2c92Jmfnl/sRU2pLfFuK/z2CKSJ2LIod/a8v1z8=;
 b=kXQu/71QlhIkayvC2lk1idwy07LERiJZBGphvukJ+9mhUgv22CmLuGS1
 pr/oUcz/4kYsLwxRmwW0JnPIakloKEp/MQGNihOIuPLP8v9Tbsvb6AyMS
 SDf0ach+k7F19CI3PbmZfrRASVttoVkK4EVV96neuJZ3jjaHwk6yt6FOO
 rT9XxzQIgtVeAxo++nEng8jeAAUuxmIjrut6Zmhcgwn1xUXNKoD9vf4tV
 uAL0dAK+iVEifWIyJCCJQuCrVomdvMtUPjFjogX4ZxtoqKtT+E90GWbN4
 GeoofGpSZnPKdsg70u77dEBN+VI+TqrFvJmZ9iRAwSwyWEN9YuveiSftW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20800834"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20800834"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:37:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2340252"
Received: from unknown (HELO localhost) ([10.245.100.131])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:36:59 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Date: Thu, 25 Jan 2024 19:36:28 +0100
Message-ID: <20240125183632.50422-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
References: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
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
 lib/intel_multigpu.c | 11 +++++++++++
 lib/intel_multigpu.h | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
index 34c9f936d..0e76d8aa3 100644
--- a/lib/intel_multigpu.c
+++ b/lib/intel_multigpu.c
@@ -3,10 +3,21 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "drmtest.h"
 #include "igt_core.h"
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
index 98dc5a4ce..0ebc73e4a 100644
--- a/lib/intel_multigpu.h
+++ b/lib/intel_multigpu.h
@@ -6,6 +6,21 @@
 #ifndef __INTEL_MULTIGPU_H
 #define __INTEL_MULTIGPU_H
 
+#include "drmtest.h"
+#include "igt_core.h"
+
 void gem_require_multigpu(int count);
+int gem_multigpu_count_class(int class);
+
+#define igt_foreach_gpu(fd__, id__) \
+	for (int igt_unique(i) = 0, fd__; \
+		(fd__ = __drm_open_driver_another(igt_unique(i)++, id__)) >= 0; \
+		close(fd__))
+
+#define igt_multi_fork_foreach_gpu(__fd, __id) \
+	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__id)) \
+		for (int __fd = drm_open_driver_another(igt_unique(__i), __id); \
+			__fd >= 0; \
+			close(__fd), __fd = -1) \
 
 #endif /* __INTEL_MULTIGPU_H */
-- 
2.42.0

