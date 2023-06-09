Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F3810E6A1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 13:21:12 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 18:50:15 +0530
Message-Id: <20230609132019.508947-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Misc. fixes
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

Series contains misc. fixes.

Chris Wilson (3):
  i915/kms_busy: Free spinners after use
  i915/kms_mmap_write_crc: Free the mmap and dma-buf fd
  lib: Clear displays on finish before process exit

Matt Roper (1):
  lib/i915: Add intel_display_ver() and use it in display tests/libs

 lib/igt_draw.c                  | 6 +++---
 lib/igt_kms.c                   | 3 +++
 tests/i915/kms_busy.c           | 5 ++---
 tests/i915/kms_mmap_write_crc.c | 3 +++
 4 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.25.1
