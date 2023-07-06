Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5983A10E47C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 15:06:48 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D6BD9580E3B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 08:06:45 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qHQZ9-002SA1-1R
 for igt-dev@lists.freedesktop.org; Thu, 06 Jul 2023 17:06:43 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:06:33 +0200
Message-Id: <20230706150638.581415-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/5] Speedup IGT build time
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

v3:
- custom_target that generates testlist is now simpler and
  should work better.

v2:
- make it compatible with Meson 0.47;
- added a patch to simplify tests/meson.build
- dropped a change at gem_stress - maybe there's a real reason
  why this one was excluded from test_list, so let's keep it
  as-is.

Mauro Carvalho Chehab (5):
  tests/meson.build: Simplify builds for core and i915 targets
  lib/igt_core: use the macro when checking for list_subtests
  lib/igt_core: add an option to show the testlist
  tests/meson.build: create testlists for tests
  scripts/test_list.py: speedup testlist check logic

 lib/igt_core.c       |  26 ++++-
 scripts/test_list.py |  30 +----
 tests/meson.build    | 271 +++++++++++++++++--------------------------
 3 files changed, 131 insertions(+), 196 deletions(-)

-- 
2.40.1
