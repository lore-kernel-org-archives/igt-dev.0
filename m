Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC5489885
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2020 13:20:26 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed,  8 Jul 2020 16:20:10 +0300
Message-Id: <20200708132015.334750-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/5] tests: Add timeline semaphore tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Just a rebase of the tests sent a while ago.

Cheers,

Chunming Zhou (1):
  igt: add timeline test cases

Lionel Landwerlin (4):
  drm-uapi: bump i915_drm.h for timeline semaphores
  tests/syncobj_timeline: add more timeline tests
  tests/i915/exec_fence: add timeline fence tests
  tests/i915/gem_exec_fence: add engine chaining tests

 include/drm-uapi/i915_drm.h |   65 +-
 lib/igt_syncobj.c           |  236 ++++++
 lib/igt_syncobj.h           |   22 +
 lib/intel_reg.h             |    2 +
 tests/i915/gem_exec_fence.c | 1319 ++++++++++++++++++++++++++++++
 tests/meson.build           |    1 +
 tests/syncobj_timeline.c    | 1537 +++++++++++++++++++++++++++++++++++
 7 files changed, 3179 insertions(+), 3 deletions(-)
 create mode 100644 tests/syncobj_timeline.c

--
2.27.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
