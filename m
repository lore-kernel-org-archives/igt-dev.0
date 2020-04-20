Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AF66E51C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 12:18:10 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id a32so4494306pje.5
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 05:18:10 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 20 Apr 2020 15:17:46 +0300
Message-Id: <20200420121747.23816-8-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
References: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/8] lib/debugfs: use regular module param
 functions for prefault_disable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
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
index db7f7eb8..eb52a7c9 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -300,3 +300,27 @@ void igt_set_module_param_int(const char *name, int val)
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
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
