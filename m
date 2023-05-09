Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D3910E37B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 10:42:07 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.18.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C98CC580D60
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 03:42:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pwKnE-004su5-10
 for igt-dev@lists.freedesktop.org; Tue, 09 May 2023 12:42:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 12:42:01 +0200
Message-Id: <20230509104203.1163545-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Add an option to protect Xe test
 builds
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

The Xe driver is currently under heavy development and has not
merged upstream yet. While merging doesn't happen, the API may
still change, as upstream may request changes on it and/or
driver developers may need to tweak some API bits.

While this is happening, incompatible API changes may still
happen. As IGT is distributed on some distros, placing Xe
tests on binaries is not a good idea, as such tests may fail
when the final version gets released.

So, add a build option to allow disabling Xe driver builds.

The first patch adds such option but keeps it enabled by
default, as we don't want to break any CI automation that
may be relying on having the driver enabled.

The idea is to get the first patch merged, and then give
some time to adjust CI scripts. Afterwards, apply the
second one changing the default.

---
v2:
  - fix compilation breakage with -Dtests=disabled

Mauro Carvalho Chehab (2):
  meson: add an option to control Xe test builds
  meson_options.txt: disable Xe driver tests by default

 docs/testplan/meson.build |  9 ++++++++-
 meson.build               |  1 +
 meson_options.txt         | 10 ++++++++++
 tests/meson.build         | 21 ++++++++++++---------
 4 files changed, 31 insertions(+), 10 deletions(-)

-- 
2.40.1
