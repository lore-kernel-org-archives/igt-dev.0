Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6291E10E5D5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:41:24 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0624D580D7C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:41:23 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgn68-00AC12-34
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:41:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:41:18 +0200
Message-Id: <20230327134119.2429388-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
References: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] gen_opencl_kernel: add script to
 dynamically create OpenCL kernels
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

Compute tests can be produced by using OpenCL, by calling ocloc.

While this can be part of IGT building system, for now, let's add
a script for such purpose.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 opencl/README            | 11 +++++
 opencl/gen_opencl_kernel | 86 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 opencl/README
 create mode 100755 opencl/gen_opencl_kernel

diff --git a/opencl/README b/opencl/README
new file mode 100644
index 000000000000..5d0df2ad6c33
--- /dev/null
+++ b/opencl/README
@@ -0,0 +1,11 @@
+This directory contains some OpenCL compute files, and a script to be used
+to produce a header file containing the binaries for the CL against
+multiple platforms.
+
+For instance, to generate compute square Kernel binaries for TGL and ADL
+variants, use this:
+
+    opencl/gen_opencl_kernel xe_compute_square opencl/compute_square_kernel.cl \
+	   xe_compute_square_kernels.c build/opencl tgllp adl-s adl-p adl-n
+
+    cp build/opencl/xe_compute_square_kernels.c lib/xe/
diff --git a/opencl/gen_opencl_kernel b/opencl/gen_opencl_kernel
new file mode 100755
index 000000000000..8bbc62a20cde
--- /dev/null
+++ b/opencl/gen_opencl_kernel
@@ -0,0 +1,86 @@
+#!/bin/bash
+
+trap 'catch $LINENO' ERR
+
+catch() {
+    echo "error in line $1"
+    exit 1
+}
+
+
+# Parse arguments
+if [ $# -lt 5 ]; then
+        echo -e 'Usage:\n\t$0: <Kernel name> <kernel.cl> <header name> <dest_dir> <GPU models>' >&2
+        echo -e "Example:\n\t$0 kernel_foo kernel.cl kernels.c ../build/opencl tgllp rkl\n" >&2
+        exit 1
+fi
+
+kernel_name=$1
+shift
+
+kernel_cl=$1
+shift
+
+output_fname=$1
+shift
+
+dest_dir=$1
+shift
+
+mkdir -p $dest_dir
+
+args=( "$@" )
+
+echo $args
+
+out_files=""
+for i in "${args[@]}"; do
+	name="$dest_dir/${i}_${kernel_name}"
+	out="$name.h"
+        echo "Generating $out"
+	ocloc compile -q -file ${kernel_cl} -device ${i} -output ${name}_bin -output_no_suffix
+	xxd -n "${i}_${kernel_name}" -i ${name}_bin >$out
+	sed "s,  ,\t,;s,.*unsigned int.*,,;s,\-,_,g;s,unsigned,static const unsigned," -i $out
+	sed "1 i// Match ID: $(ocloc ids $i|grep -v "Matched ids:")" -i $out
+	out_files+=" $out"
+done
+
+output_fname="$dest_dir/$output_fname"
+echo "Generating $output_fname"
+
+cat << PREFIX >$output_fname
+/* SPDX-License-Identifier: MIT */
+/*
+ * This file is auto-generated from $kernel_cl:
+ *
+PREFIX
+
+cat $kernel_cl |sed s,"^"," * ," >>$output_fname
+
+cat << INCLUDES >>$output_fname
+ */
+
+#include "intel_chipset.h"
+#include "lib/xe/xe_compute.h"
+
+INCLUDES
+
+cat $out_files >>$output_fname
+
+echo "const struct xe_compute_kernels ${kernel_name}_kernels[] = {" >>$output_fname
+
+for i in "${args[@]}"; do
+        out="$dest_dir/${i}_${kernel_name}.h"
+        echo -e "\t{" >>$output_fname; \
+	grep "Match ID:" $out|sed -E "s/.*\s([0-9]+)\.([0-9]+).*/\t\t.ip_ver = IP_VER(\1, \2),/" >>$output_fname;
+	grep unsigned $out|sed -E "s/.*\s+([_a-zA-Z0-9]+)\[\].*/\t\t.size = sizeof(\1),/" >>$output_fname;
+	grep unsigned $out|sed -E "s/.*\s+([_a-zA-Z0-9]+)\[\].*/\t\t.kernel = \1,/" >>$output_fname;
+	echo -e "\t}," >>$output_fname;
+done
+
+cat << SUFFIX >>$output_fname
+	{}
+};
+SUFFIX
+
+echo "Done."
-- 
2.39.2
