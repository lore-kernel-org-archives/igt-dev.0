Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6410E983
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 08:24:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 09:23:26 +0100
Message-Id: <20230310082326.12088-19-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
References: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 18/18] meson: replace "igt@xe/" by "igt@"
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

Change the building system to avoid the "/" path at the IGT Xe
tests, as those are causing problems for CI.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 meson.build                              |   7 -
 tests/intel-ci/xe-fast-feedback.testlist | 278 +++++++++++------------
 tests/meson.build                        |  32 +++
 tests/xe/meson.build                     |  32 ---
 4 files changed, 171 insertions(+), 178 deletions(-)

diff --git a/meson.build b/meson.build
index 56875a2190..cbb7ead7d9 100644
--- a/meson.build
+++ b/meson.build
@@ -261,7 +261,6 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
-xedir = join_paths(libexecdir, 'xe')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
@@ -310,18 +309,12 @@ if get_option('use_rpath')
 	endforeach
 	vc4_rpathdir = join_paths(vc4_rpathdir, libdir)
 
-	xedir_rpathdir = '$ORIGIN'
-	foreach p : xedir.split('/')
-		xedir_rpathdir = join_paths(xedir_rpathdir, '..')
-	endforeach
-	xedir_rpathdir = join_paths(xedir_rpathdir, libdir)
 else
 	bindir_rpathdir = ''
 	libexecdir_rpathdir = ''
 	amdgpudir_rpathdir = ''
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
-	xedir_rpathdir = ''
 endif
 
 subdir('lib')
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 25237784e2..6525b1676b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,139 +1,139 @@
-igt@xe/xe_compute@compute-square
-igt@xe/xe_debugfs@base
-igt@xe/xe_debugfs@gt
-igt@xe/xe_debugfs@forcewake
-igt@xe/xe_dma_buf_sync@export-dma-buf-once
-igt@xe/xe_dma_buf_sync@export-dma-buf-once-read-sync
-igt@xe/xe_exec_balancer@twice-virtual-basic
-igt@xe/xe_exec_balancer@no-exec-virtual-basic
-igt@xe/xe_exec_balancer@twice-cm-virtual-basic
-igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic
-igt@xe/xe_exec_balancer@twice-virtual-userptr
-igt@xe/xe_exec_balancer@no-exec-virtual-userptr
-igt@xe/xe_exec_balancer@twice-cm-virtual-userptr
-igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr
-igt@xe/xe_exec_balancer@twice-virtual-rebind
-igt@xe/xe_exec_balancer@no-exec-virtual-rebind
-igt@xe/xe_exec_balancer@twice-cm-virtual-rebind
-igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind
-igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind
-igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind
-igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-rebind
-igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-rebind
-igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate
-igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate
-igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate
-igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate
-igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate-race
-igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate-race
-igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race
-igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race
-igt@xe/xe_exec_balancer@twice-parallel-basic
-igt@xe/xe_exec_balancer@no-exec-parallel-basic
-igt@xe/xe_exec_balancer@twice-parallel-userptr
-igt@xe/xe_exec_balancer@no-exec-parallel-userptr
-igt@xe/xe_exec_balancer@twice-parallel-rebind
-igt@xe/xe_exec_balancer@no-exec-parallel-rebind
-igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind
-igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind
-igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate
-igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate
-igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race
-igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate-race
-igt@xe/xe_exec_basic@twice-basic
-igt@xe/xe_exec_basic@no-exec-basic
-igt@xe/xe_exec_basic@twice-basic-defer-mmap
-igt@xe/xe_exec_basic@no-exec-basic-defer-mmap
-igt@xe/xe_exec_basic@twice-basic-defer-bind
-igt@xe/xe_exec_basic@no-exec-basic-defer-bind
-igt@xe/xe_exec_basic@twice-userptr
-igt@xe/xe_exec_basic@no-exec-userptr
-igt@xe/xe_exec_basic@twice-rebind
-igt@xe/xe_exec_basic@no-exec-rebind
-igt@xe/xe_exec_basic@twice-userptr-rebind
-igt@xe/xe_exec_basic@no-exec-userptr-rebind
-igt@xe/xe_exec_basic@twice-userptr-invalidate
-igt@xe/xe_exec_basic@no-exec-userptr-invalidate
-igt@xe/xe_exec_basic@twice-userptr-invalidate-race
-igt@xe/xe_exec_basic@no-exec-userptr-invalidate-race
-igt@xe/xe_exec_basic@twice-bindengine
-igt@xe/xe_exec_basic@no-exec-bindengine
-igt@xe/xe_exec_basic@twice-bindengine-userptr
-igt@xe/xe_exec_basic@no-exec-bindengine-userptr
-igt@xe/xe_exec_basic@twice-bindengine-rebind
-igt@xe/xe_exec_basic@no-exec-bindengine-rebind
-igt@xe/xe_exec_basic@twice-bindengine-userptr-rebind
-igt@xe/xe_exec_basic@no-exec-bindengine-userptr-rebind
-igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate
-igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate
-igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate-race
-igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate-race
-igt@xe/xe_exec_compute_mode@twice-basic
-igt@xe/xe_exec_compute_mode@twice-preempt-fence-early
-igt@xe/xe_exec_compute_mode@twice-userptr
-igt@xe/xe_exec_compute_mode@twice-rebind
-igt@xe/xe_exec_compute_mode@twice-userptr-rebind
-igt@xe/xe_exec_compute_mode@twice-userptr-invalidate
-igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race
-igt@xe/xe_exec_compute_mode@twice-bindengine
-igt@xe/xe_exec_compute_mode@twice-bindengine-userptr
-igt@xe/xe_exec_compute_mode@twice-bindengine-rebind
-igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-rebind
-igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate
-igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race
-igt@xe/xe_exec_reset@close-fd-no-exec
-igt@xe/xe_exec_reset@cm-close-fd-no-exec
-igt@xe/xe_exec_reset@virtual-close-fd-no-exec
-#igt@xe/xe_exec_threads@threads-basic
-igt@xe/xe_exec_threads@threads-shared-vm-basic
-igt@xe/xe_exec_threads@threads-fd-basic
-#igt@xe/xe_exec_threads@threads-hang-basic
-igt@xe/xe_exec_threads@threads-bal-basic
-igt@xe/xe_exec_threads@threads-cm-basic
-igt@xe/xe_exec_threads@threads-cm-fd-basic
-igt@xe/xe_exec_threads@threads-mixed-basic
-igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic
-igt@xe/xe_exec_threads@threads-mixed-fd-basic
-igt@xe/xe_exec_threads@threads-bal-mixed-basic
-igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic
-igt@xe/xe_exec_threads@threads-bal-mixed-fd-basic
-igt@xe/xe_guc_pc@freq_basic_api
-igt@xe/xe_guc_pc@freq_fixed_idle
-igt@xe/xe_guc_pc@freq_range_idle
-igt@xe/xe_guc_pc@rc6_on_idle
-igt@xe/xe_guc_pc@rc0_on_exec
-igt@xe/xe_huc_copy@huc_copy
-igt@xe/xe_mmap@system
-igt@xe/xe_mmap@vram
-igt@xe/xe_mmap@vram-system
-igt@xe/xe_mmio@mmio-timestamp
-igt@xe/xe_mmio@mmio-invalid
-igt@xe/xe_prime_self_import@basic-with_one_bo
-igt@xe/xe_prime_self_import@basic-with_fd_dup
-igt@xe/xe_prime_self_import@export-vs-gem_close-race
-igt@xe/xe_prime_self_import@reimport-vs-gem_close-race
-#igt@xe/xe_prime_self_import@basic-llseek-size
-igt@xe/xe_query@query-engines
-igt@xe/xe_query@query-mem-usage
-igt@xe/xe_query@query-gts
-igt@xe/xe_query@query-config
-igt@xe/xe_query@query-hwconfig
-igt@xe/xe_query@query-topology
-igt@xe/xe_query@query-invalid-query
-igt@xe/xe_query@query-invalid-size
-#igt@xe/xe_vm@bind-once
-#igt@xe/xe_vm@scratch
-igt@xe/xe_vm@shared-pte-page
-igt@xe/xe_vm@shared-pde-page
-igt@xe/xe_vm@shared-pde2-page
-igt@xe/xe_vm@shared-pde3-page
-igt@xe/xe_vm@bind-engines-independent
-igt@xe/xe_vm@munmap-style-unbind-one-partial
-igt@xe/xe_vm@munmap-style-unbind-end
-igt@xe/xe_vm@munmap-style-unbind-front
-igt@xe/xe_vm@munmap-style-unbind-userptr-one-partial
-igt@xe/xe_vm@munmap-style-unbind-userptr-end
-igt@xe/xe_vm@munmap-style-unbind-userptr-front
-igt@xe/xe_vm@munmap-style-unbind-userptr-inval-end
-igt@xe/xe_vm@munmap-style-unbind-userptr-inval-front
-igt@xe/xe_waitfence@test
+igt@xe_compute@compute-square
+igt@xe_debugfs@base
+igt@xe_debugfs@gt
+igt@xe_debugfs@forcewake
+igt@xe_dma_buf_sync@export-dma-buf-once
+igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
+igt@xe_exec_balancer@twice-virtual-basic
+igt@xe_exec_balancer@no-exec-virtual-basic
+igt@xe_exec_balancer@twice-cm-virtual-basic
+igt@xe_exec_balancer@no-exec-cm-virtual-basic
+igt@xe_exec_balancer@twice-virtual-userptr
+igt@xe_exec_balancer@no-exec-virtual-userptr
+igt@xe_exec_balancer@twice-cm-virtual-userptr
+igt@xe_exec_balancer@no-exec-cm-virtual-userptr
+igt@xe_exec_balancer@twice-virtual-rebind
+igt@xe_exec_balancer@no-exec-virtual-rebind
+igt@xe_exec_balancer@twice-cm-virtual-rebind
+igt@xe_exec_balancer@no-exec-cm-virtual-rebind
+igt@xe_exec_balancer@twice-virtual-userptr-rebind
+igt@xe_exec_balancer@no-exec-virtual-userptr-rebind
+igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind
+igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind
+igt@xe_exec_balancer@twice-virtual-userptr-invalidate
+igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate
+igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate
+igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate
+igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race
+igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race
+igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race
+igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race
+igt@xe_exec_balancer@twice-parallel-basic
+igt@xe_exec_balancer@no-exec-parallel-basic
+igt@xe_exec_balancer@twice-parallel-userptr
+igt@xe_exec_balancer@no-exec-parallel-userptr
+igt@xe_exec_balancer@twice-parallel-rebind
+igt@xe_exec_balancer@no-exec-parallel-rebind
+igt@xe_exec_balancer@twice-parallel-userptr-rebind
+igt@xe_exec_balancer@no-exec-parallel-userptr-rebind
+igt@xe_exec_balancer@twice-parallel-userptr-invalidate
+igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate
+igt@xe_exec_balancer@twice-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race
+igt@xe_exec_basic@twice-basic
+igt@xe_exec_basic@no-exec-basic
+igt@xe_exec_basic@twice-basic-defer-mmap
+igt@xe_exec_basic@no-exec-basic-defer-mmap
+igt@xe_exec_basic@twice-basic-defer-bind
+igt@xe_exec_basic@no-exec-basic-defer-bind
+igt@xe_exec_basic@twice-userptr
+igt@xe_exec_basic@no-exec-userptr
+igt@xe_exec_basic@twice-rebind
+igt@xe_exec_basic@no-exec-rebind
+igt@xe_exec_basic@twice-userptr-rebind
+igt@xe_exec_basic@no-exec-userptr-rebind
+igt@xe_exec_basic@twice-userptr-invalidate
+igt@xe_exec_basic@no-exec-userptr-invalidate
+igt@xe_exec_basic@twice-userptr-invalidate-race
+igt@xe_exec_basic@no-exec-userptr-invalidate-race
+igt@xe_exec_basic@twice-bindengine
+igt@xe_exec_basic@no-exec-bindengine
+igt@xe_exec_basic@twice-bindengine-userptr
+igt@xe_exec_basic@no-exec-bindengine-userptr
+igt@xe_exec_basic@twice-bindengine-rebind
+igt@xe_exec_basic@no-exec-bindengine-rebind
+igt@xe_exec_basic@twice-bindengine-userptr-rebind
+igt@xe_exec_basic@no-exec-bindengine-userptr-rebind
+igt@xe_exec_basic@twice-bindengine-userptr-invalidate
+igt@xe_exec_basic@no-exec-bindengine-userptr-invalidate
+igt@xe_exec_basic@twice-bindengine-userptr-invalidate-race
+igt@xe_exec_basic@no-exec-bindengine-userptr-invalidate-race
+igt@xe_exec_compute_mode@twice-basic
+igt@xe_exec_compute_mode@twice-preempt-fence-early
+igt@xe_exec_compute_mode@twice-userptr
+igt@xe_exec_compute_mode@twice-rebind
+igt@xe_exec_compute_mode@twice-userptr-rebind
+igt@xe_exec_compute_mode@twice-userptr-invalidate
+igt@xe_exec_compute_mode@twice-userptr-invalidate-race
+igt@xe_exec_compute_mode@twice-bindengine
+igt@xe_exec_compute_mode@twice-bindengine-userptr
+igt@xe_exec_compute_mode@twice-bindengine-rebind
+igt@xe_exec_compute_mode@twice-bindengine-userptr-rebind
+igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate
+igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race
+igt@xe_exec_reset@close-fd-no-exec
+igt@xe_exec_reset@cm-close-fd-no-exec
+igt@xe_exec_reset@virtual-close-fd-no-exec
+#igt@xe_exec_threads@threads-basic
+igt@xe_exec_threads@threads-shared-vm-basic
+igt@xe_exec_threads@threads-fd-basic
+#igt@xe_exec_threads@threads-hang-basic
+igt@xe_exec_threads@threads-bal-basic
+igt@xe_exec_threads@threads-cm-basic
+igt@xe_exec_threads@threads-cm-fd-basic
+igt@xe_exec_threads@threads-mixed-basic
+igt@xe_exec_threads@threads-mixed-shared-vm-basic
+igt@xe_exec_threads@threads-mixed-fd-basic
+igt@xe_exec_threads@threads-bal-mixed-basic
+igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic
+igt@xe_exec_threads@threads-bal-mixed-fd-basic
+igt@xe_guc_pc@freq_basic_api
+igt@xe_guc_pc@freq_fixed_idle
+igt@xe_guc_pc@freq_range_idle
+igt@xe_guc_pc@rc6_on_idle
+igt@xe_guc_pc@rc0_on_exec
+igt@xe_huc_copy@huc_copy
+igt@xe_mmap@system
+igt@xe_mmap@vram
+igt@xe_mmap@vram-system
+igt@xe_mmio@mmio-timestamp
+igt@xe_mmio@mmio-invalid
+igt@xe_prime_self_import@basic-with_one_bo
+igt@xe_prime_self_import@basic-with_fd_dup
+igt@xe_prime_self_import@export-vs-gem_close-race
+igt@xe_prime_self_import@reimport-vs-gem_close-race
+#igt@xe_prime_self_import@basic-llseek-size
+igt@xe_query@query-engines
+igt@xe_query@query-mem-usage
+igt@xe_query@query-gts
+igt@xe_query@query-config
+igt@xe_query@query-hwconfig
+igt@xe_query@query-topology
+igt@xe_query@query-invalid-query
+igt@xe_query@query-invalid-size
+#igt@xe_vm@bind-once
+#igt@xe_vm@scratch
+igt@xe_vm@shared-pte-page
+igt@xe_vm@shared-pde-page
+igt@xe_vm@shared-pde2-page
+igt@xe_vm@shared-pde3-page
+igt@xe_vm@bind-engines-independent
+igt@xe_vm@munmap-style-unbind-one-partial
+igt@xe_vm@munmap-style-unbind-end
+igt@xe_vm@munmap-style-unbind-front
+igt@xe_vm@munmap-style-unbind-userptr-one-partial
+igt@xe_vm@munmap-style-unbind-userptr-end
+igt@xe_vm@munmap-style-unbind-userptr-front
+igt@xe_vm@munmap-style-unbind-userptr-inval-end
+igt@xe_vm@munmap-style-unbind-userptr-inval-front
+igt@xe_waitfence@test
diff --git a/tests/meson.build b/tests/meson.build
index 4a1722b3d4..632e36e059 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -241,6 +241,28 @@ i915_progs = [
 	'sysfs_timeslice_duration',
 ]
 
