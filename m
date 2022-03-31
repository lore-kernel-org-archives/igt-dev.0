Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2ED10E42F
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 16:34:41 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Mar 2022 18:34:27 +0200
Message-Id: <20220331163430.73167-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] i915/gem_concurrent_all: Add no-reloc
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

Add noreloc mode for GPU gens without relocations. Also
while at this, add some caching for required properties.
Change also snoop function so it will work on DG1.
Fix swap subtest group and make unpinning without enclosing
fixture.

v7: corrected newline add/delete errors in gem_concurrent_all
    add new patch with swap subtest fixes (Zbigniew)
v6: resended with corrected commit version desccription in
    gem_concurrent_all
v5: move down after reloc functions, add description, use
    get_simple_h2l_ahnd function in main() fixture (Zbigniew)
v4: rebase, simplify bit17_require (Zbigniew)
v3: address Zbigniew review: correcting comment style, changed
    checks in bit17_require 
v2: rebased, fix caching in bit17_require, addressed Zbigniew
    review comments

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (3):
  lib/intel_batchbuffer: add create without relocs
  tests/i915/gem_concurrent_all: Add no-reloc capability
  i915/gem_concurrent_all: fix swap subtest group

 lib/intel_batchbuffer.c         |  21 ++++
 lib/intel_batchbuffer.h         |   1 +
 tests/i915/gem_concurrent_all.c | 179 ++++++++++++++++++++++++++------
 3 files changed, 169 insertions(+), 32 deletions(-)

-- 
2.32.0
