Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5E710E51B
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 19:15:21 +0000 (UTC)
From: Anna Karas <anna.karas@intel.com>
Date: Thu, 20 Apr 2023 21:14:52 +0200
Message-Id: <20230420191454.497237-1-anna.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [RFC 0/2] lib/xe_gpu: Introduce xe_gpu library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Joonas Lahtinen <joonas.lahtinen@intel.com>, Maarten Lankhorst <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

OPENS:
1. Lack of wedged concept in XE: @Matthew informed me that there is no
intent to have reporting wedged device in XE. However, @Joonas believes
that it may be useful - "it's used at least in specific diagnostics and
hardware repair flows for PVC and FLR for all platforms, where we
prevent further accesses to the hardware. So an alternative mechanism is
needed for those". Since xe_require_gpu() is a direct port of i915's 
igt_require_gem() stripped of wedged device reporting, this could be a
good opportunity to discuss this.

2. igt_require_gem() was also responsible for restoring reset and
enable_hangcheck modparams. Do we need those parameters here? Do/will we
need different ones do restore?

3. Would you find adding equivalent of gem_quiescent_gpu here worth?

Reference: Jira VLK-46235
Signed-off-by: Anna Karas <anna.karas@intel.com>

Anna Karas (2):
  lib/xe_gpu: Introduce xe_gpu library
  tests/xe: Use xe_require_gpu() in existing tests

 lib/meson.build                 |   1 +
 lib/xe/xe_gpu.c                 | 136 ++++++++++++++++++++++++++++++++
 lib/xe/xe_gpu.h                 |  19 +++++
 tests/xe/xe_compute.c           |   2 +
 tests/xe/xe_create.c            |   2 +
 tests/xe/xe_debugfs.c           |   2 +
 tests/xe/xe_dma_buf_sync.c      |   2 +
 tests/xe/xe_evict.c             |   2 +
 tests/xe/xe_exec_balancer.c     |   2 +
 tests/xe/xe_exec_basic.c        |   2 +
 tests/xe/xe_exec_compute_mode.c |   2 +
 tests/xe/xe_exec_fault_mode.c   |   2 +
 tests/xe/xe_exec_reset.c        |   2 +
 tests/xe/xe_exec_threads.c      |   2 +
 tests/xe/xe_guc_pc.c            |   2 +
 tests/xe/xe_huc_copy.c          |   2 +
 tests/xe/xe_mmap.c              |   2 +
 tests/xe/xe_mmio.c              |   2 +
 tests/xe/xe_noexec_ping_pong.c  |   2 +
 tests/xe/xe_pm.c                |   2 +
 tests/xe/xe_prime_self_import.c |   2 +
 tests/xe/xe_query.c             |   2 +
 tests/xe/xe_vm.c                |   2 +
 tests/xe/xe_waitfence.c         |   2 +
 24 files changed, 198 insertions(+)
 create mode 100644 lib/xe/xe_gpu.c
 create mode 100644 lib/xe/xe_gpu.h

-- 
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.


