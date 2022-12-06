Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327C210E0E0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 07:39:13 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 08:39:06 +0100
Message-Id: <20221206073908.24332-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] Exercise evict-flink-*
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

During change reloc allocator to keep offsets I start observing failures
in gem_exec_parallel@engines@fds. Looks as vma rebind bug so this series
contains isolated flink open/bind test.

HAX isolates execution, review is welcome.

v2: removing missed FILE *out used for debug
v3: - migrate object setup (pinning) code out of loop as it is constant
      during loop execution
    - put 'all' subtest within same dynamic subtest, add sanity check
      subtest which verifies evictin within single thread

Zbigniew Kempczyński (2):
  tests/gem_softpin: Add flink reopen eviction subtest
  HAX: Exercise evict-flink and evict-flink-all

 tests/i915/gem_softpin.c              | 167 ++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist | 180 +-------------------------
 2 files changed, 170 insertions(+), 177 deletions(-)

-- 
2.34.1
