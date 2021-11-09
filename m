Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8086E7EC
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 10:33:45 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue,  9 Nov 2021 11:33:39 +0100
Message-Id: <20211109103341.19545-1-zbigniew.kempczynski@intel.com>
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

CQ Tang (1):
  tests/i915/gem_lmem_swapping: Add the gem_lmem_swapping test

Zbigniew Kempczyński (1):
  tests/intel-ci/fast-feedback: Add gem_lmem_swapping@basic to BAT

 tests/i915/gem_lmem_swapping.c        | 543 ++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/meson.build                     |   1 +
 3 files changed, 545 insertions(+)
 create mode 100644 tests/i915/gem_lmem_swapping.c

-- 
2.26.0
