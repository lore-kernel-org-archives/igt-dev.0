Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8308810E0B7
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 07:30:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 08:30:16 +0100
Message-Id: <20220318073018.26941-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add two gem-ccs subtests
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

Introduce two new subtests - ctrl-surf-copy-new-ctx + suspend-resume.

ctrl-surf-copy-new-ctx checks ccs data is binded to physical mem.
suspend-resume checks S0 suspend state.

v2 Adding separate allocator handle for new context (Zbigniew)

Apoorva Singh (2):
  tests/i915/gem_ccs: Check ctrl-surf-copy in new context
  tests/i915/gem_ccs: Add suspend-resume subtest

 tests/i915/gem_ccs.c | 93 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 78 insertions(+), 15 deletions(-)

-- 
2.32.0
