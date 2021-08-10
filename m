Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94088984E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 19:14:35 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Tue, 10 Aug 2021 21:14:23 +0200
Message-Id: <20210810191425.8391-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Keep tests working without relocations
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
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

With relocations disabled for newer generations
the addresses of buffer objects in memory need
to be known in advance and, hence, assigned in
userspace.
If relocations are not supported, the tests now
use the intel allocator to find offsets and
update the contents of batches correspondingly.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Andrzej Turko (2):
  tests/gem_exec_store: Support gens without relocations
  tests/gem_softpin: Exercise eviction with softpinning

 tests/i915/gem_exec_store.c | 134 ++++++++++++++++++-----
 tests/i915/gem_softpin.c    | 212 +++++++++++++++++++++++++++++++++++-
 2 files changed, 317 insertions(+), 29 deletions(-)

-- 
2.25.1
