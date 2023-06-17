Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DFE10E08C
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jun 2023 09:47:46 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.22.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 81913580D93
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jun 2023 02:47:44 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qASWz-00GFol-2e
 for igt-dev@lists.freedesktop.org; Sat, 17 Jun 2023 11:47:41 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 17 Jun 2023 11:47:37 +0200
Message-Id: <20230617094739.3874020-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Some fixes for tests/xe documentation
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

This is a small series with two fixes for tests/xe documentation:

- patch 1: fixes a typo: Software -> Software
- patch 2: removes a TODO warning from documentation

Mauro Carvalho Chehab (2):
  tests/xe/xe_module_load: fix a typo at the category
  tests/xe: remove an useless TODO message

 tests/xe/xe_dma_buf_sync.c      |  2 --
 tests/xe/xe_evict.c             |  1 -
 tests/xe/xe_exec_balancer.c     |  7 -------
 tests/xe/xe_exec_basic.c        |  4 ----
 tests/xe/xe_exec_compute_mode.c |  3 ---
 tests/xe/xe_exec_fault_mode.c   |  8 --------
 tests/xe/xe_exec_reset.c        | 19 -------------------
 tests/xe/xe_exec_threads.c      |  1 -
 tests/xe/xe_gpgpu_fill.c        |  1 -
 tests/xe/xe_guc_pc.c            |  6 ------
 tests/xe/xe_intel_bb.c          | 10 ----------
 tests/xe/xe_module_load.c       |  2 +-
 tests/xe/xe_noexec_ping_pong.c  |  1 -
 tests/xe/xe_pm.c                |  1 -
 tests/xe/xe_prime_self_import.c |  4 ----
 tests/xe/xe_spin_batch.c        |  4 ----
 tests/xe/xe_vm.c                | 17 -----------------
 17 files changed, 1 insertion(+), 90 deletions(-)

-- 
2.40.1
