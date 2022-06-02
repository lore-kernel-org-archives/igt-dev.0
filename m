Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7110F07C
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 13:18:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Jun 2022 15:17:56 +0200
Message-Id: <20220602131758.51207-1-zbigniew.kempczynski@intel.com>
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

Zbigniew Kempczyński (2):
  lib/i915_crc: Introduce crc32 on gpu for DG2
  tests/api_intel_bb: Add crc32 checking test for DG2

 lib/i915/i915_crc.c       | 369 ++++++++++++++++++++++++++++++++++++++
 lib/i915/i915_crc.h       |  16 ++
 lib/intel_reg.h           |   7 +
 lib/meson.build           |   1 +
 tests/i915/api_intel_bb.c |  53 ++++++
 5 files changed, 446 insertions(+)
 create mode 100644 lib/i915/i915_crc.c
 create mode 100644 lib/i915/i915_crc.h

-- 
2.32.0
