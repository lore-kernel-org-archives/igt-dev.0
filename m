Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518F96E110
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Nov 2021 07:16:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 15 Nov 2021 08:16:08 +0100
Message-Id: <20211115071610.14773-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Upstream gem_lmem_swapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Address review comments from Maarten + add "basic" to BAT

v2: fix seed handling when more process are involved in creating
    and filling objects
    add igt_describe()

v3: remove unnecessary empty line
    alter s-o-b list
    add additional 3 subtests to fast-feedback

CQ Tang (1):
  tests/i915/gem_lmem_swapping: Add the gem_lmem_swapping test

Zbigniew Kempczyński (1):
  tests/intel-ci/fast-feedback: Add four subtests of gem_lmem_swapping
    to BAT

 tests/i915/gem_lmem_swapping.c        | 550 ++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |   4 +
 tests/meson.build                     |   1 +
 3 files changed, 555 insertions(+)
 create mode 100644 tests/i915/gem_lmem_swapping.c

-- 
2.26.0
