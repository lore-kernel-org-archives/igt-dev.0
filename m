Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4648689E7B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2020 08:51:02 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  4 Aug 2020 11:50:52 +0300
Message-Id: <20200804085057.349998-1-lionel.g.landwerlin@intel.com>
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

Hi all,

Adding a new test to cover Chris' changes (multiple extension nodes).

Cheers,

Chunming Zhou (1):
  igt: add timeline test cases

Lionel Landwerlin (4):
  drm-uapi: bump i915_drm.h for timeline semaphores
  tests/syncobj_timeline: add more timeline tests
  tests/i915/exec_fence: add timeline fence tests
  tests/i915/gem_exec_fence: add engine chaining tests

 include/drm-uapi/i915_drm.h |   64 +-
 lib/igt_syncobj.c           |  236 ++++++
 lib/igt_syncobj.h           |   22 +
 lib/intel_reg.h             |    2 +
 tests/i915/gem_exec_fence.c | 1392 +++++++++++++++++++++++++++++++
 tests/meson.build           |    1 +
 tests/syncobj_timeline.c    | 1537 +++++++++++++++++++++++++++++++++++
 7 files changed, 3249 insertions(+), 5 deletions(-)
 create mode 100644 tests/syncobj_timeline.c

--
2.28.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
