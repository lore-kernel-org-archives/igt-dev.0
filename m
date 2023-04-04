Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8379310E144
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 07:38:41 +0000 (UTC)
Received: from linux.intel.com (daanders-mobl1.ger.corp.intel.com
 [10.252.28.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DF163580D95
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 00:38:38 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjbFU-000rTT-2O
 for igt-dev@lists.freedesktop.org; Tue, 04 Apr 2023 09:38:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 09:38:35 +0200
Message-Id: <20230404073835.205323-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230404073835.205323-1-mauro.chehab@linux.intel.com>
References: <20230404073835.205323-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/4] gen_opencl_kernel: add script to
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
 opencl/README            |  30 ++++++++++++
 opencl/gen_opencl_kernel | 103 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 opencl/README
 create mode 100755 opencl/gen_opencl_kernel

diff --git a/opencl/README b/opencl/README
new file mode 100644
index 000000000000..2fd0687a299b
--- /dev/null
+++ b/opencl/README
@@ -0,0 +1,30 @@
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
+
+The opencl/gen_opencl_kernel requires the Intel compute runtime[1].
+
+[1] https://github.com/intel/compute-runtime
+
+This is usually shipped with different names on different distributions.
+The above command generate Kernels for both TGL and ADL platforms.
+Modern packages for Ubuntu are provided at github, under releases
+tag.
+
+Please notice that the GPU platforms supported by Intel ICD tools depend
+on its version. In order to know what's supported, you can run:
+
+	$ ocloc compile --help 2>&1|grep -A1 'Target device.'
+	  -device <device_type>         Target device.
+                  <device_type> can be: bdw, skl, kbl, cfl, apl, bxt, glk, whl, aml, cml, icllp, lkf, ehl, jsl, tgllp, rkl, adl-s, adl-p, adl-n, dg1, acm-g10, ats-m150, dg2-g10, acm-g11, ats-m75, dg2-g11, acm-g12, dg2-g12, pvc-sdv, pvc, gen11, gen12lp, gen8, gen9, xe, xe-hp, xe-hpc, xe-hpg, version  or hexadecimal value with 0x prefix
+
+The above results are for Intel ICD version 22.43.24558, which supports
+both TGL and ADL platforms, plus other newer GPU models.
diff --git a/opencl/gen_opencl_kernel b/opencl/gen_opencl_kernel
new file mode 100755
index 000000000000..e6f9601e0edb
--- /dev/null
+++ b/opencl/gen_opencl_kernel
@@ -0,0 +1,103 @@
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
+if [ "$(xxd --help 2>&1|grep '\-n')" == "" ]; then
+	# Old versions have its own criteria to generate names.
+	# In this specific case, names will be like:
+	# "build_opencl_${GPU_DEVICE}_${kernel_name}_bin"
+	# Not fancy but it works.
+	USE_NAME_PARM=
+else
+	# Remove bloatware from the names, calling Kernels as:
+	# "${GPU_DEVICE}_${kernel_name}"
+	USE_NAME_PARM=1
+fi
+
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
+	if  [ "$USE_NAME_PARM" != "" ]; then
+		xxd -n "${i}_${kernel_name}" -i ${name}_bin >$out
+	else
+		xxd -i ${name}_bin >$out
+	fi
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
