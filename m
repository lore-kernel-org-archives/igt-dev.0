Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3510E0F1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 06:16:27 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 44392580AE0
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jul 2023 23:16:25 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qIkC7-002onO-1C
 for igt-dev@lists.freedesktop.org; Mon, 10 Jul 2023 08:16:23 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 08:16:15 +0200
Message-Id: <20230710061621.671843-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/6] Speedup IGT build time
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

Mauro Carvalho Chehab (6):
  tests/meson.build: Simplify builds for core and i915 targets
  lib/igt_core: use the macro when checking for list_subtests
  lib/igt_core: add an option to show the testlist
  tests/meson.build: create testlists for tests
  scripts/test_list.py: speedup testlist check logic
  tests/build: Generate and store an intel-ci.testlist

 docs/testplan/meson.build  |   2 +-
 lib/igt_core.c             |  26 +++-
 scripts/test_list.py       |  30 +---
 tests/intel-ci/meson.build |   8 ++
 tests/meson.build          | 272 +++++++++++++++----------------------
 5 files changed, 141 insertions(+), 197 deletions(-)

-- 
2.40.1
