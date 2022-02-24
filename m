Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F143E10E187
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 13:04:56 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 14:04:42 +0100
Message-Id: <20220224130444.18793-1-kamil.konieczny@linux.intel.com>
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

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/intel_batchbuffer: add create without relocs
  tests/i915/gem_concurrent_all: Add no-reloc capability

 lib/intel_batchbuffer.c         |   9 +-
 lib/intel_batchbuffer.h         |   1 +
 tests/i915/gem_concurrent_all.c | 162 +++++++++++++++++++++++++++-----
 3 files changed, 148 insertions(+), 24 deletions(-)

-- 
2.32.0
