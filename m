Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730CE6E2F0
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 16:17:38 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 198so11586766lfo.7
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 09:17:38 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 21 Apr 2020 19:17:24 +0300
Message-Id: <20200421161725.12249-8-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 7/8] lib/debugfs: use regular module param
 functions for prefault_disable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Functional change switches from igt_require to igt_assert on errors.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 benchmarks/gem_exec_reloc.c |  2 +-
 lib/igt_params.c            | 24 ++++++++++++++++++++++++
 lib/igt_params.h            |  7 +++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/benchmarks/gem_exec_reloc.c b/benchmarks/gem_exec_reloc.c
index 0a2454cb..d7841b58 100644
--- a/benchmarks/gem_exec_reloc.c
+++ b/benchmarks/gem_exec_reloc.c
@@ -38,7 +38,7 @@
 #include "drm.h"
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
-#include "igt_debugfs.h"
+#include "igt_params.h"
 #include "drmtest.h"
 #include "i915/gem_mman.h"
 
diff --git a/lib/igt_params.c b/lib/igt_params.c
index 369d224c..2e0e727f 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -333,3 +333,27 @@ void igt_set_module_param_int(const char *name, int val)
 {
 	igt_assert(igt_params_set_save(-1, name, "%d", val));
 }
+
+/**
+ * igt_disable_prefault:
+ *
+ * Disable prefaulting in certain gem ioctls through the module param. As usual
+ * this installs an exit handler to clean up and re-enable prefaulting even when
+ * the test exited abnormally.
+ *
+ * igt_enable_prefault() will enable normale operation again.
+ */
+void igt_disable_prefault(void)
+{
+	igt_require(igt_params_set_save(-1, "prefault_disable", "Y"));
+}
+
+/**
+ * igt_enable_prefault:
+ *
+ * Enable prefault (again) through the module param.
+ */
+void igt_enable_prefault(void)
+{
+	igt_require(igt_params_set_save(-1, "prefault_disable", "N"));
+}
diff --git a/lib/igt_params.h b/lib/igt_params.h
index 1b750d23..f18ea436 100644
--- a/lib/igt_params.h
+++ b/lib/igt_params.h
@@ -37,4 +37,11 @@ bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...
 void igt_set_module_param(const char *name, const char *val);
 void igt_set_module_param_int(const char *name, int val);
 
+/*
+ * Prefault control
+ */
+
+void igt_disable_prefault(void);
+void igt_enable_prefault(void);
+
 #endif /* __IGT_PARAMS_H__ */
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
