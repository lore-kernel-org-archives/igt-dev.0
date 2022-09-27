Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9123310E0C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 09:17:38 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 11:17:24 +0200
Message-Id: <20220927091727.36470-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Remove gem_get_batch_size()
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

Remove gem_get_batch_size() as it is confusing - object size returned
by the kernel might differ than this function suggests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Zbigniew Kempczyński (3):
  tests/prime_mmap: Use batch sizes appropriate for regions
  tests/gem_exec_basic: Don't use hardcoded batch size
  lib/intel_memory_region: Remove function which returns batch size in
    regions

 lib/i915/intel_memory_region.c | 14 --------
 lib/i915/intel_memory_region.h |  1 -
 tests/i915/gem_exec_basic.c    | 10 +++---
 tests/prime_mmap.c             | 59 ++++++++++++++++------------------
 4 files changed, 33 insertions(+), 51 deletions(-)

-- 
2.34.1
