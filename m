Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4444910E7B1
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 12:13:00 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Mar 2022 13:12:50 +0100
Message-Id: <20220302121253.25299-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Upstream render-copy function for DG2
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

Change requires intel-bb adoption to use safe alignment + render-copy
function.

Arjun Melkaveri (1):
  tests/gem_render_copy: Added skip for I915_TILING_Y and I915_TILING_Yf
    on DG2

Pankaj Bharadiya (1):
  lib/rendercopy/dg2: Add rendercopy support for dg2

Zbigniew Kempczyński (1):
  lib/intel_batchbuffer: Use safe alignment for intel-bb

 lib/gen4_render.h                            |  2 +
 lib/i915/shaders/ps/gen12p71_render_copy.asm | 16 +++++++
 lib/intel_batchbuffer.c                      |  6 ++-
 lib/rendercopy.h                             |  4 ++
 lib/rendercopy_gen9.c                        | 47 ++++++++++++++++++++
 tests/i915/gem_render_copy.c                 |  6 +++
 6 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 lib/i915/shaders/ps/gen12p71_render_copy.asm

-- 
2.32.0
