Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5418910E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 11:58:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Dec 2022 12:58:10 +0100
Message-Id: <20221219115812.55770-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Fix invalid usage of put_offset()
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

Fixes invalid usage of put_offset() - it should be called with handle,
not with offset (all three tests have this problem).

Also change allocator opening a bit in gem_exec_whisper - with stateful
reloc allocator separation of vm spaces is necessary (previously it 
just incremented offsets so there was no risk of overlapping even
when all processes uses single allocator underneath).

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Zbigniew Kempczyński (2):
  tests/gem_*: Fix release offsets
  tests/gem_exec_whisper: Fix offsets handling and separate allocators

 tests/i915/gem_blits.c         | 12 ++++++------
 tests/i915/gem_ctx_isolation.c |  6 +++---
 tests/i915/gem_exec_whisper.c  |  7 ++++---
 3 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.34.1
