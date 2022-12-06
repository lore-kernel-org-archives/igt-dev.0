Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C4710E151
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 17:52:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 18:52:20 +0100
Message-Id: <20221206175222.63998-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Exercise evict-prime-*
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
contains isolated prime open/bind test.

HAX isolates execution, review is welcome.

v2: removing missed FILE *out used for debug
v3: - migrate object setup (pinning) code out of loop as it is constant
      during loop execution
    - put 'all' subtest within same dynamic subtest, add sanity check
      subtest which verifies evictin within single thread
v4: - change to prime as it more real world scenario
    - make better cleanup on thread failure
v5: update fast-feedback to prime

Zbigniew Kempczyński (2):
  tests/gem_softpin: Add prime reopen eviction subtest
  HAX: Exercise evict-prime and evict-prime-sanity-check

 tests/i915/gem_softpin.c              | 181 ++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist | 180 +------------------------
 2 files changed, 184 insertions(+), 177 deletions(-)

-- 
2.34.1
