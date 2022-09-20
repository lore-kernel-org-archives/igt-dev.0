Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B458F10E6BA
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Sep 2022 13:15:51 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Sep 2022 15:15:38 +0200
Message-Id: <20220920131546.34879-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/8] add I915_MMAP_OFFSET_FIXED tests
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

This is second and last part of patchset
"Fix spinner 48b + add I915_MMAP_OFFSET_FIXED tests"
https://patchwork.freedesktop.org/series/108022/

changes in gem_mmap_offset (patches 005-012).

Chris Wilson (8):
  i915/gem_mmap_offset: Avoid set_domain when I915_MMAP_OFFSET_FIXED is
    used
  i915/gem_mmap_offset: Verify all regions return clear mmaps on
    creation
  i915/gem_mmap_offset: Verify all regions with ptrace
  i915/gem_mmap_offset: Verify all regions remain in isolation
  i915/gem_mmap_offset: Verify all regions have nonblocking pagefaults
  i915/gem_mmap_offset: Check all mmap types reject invalid objects
  i915/gem_mmap_offset: Exercise close race against all types/regions
  i915/gem_mmap_offset: Crudely measure read/write to different mmaps

 tests/i915/gem_mmap_offset.c | 453 ++++++++++++++++++++++++-----------
 1 file changed, 307 insertions(+), 146 deletions(-)

-- 
2.34.1
