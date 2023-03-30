Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB16F10E322
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 13:06:06 +0000 (UTC)
Received: from linux.intel.com (pludynia-mobl.ger.corp.intel.com [10.252.3.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 35E65580A6C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 06:05:24 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phrxy-00BSaV-0o
 for igt-dev@lists.freedesktop.org; Thu, 30 Mar 2023 15:05:22 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 15:05:06 +0200
Message-Id: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 00/12] Improve igt_doc.py
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

This series do some improvements at the igt_doc.py tool:

- It does some tweaks at the Xe documentation hierarchy;
- It adds support to generate test lists from documentation;
- It splits the script on two parts: one with the TestList
  class definition and another one with the toll itself;
- While here, add missing documentation for two new tests;
- Check if the documentation matches the actual tests at
  build time, in order to prevent it to become outdated.

---
v3:
  - fix a breakage with older meson releases

v2:
  - add a patch at the end to avoid a gitlab pipeline breakage.

Mauro Carvalho Chehab (12):
  xe_test_config.json: do some adjustments at the output hierarchy
  scripts/igt_doc.py: move show_subtests logic to the class
  scripts/igt_doc.py: add support to generate testlists
  scripts/igt_doc.py: prepare to place TestList class on a separate file
  scripts/test_list.py: prepare to place class on a separate file
  scripts/igt_doc.py: re-introduce it by calling test_list.py
  scripts/test_list.py: better handle documentation validation issues
  scripts/test_list.py: add support for igt_simple_main
  testplan/meson.build: Validate documentation at build time
  xe/xe_vm: add documentation for igt@xe_vm@userptr-invalid
  xe/xe_noexec_ping_pong: document subtest
  runner/meson.build: fix minimal build

 docs/testplan/meson.build      |    8 +-
 meson.build                    |    1 +
 runner/meson.build             |    6 +-
 scripts/igt_doc.py             | 1038 +-----------------------------
 scripts/test_list.py           | 1084 ++++++++++++++++++++++++++++++++
 tests/xe/xe_noexec_ping_pong.c |   26 +-
 tests/xe/xe_test_config.json   |   30 +-
 tests/xe/xe_vm.c               |   10 +-
 8 files changed, 1144 insertions(+), 1059 deletions(-)
 create mode 100755 scripts/test_list.py

-- 
2.39.2
