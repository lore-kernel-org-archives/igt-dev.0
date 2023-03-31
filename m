Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA8E10E09F
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 12:24:50 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	karolina.stolarek@intel.com
Date: Fri, 31 Mar 2023 17:51:29 +0530
Message-Id: <20230331122133.3000215-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4 v3] tests/i915: Enable XY_FAST_COPY_BLT
 for gen12+
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

Test case uses legacy command XY_SRC_COPY_BLT_CMD which
is not supported on newer platforms. Modify test
to use XY_FAST_COPY_BLT.

Arjun Melkaveri (1):
  tests/i915/gem_linear_blits: Enable XY_FAST_COPY_BLT copy instruction

Vikas Srivastava (3):
  tests/i915/gem_caching: Enable XY_FAST_COPY_BLT for MTL
  tests/i915/gem_userptr_blits: Enable XY_FAST_COPY_BLT Command for
    gen12+
  lib/intel_batchbuffer: Enable XY_FAST_COPY_BLT support for
    api_intel_bb

 lib/intel_batchbuffer.c        | 57 ++++++++++++++---------
 tests/i915/gem_caching.c       | 26 +++++++----
 tests/i915/gem_linear_blits.c  | 67 +++++++++++++++++----------
 tests/i915/gem_userptr_blits.c | 82 ++++++++++++++++++++++------------
 4 files changed, 151 insertions(+), 81 deletions(-)

-- 
2.25.1
