Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC4F10E35C
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 09:22:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C7304580D92
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 02:22:08 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1peYBy-006svY-2N
 for igt-dev@lists.freedesktop.org; Tue, 21 Mar 2023 10:22:06 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Mar 2023 10:22:01 +0100
Message-Id: <20230321092205.1640976-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/4] Build Xe test documentation
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

v3:
  - added SPDG tag to docs/testplan/conf.py;
  - changed description on patch 2;
  - cleanup IGT doc dependency chain (patches 3 and 4).

Mauro Carvalho Chehab (4):
  meson: build Xe test documentation
  testplan: build also a PDF file with the testplan
  meson.build: place gtk-doc dependencies check at the right place
  testplan/meson.build: cleanup dependency chain

 docs/meson.build           |  4 +++
 docs/reference/meson.build | 12 +++++++-
 docs/testplan/conf.py      | 42 ++++++++++++++++++++++++++
 docs/testplan/meson.build  | 60 ++++++++++++++++++++++----------------
 docs/testplan/testplan.css |  7 +++++
 meson.build                | 12 +++-----
 meson_options.txt          |  8 +++++
 scripts/gen_rst_index      | 43 +++++++++++++++++++++++++++
 scripts/meson.build        |  3 ++
 9 files changed, 157 insertions(+), 34 deletions(-)
 create mode 100644 docs/testplan/conf.py
 create mode 100644 docs/testplan/testplan.css
 create mode 100755 scripts/gen_rst_index

-- 
2.39.2
