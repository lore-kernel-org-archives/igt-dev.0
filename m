Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E605610E4E0
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 11:13:33 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 450F8580D1E
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 04:13:32 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qHMvS-0028Nq-0b
 for igt-dev@lists.freedesktop.org; Thu, 06 Jul 2023 13:13:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 13:13:23 +0200
Message-Id: <20230706111328.508790-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/5] Speedup IGT build time
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

 lib/igt_core.c       |  26 +++-
 scripts/test_list.py |  30 +----
 tests/meson.build    | 277 +++++++++++++++++--------------------------
 3 files changed, 137 insertions(+), 196 deletions(-)

-- 
2.40.1
