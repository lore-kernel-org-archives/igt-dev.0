Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A350310E1AA
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Mar 2022 11:11:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Mar 2022 12:11:28 +0100
Message-Id: <20220321111130.145805-1-zbigniew.kempczynski@intel.com>
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
v3 Address review comments (Kamil)
v4 Remove memory leak (Kamil)

Apoorva Singh (2):
  tests/i915/gem_ccs: Check ctrl-surf-copy in new context
  tests/i915/gem_ccs: Add suspend-resume subtest

 tests/i915/gem_ccs.c | 98 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 15 deletions(-)

-- 
2.32.0
