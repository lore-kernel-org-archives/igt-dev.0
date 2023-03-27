Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EE310E5D5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:41:24 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EEC27580C25
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:41:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgn68-00AC0t-2r
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:41:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:41:15 +0200
Message-Id: <20230327134119.2429388-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
References: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] compute_square_kernel.cl: add CL file
 used at xe_compute.c
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

Provide the cl file that it was used to produce the OpenCL
Kernel used by xe_compute, and document how the binary at
xe_compute.h was produced.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/xe/xe_compute.c             | 3 ++-
 opencl/compute_square_kernel.cl | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 opencl/compute_square_kernel.cl

diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
index 8c0f8c87d50f..2165eada8931 100644
--- a/lib/xe/xe_compute.c
+++ b/lib/xe/xe_compute.c
@@ -18,7 +18,8 @@
 #define GPGPU_WALKER			0x7105000d
 #define MI_BATCH_BUFFER_END		(0xA << 23)
 
-// generated with: ocloc -file kernel.cl -device tgllp && xxd -i kernel_Gen12LPlp.gen
+// generated with:
+// ocloc -file opencl/compute_square_kernel.cl -device tgllp && xxd -i compute_square_kernel_Gen12LPlp.bin
 unsigned char tgllp_kernel_square_bin[] = {
 	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
diff --git a/opencl/compute_square_kernel.cl b/opencl/compute_square_kernel.cl
new file mode 100644
index 000000000000..f6260fb934dc
--- /dev/null
+++ b/opencl/compute_square_kernel.cl
@@ -0,0 +1,5 @@
+__kernel void square(__global float* input, __global float* output, const unsigned int count) {
+  int i = get_global_id(0);
+  if(i < count)
+    output[i] = input[i] * input[i];
+}
-- 
2.39.2
