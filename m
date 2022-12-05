Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAB810E190
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 09:25:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Dec 2022 10:25:09 +0100
Message-Id: <20221205092511.16008-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Exercise evict-flink-*
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

Zbigniew Kempczyński (2):
  tests/gem_softpin: Add flink reopen eviction subtest
  HAX: Exercise evict-flink and evict-flink-all

 tests/i915/gem_softpin.c              | 164 +++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist | 180 +-------------------------
 2 files changed, 167 insertions(+), 177 deletions(-)

-- 
2.34.1
