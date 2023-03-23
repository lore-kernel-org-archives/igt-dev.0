Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443C710E466
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 09:02:27 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 93357580677
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 02:02:25 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfGpz-0085vc-1U
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 10:02:23 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 10:02:18 +0100
Message-Id: <20230323090221.1929302-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230323090221.1929302-1-mauro.chehab@linux.intel.com>
References: <20230323090221.1929302-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/4] intel-ci: update blacklists to work
 with the Xe driver
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

It doesn't make sense to run i915 tests with Xe driver and
vice-versa. Update testlists to make it clear.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 .../{blacklist.txt => i915-blacklist.txt}     |  4 ++++
 tests/intel-ci/xe-blacklist.txt               | 21 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 rename tests/intel-ci/{blacklist.txt => i915-blacklist.txt} (97%)
 create mode 100644 tests/intel-ci/xe-blacklist.txt

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/i915-blacklist.txt
similarity index 97%
rename from tests/intel-ci/blacklist.txt
rename to tests/intel-ci/i915-blacklist.txt
index 6e5cc43667cf..389a2acb7f44 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/i915-blacklist.txt
@@ -84,6 +84,10 @@ igt@kms_chamelium_frames@hdmi-.*-planes-random
 igt@vc4_.*
 igt@v3d_.*
 ###############################################
+# Intel Xe
+###############################################
+igt@xe/.*
+###############################################
 # AMD
 ###############################################
 igt@amdgpu/.*
diff --git a/tests/intel-ci/xe-blacklist.txt b/tests/intel-ci/xe-blacklist.txt
new file mode 100644
index 000000000000..986e91a67069
--- /dev/null
+++ b/tests/intel-ci/xe-blacklist.txt
@@ -0,0 +1,21 @@
+###############################################
+# Broadcom
+###############################################
+igt@vc4_.*
+igt@v3d_.*
+###############################################
+# Intel i915
+###############################################
+igt@i915/.*
+###############################################
+# AMD
+###############################################
+igt@amdgpu/.*
+###############################################
+# Panfrost
+###############################################
+igt@panfrost_.*
+###############################################
+# Qualcomm
+###############################################
+igt@msm_.*
-- 
2.39.2
