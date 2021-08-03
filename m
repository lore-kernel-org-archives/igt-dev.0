Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636ED89EBB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 07:38:52 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Tue,  3 Aug 2021 09:38:33 +0200
Message-Id: <20210803073835.2910-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Keep tests working without relocations 2
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
  tests/i915/gem_streaming_writes: Support gens without relocations
  tests/i915/gem_exec_lut_handle: Require relocation support

 tests/i915/gem_exec_lut_handle.c  |   1 +
 tests/i915/gem_streaming_writes.c | 151 ++++++++++++++++++++----------
 2 files changed, 101 insertions(+), 51 deletions(-)

-- 
2.25.1
