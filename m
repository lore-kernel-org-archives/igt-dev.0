Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1ED10E5B8
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 21:22:49 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Subject: [PATCH i-g-t v2 1/4] opencl/compute_increment_kernel: Add opencl
 increment kernel
Date: Wed, 17 Jan 2024 02:57:53 +0530
Message-Id: <20240116212756.2687603-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20240116212756.2687603-1-janga.rahul.kumar@intel.com>
References: <20240116212756.2687603-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Compute opencl increment kernel provided here is used in
xe_compute_preempt test.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 opencl/compute_increment_kernel.cl | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 opencl/compute_increment_kernel.cl

diff --git a/opencl/compute_increment_kernel.cl b/opencl/compute_increment_kernel.cl
new file mode 100644
index 000000000..976c5a338
--- /dev/null
+++ b/opencl/compute_increment_kernel.cl
@@ -0,0 +1,6 @@
+__kernel void square(__global float* input, __global float* output, const unsigned int count) {
+  int i = get_global_id(0);
+  for (int j = 0; j < count ; j++) {
+    output[i] = output[i] + 1;
+   }
+}
-- 
2.25.1
