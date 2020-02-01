Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4157D6E32E
 for <igt-dev@lists.freedesktop.org>; Sat,  1 Feb 2020 19:34:55 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Sun,  2 Feb 2020 01:03:45 +0530
Message-Id: <20200201193347.7432-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Add check for FENCE based tiling support
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

These tests are verifying the integrity of blitter render copy as well as
read write operations for tiling data on platform which has support of
FANCES. So a check has been added to skip the test if no of fences are
zero on the platform.

gem_render_tiled_blits: Test to check effects of different physical
address values on render copy is being developed as Kernel selftest.

Ayaz A Siddiqui (2):
  i915/gem_tiled_pread_*: Add check for FENCE based tiling support
  i915/gem_render_tiled_blits: Add check for hardware based FENCE
    support

 tests/i915/gem_render_tiled_blits.c | 1 +
 tests/i915/gem_tiled_pread_basic.c  | 2 +-
 tests/i915/gem_tiled_pread_pwrite.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
