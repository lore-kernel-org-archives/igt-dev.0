Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8D610F15F
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 09:17:06 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 31 Mar 2023 11:16:57 +0200
Message-Id: <20230331091700.69801-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add xe_create test
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

Test for drm_xe_gem_create ioctl verification.

Zbigniew Kempczyński (3):
  lib/xe_query: Add xe_for_each_mem_region iterator
  lib/xe_query: Add memory region getter from region mask
  xe/xe_create: Add xe_create test

 lib/xe/xe_query.c    |  12 +++++
 lib/xe/xe_query.h    |   5 ++
 tests/meson.build    |   1 +
 tests/xe/xe_create.c | 107 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 125 insertions(+)
 create mode 100644 tests/xe/xe_create.c

-- 
2.34.1
