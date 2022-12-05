Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6FE10E227
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 12:21:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Dec 2022 13:21:27 +0100
Message-Id: <20221205122129.33249-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Exercise evict-flink-*
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

Zbigniew Kempczyński (2):
  tests/gem_softpin: Add flink reopen eviction subtest
  HAX: Exercise evict-flink and evict-flink-all

 tests/i915/gem_softpin.c              | 161 +++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist | 180 +-------------------------
 2 files changed, 164 insertions(+), 177 deletions(-)

-- 
2.34.1
