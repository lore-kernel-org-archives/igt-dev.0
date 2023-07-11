Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367C010E394
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 13:37:41 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 13:36:53 +0000
Message-Id: <20230711133653.2402574-2-katarzyna.dec@intel.com>
In-Reply-To: <20230711133653.2402574-1-katarzyna.dec@intel.com>
References: <20230711133653.2402574-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/intel-ci: Remove unnecessary
 tests from fast-feedback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We have reached point where we need to reduce BAT testlist.
First step of cleaning up fast-feedback is covering:
 * remove 'race' testcases
 * reduce xe_exec_balancer, xe_exec_basic, xe_spin_batch test cases

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 44 ------------------------
 1 file changed, 44 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 1e8f181c2..e6f134f3d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -31,115 +31,76 @@ igt@xe_exec_balancer@no-exec-virtual-basic
 igt@xe_exec_balancer@twice-cm-virtual-basic
 igt@xe_exec_balancer@no-exec-cm-virtual-basic
 igt@xe_exec_balancer@twice-virtual-userptr
-igt@xe_exec_balancer@no-exec-virtual-userptr
 igt@xe_exec_balancer@twice-cm-virtual-userptr
-igt@xe_exec_balancer@no-exec-cm-virtual-userptr
 igt@xe_exec_balancer@twice-virtual-rebind
-igt@xe_exec_balancer@no-exec-virtual-rebind
 igt@xe_exec_balancer@twice-cm-virtual-rebind
-igt@xe_exec_balancer@no-exec-cm-virtual-rebind
 igt@xe_exec_balancer@twice-virtual-userptr-rebind
-igt@xe_exec_balancer@no-exec-virtual-userptr-rebind
 igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind
-igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind
 igt@xe_exec_balancer@twice-virtual-userptr-invalidate
-igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate
 igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate
-igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate
-igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race
-igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race
-igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race
-igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race
 igt@xe_exec_balancer@twice-parallel-basic
 igt@xe_exec_balancer@no-exec-parallel-basic
 igt@xe_exec_balancer@twice-parallel-userptr
-igt@xe_exec_balancer@no-exec-parallel-userptr
 igt@xe_exec_balancer@twice-parallel-rebind
-igt@xe_exec_balancer@no-exec-parallel-rebind
 igt@xe_exec_balancer@twice-parallel-userptr-rebind
-igt@xe_exec_balancer@no-exec-parallel-userptr-rebind
 igt@xe_exec_balancer@twice-parallel-userptr-invalidate
-igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate
-igt@xe_exec_balancer@twice-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race
 igt@xe_exec_basic@twice-basic
 igt@xe_exec_basic@no-exec-basic
 igt@xe_exec_basic@twice-basic-defer-mmap
-igt@xe_exec_basic@no-exec-basic-defer-mmap
 igt@xe_exec_basic@twice-basic-defer-bind
-igt@xe_exec_basic@no-exec-basic-defer-bind
 igt@xe_exec_basic@twice-userptr
-igt@xe_exec_basic@no-exec-userptr
 igt@xe_exec_basic@twice-rebind
-igt@xe_exec_basic@no-exec-rebind
 igt@xe_exec_basic@twice-userptr-rebind
-igt@xe_exec_basic@no-exec-userptr-rebind
 igt@xe_exec_basic@twice-userptr-invalidate
 igt@xe_exec_basic@no-exec-userptr-invalidate
-igt@xe_exec_basic@twice-userptr-invalidate-race
-igt@xe_exec_basic@no-exec-userptr-invalidate-race
 igt@xe_exec_basic@twice-bindengine
 igt@xe_exec_basic@no-exec-bindengine
 igt@xe_exec_basic@twice-bindengine-userptr
-igt@xe_exec_basic@no-exec-bindengine-userptr
 igt@xe_exec_basic@twice-bindengine-rebind
-igt@xe_exec_basic@no-exec-bindengine-rebind
 igt@xe_exec_basic@twice-bindengine-userptr-rebind
-igt@xe_exec_basic@no-exec-bindengine-userptr-rebind
 igt@xe_exec_basic@twice-bindengine-userptr-invalidate
