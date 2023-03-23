Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2816510E467
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 09:02:27 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7C838580C35
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 02:02:25 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfGpz-0085vZ-1K
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 10:02:23 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 10:02:17 +0100
Message-Id: <20230323090221.1929302-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/4] xe/xe_module_load: add a test to
 load/unload Xe driver
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

It is interesting to let IGT to unload/reload the Xe driver,
as it can help CI to track track troubles.

Add support for it.

Test documentation:

	==================
	igt@xe_module_load
	==================
	
	:Category: Sofware building block
	:File: tests/xe/xe_module_load.c
	:Sub-category: driver
	:Summary: Tests the xe module loading
	:Test category: functionality test
	
	igt@xe_module_load@force-load
	=============================
	
	:Description: Load the Xe driver passing ``force_probe=*`` parameter
	:Run type: BAT
	
	
	igt@xe_module_load@load
	=======================
	
	:Description: Load the Xe driver
	:Run type: FULL
	
	
	igt@xe_module_load@unload
	=========================
	
	:Description: Unload the Xe driver
	:Run type: FULL
	
	
	igt@xe_module_load@reload
	=========================
	
	:Description: Reload the Xe driver
	:Run type: FULL
	
	
	igt@xe_module_load@reload-no-display
	====================================
	
	:Description: Reload the Xe driver passing ``enable_display=0`` parameter
	:Run type: FULL
	
	
	igt@xe_module_load@many-reload
	==============================
	
	:Description: Reload the Xe driver many times
	:Run type: FULL

---

v4:
- patch 1 broke on two patches, to reduce git diff, making
  easier to review;
- addressed some nitpicks on patch 4.

v3:
- no changes. Just rebased due to a merge conflict.

v2:

- added a patch (already submitted) to shut-up i915 trybot to
  try to run those tests when i915 driver is loaded;
- removed duplication of the unwanted drivers array and declare
  it as const with const strings;
- reordered includes and removed a duplication;
- did some cosmetic changes.

Mauro Carvalho Chehab (4):
  intel-ci: update blacklists to work with the Xe driver
  intel-ci: create a symlink for i915-blacklist.txt
  lib/igt_kmod: add support for Xe driver
  xe/xe_module_load: add a test to load/unload Xe driver

 lib/igt_kmod.c                           |  34 ++---
 lib/igt_kmod.h                           |  32 ++++-
 tests/intel-ci/blacklist.txt             | 130 +----------------
 tests/intel-ci/i915-blacklist.txt        | 133 ++++++++++++++++++
 tests/intel-ci/xe-blacklist.txt          |  21 +++
 tests/intel-ci/xe-fast-feedback.testlist |   3 +
 tests/meson.build                        |   1 +
 tests/xe/xe_module_load.c                | 172 +++++++++++++++++++++++
 8 files changed, 377 insertions(+), 149 deletions(-)
 mode change 100644 => 120000 tests/intel-ci/blacklist.txt
 create mode 100644 tests/intel-ci/i915-blacklist.txt
 create mode 100644 tests/intel-ci/xe-blacklist.txt
 create mode 100644 tests/xe/xe_module_load.c

-- 
2.39.2
