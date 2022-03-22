Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E1310E521
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Mar 2022 06:59:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Mar 2022 07:59:11 +0100
Message-Id: <20220322065913.13319-1-zbigniew.kempczynski@intel.com>
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
v5 Add igt_describe (Kamil)

Apoorva Singh (2):
  tests/i915/gem_ccs: Check ctrl-surf-copy in new context
  tests/i915/gem_ccs: Add suspend-resume subtest

 tests/i915/gem_ccs.c | 101 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 86 insertions(+), 15 deletions(-)

-- 
2.32.0
