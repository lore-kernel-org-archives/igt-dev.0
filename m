Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780B410E361
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 10:41:25 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 29D14580377
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 03:41:23 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1prz3w-000pdu-2J
 for igt-dev@lists.freedesktop.org; Thu, 27 Apr 2023 12:41:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Apr 2023 12:41:19 +0200
Message-Id: <20230427104119.198499-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230427104119.198499-1-mauro.chehab@linux.intel.com>
References: <20230427104119.198499-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915_pm_freq_api: add missing
 include
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Add missing include file. This fixes armhf, aarch64 and mips
cross-compilation error:

../tests/i915/i915_pm_freq_api.c:80:46: error: ‘O_WRONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/i915_pm_freq_api.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
index 7342f5414034..662d514a4ef6 100644
--- a/tests/i915/i915_pm_freq_api.c
+++ b/tests/i915/i915_pm_freq_api.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <fcntl.h>
+
 #include "i915/gem.h"
 #include "igt_sysfs.h"
 #include "igt.h"
-- 
2.40.0
