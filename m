Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE03D10E310
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 16:16:50 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 18:14:05 +0200
Message-Id: <20230627161407.344961-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Change all user wait fence tests to
 nanoseconds
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

To avoid regression in all tests uses user fence wait we need
to extend timeout first, then kernel change which changes jiffies
to nanoseconds can land.

Zbigniew Kempczyński (2):
  lib/xe_query: Add milliseconds to nanoseconds macro
  tests/xe_*: Use nanoseconds instead jiffies in wait user fence

 lib/xe/xe_query.h               | 2 ++
 tests/xe/xe_evict.c             | 2 +-
 tests/xe/xe_exec_balancer.c     | 2 +-
 tests/xe/xe_exec_compute_mode.c | 4 ++--
 tests/xe/xe_exec_fault_mode.c   | 2 +-
 tests/xe/xe_exec_reset.c        | 2 +-
 tests/xe/xe_exec_threads.c      | 4 ++--
 tests/xe/xe_waitfence.c         | 1 -
 8 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.34.1
