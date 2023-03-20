Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145410E293
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 08:45:08 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8AD11580D4D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 01:45:07 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1peB8b-0062jB-1X
 for igt-dev@lists.freedesktop.org; Mon, 20 Mar 2023 09:45:05 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Mar 2023 09:44:58 +0100
Message-Id: <20230320084500.1434535-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Build Xe test documentation
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

Mauro Carvalho Chehab (2):
  meson: build Xe test documentation
  testplan: build also a PDF file with the testplan

 docs/meson.build           |  1 +
 docs/testplan/conf.py      | 41 ++++++++++++++++++++++++++++++++++++
 docs/testplan/meson.build  | 27 +++++++++++++++++++-----
 docs/testplan/testplan.css |  7 +++++++
 meson_options.txt          |  8 +++++++
 scripts/gen_rst_index      | 43 ++++++++++++++++++++++++++++++++++++++
 scripts/meson.build        |  3 +++
 7 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 docs/testplan/conf.py
 create mode 100644 docs/testplan/testplan.css
 create mode 100755 scripts/gen_rst_index

-- 
2.39.2
