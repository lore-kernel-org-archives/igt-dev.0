Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C9610E883
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 11:08:33 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Jun 2022 13:08:26 +0200
Message-Id: <20220603110828.37759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add crc32 calculation on dg2 gpu
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

Add crc32 calculation library on gpu (dg2).

v2: use predication instead of cond_bbe with memory access.

Zbigniew Kempczyński (2):
  lib/i915_crc: Introduce crc32 on gpu for DG2
  tests/api_intel_bb: Add crc32 checking test for DG2

 lib/i915/i915_crc.c       | 373 ++++++++++++++++++++++++++++++++++++++
 lib/i915/i915_crc.h       |  17 ++
 lib/intel_reg.h           |   7 +
 lib/meson.build           |   1 +
 tests/i915/api_intel_bb.c |  64 +++++++
 5 files changed, 462 insertions(+)
 create mode 100644 lib/i915/i915_crc.c
 create mode 100644 lib/i915/i915_crc.h

-- 
2.32.0
