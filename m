Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCBA6E17F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 10:41:32 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed,  1 Sep 2021 16:04:00 +0530
Message-Id: <20210901103402.1253909-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t,
 V4 0/2] lib/i915: Use FIXED mapping only for discrete memory
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

The FIXED mapping is only used for discrete, and mapping type
is pre-defined. This disables the other type of mmap
offsets when discrete memory is used.

Taken from kernel commit:
commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")

Change is devided in two patches :
1. First patch fixes gem_has_mmap_offset_type library call
2. Sync i915_drm.h with kernel

Tejas Upadhyay (2):
  lib/i915: Use FIXED mapping only for discrete memory
  i915_drm.h sync

 include/drm-uapi/i915_drm.h |  1 +
 lib/i915/gem_mman.c         | 20 +++++++++++++++++++-
 lib/i915/i915_drm_local.h   |  2 --
 3 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.31.1
