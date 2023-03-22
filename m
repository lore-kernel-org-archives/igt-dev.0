Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBC610E371
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 14:00:52 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 232B1580C35
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 07:00:33 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pez0x-007YK5-0j
 for igt-dev@lists.freedesktop.org; Wed, 22 Mar 2023 15:00:31 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 15:00:27 +0100
Message-Id: <20230322140030.1800192-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] xe/xe_module_load: add a test to
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

v3:
- no changes. Just rebased due to a merge conflict.

v2:

- added a patch (already submitted) to shut-up i915 trybot to
  try to run those tests when i915 driver is loaded;
- removed duplication of the unwanted drivers array and declare
  it as const with const strings;
- reordered includes and removed a duplication;
- did some cosmetic changes.

Mauro Carvalho Chehab (3):
  intel-ci: update blacklists to work with the Xe driver
  lib/igt_kmod: add support for Xe driver
  xe/xe_module_load: add a test to load/unload Xe driver

 lib/igt_kmod.c                           |  34 ++---
 lib/igt_kmod.h                           |  32 ++++-
 tests/intel-ci/blacklist.txt             | 130 +------------------
 tests/intel-ci/i915-blacklist.txt        | 133 +++++++++++++++++++
 tests/intel-ci/xe-blacklist.txt          |  21 +++
 tests/intel-ci/xe-fast-feedback.testlist |   3 +
 tests/meson.build                        |   1 +
 tests/xe/xe_module_load.c                | 158 +++++++++++++++++++++++
 8 files changed, 363 insertions(+), 149 deletions(-)
 mode change 100644 => 120000 tests/intel-ci/blacklist.txt
 create mode 100644 tests/intel-ci/i915-blacklist.txt
 create mode 100644 tests/intel-ci/xe-blacklist.txt
 create mode 100644 tests/xe/xe_module_load.c

-- 
2.39.2
