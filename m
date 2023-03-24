Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9939310E126
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 13:36:57 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	karolina.stolarek@intel.com
Date: Fri, 24 Mar 2023 19:03:42 +0530
Message-Id: <20230324133346.2284000-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] tests/i915: Enable XY_FAST_COPY_BLT for
 gen12+
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
is not supported on newer platforms. Modified test
to use XY_FAST_COPY_BLT.

Arjun Melkaveri (1):
  tests/i915/gem_linear_blits: Enable XY_FAST_COPY_BLT copy instruction

Vikas Srivastava (3):
  lib/intel_batchbuffer: Enable XY_FAST_COPY_BLT support for
    api_intel_bb
  tests/i915/gem_caching: Enable XY_FAST_COPY_BLT for MTL
  tests/i915/gem_userptr_blits: Enable XY_FAST_COPY_BLT Command for
    gen12+

 lib/intel_batchbuffer.c        | 63 +++++++++++++++++---------
 tests/i915/gem_caching.c       | 25 +++++++----
 tests/i915/gem_linear_blits.c  | 66 +++++++++++++++++----------
 tests/i915/gem_userptr_blits.c | 82 +++++++++++++++++++++-------------
 4 files changed, 153 insertions(+), 83 deletions(-)

-- 
2.25.1
