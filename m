Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296066E15E
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Nov 2021 13:17:47 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 10 Nov 2021 14:17:27 +0100
Message-Id: <20211110131729.54135-1-zbigniew.kempczynski@intel.com>
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

CQ Tang (1):
  tests/i915/gem_lmem_swapping: Add the gem_lmem_swapping test

Zbigniew Kempczyński (1):
  tests/intel-ci/fast-feedback: Add gem_lmem_swapping@basic to BAT

 tests/i915/gem_lmem_swapping.c        | 551 ++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/meson.build                     |   1 +
 3 files changed, 553 insertions(+)
 create mode 100644 tests/i915/gem_lmem_swapping.c

-- 
2.26.0
