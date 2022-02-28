Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA92B10E791
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 13:03:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Feb 2022 14:03:25 +0100
Message-Id: <20220228130328.46176-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Use supported dma-buf regions in
 prime_mmap*
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

Contains library helper + changes in prime_mmap*. Additionally removes
prime_mmap_coherency libdrm dependency.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Ch Sai Gowtham (1):
  tests/prime_mmap_coherency.c: Use intel_bb and intel_buf to remove
    libdrm dependency

Zbigniew Kempczyński (2):
  lib/intel_memory_regions: Add helper which creates supported dma-buf
    set
  tests/prime_mmap: Iterate over dma-buf supported memory regions

 lib/i915/intel_memory_region.c |  61 ++++++++++++++++
 lib/i915/intel_memory_region.h |   3 +
 tests/prime_mmap.c             |  34 ++-------
 tests/prime_mmap_coherency.c   | 125 ++++++++++++++++++++-------------
 4 files changed, 145 insertions(+), 78 deletions(-)

-- 
2.32.0