-igt@xe_exec_basic@no-exec-bindengine-userptr-invalidate
-igt@xe_exec_basic@twice-bindengine-userptr-invalidate-race
-igt@xe_exec_basic@no-exec-bindengine-userptr-invalidate-race
 igt@xe_exec_compute_mode@twice-basic
 igt@xe_exec_compute_mode@twice-preempt-fence-early
 igt@xe_exec_compute_mode@twice-userptr
 igt@xe_exec_compute_mode@twice-rebind
 igt@xe_exec_compute_mode@twice-userptr-rebind
 igt@xe_exec_compute_mode@twice-userptr-invalidate
-igt@xe_exec_compute_mode@twice-userptr-invalidate-race
 igt@xe_exec_compute_mode@twice-bindengine
 igt@xe_exec_compute_mode@twice-bindengine-userptr
 igt@xe_exec_compute_mode@twice-bindengine-rebind
 igt@xe_exec_compute_mode@twice-bindengine-userptr-rebind
 igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate
-igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race
 igt@xe_exec_fault_mode@twice-basic
 igt@xe_exec_fault_mode@many-basic
 igt@xe_exec_fault_mode@twice-userptr
 igt@xe_exec_fault_mode@twice-rebind
 igt@xe_exec_fault_mode@twice-userptr-rebind
 igt@xe_exec_fault_mode@twice-userptr-invalidate
-igt@xe_exec_fault_mode@twice-userptr-invalidate-race
 igt@xe_exec_fault_mode@twice-bindengine
 igt@xe_exec_fault_mode@twice-bindengine-userptr
 igt@xe_exec_fault_mode@twice-bindengine-rebind
 igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind
 igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate
-igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race
 igt@xe_exec_fault_mode@twice-basic-imm
 igt@xe_exec_fault_mode@twice-userptr-imm
 igt@xe_exec_fault_mode@twice-rebind-imm
 igt@xe_exec_fault_mode@twice-userptr-rebind-imm
 igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm
 igt@xe_exec_fault_mode@twice-bindengine-imm
 igt@xe_exec_fault_mode@twice-bindengine-userptr-imm
 igt@xe_exec_fault_mode@twice-bindengine-rebind-imm
 igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm
 igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm
 igt@xe_exec_fault_mode@twice-basic-prefetch
 igt@xe_exec_fault_mode@twice-userptr-prefetch
 igt@xe_exec_fault_mode@twice-rebind-prefetch
 igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch
 igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch
-igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch
 igt@xe_exec_fault_mode@twice-bindengine-prefetch
 igt@xe_exec_fault_mode@twice-bindengine-userptr-prefetch
 igt@xe_exec_fault_mode@twice-bindengine-rebind-prefetch
 igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch
 igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-prefetch
-igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch
 igt@xe_exec_fault_mode@twice-invalid-fault
 igt@xe_exec_fault_mode@twice-invalid-userptr-fault
 igt@xe_exec_reset@close-fd-no-exec
@@ -149,7 +110,6 @@ igt@xe_exec_store@basic-store
 #igt@xe_exec_threads@threads-basic
 igt@xe_exec_threads@threads-shared-vm-basic
 igt@xe_exec_threads@threads-fd-basic
-#igt@xe_exec_threads@threads-hang-basic
 igt@xe_exec_threads@threads-bal-basic
 igt@xe_exec_threads@threads-cm-basic
 igt@xe_exec_threads@threads-cm-fd-basic
@@ -191,8 +151,6 @@ igt@xe_mmio@mmio-timestamp
 igt@xe_mmio@mmio-invalid
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
-#igt@xe_prime_self_import@export-vs-gem_close-race
-#igt@xe_prime_self_import@reimport-vs-gem_close-race
 #igt@xe_prime_self_import@basic-llseek-size
 igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
@@ -203,9 +161,7 @@ igt@xe_query@query-topology
 igt@xe_query@query-invalid-extension
 igt@xe_query@query-invalid-query
 igt@xe_query@query-invalid-size
-igt@xe_spin_batch@spin-all
 igt@xe_spin_batch@spin-basic
-igt@xe_spin_batch@spin-basic-all
 igt@xe_spin_batch@spin-batch
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
-- 
2.34.1