+xe_progs = [
+	'xe_compute',
+	'xe_dma_buf_sync',
+	'xe_debugfs',
+	'xe_evict',
+	'xe_exec_balancer',
+	'xe_exec_basic',
+	'xe_exec_compute_mode',
+	'xe_exec_fault_mode',
+	'xe_exec_reset',
+	'xe_exec_threads',
+	'xe_guc_pc',
+	'xe_huc_copy',
+	'xe_mmap',
+	'xe_mmio',
+	'xe_pm',
+	'xe_prime_self_import',
+	'xe_query',
+	'xe_vm',
+	'xe_waitfence',
+]
+
 msm_progs = [
 	'msm_mapping',
 	'msm_recovery',
@@ -289,6 +311,16 @@ foreach prog : i915_progs
 	test_list += prog
 endforeach
 
+foreach prog : xe_progs
+	test_executables += executable(prog,
+		   join_paths('xe', prog + '.c'),
+		   dependencies : test_deps,
+		   install_dir : libexecdir,
+		   install_rpath : libexecdir_rpathdir,
+		   install : true)
+	test_list += prog
+endforeach
+
 foreach prog : msm_progs
 	test_executables += executable(prog, join_paths('msm', prog + '.c'),
 				       dependencies : test_deps,
diff --git a/tests/xe/meson.build b/tests/xe/meson.build
index bcc2f58ba8..bb344f95d5 100644
--- a/tests/xe/meson.build
+++ b/tests/xe/meson.build
@@ -1,33 +1 @@
-xe_progs = [
-	'xe_compute',
-	'xe_dma_buf_sync',
-	'xe_debugfs',
-	'xe_evict',
-	'xe_exec_balancer',
-	'xe_exec_basic',
-	'xe_exec_compute_mode',
-	'xe_exec_fault_mode',
-	'xe_exec_reset',
-	'xe_exec_threads',
-	'xe_guc_pc',
-	'xe_huc_copy',
-	'xe_mmap',
-	'xe_mmio',
-	'xe_pm',
-	'xe_prime_self_import',
-	'xe_query',
-	'xe_vm',
-	'xe_waitfence',
-]
-xe_deps = test_deps
-
 xe_test_config = meson.current_source_dir() + '/xe_test_config.json'
-
-foreach prog : xe_progs
-	test_executables += executable(prog, prog + '.c',
-				       dependencies : xe_deps,
-				       install_dir : xedir,
-				       install_rpath : xedir_rpathdir,
-				       install : true)
-	test_list += join_paths('xe', prog)
-endforeach
-- 
2.34.1
