Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261FF10E3C3
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 15:29:08 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0F2F0580BB8
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 08:28:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qH4R3-001vyA-2N
 for igt-dev@lists.freedesktop.org; Wed, 05 Jul 2023 17:28:53 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:28:45 +0200
Message-Id: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Speedup IGT build time
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

Mauro Carvalho Chehab (5):
  lib/igt_core: use the macro when checking for list_subtests
  lib/igt_core: add an option to show the testlist
  tests/meson.build: create testlists for tests
  tests/meson.build: add gem_stress to the test_list logic
  scripts/test_list.py: speedup testlist check logic

 lib/igt_core.c       | 26 ++++++++++++++++++++------
 scripts/test_list.py | 30 ++++++------------------------
 tests/meson.build    | 25 ++++++++++++++++++-------
 3 files changed, 44 insertions(+), 37 deletions(-)

-- 
2.40.1
