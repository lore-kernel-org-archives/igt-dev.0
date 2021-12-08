Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEC76E4FF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 17:36:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed,  8 Dec 2021 18:24:14 +0100
Message-Id: <20211208172416.136412-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Stop complaining regioning on stable
 kernels
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Chris noted that we don't support properly fallback path on stable
kernels with querying regions but for example gem_exec_basic is 
using this so provide stub code which should work both for drm-tip
and stable kernels as well.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>

Zbigniew Kempczyński (2):
  lib/i915/intel_memory_region: Provide system memory region stub
  tests/gem_exec_basic: Add gem create fallback

 lib/i915/intel_memory_region.c | 13 +++++++++++--
 tests/i915/gem_exec_basic.c    |  7 +++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.26.0
