Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A0E10E0FB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 16:29:48 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.27.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 55CEB580D5D
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 09:29:46 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfNou-008EJ1-1F
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 17:29:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 17:29:42 +0100
Message-Id: <20230323162943.1961396-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
References: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC 3/4] i915-blocklist.txt: sort the other driver block
 list
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Place other driver-specific tests at the beginning of the file,
sorting them on alphabetical order.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/i915-blocklist.txt | 44 ++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/tests/intel-ci/i915-blocklist.txt b/tests/intel-ci/i915-blocklist.txt
index 243bc60934f6..e1569150b59f 100644
--- a/tests/intel-ci/i915-blocklist.txt
+++ b/tests/intel-ci/i915-blocklist.txt
@@ -1,7 +1,30 @@
+#############################################################
+# This file is for blocking tests from running on i915 driver
+#############################################################
+
+################################################################
+# Block tests for other hardware - please keep sorted per vendor
+################################################################
+
+# AMD
+igt@amdgpu/.*
+
+# Broadcom
+igt@vc4_.*
+igt@v3d_.*
+
+# Intel
+igt@xe.*
+
+# Panfrost
+igt@panfrost_.*
+
+# Qualcomm
+igt@msm_.*
+
 ###############################################
-# This file is for non-Xe tests only
+# Block other tests
 ###############################################
-igt@xe.*
 
 igt@meta_test(@.*)?
 ###############################################
@@ -84,23 +107,6 @@ igt@kms_frontbuffer_tracking@.*drrs.*
 ###############################################
 igt@kms_chamelium_frames@hdmi-.*-planes-random
 ###############################################
-# Broadcom
-###############################################
-igt@vc4_.*
-igt@v3d_.*
-###############################################
-# AMD
-###############################################
-igt@amdgpu/.*
-###############################################
-# Panfrost
-###############################################
-igt@panfrost_.*
-###############################################
-# Qualcomm
-###############################################
-igt@msm_.*
-###############################################
 # Hibernate: not configured correctly on CI
 ###############################################
 igt@.*@.*-hibernate
-- 
2.39.2
