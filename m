Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD510E13E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 14:46:29 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Mar 2023 15:46:12 +0100
Message-Id: <20230321144614.1676419-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add support for Xe driver unload/reload
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


Mauro Carvalho Chehab (2):
  lib/igt_kmod: add support for Xe driver
  xe/xe_module_load: add a test to load/unload Xe driver

 lib/igt_kmod.c                           |  34 ++---
 lib/igt_kmod.h                           |  31 ++++-
 tests/intel-ci/xe-fast-feedback.testlist |   3 +
 tests/meson.build                        |   1 +
 tests/xe/xe_module_load.c                | 163 +++++++++++++++++++++++
 5 files changed, 212 insertions(+), 20 deletions(-)
 create mode 100644 tests/xe/xe_module_load.c

-- 
2.39.2
