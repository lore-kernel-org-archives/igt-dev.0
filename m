Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD85E2BE93
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 10:13:09 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Jul 2022 12:13:10 +0200
Message-Id: <cover.1658826356.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/gem_exec_fence: Fix
 test_fence_await for hanging workloads
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch series fixes test_fence_await for failing gem_exec_fence
subtests that inject GPU hangs (await-hang and nb-await-hang). The test
assumed that the error notification happens after a hang is declared,
which would be enough for the next set of fences to be submitted,
making this test pass. But as we use the error-interrupt, we get immediate
reset for the invalid command stream. This means that when the test checks
for active fences, none can be found, leading to the test failure.

To address this problem, the active fences check is only done for valid
workloads. In addition to the fix, the series adds spinning before
usleep() call to coordinate sleep with the start of the request.

v2:
  No functional changes, fixed styling issues pointed out by Kamil:
    - Moved comment for fence_busy(spin->out_fence) assertion
    - Fixed formatting for flags assignment in spin definition

Chris Wilson (2):
  tests/gem_exec_fence: Check stored values only for valid workloads
  tests/gem_exec_fence: Coordinate sleep with the start of the request

 tests/i915/gem_exec_fence.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

--
2.25.1
