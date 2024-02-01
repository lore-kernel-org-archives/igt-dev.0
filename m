Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD4C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 15:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9978010EEC6;
	Thu,  1 Feb 2024 15:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQRYFZMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEB910EEC6
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706802673; x=1738338673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hacTijmAspvNLtP3zWpGEqJ1TqTkZ+mXgRoJH50UWVM=;
 b=MQRYFZMYKW6BBtxgEsxiFU0nPcnARU+zmOCHXBlGXENhqaAc7GXZukgv
 ymWdcixYKXVmMcCIK4R9JKiJKhEOsaTfBFmDbZTTm7ovyr/YF9VsgCPAp
 Y0mtszPK+PH5TSPsWfabFaJJPDC5x7lJfVnEX/iVgQxZTpqSWfAYR7SfN
 6Zc/UDZfFOtd0IApuNZc6eRXJKYlvaHQXmiP3QLEh9nDs6Gvto8XQvba3
 fB0aIqdTSYhBxd4eLdv6Jbq30hdKHS6GP/FLliLpYSbsbMCjTwInguBVq
 orXrc6Ffas2ulng/GToh5xUd6WoqTd4WNN3uxgTagJZkRTzKWJq6BQpm0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="102142"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="102142"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="113980"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.112.128])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:51:11 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Date: Thu,  1 Feb 2024 16:50:44 +0100
Message-ID: <20240201155047.48608-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240201155047.48608-1-kamil.konieczny@linux.intel.com>
References: <20240201155047.48608-1-kamil.konieczny@linux.intel.com>
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

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
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

