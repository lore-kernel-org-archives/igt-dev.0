Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4997710E2F7
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 14:58:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 20:27:34 +0530
Message-Id: <20230620145737.601858-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Misc. fixes
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

Chris Wilson (2):
  i915/kms_busy: Free spinners after use
  i915/kms_mmap_write_crc: Free the mmap and dma-buf fd

Matt Roper (1):
  lib/igt_draw: Use intel_display_ver() for drawing with blits

 lib/igt_draw.c                  | 6 +++---
 tests/i915/kms_busy.c           | 5 ++---
 tests/i915/kms_mmap_write_crc.c | 3 +++
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.25.1
