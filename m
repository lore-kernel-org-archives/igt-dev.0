Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35CB6E0F4
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 08:28:23 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 23 Apr 2021 11:29:19 +0300
Message-Id: <20210423082919.25489-2-petri.latvala@intel.com>
In-Reply-To: <20210423082919.25489-1-petri.latvala@intel.com>
References: <20210423082919.25489-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] gitignore: Remove various .gitignore
 files
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

Now that autotools is gone and you always build to a dedicated build
directory with meson, we can remove .gitignore files that only had the
purpose of ignoring built binaries in the source directories.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 assembler/.gitignore                    |  7 -----
 assembler/test/.gitignore               | 24 ----------------
 benchmarks/.gitignore                   | 23 ---------------
 docs/reference/igt-gpu-tools/.gitignore | 27 ------------------
 lib/.gitignore                          |  1 -
 lib/tests/.gitignore                    | 18 ------------
 man/.gitignore                          |  1 -
 overlay/.gitignore                      |  4 ---
 runner/.gitignore                       |  5 ----
 tools/.gitignore                        | 37 -------------------------
 tools/null_state_gen/.gitignore         |  1 -
 11 files changed, 148 deletions(-)
 delete mode 100644 assembler/.gitignore
 delete mode 100644 assembler/test/.gitignore
 delete mode 100644 benchmarks/.gitignore
 delete mode 100644 docs/reference/igt-gpu-tools/.gitignore
 delete mode 100644 lib/.gitignore
 delete mode 100644 lib/tests/.gitignore
 delete mode 100644 man/.gitignore
 delete mode 100644 overlay/.gitignore
 delete mode 100644 runner/.gitignore
 delete mode 100644 tools/.gitignore
 delete mode 100644 tools/null_state_gen/.gitignore

diff --git a/assembler/.gitignore b/assembler/.gitignore
deleted file mode 100644
index 337e0473..00000000
--- a/assembler/.gitignore
+++ /dev/null
@@ -1,7 +0,0 @@
-*.o
-
-intel-gen4asm
-intel-gen4disasm
-gram.c
-gram.h
-lex.c
diff --git a/assembler/test/.gitignore b/assembler/test/.gitignore
deleted file mode 100644
index 898d10ac..00000000
--- a/assembler/test/.gitignore
+++ /dev/null
@@ -1,24 +0,0 @@
-*.out
-*.log
-*.trs
-mov
-frc
-rndd
-rnde
-rnde-intsrc
-rndu
-rndz
-lzd
-not
-jmpi
-if
-iff
-while
-else
-break
-cont
-halt
-wait
-endif
-immediate
-declare
diff --git a/benchmarks/.gitignore b/benchmarks/.gitignore
deleted file mode 100644
index 56daa1fd..00000000
--- a/benchmarks/.gitignore
+++ /dev/null
@@ -1,23 +0,0 @@
-# Please keep sorted alphabetically
-gem_blt
-gem_busy
-gem_create
-gem_exec_ctx
-gem_exec_fault
-gem_exec_nop
-gem_exec_reloc
-gem_exec_trace
-gem_latency
-gem_mmap
-gem_prw
-gem_set_domain
-gem_syslatency
-gem_userptr_benchmark
-gem_wsim
-intel_upload_blit_large
-intel_upload_blit_large_gtt
-intel_upload_blit_large_map
-intel_upload_blit_small
-kms_vblank
-prime_lookup
-vgem_mmap
diff --git a/docs/reference/igt-gpu-tools/.gitignore b/docs/reference/igt-gpu-tools/.gitignore
deleted file mode 100644
index 9a788a26..00000000
--- a/docs/reference/igt-gpu-tools/.gitignore
+++ /dev/null
@@ -1,27 +0,0 @@
-/gtkdoc-check.log
-/gtkdoc-check.trs
-/html-build.stamp
-/html.stamp
-/html/
-/igt_test_programs_*.xml
-/igt-gpu-tools-decl-list.txt
-/igt-gpu-tools-decl.txt
-/igt-gpu-tools-overrides.txt
-/igt-gpu-tools-sections.txt
-/igt-gpu-tools-undeclared.txt
-/igt-gpu-tools-undocumented.txt
-/igt-gpu-tools-unused.txt
-/igt-gpu-tools.args
-/igt-gpu-tools.hierarchy
-/igt-gpu-tools.igt
-/igt-gpu-tools.prerequisites
-/igt-gpu-tools.signals
-/igt-gpu-tools.types
-/scan-build.stamp
-/setup-build.stamp
-/sgml-build.stamp
-/sgml.stamp
-/test-suite.log
-/version.xml
-/xml/
-
diff --git a/lib/.gitignore b/lib/.gitignore
deleted file mode 100644
index 67020331..00000000
--- a/lib/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-version.h
diff --git a/lib/tests/.gitignore b/lib/tests/.gitignore
deleted file mode 100644
index ae11dd47..00000000
--- a/lib/tests/.gitignore
+++ /dev/null
@@ -1,18 +0,0 @@
-# Please keep sorted alphabetically
-igt_assert
-igt_fork_helper
-igt_exit_handler
-igt_invalid_subtest_name
-igt_list_only
-igt_no_exit
-igt_no_exit_list_only
-igt_no_subtest
-igt_segfault
-igt_simple_test_subtests
-igt_simulation
-igt_stats
-igt_subtest_group
-igt_timeout
-igt_hdmi_inject
-igt_can_fail
-igt_can_fail_simple
diff --git a/man/.gitignore b/man/.gitignore
deleted file mode 100644
index 8a8c90ca..00000000
--- a/man/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-defs.rst
diff --git a/overlay/.gitignore b/overlay/.gitignore
deleted file mode 100644
index 9ee5a356..00000000
--- a/overlay/.gitignore
+++ /dev/null
@@ -1,4 +0,0 @@
-intel-gpu-overlay
-tracepoint_format.h
-kms/.dirstamp
-x11/.dirstamp
diff --git a/runner/.gitignore b/runner/.gitignore
deleted file mode 100644
index 3812da23..00000000
--- a/runner/.gitignore
+++ /dev/null
@@ -1,5 +0,0 @@
-igt_runner
-igt_resume
-igt_results
-runner_test
-runner_json_test
diff --git a/tools/.gitignore b/tools/.gitignore
deleted file mode 100644
index 86f28096..00000000
--- a/tools/.gitignore
+++ /dev/null
@@ -1,37 +0,0 @@
-# Please keep sorted alphabetically
-cnl_compute_wrpll
-dpcd_reg
-hsw_compute_wrpll
-igt_stats
-intel_audio_dump
-intel_backlight
-intel_bios_dumper
-intel_display_crc
-intel_display_poller
-intel_dp_compliance
-intel_dump_decode
-intel_error_decode
-intel_firmware_decode
-intel_forcewaked
-intel_framebuffer_dump
-intel_gem_info
-intel_gpu_frequency
-intel_gpu_time
-intel_gpu_top
-intel_gtt
-intel_guc_logger
-intel_gvtg_test
-intel_infoframes
-intel_l3_parity
-intel_lid
-intel_opregion_decode
-intel_panel_fitter
-intel_perf_counters
-intel_reg
-intel_reg_checker
-intel_residency
-intel_stepping
-intel_vbt_decode
-intel_watermark
-skl_compute_wrpll
-skl_ddb_allocation
diff --git a/tools/null_state_gen/.gitignore b/tools/null_state_gen/.gitignore
deleted file mode 100644
index 170bcef7..00000000
--- a/tools/null_state_gen/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-intel_null_state_gen
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
