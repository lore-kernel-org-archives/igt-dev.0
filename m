Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D116E8EC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 05:41:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  4 Oct 2021 07:40:54 +0200
Message-Id: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Clean buffer and bo size in intel_buf
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

In intel_buf size not always was equal to buffer size, even if 
intel_buf_bo_size() which returns that field would suggest.

Clean the mess - from now on buf->size contains real buffer size
(requested one) and buf->bo_size underlying gem bo size.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Zbigniew Kempczyński (2):
  lib/intel_bufops: Rename intel_buf_bo_size() -> intel_buf_size()
  lib/intel_bufops: Store gem bo size

 lib/intel_aux_pgtable.c            |  2 +-
 lib/intel_bufops.c                 | 33 +++++++++++++++++-------------
 lib/intel_bufops.h                 |  3 +++
 tests/i915/api_intel_bb.c          |  6 +++---
 tests/i915/gem_render_copy.c       | 14 ++++++-------
 tests/i915/gem_set_tiling_vs_blt.c |  2 +-
 6 files changed, 34 insertions(+), 26 deletions(-)

-- 
2.26.0
