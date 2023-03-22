Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D6910E042
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 06:50:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 577F5580D2C
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 23:50:09 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pesIR-007NXJ-0x
 for igt-dev@lists.freedesktop.org; Wed, 22 Mar 2023 07:50:07 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 07:49:55 +0100
Message-Id: <20230322065003.1758611-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/8] Build Xe test documentation
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


IGT has gained support for building Xe driver test documentation,
but there are a few left-overs for it to work.

Add the left overs, creating Xe test documentation at build time.

---

v4:
  - Fixed a build error when tests are disabled;
  - get rid of source_root future deprecated warning;
  - testplan/meson.build now uses join_paths;
  - dropped tests/xe/meson.build file;
  - re-indented testplan/meson.build.

v3:
  - added SPDG tag to docs/testplan/conf.py;
  - changed description on patch 2;
  - cleanup IGT doc dependency chain.

Mauro Carvalho Chehab (8):
  meson: build Xe test documentation
  testplan: build also a PDF file with the testplan
  meson.build: place gtk-doc dependencies check at the right place
  meson: get rid of a future-deprecated warning
  meson: get rid of tests/xe/meson.build
  testplan/meson.build: cleanup dependency chain
  testplan/meson.build: use join_paths()
  testplan/meson.build: re-indent file

 docs/meson.build           |   4 ++
 docs/reference/meson.build |  12 +++-
 docs/testplan/conf.py      |  42 ++++++++++++++
 docs/testplan/meson.build  | 112 +++++++++++++++++++++----------------
 docs/testplan/testplan.css |   7 +++
 lib/meson.build            |   2 +-
 meson.build                |  17 +++---
 meson_options.txt          |   8 +++
 scripts/gen_rst_index      |  43 ++++++++++++++
 scripts/meson.build        |   3 +
 tests/meson.build          |   1 -
 tests/xe/meson.build       |   1 -
 12 files changed, 192 insertions(+), 60 deletions(-)
 create mode 100644 docs/testplan/conf.py
 create mode 100644 docs/testplan/testplan.css
 create mode 100755 scripts/gen_rst_index
 delete mode 100644 tests/xe/meson.build

-- 
2.39.2
