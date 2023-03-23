Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD9B10E494
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 16:29:48 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.27.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4A925580D2C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 09:29:46 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfNou-008EJ4-1J
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 17:29:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 17:29:43 +0100
Message-Id: <20230323162943.1961396-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
References: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC 4/4] xe-blocklist.txt: add a blocklist for the Xe
 driver
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

The same way we have a blocklist for i915, add one for the Xe
driver. It currently contain only non-xe drivers that also
have test definitions.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/xe-blocklist.txt | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 tests/intel-ci/xe-blocklist.txt

diff --git a/tests/intel-ci/xe-blocklist.txt b/tests/intel-ci/xe-blocklist.txt
new file mode 100644
index 000000000000..190b76293937
--- /dev/null
+++ b/tests/intel-ci/xe-blocklist.txt
@@ -0,0 +1,23 @@
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
+igt@i915.*
+
+# Panfrost
+igt@panfrost_.*
+
+# Qualcomm
+igt@msm_.*
-- 
2.39.2
