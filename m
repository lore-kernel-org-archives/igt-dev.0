Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C68010E241
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 11:54:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 45E98580DC5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 04:53:59 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qIpSn-002vvn-0Z
 for igt-dev@lists.freedesktop.org; Mon, 10 Jul 2023 13:53:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 13:53:47 +0200
Message-Id: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/7] Speedup IGT build time
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, even a single change on IGT makes the build time too
slow.

This is because it will re-generate the check testlist on every
single build that touches any file.

Change the logic to generate per-file testlists, with speeds up
build time from 22 seconds to 4 seconds.

It can be improved even further after changing the build logic
to maintain separate test_executables for i915, kms and xe.

As there's a pending patch series touching those tests, moving
them to tests/intel directory, let's not do a conflicting change.
Once such patch series gets merged, I'll write a patch with the
pending optimization.

---

v5:
- add an extra patch at the end to gain extra 3x performance
  at the testlist check logic by using pre-compiled regexes,
  and do some additional regex compile cleanups.

v4:
- fix dependency chain for igt-doc.py;
- create an intel-ci.testlist with core tests and tests for
  intel drivers.

v3:
- custom_target that generates testlist is now simpler and
  should work better.

v2:
- make it compatible with Meson 0.47;
- added a patch to simplify tests/meson.build
- dropped a change at gem_stress - maybe there's a real reason
  why this one was excluded from test_list, so let's keep it
  as-is.

Mauro Carvalho Chehab (7):
  tests/meson.build: Simplify builds for core and i915 targets
  lib/igt_core: use the macro when checking for list_subtests
  lib/igt_core: add an option to show the testlist
  tests/meson.build: create testlists for tests
  scripts/test_list.py: speedup testlist check logic
  tests/build: Generate and store an intel-ci.testlist
  scripts/test_list.py: optimize check regex

 docs/testplan/meson.build  |   2 +-
 lib/igt_core.c             |  26 +++-
 scripts/test_list.py       |  50 +++----
 tests/intel-ci/meson.build |   8 ++
 tests/meson.build          | 272 +++++++++++++++----------------------
 5 files changed, 152 insertions(+), 206 deletions(-)

-- 
2.40.1
