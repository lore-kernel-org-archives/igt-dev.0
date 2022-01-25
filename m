Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A8910EC50
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 06:52:36 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 25 Jan 2022 07:52:28 +0100
Message-Id: <20220125065231.16986-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Verify X and Y tilings on rcs and bcs
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

During my work on block-copy I've observed some phenomena with fast-copy
and x-tiling. I was a little bit surprised it doesn't blit to expected
x-tile surface and I want to expose that behavior. Render engine in the
meantime behaves correctly.

If there're some tests which uses fast-copy x-tiling we should be
aware that some blitter commands (in this case fast-copy) cannot be
reliable and we should be replaced or skipped.

Zbigniew Kempczyński (3):
  lib/intel_bufops: Relax swizzle condition to allow using software
    tiling
  lib/intel_bufops: Add tile/linear argument during dumping to png
  tests/api_intel_bb: Add check-xmajor and check-ymajor tests

 lib/intel_bufops.c           |  32 ++++++----
 lib/intel_bufops.h           |   3 +-
 tests/i915/api_intel_bb.c    | 110 +++++++++++++++++++++++++++++++----
 tests/i915/gem_render_copy.c |  16 ++---
 4 files changed, 131 insertions(+), 30 deletions(-)

-- 
2.32.0
