Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5196EBF9
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2020 15:29:26 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Fri, 13 Mar 2020 17:29:10 +0200
Message-ID: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/intel-ci/blacklist: Blacklist
 kms_chamelium@hdmi-*-planes-random
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
Cc: Petri Latvala <petri.latvala@intel.com>, Martin Peres <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tends to generate invalid configurations using CCS planes or
configurations that exceed HW capabilities resulting in sporadic failure
with -EINVAL.

Maintaining extra constraints for Intel's HW is too costly in comparison
to the value provided.

Seems like the test is used by other vendors, so unless they are fine
with removal we'll keep it. In the meantime let's blacklist it for our
CI.

Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1404
Fixes: https://gitlab.freedesktop.org/drm/intel/issues/239
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Martin Peres <martin.peres@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 tests/intel-ci/blacklist.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 8085719f..a7bd1e68 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -69,6 +69,17 @@ igt@gen7_exec_parse@.*lri.*
 ###############################################
 igt@kms_frontbuffer_tracking@.*drrs.*
 ###############################################
+# Tends to generate invalid configurations
+# using CCS planes or configurations that
+# exceed HW capabilities resulting in sporadic
+# failure with -EINVAL.
+#
+# Maintaining extra constraints for Intel's HW
+# is too costly in comparison to the value
+# provided.
+###############################################
+igt@kms_chamelium@hdmi-.*-planes-random
+###############################################
 # Broadcom
 ###############################################
 igt@vc4_.*
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
