Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD776EA14
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2020 07:48:59 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Fri, 31 Jul 2020 10:48:39 +0300
Message-ID: <20200731074839.2028782-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/feature_discovery: Fix things spotted
 by GitLab's CI
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

 * compile with autotools
 * ifdef chamelium

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 tests/Makefile.sources    | 1 +
 tests/feature_discovery.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index 93d7768c..fc1cb59c 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -29,6 +29,7 @@ TESTS_progs = \
 	drm_read \
 	dumb_buffer \
 	fbdev \
+	feature_discovery \
 	kms_3d \
 	kms_addfb_basic \
 	kms_atomic \
diff --git a/tests/feature_discovery.c b/tests/feature_discovery.c
index 32ef9df7..1978ce89 100644
--- a/tests/feature_discovery.c
+++ b/tests/feature_discovery.c
@@ -23,7 +23,9 @@
  */
 
 #include "igt.h"
+#ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
+#endif
 #include "igt_kms.h"
 #include "igt_psr.h"
 #include "igt_sysfs.h"
@@ -91,12 +93,14 @@ igt_main {
 			}
 		}
 
+#ifdef HAVE_CHAMELIUM
 		igt_describe("Make sure that Chamelium is configured and reachable.");
 		igt_subtest("chamelium") {
 			struct chamelium *chamelium = chamelium_init(fd);
 			igt_require(chamelium);
 			chamelium_deinit(chamelium);
 		}
+#endif
 
 		igt_describe("Make sure that we have eDP panel with PSR1 support.");
 		igt_subtest("psr1") {
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
