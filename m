Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA9B10E50C
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 15:22:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 16:21:29 +0100
Message-Id: <20230307152130.795989-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307152130.795989-1-zbigniew.kempczynski@intel.com>
References: <20230307152130.795989-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 6/7] intel-ci/xe-fast-feedback: Introduce
 xe-fast-feedback list
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

Let's start with something simple that runs very quickly and is
currently passing reliably.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Philippe Lecluse <philippe.lecluse@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/meson.build               |   1 +
 tests/intel-ci/xe-fast-feedback.testlist | 140 +++++++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 tests/intel-ci/xe-fast-feedback.testlist

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 62811e92c3..bbbd557009 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -5,6 +5,7 @@ intelci_files = [
   'README',
   'blacklist.txt',
   'blacklist-pre-merge.txt',
+  'xe-fast-feedback.testlist',
 ]
 
 install_data(sources : intelci_files, install_dir : datadir)
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
new file mode 100644
index 0000000000..ac42d52aa9
--- /dev/null
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -0,0 +1,140 @@
+igt@xe/xe_compute@compute-square
+igt@xe/xe_debugfs@base
+igt@xe/xe_debugfs@gt0
+igt@xe/xe_debugfs@gt1
+igt@xe/xe_debugfs@forcewake
+igt@xe/xe_dma_buf_sync@export-dma-buf-once
+igt@xe/xe_dma_buf_sync@export-dma-buf-once-read-sync
+igt@xe/xe_exec_balancer@twice-virtual-basic
+igt@xe/xe_exec_balancer@no-exec-virtual-basic
+igt@xe/xe_exec_balancer@twice-cm-virtual-basic
+igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic
+igt@xe/xe_exec_balancer@twice-virtual-userptr
+igt@xe/xe_exec_balancer@no-exec-virtual-userptr
+igt@xe/xe_exec_balancer@twice-cm-virtual-userptr
+igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr
+igt@xe/xe_exec_balancer@twice-virtual-rebind
+igt@xe/xe_exec_balancer@no-exec-virtual-rebind
+igt@xe/xe_exec_balancer@twice-cm-virtual-rebind
+igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind
+igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind
+igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind
+igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-rebind
+igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-rebind
+igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate
+igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate
+igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate
+igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate
+igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate-race
+igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate-race
+igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race
+igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race
+igt@xe/xe_exec_balancer@twice-parallel-basic
+igt@xe/xe_exec_balancer@no-exec-parallel-basic
+igt@xe/xe_exec_balancer@twice-parallel-userptr
+igt@xe/xe_exec_balancer@no-exec-parallel-userptr
+igt@xe/xe_exec_balancer@twice-parallel-rebind
+igt@xe/xe_exec_balancer@no-exec-parallel-rebind
+igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind
+igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind
+igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate
+igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate
+igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race
+igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate-race
+igt@xe/xe_exec_basic@twice-basic
+igt@xe/xe_exec_basic@no-exec-basic
+igt@xe/xe_exec_basic@twice-basic-defer-mmap
+igt@xe/xe_exec_basic@no-exec-basic-defer-mmap
+igt@xe/xe_exec_basic@twice-basic-defer-bind
+igt@xe/xe_exec_basic@no-exec-basic-defer-bind
+igt@xe/xe_exec_basic@twice-userptr
+igt@xe/xe_exec_basic@no-exec-userptr
+igt@xe/xe_exec_basic@twice-rebind
+igt@xe/xe_exec_basic@no-exec-rebind
+igt@xe/xe_exec_basic@twice-userptr-rebind
+igt@xe/xe_exec_basic@no-exec-userptr-rebind
+igt@xe/xe_exec_basic@twice-userptr-invalidate
+igt@xe/xe_exec_basic@no-exec-userptr-invalidate
+igt@xe/xe_exec_basic@twice-userptr-invalidate-race
+igt@xe/xe_exec_basic@no-exec-userptr-invalidate-race
+igt@xe/xe_exec_basic@twice-bindengine
+igt@xe/xe_exec_basic@no-exec-bindengine
+igt@xe/xe_exec_basic@twice-bindengine-userptr
+igt@xe/xe_exec_basic@no-exec-bindengine-userptr
+igt@xe/xe_exec_basic@twice-bindengine-rebind
+igt@xe/xe_exec_basic@no-exec-bindengine-rebind
+igt@xe/xe_exec_basic@twice-bindengine-userptr-rebind
+igt@xe/xe_exec_basic@no-exec-bindengine-userptr-rebind
+igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate
+igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate
+igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate-race
+igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate-race
+igt@xe/xe_exec_compute_mode@twice-basic
+igt@xe/xe_exec_compute_mode@twice-preempt-fence-early
+igt@xe/xe_exec_compute_mode@twice-userptr
+igt@xe/xe_exec_compute_mode@twice-rebind
+igt@xe/xe_exec_compute_mode@twice-userptr-rebind
+igt@xe/xe_exec_compute_mode@twice-userptr-invalidate
+igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race
+igt@xe/xe_exec_compute_mode@twice-bindengine
+igt@xe/xe_exec_compute_mode@twice-bindengine-userptr
+igt@xe/xe_exec_compute_mode@twice-bindengine-rebind
+igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-rebind
+igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate
+igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race
+igt@xe/xe_exec_reset@close-fd-no-exec
+igt@xe/xe_exec_reset@cm-close-fd-no-exec
+igt@xe/xe_exec_reset@virtual-close-fd-no-exec
+#igt@xe/xe_exec_threads@threads-basic
+igt@xe/xe_exec_threads@threads-shared-vm-basic
+igt@xe/xe_exec_threads@threads-fd-basic
+#igt@xe/xe_exec_threads@threads-hang-basic
+igt@xe/xe_exec_threads@threads-bal-basic
+igt@xe/xe_exec_threads@threads-cm-basic
+igt@xe/xe_exec_threads@threads-cm-fd-basic
+igt@xe/xe_exec_threads@threads-mixed-basic
+igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic
+igt@xe/xe_exec_threads@threads-mixed-fd-basic
+igt@xe/xe_exec_threads@threads-bal-mixed-basic
+igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic
+igt@xe/xe_exec_threads@threads-bal-mixed-fd-basic
+igt@xe/xe_guc_pc@freq_basic_api
+igt@xe/xe_guc_pc@freq_fixed_idle
+igt@xe/xe_guc_pc@freq_range_idle
+igt@xe/xe_guc_pc@rc6_on_idle
+igt@xe/xe_guc_pc@rc0_on_exec
+igt@xe/xe_huc_copy@huc_copy
+igt@xe/xe_mmap@system
+igt@xe/xe_mmap@vram
+igt@xe/xe_mmap@vram-system
+igt@xe/xe_mmio@mmio-timestamp
+igt@xe/xe_mmio@mmio-invalid
+igt@xe/xe_prime_self_import@basic-with_one_bo
+igt@xe/xe_prime_self_import@basic-with_fd_dup
+igt@xe/xe_prime_self_import@export-vs-gem_close-race
+igt@xe/xe_prime_self_import@reimport-vs-gem_close-race
+#igt@xe/xe_prime_self_import@basic-llseek-size
+igt@xe/xe_query@query-engines
+igt@xe/xe_query@query-mem-usage
+igt@xe/xe_query@query-gts
+igt@xe/xe_query@query-config
+igt@xe/xe_query@query-hwconfig
+igt@xe/xe_query@query-topology
+igt@xe/xe_query@query-invalid-query
+igt@xe/xe_query@query-invalid-size
+#igt@xe/xe_vm@bind-once
+#igt@xe/xe_vm@scratch
+igt@xe/xe_vm@shared-pte-page
+igt@xe/xe_vm@shared-pde-page
+igt@xe/xe_vm@shared-pde2-page
+igt@xe/xe_vm@shared-pde3-page
+igt@xe/xe_vm@bind-engines-independent
+igt@xe/xe_vm@munmap-style-unbind-one-partial
+igt@xe/xe_vm@munmap-style-unbind-end
+igt@xe/xe_vm@munmap-style-unbind-front
+igt@xe/xe_vm@munmap-style-unbind-userptr-one-partial
+igt@xe/xe_vm@munmap-style-unbind-userptr-end
+igt@xe/xe_vm@munmap-style-unbind-userptr-front
+igt@xe/xe_vm@munmap-style-unbind-userptr-inval-end
+igt@xe/xe_vm@munmap-style-unbind-userptr-inval-front
+igt@xe/xe_waitfence@test
-- 
2.34.1
